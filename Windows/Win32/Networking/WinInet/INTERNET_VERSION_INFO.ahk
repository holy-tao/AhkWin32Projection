#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the HTTP version number of the server. This structure is used when passing the INTERNET_OPTION_VERSION flag to the InternetQueryOption function.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-internet_version_info
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_VERSION_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Major version number.
     * @type {Integer}
     */
    dwMajorVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Minor version number.
     * @type {Integer}
     */
    dwMinorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
