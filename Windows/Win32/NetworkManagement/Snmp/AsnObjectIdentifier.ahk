#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AsnObjectIdentifier structure represents object identifiers. This structure is used by multiple SNMP functions. This structure is not used by the WinSNMP API functions.
 * @see https://docs.microsoft.com/windows/win32/api//snmp/ns-snmp-asnobjectidentifier
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class AsnObjectIdentifier extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of integers in the object identifier.
     * @type {Integer}
     */
    idLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of integers that represents the object identifier.
     * @type {Pointer<Integer>}
     */
    ids {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
