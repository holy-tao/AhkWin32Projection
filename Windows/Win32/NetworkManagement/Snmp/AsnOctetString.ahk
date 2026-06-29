#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The AsnOctetString structure contains octet quantities, usually bytes. This structure is used by multiple SNMP functions. This structure is not used by the WinSNMP API functions.
 * @remarks
 * Use the 
 * <b>AsnOctetString</b> structure to transfer string values. For example, use it to transfer the string that represents a computer name as a MIB object value.
 * 
 * You must check the flag specified in the <b>dynamic</b> member before you release the data stream of an octet string. Call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemfree">SnmpUtilMemFree</a> function only if the <b>dynamic</b> member is set to <b>TRUE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/snmp/ns-snmp-asnoctetstring
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @architecture X64, Arm64
 */
export default struct AsnOctetString {
    #StructPack 8

    /**
     * Pointer to the octet stream.
     */
    stream : IntPtr

    /**
     * The number of octets in the data stream.
     */
    length : UInt32

    /**
     * Flag that specifies whether the data stream has been dynamically allocated with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/snmp/nf-snmp-snmputilmemalloc">SnmpUtilMemAlloc</a> function.
     */
    dynamic : BOOL

}
