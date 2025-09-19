#Requires AutoHotkey v2.0

/**
 * Represents an HTTP Request. Originally had more functionality
 */
class HttpRequest extends Object {

    method := ""

    uri := ""

    version := ""

    headers := Map()

    body := ""

    __New(){
        this.headers.CaseSense := false     ;Headers are case-insensitive
    }

    /**
     * Returns a string representation of the request
     * @param {Boolean} verbose If true, headers and the request body are also included. 
     */
    ToString(verbose := false){
        str := Format("{1} {2} {3}", this.method, this.uri, this.version)

        if(verbose){
            str .= "`n"
            for(header, value in this.headers){
                str .= Format("{1}: {2}`n", header, value)
            }

            str .= "`n"
            str .= this.body
        }

        return str
    }
}