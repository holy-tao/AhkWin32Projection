#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include .\NMCUSTOMDRAW.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * Contains information specific to an NM_CUSTOMDRAW (list view) notification code sent by a list-view control.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  Comctl32.dll version 6 is not redistributable but it is included in Windows or later. To use Comctl32.dll version 6, specify it in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmlvcustomdraw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLVCUSTOMDRAW extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a> structure that contains general custom draw information.
     * @type {NMCUSTOMDRAW}
     */
    nmcd{
        get {
            if(!this.HasProp("__nmcd"))
                this.__nmcd := NMCUSTOMDRAW(this.ptr + 0)
            return this.__nmcd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> value representing the color that will be used to display text foreground in the list-view control.
     * @type {COLORREF}
     */
    clrText{
        get {
            if(!this.HasProp("__clrText"))
                this.__clrText := COLORREF(this.ptr + 80)
            return this.__clrText
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> value representing the color that will be used to display text background in the list-view control. In <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0., </a> this member is ignored if the background image is set with the <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-setbkimage">LVM_SETBKIMAGE</a> message.
     * @type {COLORREF}
     */
    clrTextBk{
        get {
            if(!this.HasProp("__clrTextBk"))
                this.__clrTextBk := COLORREF(this.ptr + 84)
            return this.__clrTextBk
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71.</a> Index of the subitem that is being drawn. If the main item is being drawn, this member will be zero.
     * @type {Integer}
     */
    iSubItem {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0. </a>
     * @type {Integer}
     */
    dwItemType {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a> 
     * 					<b>COLORREF</b> value representing the color that will be used to display the face of an item.
     * @type {COLORREF}
     */
    clrFace{
        get {
            if(!this.HasProp("__clrFace"))
                this.__clrFace := COLORREF(this.ptr + 96)
            return this.__clrFace
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					Value of type <b>int</b> that specifies the effect that is applied to an icon, such as Glow, Shadow, or Pulse.
     * @type {Integer}
     */
    iIconEffect {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					Value of type <b>int</b> that specifies the phase of an icon.
     * @type {Integer}
     */
    iIconPhase {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					Value of type <b>int</b> that specifies the ID of the part of an item to draw.
     * @type {Integer}
     */
    iPartId {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					Value of type <b>int</b> that specifies the ID of the state of an item to draw.
     * @type {Integer}
     */
    iStateId {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					<b>RECT</b> that specifies the rectangle in which the text is to be drawn.
     * @type {RECT}
     */
    rcText{
        get {
            if(!this.HasProp("__rcText"))
                this.__rcText := RECT(this.ptr + 120)
            return this.__rcText
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>
     * @type {Integer}
     */
    uAlign {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}
