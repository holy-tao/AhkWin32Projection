#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HTTP_VERSION_INFO structure contains the global HTTP version.
 * @remarks
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/winhttp/ns-winhttp-http_version_info
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class HTTP_VERSION_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Major version number. Must be 1.
     * @type {Integer}
     */
    dwMajorVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Minor version number. Can be either 1 or 0.
     * @type {Integer}
     */
    dwMinorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
