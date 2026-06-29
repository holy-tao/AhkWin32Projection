#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the global HTTP version.
 * @remarks
 * On Windows 7, Windows Server 2008 R2, and later, the value in the <b>HTTP_VERSION_INFO</b> structure is overridden by Internet Explorer settings.  <b>EnableHttp1_1</b> is a registry value under <b>HKLM\Software\Microsoft\InternetExplorer\AdvacnedOptions\HTTP\GENABLE</b> controlled by Internet Options set in Internet Explorer for the system.  The <b>EnableHttp1_1</b> value defaults to 1. The <b>HTTP_VERSION_INFO</b> structure is  ignored for any HTTP version less than 1.1 if <b>EnableHttp1_1</b> is set to 1.
 * 
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-http_version_info
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct HTTP_VERSION_INFO {
    #StructPack 4

    /**
     * The major version number. Must be 1.
     */
    dwMajorVersion : UInt32

    /**
     * The minor version number. Can be either 1 or zero.
     */
    dwMinorVersion : UInt32

}
