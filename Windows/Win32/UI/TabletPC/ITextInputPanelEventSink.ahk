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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InPlaceStateChanging", "InPlaceStateChanged", "InPlaceSizeChanging", "InPlaceSizeChanged", "InputAreaChanging", "InputAreaChanged", "CorrectionModeChanging", "CorrectionModeChanged", "InPlaceVisibilityChanging", "InPlaceVisibilityChanged", "TextInserting", "TextInserted"]

    /**
     * 
     * @param {Integer} oldInPlaceState 
     * @param {Integer} newInPlaceState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacestatechanging
     */
    InPlaceStateChanging(oldInPlaceState, newInPlaceState) {
        result := ComCall(3, this, "int", oldInPlaceState, "int", newInPlaceState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} oldInPlaceState 
     * @param {Integer} newInPlaceState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacestatechanged
     */
    InPlaceStateChanged(oldInPlaceState, newInPlaceState) {
        result := ComCall(4, this, "int", oldInPlaceState, "int", newInPlaceState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RECT} oldBoundingRectangle 
     * @param {RECT} newBoundingRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacesizechanging
     */
    InPlaceSizeChanging(oldBoundingRectangle, newBoundingRectangle) {
        result := ComCall(5, this, "ptr", oldBoundingRectangle, "ptr", newBoundingRectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RECT} oldBoundingRectangle 
     * @param {RECT} newBoundingRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacesizechanged
     */
    InPlaceSizeChanged(oldBoundingRectangle, newBoundingRectangle) {
        result := ComCall(6, this, "ptr", oldBoundingRectangle, "ptr", newBoundingRectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} oldInputArea 
     * @param {Integer} newInputArea 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inputareachanging
     */
    InputAreaChanging(oldInputArea, newInputArea) {
        result := ComCall(7, this, "int", oldInputArea, "int", newInputArea, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} oldInputArea 
     * @param {Integer} newInputArea 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inputareachanged
     */
    InputAreaChanged(oldInputArea, newInputArea) {
        result := ComCall(8, this, "int", oldInputArea, "int", newInputArea, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} oldCorrectionMode 
     * @param {Integer} newCorrectionMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-correctionmodechanging
     */
    CorrectionModeChanging(oldCorrectionMode, newCorrectionMode) {
        result := ComCall(9, this, "int", oldCorrectionMode, "int", newCorrectionMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} oldCorrectionMode 
     * @param {Integer} newCorrectionMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-correctionmodechanged
     */
    CorrectionModeChanged(oldCorrectionMode, newCorrectionMode) {
        result := ComCall(10, this, "int", oldCorrectionMode, "int", newCorrectionMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} oldVisible 
     * @param {BOOL} newVisible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacevisibilitychanging
     */
    InPlaceVisibilityChanging(oldVisible, newVisible) {
        result := ComCall(11, this, "int", oldVisible, "int", newVisible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} oldVisible 
     * @param {BOOL} newVisible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacevisibilitychanged
     */
    InPlaceVisibilityChanged(oldVisible, newVisible) {
        result := ComCall(12, this, "int", oldVisible, "int", newVisible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Ink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-textinserting
     */
    TextInserting(Ink) {
        result := ComCall(13, this, "ptr", Ink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Ink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-textinserted
     */
    TextInserted(Ink) {
        result := ComCall(14, this, "ptr", Ink, "HRESULT")
        return result
    }
}
