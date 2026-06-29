#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AsnObjectIdentifier.ahk" { AsnObjectIdentifier }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\AsnOctetString.ahk" { AsnOctetString }

/**
 * The AsnAny structure contains an SNMP variable type and value. This structure is a member of the SnmpVarBind structure that is used as a parameter in many of the SNMP functions. This structure is not used by the WinSNMP API functions.
 * @remarks
 * To use the definition of the Unsigned32 type described in RFC 1902, you can specify the ASN_GAUGE32 variable type. Currently the ASN_UNSIGNED32 variable type specifies the UInteger32 type described in RFC 1442.
 * @see https://learn.microsoft.com/windows/win32/api/snmp/ns-snmp-asnany
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct AsnAny {
    #StructPack 4


    struct _asnValue {
        number : Int32

        static __New() {
            DefineProp(this.Prototype, 'unsigned32', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'counter64', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'string', { type: AsnOctetString, offset: 0 })
            DefineProp(this.Prototype, 'bits', { type: AsnOctetString, offset: 0 })
            DefineProp(this.Prototype, 'object', { type: AsnObjectIdentifier, offset: 0 })
            DefineProp(this.Prototype, 'sequence', { type: AsnOctetString, offset: 0 })
            DefineProp(this.Prototype, 'address', { type: AsnOctetString, offset: 0 })
            DefineProp(this.Prototype, 'counter', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'gauge', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'ticks', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'arbitrary', { type: AsnOctetString, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Type: <b>BYTE</b>
     */
    asnType : Int8

    asnValue : AsnAny._asnValue

}
