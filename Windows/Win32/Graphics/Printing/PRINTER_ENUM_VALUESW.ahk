#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The PRINTER\_ENUM\_VALUES structure specifies the value name, type, and data for a printer configuration value returned by the EnumPrinterDataEx function.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-enum-values
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct PRINTER_ENUM_VALUESW {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the name of the retrieved value.
     */
    pValueName : PWSTR

    /**
     * The number of bytes in the **pValueName** member, including the terminating NULL character.
     */
    cbValueName : UInt32

    /**
     * A code indicating the type of data pointed to by the **pData** member. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
     */
    dwType : UInt32

    /**
     * Pointer to a buffer containing the data for the retrieved value.
     */
    pData : IntPtr

    /**
     * The number of bytes retrieved in the **pData** buffer.
     */
    cbData : UInt32

}
