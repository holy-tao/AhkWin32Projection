#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Pointer>} CurrentWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_hwnd
     */
    put_hWnd(NewWindow) {
        result := ComCall(8, this, "ptr", NewWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Collecting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled
     */
    get_Enabled(Collecting) {
        result := ComCall(9, this, "ptr", Collecting, "HRESULT")
        return result
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
     * @param {Pointer<IInkDrawingAttributes>} CurrentAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_defaultdrawingattributes
     */
    get_DefaultDrawingAttributes(CurrentAttributes) {
        result := ComCall(11, this, "ptr*", CurrentAttributes, "HRESULT")
        return result
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
     * @param {Pointer<IInkRenderer>} CurrentInkRenderer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_renderer
     */
    get_Renderer(CurrentInkRenderer) {
        result := ComCall(13, this, "ptr*", CurrentInkRenderer, "HRESULT")
        return result
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
     * @param {Pointer<IInkDisp>} Ink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_ink
     */
    get_Ink(Ink) {
        result := ComCall(15, this, "ptr*", Ink, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} AutoRedraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_autoredraw
     */
    get_AutoRedraw(AutoRedraw) {
        result := ComCall(17, this, "ptr", AutoRedraw, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} Collecting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_collectingink
     */
    get_CollectingInk(Collecting) {
        result := ComCall(19, this, "ptr", Collecting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_collectionmode
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_collectionmode
     */
    put_CollectionMode(Mode) {
        result := ComCall(21, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_dynamicrendering
     */
    get_DynamicRendering(Enabled) {
        result := ComCall(22, this, "ptr", Enabled, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} PacketGuids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_desiredpacketdescription
     */
    get_DesiredPacketDescription(PacketGuids) {
        result := ComCall(24, this, "ptr", PacketGuids, "HRESULT")
        return result
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
     * @param {Pointer<IPictureDisp>} MouseIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_mouseicon
     */
    get_MouseIcon(MouseIcon) {
        result := ComCall(26, this, "ptr*", MouseIcon, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} MousePointer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_mousepointer
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_mousepointer
     */
    put_MousePointer(MousePointer) {
        result := ComCall(30, this, "int", MousePointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkCursors>} Cursors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_cursors
     */
    get_Cursors(Cursors) {
        result := ComCall(31, this, "ptr*", Cursors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MarginX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_marginx
     */
    get_MarginX(MarginX) {
        MarginXMarshal := MarginX is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, MarginXMarshal, MarginX, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} MarginY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_marginy
     */
    get_MarginY(MarginY) {
        MarginYMarshal := MarginY is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, MarginYMarshal, MarginY, "HRESULT")
        return result
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
     * @param {Pointer<IInkTablet>} SingleTablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_tablet
     */
    get_Tablet(SingleTablet) {
        result := ComCall(36, this, "ptr*", SingleTablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Support 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_supporthighcontrastink
     */
    get_SupportHighContrastInk(Support) {
        result := ComCall(37, this, "ptr", Support, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} Listening 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-getgesturestatus
     */
    GetGestureStatus(Gesture, Listening) {
        result := ComCall(40, this, "int", Gesture, "ptr", Listening, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} Listen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-geteventinterest
     */
    GetEventInterest(EventId, Listen) {
        result := ComCall(45, this, "int", EventId, "ptr", Listen, "HRESULT")
        return result
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
