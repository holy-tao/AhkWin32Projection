#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The WINHTTP_CONNECTION_INFO structure contains the source and destination IP address of the request that generated the response.
 * @remarks
 * When <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> returns, the application can retrieve the source and destination IP address of the request that generated the response. The application calls <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> with the <b>WINHTTP_OPTION_CONNECTION_INFO</b> option, and provides the <b>WINHTTP_CONNECTION_INFO</b> structure in the <i>lpBuffer</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_connection_info
 * @namespace Windows.Win32.Networking.WinHttp
 * @architecture X64, Arm64
 */
export default struct WINHTTP_CONNECTION_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the <b>WINHTTP_CONNECTION_INFO</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure that contains the local IP address and port of the original request.
     */
    LocalAddress : SOCKADDR_STORAGE

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure that contains the remote IP address and port of the original request.
     */
    RemoteAddress : SOCKADDR_STORAGE

}
