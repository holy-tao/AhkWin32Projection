#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_ATMA_DATA structure represents a DNS ATM address (ATMA) resource record (RR).
 * @remarks
 * 
  * The 
  * <b>DNS_ATMA_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_atma_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_ATMA_DATA extends Win32Struct
{
    static sizeof => 21

    static packingSize => 1

    /**
     * The format of the ATM address in <b>Address</b>. The possible values for <b>AddressType</b> are: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_ATMA_FORMAT_AESA"></a><a id="dns_atma_format_aesa"></a><dl>
     * <dt><b>DNS_ATMA_FORMAT_AESA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An address of the form: 39.246f.123456789abcdefa0123.00123456789a.00. It is a 40 hex character address mapped to 20 octets with arbitrarily placed "." separators. Its length is exactly <b>DNS_ATMA_AESA_ADDR_LENGTH</b> bytes. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_ATMA_FORMAT_E164"></a><a id="dns_atma_format_e164"></a><dl>
     * <dt><b>DNS_ATMA_FORMAT_E164</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An address of the form: +358.400.1234567\0.  The null-terminated hex characters map one-to-one into the ATM address
     *     with arbitrarily placed "." separators. The '+' indicates it is an E.164 format address. Its length is less than <b>DNS_ATMA_MAX_ADDR_LENGTH</b> bytes.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * A <b>BYTE</b> array that contains the ATM address whose format is specified by <b>AddressType</b>.
     * @type {Array<Byte>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 1, 20, Primitive, "char")
            return this.__AddressProxyArray
        }
    }
}
