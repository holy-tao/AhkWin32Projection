#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_KERBEROS_AUTHENTICATION_FLAGS.ahk

/**
 * Contains information needed for preshared key authentication. (IKEEXT_KERBEROS_AUTHENTICATION0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_kerberos_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_KERBEROS_AUTHENTICATION0 extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {IKEEXT_KERBEROS_AUTHENTICATION_FLAGS}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
