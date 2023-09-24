function fn(s) {
    var SimpleDataFormat = Java.type("java.text.SimpleDateFormat");
    var sdf = new SimpleDataFormat("yyyy-MM-dd'T'HH:mm:ss.ms'Z'");
    try {
        sdf.parse(s).time;
        return true;
    } catch(e) {
        karate.log('*** invalid data string:', s);
        return false;
    }
}