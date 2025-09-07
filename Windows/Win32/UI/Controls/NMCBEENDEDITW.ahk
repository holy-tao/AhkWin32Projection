#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk

/**
 * Contains information about the conclusion of an edit operation within a ComboBoxEx control. This structure is used with the CBEN_ENDEDIT notification code. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The commctrl.h header defines NMCBEENDEDIT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcbeendeditw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class NMCBEENDEDITW extends Win32Struct
{
    static sizeof => 560

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification code.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A value indicating whether the contents of the control's edit box have changed. This value is nonzero if the contents have been modified, or zero otherwise.
     * @type {Integer}
     */
    fChanged {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index of the item that will be selected after completing the edit operation. This value can be CB_ERR if no item will be selected.
     * @type {Integer}
     */
    iNewSelection {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">TCHAR</a></b>
     * 
     * A zero-terminated string that contains the text from within the control's edit box.
     * @type {String}
     */
    szText {
        get => StrGet(this.ptr + 32, 259, "UTF-16")
        set => StrPut(value, this.ptr + 32, 259, "UTF-16")
    }

    /**
     * Type: <b>int</b>
     * 
     * A value that specifies the action that generated the <a href="https://docs.microsoft.com/windows/desktop/Controls/cben-endedit">CBEN_ENDEDIT</a> notification code. This value can be one of the following: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBENF_DROPDOWN"></a><a id="cbenf_dropdown"></a><dl>
     * <dt><b>CBENF_DROPDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user activated the drop-down list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBENF_ESCAPE"></a><a id="cbenf_escape"></a><dl>
     * <dt><b>CBENF_ESCAPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed ESC.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBENF_KILLFOCUS"></a><a id="cbenf_killfocus"></a><dl>
     * <dt><b>CBENF_KILLFOCUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit box lost the keyboard focus.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBENF_RETURN"></a><a id="cbenf_return"></a><dl>
     * <dt><b>CBENF_RETURN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user completed the edit operation by pressing ENTER.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    iWhy {
        get => NumGet(this, 552, "int")
        set => NumPut("int", value, this, 552)
    }
}
