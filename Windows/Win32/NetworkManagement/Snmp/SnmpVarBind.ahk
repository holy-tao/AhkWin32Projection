#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AsnObjectIdentifier.ahk
#Include .\AsnOctetString.ahk
#Include .\AsnAny.ahk

/**
 * The SnmpVarBind structure represents an SNMP variable binding. This structure is used by multiple SNMP functions. This structure is not used by the WinSNMP API functions.
 * @see https://learn.microsoft.com/windows/win32/api/snmp/ns-snmp-snmpvarbind
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class SnmpVarBind extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Indicates the variable's name, as an object identifier.
     * @type {AsnObjectIdentifier}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := AsnObjectIdentifier(0, this)
            return this.__name
        }
    }

    /**
     * Contains the variable's value.
     * @type {AsnAny}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := AsnAny(16, this)
            return this.__value
        }
    }
}
