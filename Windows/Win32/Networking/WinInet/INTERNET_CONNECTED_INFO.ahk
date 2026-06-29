#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERNET_STATE.ahk" { INTERNET_STATE }

/**
 * Contains the information to set the global online/offline state.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_connected_info
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_CONNECTED_INFO {
    #StructPack 4

    dwConnectedState : INTERNET_STATE

    /**
     * Controls the transition between states. This member can be ISO_FORCE_DISCONNECTED, which puts WinINet into offline mode. All outstanding requests will be aborted with a canceled error.
     */
    dwFlags : UInt32

}
