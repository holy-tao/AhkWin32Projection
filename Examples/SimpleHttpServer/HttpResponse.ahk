#Requires AutoHotkey v2.0

/**
 * A class to handle writing HTTP responses
 */
class HttpResponse extends Object {

    status := 0

    reason := "None"

    body := ""

    /**
     * Headers in the format <header, value>
     * @type {Map<String, String>}
     */
    headers := Map()

    /**
     * Create a new HttpMessage, either empty, if it is going to be sent, or by reading
     * data from a buffer.
     * 
     * @param {Integer | Buffer} fromBuffer Pointer to a buffer containing the data from 
     *          which to construct the message, if this is a message being received
     */
    __New(statusCode := 0, reason := "None"){
        this.status := statusCode
        this.reason := reason
    }

    /**
     * Convert the message object into an actual HTTP message string that can be sent
     * over a network. Use `ToBuffer()` to get this in a buffer that you can send to
     * WinSock
     * @returns {String} the response as an HTTP-Parseable string
     */
    ToString(){
        str := Format("HTTP/1.1 {1} {2}`r`n", this.status, this.reason)
        for(header, value in this.headers){
            str .= Format("{1}: {2}`r`n", header, value)
        }

        str .= "`r`n"
        str .= this.body

        return str
    }

    /**
     * Creates and returns a `Buffer` containing the contents of the response (as text). If the body
     * of the response is not a string, it's not included here.
     * @returns {Buffer} a new buffer containing the response
     */
    ToBuffer(){
        msgStr := this.ToString()
        bytesReqd := StrPut(msgStr, "UTF-8")

        buf := Buffer(bytesReqd)
        StrPut(msgStr, buf, , "UTF-8")
        return buf
    }

    /**
     * Create a standard HttpMessage for a 500 server error
     * @param {Error} forError The AutoHotkey error that caused the issue 
     */
    static ServerError(forError?){
        msg := HttpResponse(500, "Internal Server Error")
        msg.headers["content-type"] := "text/plain"
        msg.headers["connection"] := "close"

        if(IsSet(forError)){
            msg.body := HttpResponse.FormatError(forError)
            msg.headers["content-length"] := String(StrLen(msg.body))
        }
        else{
            msg.headers["content-length"] := String(0)
        }

        return msg
    }

    /**
     * Creates a standard 404 not found error message with no  body
     * @returns {HttpResponse} the created response
     */
    static NotFound(message := "404 Not Found") {
        msg := HttpResponse(404, "Not Found")
        msg.headers["connection"] := "close"
        msg.body := message
        msg.headers["content-length"] := StrLen(message)
        return msg
    }

    /**
     * Creates a standard 405 method not allowed error message with no body
     * @returns {HttpResponse} the created response
     */
    static NotAllowed(){
        msg := HttpResponse(405, "Method Not Allowed")
        msg.headers["connection"] := "close"
        msg.headers["content-length"] := "0"
        return msg
    }

    /**
     * Creates a standard 418 I'm a teapot response that indicates that the server 
     * refuses to brew coffee because it is, permanently, a teapot.
     * @returns {HttpResponse} the created response
     */
    static Teapot(){
        static teapot := FileRead("teapot.txt")

        msg := HttpResponse(418, "I'm a Teapot")
        msg.body := teapot
        msg.headers["content-length"] := StrLen(msg.body)
        msg.headers["connection"] := "close"
        return msg
    }

    /**
     * Creates a standard 200 OK response with an optional body
     * @param {String} body the body of the response, if any (default: "")
     * @param {String} contentType the content type of the response. Note that the body is
     *          always sent as a string, so only text content types are allowed (default: 
     *          "text/plain")
     * @returns {HttpResponse} the created response
     */
    static OK(body := "", contentType := "text/plain"){
        msg := HttpResponse(200, "OK")
        msg.headers["connection"] := "close"
        msg.headers["content-length"] := StrLen(body)
        msg.body := body
        return msg
    }

    /**
     * Format an error message for delivery to a client
     * @param {Error} err Error to format
     * @returns {HttpResponse} the created response
     */
    static FormatError(err) => Format("
        (LTrim RTrim Join`r`n
        {1}: {2}
        Specifically: {3}

        {4}
        )", Type(err), err.message, err.extra, err.stack)
}