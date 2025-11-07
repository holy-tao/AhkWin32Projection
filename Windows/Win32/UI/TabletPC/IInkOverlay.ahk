#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkRenderer.ahk
#Include .\IInkDisp.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Ole\IPictureDisp.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkCursors.ahk
#Include .\IInkTablet.ahk
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
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_hwnd
     */
    get_hWnd() {
        result := ComCall(7, this, "ptr*", &CurrentWindow := 0, "HRESULT")
        return CurrentWindow
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_enabled
     */
    get_Enabled() {
        result := ComCall(9, this, "short*", &Collecting := 0, "HRESULT")
        return Collecting
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
     * @returns {IInkDrawingAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_defaultdrawingattributes
     */
    get_DefaultDrawingAttributes() {
        result := ComCall(11, this, "ptr*", &CurrentAttributes := 0, "HRESULT")
        return IInkDrawingAttributes(CurrentAttributes)
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
     * @returns {IInkRenderer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_renderer
     */
    get_Renderer() {
        result := ComCall(13, this, "ptr*", &CurrentInkRenderer := 0, "HRESULT")
        return IInkRenderer(CurrentInkRenderer)
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
     * @returns {IInkDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_ink
     */
    get_Ink() {
        result := ComCall(15, this, "ptr*", &Ink := 0, "HRESULT")
        return IInkDisp(Ink)
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_autoredraw
     */
    get_AutoRedraw() {
        result := ComCall(17, this, "short*", &AutoRedraw := 0, "HRESULT")
        return AutoRedraw
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_collectingink
     */
    get_CollectingInk() {
        result := ComCall(19, this, "short*", &Collecting := 0, "HRESULT")
        return Collecting
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_collectionmode
     */
    get_CollectionMode() {
        result := ComCall(20, this, "int*", &Mode := 0, "HRESULT")
        return Mode
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_dynamicrendering
     */
    get_DynamicRendering() {
        result := ComCall(22, this, "short*", &Enabled := 0, "HRESULT")
        return Enabled
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_desiredpacketdescription
     */
    get_DesiredPacketDescription() {
        PacketGuids := VARIANT()
        result := ComCall(24, this, "ptr", PacketGuids, "HRESULT")
        return PacketGuids
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
     * @returns {IPictureDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_mouseicon
     */
    get_MouseIcon() {
        result := ComCall(26, this, "ptr*", &MouseIcon := 0, "HRESULT")
        return IPictureDisp(MouseIcon)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_mousepointer
     */
    get_MousePointer() {
        result := ComCall(29, this, "int*", &MousePointer := 0, "HRESULT")
        return MousePointer
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_editingmode
     */
    get_EditingMode() {
        result := ComCall(31, this, "int*", &EditingMode := 0, "HRESULT")
        return EditingMode
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
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_selection
     */
    get_Selection() {
        result := ComCall(33, this, "ptr*", &Selection := 0, "HRESULT")
        return IInkStrokes(Selection)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_erasermode
     */
    get_EraserMode() {
        result := ComCall(35, this, "int*", &EraserMode := 0, "HRESULT")
        return EraserMode
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_eraserwidth
     */
    get_EraserWidth() {
        result := ComCall(37, this, "int*", &EraserWidth := 0, "HRESULT")
        return EraserWidth
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_attachmode
     */
    get_AttachMode() {
        result := ComCall(39, this, "int*", &AttachMode := 0, "HRESULT")
        return AttachMode
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
     * @returns {IInkCursors} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_cursors
     */
    get_Cursors() {
        result := ComCall(41, this, "ptr*", &Cursors := 0, "HRESULT")
        return IInkCursors(Cursors)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_marginx
     */
    get_MarginX() {
        result := ComCall(42, this, "int*", &MarginX := 0, "HRESULT")
        return MarginX
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_marginy
     */
    get_MarginY() {
        result := ComCall(44, this, "int*", &MarginY := 0, "HRESULT")
        return MarginY
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
     * @returns {IInkTablet} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_tablet
     */
    get_Tablet() {
        result := ComCall(46, this, "ptr*", &SingleTablet := 0, "HRESULT")
        return IInkTablet(SingleTablet)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_supporthighcontrastink
     */
    get_SupportHighContrastInk() {
        result := ComCall(47, this, "short*", &Support := 0, "HRESULT")
        return Support
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-get_supporthighcontrastselectionui
     */
    get_SupportHighContrastSelectionUI() {
        result := ComCall(49, this, "short*", &Support := 0, "HRESULT")
        return Support
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-hittestselection
     */
    HitTestSelection(x, y) {
        result := ComCall(51, this, "int", x, "int", y, "int*", &SelArea := 0, "HRESULT")
        return SelArea
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-getgesturestatus
     */
    GetGestureStatus(Gesture) {
        result := ComCall(54, this, "int", Gesture, "short*", &Listening := 0, "HRESULT")
        return Listening
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkoverlay-geteventinterest
     */
    GetEventInterest(EventId) {
        result := ComCall(59, this, "int", EventId, "short*", &Listen := 0, "HRESULT")
        return Listen
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
