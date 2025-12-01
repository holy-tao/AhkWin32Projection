#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PRINTER\_INFO\_1 structure specifies general printer information.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PRINTER_INFO_1A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies information about the returned data. Following are the values for this member.
     * 
     * 
     * 
     * | Value                    | Meaning                                                                                                                                                                                                                                                   |
     * |--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | PRINTER\_ENUM\_EXPAND    | A print provider can set this flag as a hint to a calling application to enumerate this object further if default expansion is enabled. For example, when domains are enumerated, a print provider might indicate the user's domain by setting this flag. |
     * | PRINTER\_ENUM\_CONTAINER | If this flag is set, the printer object may contain enumerable objects. For example, the object may be a print server that contains printers.                                                                                                             |
     * | PRINTER\_ENUM\_ICON1     | Indicates that, where appropriate, an application should display an icon identifying the object as a top-level network name, such as Microsoft Windows Network.                                                                                           |
     * | PRINTER\_ENUM\_ICON2     | Indicates that, where appropriate, an application should display an icon that identifies the object as a network domain.                                                                                                                                  |
     * | PRINTER\_ENUM\_ICON3     | Indicates that, where appropriate, an application should display an icon that identifies the object as a print server.                                                                                                                                    |
     * | PRINTER\_ENUM\_ICON4     | Reserved.                                                                                                                                                                                                                                                 |
     * | PRINTER\_ENUM\_ICON5     | Reserved.                                                                                                                                                                                                                                                 |
     * | PRINTER\_ENUM\_ICON6     | Reserved.                                                                                                                                                                                                                                                 |
     * | PRINTER\_ENUM\_ICON7     | Reserved.                                                                                                                                                                                                                                                 |
     * | PRINTER\_ENUM\_ICON8     | Indicates that, where appropriate, an application should display an icon that identifies the object as a printer.                                                                                                                                         |
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that describes the contents of the structure.
     * @type {PSTR}
     */
    pDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that names the contents of the structure.
     * @type {PSTR}
     */
    pName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated string that contains additional data describing the structure.
     * @type {PSTR}
     */
    pComment {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
