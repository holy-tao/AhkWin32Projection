#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include .\NMCUSTOMDRAW.ahk
#Include ..\..\Graphics\Gdi\HBRUSH.ahk
#Include ..\..\Graphics\Gdi\HPEN.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * Contains information specific to an NM_CUSTOMDRAW notification code sent by a toolbar control.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmtbcustomdraw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTBCUSTOMDRAW extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a> structure that contains general custom draw information. The 
     * 					<b>uItemState</b> member of this structure can be modified so that a toolbar item will be drawn in the specified state without actually changing the item's state.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBRUSH</a></b>
     * 
     * HBRUSH that the control will use when drawing the background of marked or dithered items. This member is ignored if TBCDRF_NOMARK is returned from the <a href="https://docs.microsoft.com/windows/desktop/Controls/nm-customdraw-toolbar">NM_CUSTOMDRAW</a> notification code.
     * @type {HBRUSH}
     */
    hbrMonoDither{
        get {
            if(!this.HasProp("__hbrMonoDither"))
                this.__hbrMonoDither := HBRUSH(this.ptr + 80)
            return this.__hbrMonoDither
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBRUSH</a></b>
     * 
     * HBRUSH that the control will use when drawing lines on the buttons.
     * @type {HBRUSH}
     */
    hbrLines{
        get {
            if(!this.HasProp("__hbrLines"))
                this.__hbrLines := HBRUSH(this.ptr + 88)
            return this.__hbrLines
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HPEN</a></b>
     * 
     * HPEN that the control will use when drawing lines on the buttons.
     * @type {HPEN}
     */
    hpenLines{
        get {
            if(!this.HasProp("__hpenLines"))
                this.__hpenLines := HPEN(this.ptr + 96)
            return this.__hpenLines
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that represents the color that the control will use when drawing text on normal items.
     * @type {COLORREF}
     */
    clrText{
        get {
            if(!this.HasProp("__clrText"))
                this.__clrText := COLORREF(this.ptr + 104)
            return this.__clrText
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the background color that the control will use when drawing text on marked items.
     * @type {COLORREF}
     */
    clrMark{
        get {
            if(!this.HasProp("__clrMark"))
                this.__clrMark := COLORREF(this.ptr + 108)
            return this.__clrMark
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the color that the control will use when drawing text on highlighted items.
     * @type {COLORREF}
     */
    clrTextHighlight{
        get {
            if(!this.HasProp("__clrTextHighlight"))
                this.__clrTextHighlight := COLORREF(this.ptr + 112)
            return this.__clrTextHighlight
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the face color that the control will use when drawing buttons.
     * @type {COLORREF}
     */
    clrBtnFace{
        get {
            if(!this.HasProp("__clrBtnFace"))
                this.__clrBtnFace := COLORREF(this.ptr + 116)
            return this.__clrBtnFace
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the face color that the control will use when drawing highlighted items. An item is highlighted if it has the <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-button-states">TBSTATE_MARKED</a> style and is contained in a toolbar that has the <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">TBSTYLE_FLAT</a> style.
     * @type {COLORREF}
     */
    clrBtnHighlight{
        get {
            if(!this.HasProp("__clrBtnHighlight"))
                this.__clrBtnHighlight := COLORREF(this.ptr + 120)
            return this.__clrBtnHighlight
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the background color that the control will use when drawing text on hot tracked items. This member is ignored if TBCDRF_HILITEHOTTRACK is not returned from the <a href="https://docs.microsoft.com/windows/desktop/Controls/nm-customdraw-toolbar">NM_CUSTOMDRAW</a> notification code.
     * @type {COLORREF}
     */
    clrHighlightHotTrack{
        get {
            if(!this.HasProp("__clrHighlightHotTrack"))
                this.__clrHighlightHotTrack := COLORREF(this.ptr + 124)
            return this.__clrHighlightHotTrack
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that, on entry, contains the rectangle of the item's text. The 
     * 					<b>right</b> and 
     * 					<b>bottom</b> members of this structure can be modified to change the width and height, respectively, of the text rectangle of the item.
     * @type {RECT}
     */
    rcText{
        get {
            if(!this.HasProp("__rcText"))
                this.__rcText := RECT(this.ptr + 128)
            return this.__rcText
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Background mode that the control will use when drawing the text of a nonhighlighted item. This can be either the TRANSPARENT or OPAQUE value.
     * @type {Integer}
     */
    nStringBkMode {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * Type: <b>int</b>
     * 
     * Background mode that the control will use when drawing the text of a highlighted item. This can be either the TRANSPARENT or OPAQUE value.
     * @type {Integer}
     */
    nHLStringBkMode {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0</a> Specifies the distance between the toolbar button image and the text, in logical pixels, for toolbars that have <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">TBSTYLE_LIST</a> style set.
     * 
     * Note that Comctl32.dll version 6 is not redistributable but it is included in Windows or later. To use Comctl32.dll version 6, specify it in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @type {Integer}
     */
    iListGap {
        get => NumGet(this, 152, "int")
        set => NumPut("int", value, this, 152)
    }
}
