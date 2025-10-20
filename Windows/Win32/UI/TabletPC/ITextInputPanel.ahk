#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides control of appearance and behavior of the Tablet PC Input Panel.
 * @remarks
 * 
  * <b>ITextInputPanel Interface</b> gives application developers more control and information about Input Panel's state than <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel Class</a>. <b>ITextInputPanel Interface</b> replaces the <b>PenInputPanel Class</b> as the preferred mechanism for programmatically interacting with the Input Panel.
  * 
  * <b>ITextInputPanel Interface</b> provides:
  * 
  * <ul>
  * <li>A complete control over the positioning of the in-place Input Panel when the application has focus.</li>
  * <li>An access to the ink objects from the Input Panel text insertion in addition to the recognized text.</li>
  * <li>A set of properties that correspond exactly to Input Panel's capabilities giving both the ability to know Input Panel's current state and to customize Input Panel's configuration.</li>
  * </ul>
  * The <b>ITextInputPanel Interface</b> continues to provide nearly all of the programmatic capabilities of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel Class</a> thus superseding the <b>PenInputPanel Class</b>.
  * 
  * This element is declared in Peninputpanel.h.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nn-peninputpanel-itextinputpanel
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ITextInputPanel extends IUnknown{
    /**
     * The interface identifier for ITextInputPanel
     * @type {Guid}
     */
    static IID => Guid("{6b6a65a5-6af3-46c2-b6ea-56cd1f80df71}")

    /**
     * The class identifier for TextInputPanel
     * @type {Guid}
     */
    static CLSID => Guid("{f9b189d7-228b-4f2b-8650-b97f59e02c8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<HWND>} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    get_AttachedEditWindow(AttachedEditWindow) {
        result := ComCall(3, this, "ptr", AttachedEditWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    put_AttachedEditWindow(AttachedEditWindow) {
        AttachedEditWindow := AttachedEditWindow is Win32Handle ? NumGet(AttachedEditWindow, "ptr") : AttachedEditWindow

        result := ComCall(4, this, "ptr", AttachedEditWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CurrentInteractionMode 
     * @returns {HRESULT} 
     */
    get_CurrentInteractionMode(CurrentInteractionMode) {
        result := ComCall(5, this, "int*", CurrentInteractionMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} State 
     * @returns {HRESULT} 
     */
    get_DefaultInPlaceState(State) {
        result := ComCall(6, this, "int*", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    put_DefaultInPlaceState(State) {
        result := ComCall(7, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} State 
     * @returns {HRESULT} 
     */
    get_CurrentInPlaceState(State) {
        result := ComCall(8, this, "int*", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Area 
     * @returns {HRESULT} 
     */
    get_DefaultInputArea(Area) {
        result := ComCall(9, this, "int*", Area, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Area 
     * @returns {HRESULT} 
     */
    put_DefaultInputArea(Area) {
        result := ComCall(10, this, "int", Area, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Area 
     * @returns {HRESULT} 
     */
    get_CurrentInputArea(Area) {
        result := ComCall(11, this, "int*", Area, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Mode 
     * @returns {HRESULT} 
     */
    get_CurrentCorrectionMode(Mode) {
        result := ComCall(12, this, "int*", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Direction 
     * @returns {HRESULT} 
     */
    get_PreferredInPlaceDirection(Direction) {
        result := ComCall(13, this, "int*", Direction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Direction 
     * @returns {HRESULT} 
     */
    put_PreferredInPlaceDirection(Direction) {
        result := ComCall(14, this, "int", Direction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Expand 
     * @returns {HRESULT} 
     */
    get_ExpandPostInsertionCorrection(Expand) {
        result := ComCall(15, this, "ptr", Expand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Expand 
     * @returns {HRESULT} 
     */
    put_ExpandPostInsertionCorrection(Expand) {
        result := ComCall(16, this, "int", Expand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Visible 
     * @returns {HRESULT} 
     */
    get_InPlaceVisibleOnFocus(Visible) {
        result := ComCall(17, this, "ptr", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_InPlaceVisibleOnFocus(Visible) {
        result := ComCall(18, this, "int", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} BoundingRectangle 
     * @returns {HRESULT} 
     */
    get_InPlaceBoundingRectangle(BoundingRectangle) {
        result := ComCall(19, this, "ptr", BoundingRectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Height 
     * @returns {HRESULT} 
     */
    get_PopUpCorrectionHeight(Height) {
        result := ComCall(20, this, "int*", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Height 
     * @returns {HRESULT} 
     */
    get_PopDownCorrectionHeight(Height) {
        result := ComCall(21, this, "int*", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CommitPendingInput() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Visible 
     * @returns {HRESULT} 
     */
    SetInPlaceVisibility(Visible) {
        result := ComCall(23, this, "int", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} xPosition 
     * @param {Integer} yPosition 
     * @param {Integer} position 
     * @returns {HRESULT} 
     */
    SetInPlacePosition(xPosition, yPosition, position) {
        result := ComCall(24, this, "int", xPosition, "int", yPosition, "int", position, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} xPosition 
     * @param {Integer} yPosition 
     * @returns {HRESULT} 
     */
    SetInPlaceHoverTargetPosition(xPosition, yPosition) {
        result := ComCall(25, this, "int", xPosition, "int", yPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextInputPanelEventSink>} EventSink 
     * @param {Integer} EventMask 
     * @returns {HRESULT} 
     */
    Advise(EventSink, EventMask) {
        result := ComCall(26, this, "ptr", EventSink, "uint", EventMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextInputPanelEventSink>} EventSink 
     * @returns {HRESULT} 
     */
    Unadvise(EventSink) {
        result := ComCall(27, this, "ptr", EventSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
