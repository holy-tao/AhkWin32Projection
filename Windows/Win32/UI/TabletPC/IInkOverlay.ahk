#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @remarks
 * 
  * Creating the InkOverlay control behind a transparent control (such as a GroupBox with the WS_EX_TRANSPARENT property set) will prevent InkOverlay from collecting ink.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkoverlay
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkOverlay extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkOverlay
     * @type {Guid}
     */
    static IID => Guid("{b82a463b-c1c5-45a3-997c-deab5651b67a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_hWnd", "put_hWnd", "get_Enabled", "put_Enabled", "get_DefaultDrawingAttributes", "putref_DefaultDrawingAttributes", "get_Renderer", "putref_Renderer", "get_Ink", "putref_Ink", "get_AutoRedraw", "put_AutoRedraw", "get_CollectingInk", "get_CollectionMode", "put_CollectionMode", "get_DynamicRendering", "put_DynamicRendering", "get_DesiredPacketDescription", "put_DesiredPacketDescription", "get_MouseIcon", "put_MouseIcon", "putref_MouseIcon", "get_MousePointer", "put_MousePointer", "get_EditingMode", "put_EditingMode", "get_Selection", "put_Selection", "get_EraserMode", "put_EraserMode", "get_EraserWidth", "put_EraserWidth", "get_AttachMode", "put_AttachMode", "get_Cursors", "get_MarginX", "put_MarginX", "get_MarginY", "put_MarginY", "get_Tablet", "get_SupportHighContrastInk", "put_SupportHighContrastInk", "get_SupportHighContrastSelectionUI", "put_SupportHighContrastSelectionUI", "HitTestSelection", "Draw", "SetGestureStatus", "GetGestureStatus", "GetWindowInputRectangle", "SetWindowInputRectangle", "SetAllTabletsMode", "SetSingleTabletIntegratedMode", "GetEventInterest", "SetEventInterest"]

    /**
     * 
     * @param {Pointer<Pointer>} CurrentWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_hwnd
     */
    get_hWnd(CurrentWindow) {
        CurrentWindowMarshal := CurrentWindow is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, CurrentWindowMarshal, CurrentWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} NewWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_hwnd
     */
    put_hWnd(NewWindow) {
        result := ComCall(8, this, "ptr", NewWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Collecting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_enabled
     */
    get_Enabled(Collecting) {
        result := ComCall(9, this, "ptr", Collecting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Collecting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_enabled
     */
    put_Enabled(Collecting) {
        result := ComCall(10, this, "short", Collecting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} CurrentAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_defaultdrawingattributes
     */
    get_DefaultDrawingAttributes(CurrentAttributes) {
        result := ComCall(11, this, "ptr*", CurrentAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkDrawingAttributes} NewAttributes 
     * @returns {HRESULT} 
     */
    putref_DefaultDrawingAttributes(NewAttributes) {
        result := ComCall(12, this, "ptr", NewAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkRenderer>} CurrentInkRenderer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_renderer
     */
    get_Renderer(CurrentInkRenderer) {
        result := ComCall(13, this, "ptr*", CurrentInkRenderer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRenderer} NewInkRenderer 
     * @returns {HRESULT} 
     */
    putref_Renderer(NewInkRenderer) {
        result := ComCall(14, this, "ptr", NewInkRenderer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkDisp>} Ink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_ink
     */
    get_Ink(Ink) {
        result := ComCall(15, this, "ptr*", Ink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkDisp} NewInk 
     * @returns {HRESULT} 
     */
    putref_Ink(NewInk) {
        result := ComCall(16, this, "ptr", NewInk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} AutoRedraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_autoredraw
     */
    get_AutoRedraw(AutoRedraw) {
        result := ComCall(17, this, "ptr", AutoRedraw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} AutoRedraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_autoredraw
     */
    put_AutoRedraw(AutoRedraw) {
        result := ComCall(18, this, "short", AutoRedraw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Collecting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_collectingink
     */
    get_CollectingInk(Collecting) {
        result := ComCall(19, this, "ptr", Collecting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_collectionmode
     */
    get_CollectionMode(Mode) {
        ModeMarshal := Mode is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, ModeMarshal, Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_collectionmode
     */
    put_CollectionMode(Mode) {
        result := ComCall(21, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_dynamicrendering
     */
    get_DynamicRendering(Enabled) {
        result := ComCall(22, this, "ptr", Enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_dynamicrendering
     */
    put_DynamicRendering(Enabled) {
        result := ComCall(23, this, "short", Enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PacketGuids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_desiredpacketdescription
     */
    get_DesiredPacketDescription(PacketGuids) {
        result := ComCall(24, this, "ptr", PacketGuids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} PacketGuids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_desiredpacketdescription
     */
    put_DesiredPacketDescription(PacketGuids) {
        result := ComCall(25, this, "ptr", PacketGuids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MouseIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_mouseicon
     */
    get_MouseIcon(MouseIcon) {
        result := ComCall(26, this, "ptr*", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_mouseicon
     */
    put_MouseIcon(MouseIcon) {
        result := ComCall(27, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     */
    putref_MouseIcon(MouseIcon) {
        result := ComCall(28, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MousePointer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_mousepointer
     */
    get_MousePointer(MousePointer) {
        MousePointerMarshal := MousePointer is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, MousePointerMarshal, MousePointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MousePointer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_mousepointer
     */
    put_MousePointer(MousePointer) {
        result := ComCall(30, this, "int", MousePointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} EditingMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_editingmode
     */
    get_EditingMode(EditingMode) {
        EditingModeMarshal := EditingMode is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, EditingModeMarshal, EditingMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EditingMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_editingmode
     */
    put_EditingMode(EditingMode) {
        result := ComCall(32, this, "int", EditingMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Selection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_selection
     */
    get_Selection(Selection) {
        result := ComCall(33, this, "ptr*", Selection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} Selection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_selection
     */
    put_Selection(Selection) {
        result := ComCall(34, this, "ptr", Selection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} EraserMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_erasermode
     */
    get_EraserMode(EraserMode) {
        EraserModeMarshal := EraserMode is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, EraserModeMarshal, EraserMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EraserMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_erasermode
     */
    put_EraserMode(EraserMode) {
        result := ComCall(36, this, "int", EraserMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} EraserWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_eraserwidth
     */
    get_EraserWidth(EraserWidth) {
        EraserWidthMarshal := EraserWidth is VarRef ? "int*" : "ptr"

        result := ComCall(37, this, EraserWidthMarshal, EraserWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newEraserWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_eraserwidth
     */
    put_EraserWidth(newEraserWidth) {
        result := ComCall(38, this, "int", newEraserWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} AttachMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_attachmode
     */
    get_AttachMode(AttachMode) {
        AttachModeMarshal := AttachMode is VarRef ? "int*" : "ptr"

        result := ComCall(39, this, AttachModeMarshal, AttachMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AttachMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_attachmode
     */
    put_AttachMode(AttachMode) {
        result := ComCall(40, this, "int", AttachMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkCursors>} Cursors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_cursors
     */
    get_Cursors(Cursors) {
        result := ComCall(41, this, "ptr*", Cursors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MarginX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_marginx
     */
    get_MarginX(MarginX) {
        MarginXMarshal := MarginX is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, MarginXMarshal, MarginX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MarginX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_marginx
     */
    put_MarginX(MarginX) {
        result := ComCall(43, this, "int", MarginX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MarginY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_marginy
     */
    get_MarginY(MarginY) {
        MarginYMarshal := MarginY is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, MarginYMarshal, MarginY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MarginY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_marginy
     */
    put_MarginY(MarginY) {
        result := ComCall(45, this, "int", MarginY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkTablet>} SingleTablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_tablet
     */
    get_Tablet(SingleTablet) {
        result := ComCall(46, this, "ptr*", SingleTablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Support 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_supporthighcontrastink
     */
    get_SupportHighContrastInk(Support) {
        result := ComCall(47, this, "ptr", Support, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Support 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_supporthighcontrastink
     */
    put_SupportHighContrastInk(Support) {
        result := ComCall(48, this, "short", Support, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Support 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_supporthighcontrastselectionui
     */
    get_SupportHighContrastSelectionUI(Support) {
        result := ComCall(49, this, "ptr", Support, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Support 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-put_supporthighcontrastselectionui
     */
    put_SupportHighContrastSelectionUI(Support) {
        result := ComCall(50, this, "short", Support, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<Integer>} SelArea 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-hittestselection
     */
    HitTestSelection(x, y, SelArea) {
        SelAreaMarshal := SelArea is VarRef ? "int*" : "ptr"

        result := ComCall(51, this, "int", x, "int", y, SelAreaMarshal, SelArea, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} Rect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-draw
     */
    Draw(Rect) {
        result := ComCall(52, this, "ptr", Rect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @param {VARIANT_BOOL} Listen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-setgesturestatus
     */
    SetGestureStatus(Gesture, Listen) {
        result := ComCall(53, this, "int", Gesture, "short", Listen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @param {Pointer<VARIANT_BOOL>} Listening 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-getgesturestatus
     */
    GetGestureStatus(Gesture, Listening) {
        result := ComCall(54, this, "int", Gesture, "ptr", Listening, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} WindowInputRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-getwindowinputrectangle
     */
    GetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(55, this, "ptr*", WindowInputRectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} WindowInputRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-setwindowinputrectangle
     */
    SetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(56, this, "ptr", WindowInputRectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseMouseForInput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-setalltabletsmode
     */
    SetAllTabletsMode(UseMouseForInput) {
        result := ComCall(57, this, "short", UseMouseForInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkTablet} Tablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-setsingletabletintegratedmode
     */
    SetSingleTabletIntegratedMode(Tablet) {
        result := ComCall(58, this, "ptr", Tablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EventId 
     * @param {Pointer<VARIANT_BOOL>} Listen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-geteventinterest
     */
    GetEventInterest(EventId, Listen) {
        result := ComCall(59, this, "int", EventId, "ptr", Listen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EventId 
     * @param {VARIANT_BOOL} Listen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-seteventinterest
     */
    SetEventInterest(EventId, Listen) {
        result := ComCall(60, this, "int", EventId, "short", Listen, "HRESULT")
        return result
    }
}
