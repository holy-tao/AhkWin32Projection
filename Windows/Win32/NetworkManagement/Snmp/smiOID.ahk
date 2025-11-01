#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WinSNMP smiOID structure passes object identifiers to multiple WinSNMP functions. The structure also receives the variable name of a variable binding entry in a call to the SnmpGetVb function.
 * @remarks
 * 
  * In an 
  * <b>smiOID</b> structure, the format of the array pointed to by the <b>ptr</b> member is one subidentifier per array element. For example, the string "1.3.6.1" would be an array of four elements {1,3,6,1}.
  * 
  * The Microsoft WinSNMP implementation allocates and deallocates memory for all output 
  * <b>smiOID</b> structures. The WinSNMP application should not free memory that the implementation allocates for the <b>ptr</b> member of an 
  * <b>smiOID</b> structure. Instead, the application must call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpfreedescriptor">SnmpFreeDescriptor</a> function to free the memory.
  * 
  * Because the WinSNMP application allocates memory for input descriptor objects with variable lengths, it must free that memory. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/SNMP/winsnmp-data-management-concepts">WinSNMP Data Management Concepts</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsnmp/ns-winsnmp-smioid
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class smiOID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies an unsigned long integer value that indicates the number of elements in the array pointed to by the <b>ptr</b> member.
     * @type {Integer}
     */
    len {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of unsigned long integers that represent the object identifier's subidentifiers.
     * @type {Pointer<Integer>}
     */
    ptr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
