#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies a particular property sheet in a printer's property pages and whether that property sheet should be modal. Optionally used with the SHInvokePrinterCommand function.
 * @remarks
 * 
 * This structure can be passed in the <i>lpBuf2</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shinvokeprintercommanda">SHInvokePrinterCommand</a> function when that function's <i>uAction</i> parameter is set to PRINTACTION_PROPERTIES.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The shellapi.h header defines OPEN_PRINTER_PROPS_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shellapi/ns-shellapi-open_printer_props_infoa
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class OPEN_PRINTER_PROPS_INFOA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPSTR</b>
     * 
     * The name of the property sheet. If the specified sheet is not found, the property sheet still appears with the default first page.
     * @type {PSTR}
     */
    pszSheetName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The index of the property sheet in the array of property sheets that makes up the window. If empty or invalid, the default first page is displayed.
     * @type {Integer}
     */
    uSheetIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Not used.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the property sheet should be modal; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    bModal {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
