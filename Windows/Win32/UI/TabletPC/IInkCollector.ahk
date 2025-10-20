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
     * 
     * @param {Pointer<IntPtr>} CurrentWindow 
     * @returns {HRESULT} 
     */
    get_hWnd(CurrentWindow) {
        result := ComCall(7, this, "ptr*", CurrentWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} NewWindow 
     * @returns {HRESULT} 
     */
    put_hWnd(NewWindow) {
        result := ComCall(8, this, "ptr", NewWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Collecting 
     * @returns {HRESULT} 
     */
    get_Enabled(Collecting) {
        result := ComCall(9, this, "ptr", Collecting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Collecting 
     * @returns {HRESULT} 
     */
    put_Enabled(Collecting) {
        result := ComCall(10, this, "short", Collecting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} CurrentAttributes 
     * @returns {HRESULT} 
     */
    get_DefaultDrawingAttributes(CurrentAttributes) {
        result := ComCall(11, this, "ptr", CurrentAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} NewAttributes 
     * @returns {HRESULT} 
     */
    putref_DefaultDrawingAttributes(NewAttributes) {
        result := ComCall(12, this, "ptr", NewAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRenderer>} CurrentInkRenderer 
     * @returns {HRESULT} 
     */
    get_Renderer(CurrentInkRenderer) {
        result := ComCall(13, this, "ptr", CurrentInkRenderer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRenderer>} NewInkRenderer 
     * @returns {HRESULT} 
     */
    putref_Renderer(NewInkRenderer) {
        result := ComCall(14, this, "ptr", NewInkRenderer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDisp>} Ink 
     * @returns {HRESULT} 
     */
    get_Ink(Ink) {
        result := ComCall(15, this, "ptr", Ink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDisp>} NewInk 
     * @returns {HRESULT} 
     */
    putref_Ink(NewInk) {
        result := ComCall(16, this, "ptr", NewInk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} AutoRedraw 
     * @returns {HRESULT} 
     */
    get_AutoRedraw(AutoRedraw) {
        result := ComCall(17, this, "ptr", AutoRedraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} AutoRedraw 
     * @returns {HRESULT} 
     */
    put_AutoRedraw(AutoRedraw) {
        result := ComCall(18, this, "short", AutoRedraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Collecting 
     * @returns {HRESULT} 
     */
    get_CollectingInk(Collecting) {
        result := ComCall(19, this, "ptr", Collecting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Mode 
     * @returns {HRESULT} 
     */
    get_CollectionMode(Mode) {
        result := ComCall(20, this, "int*", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    put_CollectionMode(Mode) {
        result := ComCall(21, this, "int", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Enabled 
     * @returns {HRESULT} 
     */
    get_DynamicRendering(Enabled) {
        result := ComCall(22, this, "ptr", Enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Enabled 
     * @returns {HRESULT} 
     */
    put_DynamicRendering(Enabled) {
        result := ComCall(23, this, "short", Enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PacketGuids 
     * @returns {HRESULT} 
     */
    get_DesiredPacketDescription(PacketGuids) {
        result := ComCall(24, this, "ptr", PacketGuids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} PacketGuids 
     * @returns {HRESULT} 
     */
    put_DesiredPacketDescription(PacketGuids) {
        result := ComCall(25, this, "ptr", PacketGuids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MouseIcon 
     * @returns {HRESULT} 
     */
    get_MouseIcon(MouseIcon) {
        result := ComCall(26, this, "ptr", MouseIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MouseIcon 
     * @returns {HRESULT} 
     */
    put_MouseIcon(MouseIcon) {
        result := ComCall(27, this, "ptr", MouseIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MouseIcon 
     * @returns {HRESULT} 
     */
    putref_MouseIcon(MouseIcon) {
        result := ComCall(28, this, "ptr", MouseIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MousePointer 
     * @returns {HRESULT} 
     */
    get_MousePointer(MousePointer) {
        result := ComCall(29, this, "int*", MousePointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MousePointer 
     * @returns {HRESULT} 
     */
    put_MousePointer(MousePointer) {
        result := ComCall(30, this, "int", MousePointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkCursors>} Cursors 
     * @returns {HRESULT} 
     */
    get_Cursors(Cursors) {
        result := ComCall(31, this, "ptr", Cursors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MarginX 
     * @returns {HRESULT} 
     */
    get_MarginX(MarginX) {
        result := ComCall(32, this, "int*", MarginX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MarginX 
     * @returns {HRESULT} 
     */
    put_MarginX(MarginX) {
        result := ComCall(33, this, "int", MarginX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MarginY 
     * @returns {HRESULT} 
     */
    get_MarginY(MarginY) {
        result := ComCall(34, this, "int*", MarginY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MarginY 
     * @returns {HRESULT} 
     */
    put_MarginY(MarginY) {
        result := ComCall(35, this, "int", MarginY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTablet>} SingleTablet 
     * @returns {HRESULT} 
     */
    get_Tablet(SingleTablet) {
        result := ComCall(36, this, "ptr", SingleTablet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Support 
     * @returns {HRESULT} 
     */
    get_SupportHighContrastInk(Support) {
        result := ComCall(37, this, "ptr", Support, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Support 
     * @returns {HRESULT} 
     */
    put_SupportHighContrastInk(Support) {
        result := ComCall(38, this, "short", Support, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @param {VARIANT_BOOL} Listen 
     * @returns {HRESULT} 
     */
    SetGestureStatus(Gesture, Listen) {
        result := ComCall(39, this, "int", Gesture, "short", Listen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @param {Pointer<VARIANT_BOOL>} Listening 
     * @returns {HRESULT} 
     */
    GetGestureStatus(Gesture, Listening) {
        result := ComCall(40, this, "int", Gesture, "ptr", Listening, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} WindowInputRectangle 
     * @returns {HRESULT} 
     */
    GetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(41, this, "ptr", WindowInputRectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} WindowInputRectangle 
     * @returns {HRESULT} 
     */
    SetWindowInputRectangle(WindowInputRectangle) {
        result := ComCall(42, this, "ptr", WindowInputRectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseMouseForInput 
     * @returns {HRESULT} 
     */
    SetAllTabletsMode(UseMouseForInput) {
        result := ComCall(43, this, "short", UseMouseForInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTablet>} Tablet 
     * @returns {HRESULT} 
     */
    SetSingleTabletIntegratedMode(Tablet) {
        result := ComCall(44, this, "ptr", Tablet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventId 
     * @param {Pointer<VARIANT_BOOL>} Listen 
     * @returns {HRESULT} 
     */
    GetEventInterest(EventId, Listen) {
        result := ComCall(45, this, "int", EventId, "ptr", Listen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventId 
     * @param {VARIANT_BOOL} Listen 
     * @returns {HRESULT} 
     */
    SetEventInterest(EventId, Listen) {
        result := ComCall(46, this, "int", EventId, "short", Listen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
