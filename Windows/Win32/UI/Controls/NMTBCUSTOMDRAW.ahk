#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\NMCUSTOMDRAW.ahk

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
     * @type {Pointer<Void>}
     */
    hbrMonoDither {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBRUSH</a></b>
     * 
     * HBRUSH that the control will use when drawing lines on the buttons.
     * @type {Pointer<Void>}
     */
    hbrLines {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HPEN</a></b>
     * 
     * HPEN that the control will use when drawing lines on the buttons.
     * @type {Pointer<Void>}
     */
    hpenLines {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that represents the color that the control will use when drawing text on normal items.
     * @type {Integer}
     */
    clrText {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the background color that the control will use when drawing text on marked items.
     * @type {Integer}
     */
    clrMark {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the color that the control will use when drawing text on highlighted items.
     * @type {Integer}
     */
    clrTextHighlight {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the face color that the control will use when drawing buttons.
     * @type {Integer}
     */
    clrBtnFace {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the face color that the control will use when drawing highlighted items. An item is highlighted if it has the <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-button-states">TBSTATE_MARKED</a> style and is contained in a toolbar that has the <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">TBSTYLE_FLAT</a> style.
     * @type {Integer}
     */
    clrBtnHighlight {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the background color that the control will use when drawing text on hot tracked items. This member is ignored if TBCDRF_HILITEHOTTRACK is not returned from the <a href="https://docs.microsoft.com/windows/desktop/Controls/nm-customdraw-toolbar">NM_CUSTOMDRAW</a> notification code.
     * @type {Integer}
     */
    clrHighlightHotTrack {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
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
