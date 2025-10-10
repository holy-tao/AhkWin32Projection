#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the binary paths to applications running in an app container.
 * @see https://docs.microsoft.com/windows/win32/api//networkisolation/ns-networkisolation-inet_firewall_ac_binaries
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INET_FIREWALL_AC_BINARIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of paths in the <b>binaries</b> member.
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Paths to the applications running in the app container.
     * @type {Pointer<Char>}
     */
    binaries {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
