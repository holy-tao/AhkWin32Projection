#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk

/**
 * The WINHTTP_CONNECTION_INFO structure contains the source and destination IP address of the request that generated the response.
 * @remarks
 * 
 * When <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> returns, the application can retrieve the source and destination IP address of the request that generated the response. The application calls <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> with the <b>WINHTTP_OPTION_CONNECTION_INFO</b> option, and provides the <b>WINHTTP_CONNECTION_INFO</b> structure in the <i>lpBuffer</i> parameter.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ns-winhttp-winhttp_connection_info
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_CONNECTION_INFO extends Win32Struct
{
    static sizeof => 504

    static packingSize => 8

    /**
     * The size, in bytes, of the <b>WINHTTP_CONNECTION_INFO</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure that contains the local IP address and port of the original request.
     * @type {SOCKADDR_STORAGE}
     */
    LocalAddress{
        get {
            if(!this.HasProp("__LocalAddress"))
                this.__LocalAddress := SOCKADDR_STORAGE(8, this)
            return this.__LocalAddress
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure that contains the remote IP address and port of the original request.
     * @type {SOCKADDR_STORAGE}
     */
    RemoteAddress{
        get {
            if(!this.HasProp("__RemoteAddress"))
                this.__RemoteAddress := SOCKADDR_STORAGE(256, this)
            return this.__RemoteAddress
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 504
    }
}
