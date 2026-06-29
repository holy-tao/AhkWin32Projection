#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SnmpVarBind.ahk" { SnmpVarBind }

/**
 * The SnmpVarBindList structure represents an SNMP variable bindings list. This structure is used by multiple SNMP functions. This structure is not used by the WinSNMP API functions.
 * @see https://learn.microsoft.com/windows/win32/api/snmp/ns-snmp-snmpvarbindlist
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @architecture X64, Arm64
 */
export default struct SnmpVarBindList {
    #StructPack 8

    /**
     * A pointer that references an array to access individual variable bindings.
     */
    list : SnmpVarBind.Ptr

    /**
     * Contains the number of variable bindings in the list.
     */
    len : UInt32

}
