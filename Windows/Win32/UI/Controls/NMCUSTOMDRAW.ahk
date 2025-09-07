#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information specific to an NM_CUSTOMDRAW notification code.
 * @remarks
 * The value your application returns depends on the current drawing stage. The <b>dwDrawStage</b> member of the associated <b>NMCUSTOMDRAW</b> structure holds a value that specifies the drawing stage. When the <b>dwDrawStage</b> member equals CDDS_PREPAINT and CDDS_PREERASE, some controls send the CDDS_PREERASE message first and expect the return value to indicate which subsequent messages will be sent. For a code sample that illustrates states and drawing stages, see <a href="https://docs.microsoft.com/windows/desktop/Controls/custom-draw">Customizing a Control's Appearance Using Custom Draw</a>.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMCUSTOMDRAW extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwDrawStage {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * A handle to the control's device context. Use this HDC to perform any GDI functions.
     * @type {Pointer<Ptr>}
     */
    hdc {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the bounding rectangle of the area being drawn. This member is initialized only by the CDDS_ITEMPREPAINT notification. <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80.</a> This member is also initialized by the CDDS_PREPAINT notification.
     * @type {RECT}
     */
    rc{
        get {
            if(!this.HasProp("__rc"))
                this.__rc := RECT(this.ptr + 40)
            return this.__rc
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * The item number. What is contained in this member will depend on the type of control that is sending the notification. See the <a href="https://docs.microsoft.com/windows/desktop/Controls/nm-customdraw">NM_CUSTOMDRAW</a> notification reference for the specific control to determine what, if anything, is contained in this member.
     * @type {Pointer}
     */
    dwItemSpec {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The current item state. This value is a combination of the following flags. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_CHECKED"></a><a id="cdis_checked"></a><dl>
     * <dt><b>CDIS_CHECKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is checked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_DEFAULT"></a><a id="cdis_default"></a><dl>
     * <dt><b>CDIS_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is in its default state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_DISABLED"></a><a id="cdis_disabled"></a><dl>
     * <dt><b>CDIS_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_FOCUS"></a><a id="cdis_focus"></a><dl>
     * <dt><b>CDIS_FOCUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is in focus.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_GRAYED"></a><a id="cdis_grayed"></a><dl>
     * <dt><b>CDIS_GRAYED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is grayed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_HOT"></a><a id="cdis_hot"></a><dl>
     * <dt><b>CDIS_HOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is currently under the pointer ("hot").
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_INDETERMINATE"></a><a id="cdis_indeterminate"></a><dl>
     * <dt><b>CDIS_INDETERMINATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is in an indeterminate state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_MARKED"></a><a id="cdis_marked"></a><dl>
     * <dt><b>CDIS_MARKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is marked. The meaning of this is determined by the implementation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_SELECTED"></a><a id="cdis_selected"></a><dl>
     * <dt><b>CDIS_SELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is selected.
     *                     
     * 
     * <div class="alert"><b>Note</b>  This flag does not work correctly for owner-drawn list-view controls that have the <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-window-styles">LVS_SHOWSELALWAYS</a> style. For these controls, you can determine whether an item is selected by using <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-getitemstate">LVM_GETITEMSTATE</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_getitemstate">ListView_GetItemState</a>) and checking for the <b>LVIS_SELECTED</b> flag.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_SHOWKEYBOARDCUES"></a><a id="cdis_showkeyboardcues"></a><dl>
     * <dt><b>CDIS_SHOWKEYBOARDCUES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>The item is showing its keyboard cues. 
     * 
     *                         
     * 
     * Note that Comctl32 version 6 is not redistributable. operating systems. To use Comctl32.dll version 6, specify it in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_NEARHOT"></a><a id="cdis_nearhot"></a><dl>
     * <dt><b>CDIS_NEARHOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is part of a control that is currently under the mouse pointer ("hot"), but the item is not "hot" itself.  The meaning of this is determined by the implementation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_OTHERSIDEHOT"></a><a id="cdis_othersidehot"></a><dl>
     * <dt><b>CDIS_OTHERSIDEHOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is part of a splitbutton that is currently under the mouse pointer ("hot"), but the item is not "hot" itself.  The meaning of this is determined by the implementation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CDIS_DROPHILITED"></a><a id="cdis_drophilited"></a><dl>
     * <dt><b>CDIS_DROPHILITED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item is currently the drop target of a drag-and-drop operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    uItemState {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined item data.
     * @type {Pointer}
     */
    lItemlParam {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
