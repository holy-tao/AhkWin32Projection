#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk

/**
 * Stores information required to process the MCN_VIEWCHANGE notification code.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmviewchange
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMVIEWCHANGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
     * @type {NMHDR}
     */
    nmhdr{
        get {
            if(!this.HasProp("__nmhdr"))
                this.__nmhdr := NMHDR(this.ptr + 0)
            return this.__nmhdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Old view. One of the following constants.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCMV_MONTH"></a><a id="mcmv_month"></a><dl>
     * <dt><b>MCMV_MONTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Monthly view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCMV_YEAR"></a><a id="mcmv_year"></a><dl>
     * <dt><b>MCMV_YEAR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Annual view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCMV_DECADE"></a><a id="mcmv_decade"></a><dl>
     * <dt><b>MCMV_DECADE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Decade view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCMV_CENTURY"></a><a id="mcmv_century"></a><dl>
     * <dt><b>MCMV_CENTURY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Century view.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwOldView {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * New view. One of the constants listed at <b>dwOldView</b>.
     * @type {Integer}
     */
    dwNewView {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
