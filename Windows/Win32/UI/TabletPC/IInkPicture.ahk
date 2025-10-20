#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkpicture
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkPicture extends IDispatch{
    /**
     * The interface identifier for IInkPicture
     * @type {Guid}
     */
    static IID => Guid("{e85662e0-379a-40d7-9b5c-757d233f9923}")

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
     * @param {Pointer<IInkDrawingAttributes>} CurrentAttributes 
     * @returns {HRESULT} 
     */
    get_DefaultDrawingAttributes(CurrentAttributes) {
        result := ComCall(8, this, "ptr", CurrentAttributes, "int")
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
        result := ComCall(9, this, "ptr", NewAttributes, "int")
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
        result := ComCall(10, this, "ptr", CurrentInkRenderer, "int")
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
        result := ComCall(11, this, "ptr", NewInkRenderer, "int")
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
        result := ComCall(12, this, "ptr", Ink, "int")
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
        result := ComCall(13, this, "ptr", NewInk, "int")
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
        result := ComCall(14, this, "ptr", AutoRedraw, "int")
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
        result := ComCall(15, this, "short", AutoRedraw, "int")
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
        result := ComCall(16, this, "ptr", Collecting, "int")
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
        result := ComCall(17, this, "int*", Mode, "int")
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
        result := ComCall(18, this, "int", Mode, "int")
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
        result := ComCall(19, this, "ptr", Enabled, "int")
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
        result := ComCall(20, this, "short", Enabled, "int")
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
        result := ComCall(21, this, "ptr", PacketGuids, "int")
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
        result := ComCall(22, this, "ptr", PacketGuids, "int")
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
        result := ComCall(23, this, "ptr", MouseIcon, "int")
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
        result := ComCall(24, this, "ptr", MouseIcon, "int")
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
        result := ComCall(25, this, "ptr", MouseIcon, "int")
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
        result := ComCall(26, this, "int*", MousePointer, "int")
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
        result := ComCall(27, this, "int", MousePointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} EditingMode 
     * @returns {HRESULT} 
     */
    get_EditingMode(EditingMode) {
        result := ComCall(28, this, "int*", EditingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EditingMode 
     * @returns {HRESULT} 
     */
    put_EditingMode(EditingMode) {
        result := ComCall(29, this, "int", EditingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Selection 
     * @returns {HRESULT} 
     */
    get_Selection(Selection) {
        result := ComCall(30, this, "ptr", Selection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Selection 
     * @returns {HRESULT} 
     */
    put_Selection(Selection) {
        result := ComCall(31, this, "ptr", Selection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} EraserMode 
     * @returns {HRESULT} 
     */
    get_EraserMode(EraserMode) {
        result := ComCall(32, this, "int*", EraserMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EraserMode 
     * @returns {HRESULT} 
     */
    put_EraserMode(EraserMode) {
        result := ComCall(33, this, "int", EraserMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} EraserWidth 
     * @returns {HRESULT} 
     */
    get_EraserWidth(EraserWidth) {
        result := ComCall(34, this, "int*", EraserWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newEraserWidth 
     * @returns {HRESULT} 
     */
    put_EraserWidth(newEraserWidth) {
        result := ComCall(35, this, "int", newEraserWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} pPicture 
     * @returns {HRESULT} 
     */
    putref_Picture(pPicture) {
        result := ComCall(36, this, "ptr", pPicture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} pPicture 
     * @returns {HRESULT} 
     */
    put_Picture(pPicture) {
        result := ComCall(37, this, "ptr", pPicture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} ppPicture 
     * @returns {HRESULT} 
     */
    get_Picture(ppPicture) {
        result := ComCall(38, this, "ptr", ppPicture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} smNewSizeMode 
     * @returns {HRESULT} 
     */
    put_SizeMode(smNewSizeMode) {
        result := ComCall(39, this, "int", smNewSizeMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} smSizeMode 
     * @returns {HRESULT} 
     */
    get_SizeMode(smSizeMode) {
        result := ComCall(40, this, "int*", smSizeMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newColor 
     * @returns {HRESULT} 
     */
    put_BackColor(newColor) {
        result := ComCall(41, this, "uint", newColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pColor 
     * @returns {HRESULT} 
     */
    get_BackColor(pColor) {
        result := ComCall(42, this, "uint*", pColor, "int")
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
        result := ComCall(43, this, "ptr", Cursors, "int")
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
        result := ComCall(44, this, "int*", MarginX, "int")
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
        result := ComCall(45, this, "int", MarginX, "int")
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
        result := ComCall(46, this, "int*", MarginY, "int")
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
        result := ComCall(47, this, "int", MarginY, "int")
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
        result := ComCall(48, this, "ptr", SingleTablet, "int")
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
        result := ComCall(49, this, "ptr", Support, "int")
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
        result := ComCall(50, this, "short", Support, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Support 
     * @returns {HRESULT} 
     */
    get_SupportHighContrastSelectionUI(Support) {
        result := ComCall(51, this, "ptr", Support, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Support 
     * @returns {HRESULT} 
     */
    put_SupportHighContrastSelectionUI(Support) {
        result := ComCall(52, this, "short", Support, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<Int32>} SelArea 
     * @returns {HRESULT} 
     */
    HitTestSelection(x, y, SelArea) {
        result := ComCall(53, this, "int", x, "int", y, "int*", SelArea, "int")
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
        result := ComCall(54, this, "int", Gesture, "short", Listen, "int")
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
        result := ComCall(55, this, "int", Gesture, "ptr", Listening, "int")
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
        result := ComCall(56, this, "ptr", WindowInputRectangle, "int")
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
        result := ComCall(57, this, "ptr", WindowInputRectangle, "int")
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
        result := ComCall(58, this, "short", UseMouseForInput, "int")
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
        result := ComCall(59, this, "ptr", Tablet, "int")
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
        result := ComCall(60, this, "int", EventId, "ptr", Listen, "int")
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
        result := ComCall(61, this, "int", EventId, "short", Listen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Collecting 
     * @returns {HRESULT} 
     */
    get_InkEnabled(Collecting) {
        result := ComCall(62, this, "ptr", Collecting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Collecting 
     * @returns {HRESULT} 
     */
    put_InkEnabled(Collecting) {
        result := ComCall(63, this, "short", Collecting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbool 
     * @returns {HRESULT} 
     */
    get_Enabled(pbool) {
        result := ComCall(64, this, "ptr", pbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} 
     */
    put_Enabled(vbool) {
        result := ComCall(65, this, "short", vbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
