#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PRINTER\_ENUM\_VALUES structure specifies the value name, type, and data for a printer configuration value returned by the EnumPrinterDataEx function.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-enum-values
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PRINTER_ENUM_VALUESW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the name of the retrieved value.
     * @type {PWSTR}
     */
    pValueName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of bytes in the **pValueName** member, including the terminating NULL character.
     * @type {Integer}
     */
    cbValueName {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A code indicating the type of data pointed to by the **pData** member. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Pointer to a buffer containing the data for the retrieved value.
     * @type {Pointer<Integer>}
     */
    pData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of bytes retrieved in the **pData** buffer.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
