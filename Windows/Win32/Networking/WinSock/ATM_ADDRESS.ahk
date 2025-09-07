#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ATM_ADDRESS structure holds ATM address data for ATM-based sockets.
 * @remarks
 * For ATM_E164, enter the numbered digits in the same order in which they would be entered on a numeric keypad; that is, the number digit that would be entered first is located in <b>addr</b>. Digits are coded in IA5 characters. Bit 8 is set to zero.
  * 
  * For ATM_NSAP, code the address using Binary Coded Decimal (BCD) as defined in the ATM Forum UNI 3.1. The <b>NumofDigits</b> field is ignored in this case, and the NSAP-style address always contains 20 bytes.
  * 
  * A value of SAP_FIELD_ANY in <b>AddressType</b> indicates that the <b>satm_number</b> field is a wildcard. There are two more specialized wildcard values: SAP_FIELD_ANY_AESA_SEL and SAP_FIELD_ANY_AESA_REST. SAP_FIELD_ANY_AESA_SEL means that this is an NSAP-style ATM Endsystem Address and the selector octet is set as a wildcard. SAP_FIELD_ANY_AESA_REST means that this is an NSAP-style ATM Endsystem Address and all the octets except for the selector octet are set as wildcards.
 * @see https://learn.microsoft.com/windows/win32/api/ws2atm/ns-ws2atm-atm_address
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ATM_ADDRESS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type of end-system ATM address.
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of digits in the <b>Addr</b> parameter.
     * @type {Integer}
     */
    NumofDigits {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array representing the ATM address.
     * @type {Array<Byte>}
     */
    Addr{
        get {
            if(!this.HasProp("__AddrProxyArray"))
                this.__AddrProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__AddrProxyArray
        }
    }
}
