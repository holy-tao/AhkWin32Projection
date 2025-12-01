#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\CHARRANGE.ahk
#Include ..\..\..\Foundation\POINT.ahk

/**
 * Contains context menu information that is passed to the IRichEditOleCallback::GetContextMenu method.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-getcontextmenuex
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class GETCONTEXTMENUEX extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The character-position range in the active display.
     * @type {CHARRANGE}
     */
    chrg{
        get {
            if(!this.HasProp("__chrg"))
                this.__chrg := CHARRANGE(0, this)
            return this.__chrg
        }
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The screen coordinates for the content menu.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(16, this)
            return this.__pt
        }
    }

    /**
     * Type: <b>void*</b>
     * 
     * Not used; must be zero.
     * @type {Pointer<Void>}
     */
    pvReserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
