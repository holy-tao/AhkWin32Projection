#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkRenderer.ahk
#Include .\IInkDisp.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Ole\IPictureDisp.ahk
#Include .\IInkCursors.ahk
#Include .\IInkTablet.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @remarks
 * 
  * Creating the InkCollector control behind a transparent control (such as a GroupBox with the WS_EX_TRANSPARENT property set) will prevent InkCollector from collecting ink.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkcollector
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkCollector extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkCollector
     * @type {Guid}
     */
    static IID => Guid("{f0f060b5-8b1f-4a7c-89ec-880692588a4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_hWnd", "put_hWnd", "get_Enabled", "put_Enabled", "get_DefaultDrawingAttributes", "putref_DefaultDrawingAttributes", "get_Renderer", "putref_Renderer", "get_Ink", "putref_Ink", "get_AutoRedraw", "put_AutoRedraw", "get_CollectingInk", "get_CollectionMode", "put_CollectionMode", "get_DynamicRendering", "put_DynamicRendering", "get_DesiredPacketDescription", "put_DesiredPacketDescription", "get_MouseIcon", "put_MouseIcon", "putref_MouseIcon", "get_MousePointer", "put_MousePointer", "get_Cursors", "get_MarginX", "put_MarginX", "get_MarginY", "put_MarginY", "get_Tablet", "get_SupportHighContrastInk", "put_SupportHighContrastInk", "SetGestureStatus", "GetGestureStatus", "GetWindowInputRectangle", "SetWindowInputRectangle", "SetAllTabletsMode", "SetSingleTabletIntegratedMode", "GetEventInterest", "SetEventInterest"]

    /**
     * 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd
     */
    get_hWnd() {
        result := ComCall(7, this, "ptr*", &CurrentWindow := 0, "HRESULT")
        return CurrentWindow
    }

    /**
     * 
     * @param {Pointer} NewWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_hwnd
     */
    put_hWnd(NewWindow) {
        result := ComCall(8, this, "ptr", NewWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled
     */
    get_Enabled() {
        result := ComCall(9, this, "short*", &Collecting := 0, "HRESULT")
        return Collecting
    }

    /**
     * 
     * @param {VARIANT_BOOL} Collecting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_enabled
     */
    put_Enabled(Collecting) {
        result := ComCall(10, this, "short", Collecting, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_defaultdrawingattributes
     */
    get_DefaultDrawingAttributes() {
        result := ComCall(11, this, "ptr*", &CurrentAttributes := 0, "HRESULT")
        return IInkDrawingAttributes(CurrentAttributes)
    }

    /**
     * 
     * @param {IInkDrawingAttributes} NewAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-putref_defaultdrawingattributes
     */
    putref_DefaultDrawingAttributes(NewAttributes) {
        result := ComCall(12, this, "ptr", NewAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkRenderer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_renderer
     */
    get_Renderer() {
        result := ComCall(13, this, "ptr*", &CurrentInkRenderer := 0, "HRESULT")
        return IInkRenderer(CurrentInkRenderer)
    }

    /**
     * 
     * @param {IInkRenderer} NewInkRenderer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-putref_renderer
     */
    putref_Renderer(NewInkRenderer) {
        result := ComCall(14, this, "ptr", NewInkRenderer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_ink
     */
    get_Ink() {
        result := ComCall(15, this, "ptr*", &Ink := 0, "HRESULT")
        return IInkDisp(Ink)
    }

    /**
     * 
     * @param {IInkDisp} NewInk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-putref_ink
     */
    putref_Ink(NewInk) {
        result := ComCall(16, this, "ptr", NewInk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_autoredraw
     */
    get_AutoRedraw() {
        result := ComCall(17, this, "short*", &AutoRedraw := 0, "HRESULT")
        return AutoRedraw
    }

    /**
     * 
     * @param {VARIANT_BOOL} AutoRedraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_autoredraw
     */
    put_AutoRedraw(AutoRedraw) {
        result := ComCall(18, this, "short", AutoRedraw, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_collectingink
     */
    get_CollectingInk() {
        result := ComCall(19, this, "short*", &Collecting := 0, "HRESULT")
        return Collecting
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_collectionmode
     */
    get_CollectionMode() {
        result := ComCall(20, this, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_collectionmode
     */
    put_CollectionMode(Mode) {
        result := ComCall(21, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_dynamicrendering
     */
    get_DynamicRendering() {
        result := ComCall(22, this, "short*", &Enabled := 0, "HRESULT")
        return Enabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} Enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_dynamicrendering
     */
    put_DynamicRendering(Enabled) {
        result := ComCall(23, this, "short", Enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_desiredpacketdescription
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_desiredpacketdescription
     */
    put_DesiredPacketDescription(PacketGuids) {
        result := ComCall(25, this, "ptr", PacketGuids, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPictureDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_mouseicon
     */
    get_MouseIcon() {
        result := ComCall(26, this, "ptr*", &MouseIcon := 0, "HRESULT")
        return IPictureDisp(MouseIcon)
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     */
    put_MouseIcon(MouseIcon) {
        result := ComCall(27, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-putref_mouseicon
     */
    putref_MouseIcon(MouseIcon) {
        result := ComCall(28, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_mousepointer
     */
    get_MousePointer() {
        result := ComCall(29, this, "int*", &MousePointer := 0, "HRESULT")
        return MousePointer
    }

    /**
     * 
     * @param {Integer} MousePointer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_mousepointer
     */
    put_MousePointer(MousePointer) {
        result := ComCall(30, this, "int", MousePointer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkCursors} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_cursors
     */
    get_Cursors() {
        result := ComCall(31, this, "ptr*", &Cursors := 0, "HRESULT")
        return IInkCursors(Cursors)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_marginx
     */
    get_MarginX() {
        result := ComCall(32, this, "int*", &MarginX := 0, "HRESULT")
        return MarginX
    }

    /**
     * 
     * @param {Integer} MarginX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_marginx
     */
    put_MarginX(MarginX) {
        result := ComCall(33, this, "int", MarginX, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_marginy
     */
    get_MarginY() {
        result := ComCall(34, this, "int*", &MarginY := 0, "HRESULT")
        return MarginY
    }

    /**
     * 
     * @param {Integer} MarginY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_marginy
     */
    put_MarginY(MarginY) {
        result := ComCall(35, this, "int", MarginY, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkTablet} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_tablet
     */
    get_Tablet() {
        result := ComCall(36, this, "ptr*", &SingleTablet := 0, "HRESULT")
        return IInkTablet(SingleTablet)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_supporthighcontrastink
     */
    get_SupportHighContrastInk() {
        result := ComCall(37, this, "short*", &Support := 0, "HRESULT")
        return Support
    }

    /**
     * 
     * @param {VARIANT_BOOL} Support 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_supporthighcontrastink
     */
    put_SupportHighContrastInk(Support) {
        result := ComCall(38, this, "short", Support, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @param {VARIANT_BOOL} Listen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-setgesturestatus
     */
    SetGestureStatus(Gesture, Listen) {
        result := ComCall(39, this, "int", Gesture, "short", Listen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-getgesturestatus
     */
    GetGestureStatus(Gesture) {
        result := ComCall(40, this, "int", Gesture, "short*", &Listening := 0, "HRESULT")
        return Listening
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} WindowInputRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-getwindowinputrectangle
     */
    GetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(41, this, "ptr*", WindowInputRectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} WindowInputRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-setwindowinputrectangle
     */
    SetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(42, this, "ptr", WindowInputRectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseMouseForInput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode
     */
    SetAllTabletsMode(UseMouseForInput) {
        result := ComCall(43, this, "short", UseMouseForInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkTablet} Tablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode
     */
    SetSingleTabletIntegratedMode(Tablet) {
        result := ComCall(44, this, "ptr", Tablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EventId 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-geteventinterest
     */
    GetEventInterest(EventId) {
        result := ComCall(45, this, "int", EventId, "short*", &Listen := 0, "HRESULT")
        return Listen
    }

    /**
     * 
     * @param {Integer} EventId 
     * @param {VARIANT_BOOL} Listen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-seteventinterest
     */
    SetEventInterest(EventId, Listen) {
        result := ComCall(46, this, "int", EventId, "short", Listen, "HRESULT")
        return result
    }
}
