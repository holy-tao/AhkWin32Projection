#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WinSNMP smiOCTETS structure passes context strings to multiple WinSNMP functions. The structure also describes and receives encoded SNMP messages.
 * @remarks
 * The Microsoft WinSNMP implementation allocates and deallocates memory for all output 
 * <b>smiOCTETS</b> structures. The WinSNMP application should not free memory that the implementation allocates for the <b>ptr</b> member of an 
 * <b>smiOCTETS</b> structure. Instead, the application must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a> function to free the memory.
 * 
 * Because the WinSNMP application allocates memory for input descriptor objects with variable lengths, it must free that memory. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsnmp/ns-winsnmp-smioctets
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct smiOCTETS {
    #StructPack 8

    /**
     * Specifies an unsigned long integer value that indicates the number of bytes in the octet string array pointed to by the <b>ptr</b> member.
     */
    len : UInt32

    /**
     * Pointer to a byte array that contains the octet string of interest. A <b>NULL</b>-terminating byte is not required.
     */
    ptr : IntPtr

}
