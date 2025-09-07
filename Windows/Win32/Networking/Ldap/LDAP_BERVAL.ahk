#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The berval structure represents arbitrary binary data that is encoded according to Basic Encoding Rules (BER). Use a berval to represent any attribute that cannot be represented by a null-terminated string.
 * @remarks
 * Use a <b>berval</b> structure for attributes that contain raw binary data, such as certificates, graphics, or sound files.
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class LDAP_BERVAL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Length, in bytes,  of binary data.
     * @type {Integer}
     */
    bv_len {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the binary data.
     * @type {Pointer<Ptr>}
     */
    bv_val {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
