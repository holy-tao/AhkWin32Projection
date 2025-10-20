#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods that handle the ITextInputPanel Interface events.
 * @remarks
 * 
  * This element is declared in Peninputpanel.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nn-peninputpanel-itextinputpaneleventsink
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ITextInputPanelEventSink extends IUnknown{
    /**
     * The interface identifier for ITextInputPanelEventSink
     * @type {Guid}
     */
    static IID => Guid("{27560408-8e64-4fe1-804e-421201584b31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} oldInPlaceState 
     * @param {Integer} newInPlaceState 
     * @returns {HRESULT} 
     */
    InPlaceStateChanging(oldInPlaceState, newInPlaceState) {
        result := ComCall(3, this, "int", oldInPlaceState, "int", newInPlaceState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} oldInPlaceState 
     * @param {Integer} newInPlaceState 
     * @returns {HRESULT} 
     */
    InPlaceStateChanged(oldInPlaceState, newInPlaceState) {
        result := ComCall(4, this, "int", oldInPlaceState, "int", newInPlaceState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {RECT} oldBoundingRectangle 
     * @param {RECT} newBoundingRectangle 
     * @returns {HRESULT} 
     */
    InPlaceSizeChanging(oldBoundingRectangle, newBoundingRectangle) {
        result := ComCall(5, this, "ptr", oldBoundingRectangle, "ptr", newBoundingRectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {RECT} oldBoundingRectangle 
     * @param {RECT} newBoundingRectangle 
     * @returns {HRESULT} 
     */
    InPlaceSizeChanged(oldBoundingRectangle, newBoundingRectangle) {
        result := ComCall(6, this, "ptr", oldBoundingRectangle, "ptr", newBoundingRectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} oldInputArea 
     * @param {Integer} newInputArea 
     * @returns {HRESULT} 
     */
    InputAreaChanging(oldInputArea, newInputArea) {
        result := ComCall(7, this, "int", oldInputArea, "int", newInputArea, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} oldInputArea 
     * @param {Integer} newInputArea 
     * @returns {HRESULT} 
     */
    InputAreaChanged(oldInputArea, newInputArea) {
        result := ComCall(8, this, "int", oldInputArea, "int", newInputArea, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} oldCorrectionMode 
     * @param {Integer} newCorrectionMode 
     * @returns {HRESULT} 
     */
    CorrectionModeChanging(oldCorrectionMode, newCorrectionMode) {
        result := ComCall(9, this, "int", oldCorrectionMode, "int", newCorrectionMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} oldCorrectionMode 
     * @param {Integer} newCorrectionMode 
     * @returns {HRESULT} 
     */
    CorrectionModeChanged(oldCorrectionMode, newCorrectionMode) {
        result := ComCall(10, this, "int", oldCorrectionMode, "int", newCorrectionMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} oldVisible 
     * @param {BOOL} newVisible 
     * @returns {HRESULT} 
     */
    InPlaceVisibilityChanging(oldVisible, newVisible) {
        result := ComCall(11, this, "int", oldVisible, "int", newVisible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} oldVisible 
     * @param {BOOL} newVisible 
     * @returns {HRESULT} 
     */
    InPlaceVisibilityChanged(oldVisible, newVisible) {
        result := ComCall(12, this, "int", oldVisible, "int", newVisible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Ink 
     * @returns {HRESULT} 
     */
    TextInserting(Ink) {
        result := ComCall(13, this, "ptr", Ink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Ink 
     * @returns {HRESULT} 
     */
    TextInserted(Ink) {
        result := ComCall(14, this, "ptr", Ink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
