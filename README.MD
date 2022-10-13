### Do poprawnego działania musimy zainstalować certyfikat do naszego JVM

#### Rozwiązanie na teraz, nie znalazłem lepszego, certyfikat lokalny wygenerowany przez keycloaka jest uznawany jako nie zaufany ponieważ sami go stworzyliśmy...

Go to URL in your browser:
firefox - click on HTTPS certificate chain (the lock icon right next to URL address). Click "more info" > "security" > "show certificate" > "details" > "export..". Pickup the name and choose file type example.cer
chrome - click on site icon left to address in address bar, select "Certificate" -> "Details" -> "Export" and save in format "Der-encoded binary, single certificate".
Now you have file with keystore and you have to add it to your JVM. Determine location of cacerts files, eg. C:\Program Files (x86)\Java\jre1.6.0_22\lib\security\cacerts.

Next import the example.cer file into cacerts in command line (may need administrator command prompt):

keytool -import -alias example -keystore  "C:\Program Files (x86)\Java\jre1.6.0_22\lib\security\cacerts" -file example.cer

You will be asked for password which default is changeit

Restart your JVM/PC.

https://stackoverflow.com/questions/21076179/pkix-path-building-failed-and-unable-to-find-valid-certification-path-to-requ
