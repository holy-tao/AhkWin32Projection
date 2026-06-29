#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the HTTP version number of the server. This structure is used when passing the INTERNET_OPTION_VERSION flag to the InternetQueryOption function.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_version_info
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_VERSION_INFO {
    #StructPack 4

    /**
     * Major version number.
     */
    dwMajorVersion : UInt32

    /**
     * Minor version number.
     */
    dwMinorVersion : UInt32

}
