import org.apache.commons.io.IOUtils
import java.nio.charset.StandardCharsets
import java.time.LocalDateTime
import org.json.simple.parser.JSONParser
import java.util.Calendar

flowFile = session.get()
if(!flowFile)return
def text = ''
// Cast a closure with an inputStream parameter to InputStreamCallback
session.read(flowFile, {inputStream ->
  text = IOUtils.toString(inputStream, StandardCharsets.UTF_8)
  // Do something with text here
} as InputStreamCallback)

def parser = new JSONParser()
def array = parser.parse(text)
def record = array.get(0)
def day = record.get("day")
def month = record.get("month")
def year = record.get("year")

def c = Calendar.getInstance()
c.set((int)year, (int)month - 1, (int)day, 0, 0)

def outputMessage = '[{\"timestamp\": ' + c.getTimeInMillis() + ',' + text.substring(2)

flowFile = session.write(flowFile, {inputStream, outputStream ->
  text = IOUtils.toString(inputStream, StandardCharsets.UTF_8)
  outputStream.write(outputMessage.getBytes(StandardCharsets.UTF_8))
} as StreamCallback)

session.transfer(flowFile, REL_SUCCESS)
