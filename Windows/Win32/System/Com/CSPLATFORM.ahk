#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an operating system platform and processor architecture.
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ns-wtypes-csplatform
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CSPLATFORM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The operating system platform. See the <b>dwPlatformId</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-osversioninfoa">OSVERSIONINFO</a>.
     * @type {Integer}
     */
    dwPlatformId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The major version of the operating system.
     * @type {Integer}
     */
    dwVersionHi {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The minor version of the operating system.
     * @type {Integer}
     */
    dwVersionLo {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The processor architecture.
     * See the <b>wProcessorArchitecture</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/ns-sysinfoapi-system_info">SYSTEM_INFO</a>.
     * @type {Integer}
     */
    dwProcessorArch {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
