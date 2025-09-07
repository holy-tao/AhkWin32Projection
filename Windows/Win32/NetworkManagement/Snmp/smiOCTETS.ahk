#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class smiOCTETS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies an unsigned long integer value that indicates the number of bytes in the octet string array pointed to by the <b>ptr</b> member.
     * @type {Integer}
     */
    len {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a byte array that contains the octet string of interest. A <b>NULL</b>-terminating byte is not required.
     * @type {Pointer<Byte>}
     */
    ptr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
