#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AsnObjectIdentifier.ahk" { AsnObjectIdentifier }
#Import ".\AsnAny.ahk" { AsnAny }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\AsnOctetString.ahk" { AsnOctetString }

/**
 * The SnmpVarBind structure represents an SNMP variable binding. This structure is used by multiple SNMP functions. This structure is not used by the WinSNMP API functions.
 * @see https://learn.microsoft.com/windows/win32/api/snmp/ns-snmp-snmpvarbind
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SnmpVarBind {
    #StructPack 8

    /**
     * Indicates the variable's name, as an object identifier.
     */
    name : AsnObjectIdentifier

    /**
     * Contains the variable's value.
     */
    value : AsnAny

}
