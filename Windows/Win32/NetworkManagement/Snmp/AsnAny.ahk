#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AsnOctetString.ahk
#Include .\AsnObjectIdentifier.ahk

/**
 * The AsnAny structure contains an SNMP variable type and value. This structure is a member of the SnmpVarBind structure that is used as a parameter in many of the SNMP functions. This structure is not used by the WinSNMP API functions.
 * @remarks
 * To use the definition of the Unsigned32 type described in RFC 1902, you can specify the ASN_GAUGE32 variable type. Currently the ASN_UNSIGNED32 variable type specifies the UInteger32 type described in RFC 1442.
 * @see https://learn.microsoft.com/windows/win32/api/snmp/ns-snmp-asnany
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class AsnAny extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _asnValue_e__Union extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Integer}
         */
        number {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        unsigned32 {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        counter64 {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {AsnOctetString}
         */
        string{
            get {
                if(!this.HasProp("__string"))
                    this.__string := AsnOctetString(0, this)
                return this.__string
            }
        }
    
        /**
         * @type {AsnOctetString}
         */
        bits{
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := AsnOctetString(0, this)
                return this.__bits
            }
        }
    
        /**
         * @type {AsnObjectIdentifier}
         */
        object{
            get {
                if(!this.HasProp("__object"))
                    this.__object := AsnObjectIdentifier(0, this)
                return this.__object
            }
        }
    
        /**
         * @type {AsnOctetString}
         */
        sequence{
            get {
                if(!this.HasProp("__sequence"))
                    this.__sequence := AsnOctetString(0, this)
                return this.__sequence
            }
        }
    
        /**
         * @type {AsnOctetString}
         */
        address{
            get {
                if(!this.HasProp("__address"))
                    this.__address := AsnOctetString(0, this)
                return this.__address
            }
        }
    
        /**
         * @type {Integer}
         */
        counter {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        gauge {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ticks {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {AsnOctetString}
         */
        arbitrary{
            get {
                if(!this.HasProp("__arbitrary"))
                    this.__arbitrary := AsnOctetString(0, this)
                return this.__arbitrary
            }
        }
    
    }

    /**
     * Type: <b>BYTE</b>
     * @type {Integer}
     */
    asnType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {_asnValue_e__Union}
     */
    asnValue{
        get {
            if(!this.HasProp("__asnValue"))
                this.__asnValue := %this.__Class%._asnValue_e__Union(8, this)
            return this.__asnValue
        }
    }
}
