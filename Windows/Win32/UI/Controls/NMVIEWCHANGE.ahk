#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\MONTH_CALDENDAR_MESSAGES_VIEW.ahk" { MONTH_CALDENDAR_MESSAGES_VIEW }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Stores information required to process the MCN_VIEWCHANGE notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmviewchange
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMVIEWCHANGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
     */
    nmhdr : NMHDR

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
     */
    dwOldView : MONTH_CALDENDAR_MESSAGES_VIEW

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * New view. One of the constants listed at <b>dwOldView</b>.
     */
    dwNewView : MONTH_CALDENDAR_MESSAGES_VIEW

}
