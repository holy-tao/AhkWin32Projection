#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import ".\CHARRANGE.ahk" { CHARRANGE }

/**
 * Contains context menu information that is passed to the IRichEditOleCallback::GetContextMenu method.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-getcontextmenuex
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct GETCONTEXTMENUEX {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The character-position range in the active display.
     */
    chrg : CHARRANGE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * One or more of the following content menu flags: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GCMF_GRIPPER"></a><a id="gcmf_gripper"></a><dl>
     * <dt><b>GCMF_GRIPPER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get the context menu that is invoked by tapping a touch gripper handle. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GCMF_SPELLING"></a><a id="gcmf_spelling"></a><dl>
     * <dt><b>GCMF_SPELLING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get the context menu for a spelling error. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GCMF_MOUSEMENU"></a><a id="gcmf_mousemenu"></a><dl>
     * <dt><b>GCMF_MOUSEMENU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get the context menu that is invoked by mouse.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GCMF_TOUCHMENU"></a><a id="gcmf_touchmenu"></a><dl>
     * <dt><b>GCMF_TOUCHMENU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get the context menu that is invoked by touch. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The screen coordinates for the content menu.
     */
    pt : POINT

    /**
     * Type: <b>void*</b>
     * 
     * Not used; must be zero.
     */
    pvReserved : IntPtr

}
