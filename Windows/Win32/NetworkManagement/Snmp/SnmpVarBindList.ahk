#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SnmpVarBindList structure represents an SNMP variable bindings list. This structure is used by multiple SNMP functions. This structure is not used by the WinSNMP API functions.
 * @see https://docs.microsoft.com/windows/win32/api//snmp/ns-snmp-snmpvarbindlist
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class SnmpVarBindList extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer that references an array to access individual variable bindings.
     * @type {Pointer<SnmpVarBind>}
     */
    list {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the number of variable bindings in the list.
     * @type {Integer}
     */
    len {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
