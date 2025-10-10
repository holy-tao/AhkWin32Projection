#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies which code page (if any) to use in setting text, whether the text replaces all the text in the control or just the selection, and whether the undo state is to be preserved. This structure is used with the EM_SETTEXTEX message.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-settextex
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class SETTEXTEX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Option flags. It can be any reasonable combination of the following flags. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ST_DEFAULT"></a><a id="st_default"></a><dl>
     * <dt><b>ST_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deletes the undo stack, discards rich-text formatting, replaces all text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ST_KEEPUNDO"></a><a id="st_keepundo"></a><dl>
     * <dt><b>ST_KEEPUNDO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keeps the undo stack.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ST_SELECTION"></a><a id="st_selection"></a><dl>
     * <dt><b>ST_SELECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Replaces selection and keeps rich-text formatting.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ST_NEWCHARS"></a><a id="st_newchars"></a><dl>
     * <dt><b>ST_NEWCHARS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Act as if new characters are being entered. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ST_UNICODE"></a><a id="st_unicode"></a><dl>
     * <dt><b>ST_UNICODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The text is UTF-16 
     * (the <b>WCHAR</b> data type).
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The code page used to translate the text to Unicode. If <b>codepage</b> is 1200 (Unicode code page), no translation is done. If <b>codepage</b> is CP_ACP, the system code page is used.
     * @type {Integer}
     */
    codepage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
