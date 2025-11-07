#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_NULL_DATA structure represents NULL data for a DNS resource record as specified in section 3.3.10 of RFC 1035.
 * @remarks
 * 
 * The 
 * <b>DNS_NULL_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_null_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_NULL_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of bytes represented in <b>Data</b>.
     * @type {Integer}
     */
    dwByteCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Null data.
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
