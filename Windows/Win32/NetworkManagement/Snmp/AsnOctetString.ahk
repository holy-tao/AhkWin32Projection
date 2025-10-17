#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AsnOctetString structure contains octet quantities, usually bytes. This structure is used by multiple SNMP functions. This structure is not used by the WinSNMP API functions.
 * @remarks
 * 
  * Use the 
  * <b>AsnOctetString</b> structure to transfer string values. For example, use it to transfer the string that represents a computer name as a MIB object value.
  * 
  * You must check the flag specified in the <b>dynamic</b> member before you release the data stream of an octet string. Call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemfree">SnmpUtilMemFree</a> function only if the <b>dynamic</b> member is set to <b>TRUE</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//snmp/ns-snmp-asnoctetstring
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class AsnOctetString extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to the octet stream.
     * @type {Pointer<Byte>}
     */
    stream {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of octets in the data stream.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Flag that specifies whether the data stream has been dynamically allocated with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemalloc">SnmpUtilMemAlloc</a> function.
     * @type {BOOL}
     */
    dynamic {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
