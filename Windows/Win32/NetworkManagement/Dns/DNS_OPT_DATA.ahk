#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a DNS Option (OPT) resource record (RR) as specified in section 4 of RFC 2671.
 * @remarks
 * 
  * The 
  * <b>DNS_OPT_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_opt_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_OPT_DATA extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * The length, in bytes, of <b>Data</b>.
     * @type {Integer}
     */
    wDataLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    wPad {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * A <b>BYTE</b> array that contains variable transport level information as specified in section 4 of <a href="https://www.ietf.org/rfc/rfc2671.txt">RFC 2671</a>.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
