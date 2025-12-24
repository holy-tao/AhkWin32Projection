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
     * Occurs when the In-Place state is about to change.
     * @param {Integer} oldInPlaceState The current state, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a>.
     * @param {Integer} newInPlaceState The new state that the Input Panel is changing to, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacestatechanging
     */
    InPlaceStateChanging(oldInPlaceState, newInPlaceState) {
        result := ComCall(3, this, "int", oldInPlaceState, "int", newInPlaceState, "HRESULT")
        return result
    }

    /**
     * Occurs when the In-Place state has changed.
     * @param {Integer} oldInPlaceState The current state, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a>.
     * @param {Integer} newInPlaceState The new state that the Input Panel has changed to, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacestatechanged
     */
    InPlaceStateChanged(oldInPlaceState, newInPlaceState) {
        result := ComCall(4, this, "int", oldInPlaceState, "int", newInPlaceState, "HRESULT")
        return result
    }

    /**
     * Occurs when the in-place Input Panel size is about to change due to a user resize, auto growth, or an input area change.
     * @param {RECT} oldBoundingRectangle The bounding rectangle that represents the current size of the Input Panel.
     * @param {RECT} newBoundingRectangle The bounding rectangle that represents the new size of the Input Panel.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacesizechanging
     */
    InPlaceSizeChanging(oldBoundingRectangle, newBoundingRectangle) {
        result := ComCall(5, this, "ptr", oldBoundingRectangle, "ptr", newBoundingRectangle, "HRESULT")
        return result
    }

    /**
     * Occurs when the in-place Input Panel size has changed due to a user resize, auto growth, or an input area change.
     * @param {RECT} oldBoundingRectangle The bounding rectangle that represents the previous size of the Input Panel.
     * @param {RECT} newBoundingRectangle The bounding rectangle that represents the current size of the Input Panel.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacesizechanged
     */
    InPlaceSizeChanged(oldBoundingRectangle, newBoundingRectangle) {
        result := ComCall(6, this, "ptr", oldBoundingRectangle, "ptr", newBoundingRectangle, "HRESULT")
        return result
    }

    /**
     * Occurs when the input area is about to change on the Tablet PC Input Panel.
     * @param {Integer} oldInputArea The current input area as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea Enumeration</a>.
     * @param {Integer} newInputArea The input area the Input Panel is changing to as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea Enumeration</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inputareachanging
     */
    InputAreaChanging(oldInputArea, newInputArea) {
        result := ComCall(7, this, "int", oldInputArea, "int", newInputArea, "HRESULT")
        return result
    }

    /**
     * Occurs when the input area has changed on the Tablet PC Input Panel.
     * @param {Integer} oldInputArea The previous input area as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea Enumeration</a>.
     * @param {Integer} newInputArea The current input area as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea Enumeration</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inputareachanged
     */
    InputAreaChanged(oldInputArea, newInputArea) {
        result := ComCall(8, this, "int", oldInputArea, "int", newInputArea, "HRESULT")
        return result
    }

    /**
     * Occurs when the correction comb on the Tablet PC Input Panel is about to change modes.
     * @param {Integer} oldCorrectionMode The current correction mode, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionmode">CorrectionMode Enumeration</a>.
     * @param {Integer} newCorrectionMode The correction mode the Input Panel is changing to, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionmode">CorrectionMode Enumeration</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-correctionmodechanging
     */
    CorrectionModeChanging(oldCorrectionMode, newCorrectionMode) {
        result := ComCall(9, this, "int", oldCorrectionMode, "int", newCorrectionMode, "HRESULT")
        return result
    }

    /**
     * Occurs when the correction comb on the Tablet PC Input Panel has changed modes.
     * @param {Integer} oldCorrectionMode The previous correction mode, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionmode">CorrectionMode Enumeration</a>.
     * @param {Integer} newCorrectionMode The current correction mode, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionmode">CorrectionMode Enumeration</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-correctionmodechanged
     */
    CorrectionModeChanged(oldCorrectionMode, newCorrectionMode) {
        result := ComCall(10, this, "int", oldCorrectionMode, "int", newCorrectionMode, "HRESULT")
        return result
    }

    /**
     * Occurs when the Tablet PC Input Panel is about to switch between visible and invisible.
     * @param {BOOL} oldVisible <b>TRUE</b> if the Input Panel is changing from visible to invisible, otherwise <b>FALSE</b>.
     * @param {BOOL} newVisible <b>TRUE</b> if the Input Panel is changing from invisible to visible, otherwise <b>FALSE</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacevisibilitychanging
     */
    InPlaceVisibilityChanging(oldVisible, newVisible) {
        result := ComCall(11, this, "int", oldVisible, "int", newVisible, "HRESULT")
        return result
    }

    /**
     * Occurs when the Tablet PC Input Panel has switched between visible and invisible.
     * @param {BOOL} oldVisible <b>TRUE</b> if the Input Panel has changed from visible to invisible, otherwise <b>FALSE</b>.
     * @param {BOOL} newVisible <b>TRUE</b> if the Input Panel has changed from invisible to visible, otherwise <b>FALSE</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacevisibilitychanged
     */
    InPlaceVisibilityChanged(oldVisible, newVisible) {
        result := ComCall(12, this, "int", oldVisible, "int", newVisible, "HRESULT")
        return result
    }

    /**
     * Occurs when the Tablet PC Input Panel is about to insert text into the control with input focus. Provides access to the ink the user entered in the Input Panel.
     * @param {Pointer<SAFEARRAY>} Ink Array of <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">Ink</a> objects in the Input Panel.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-textinserting
     */
    TextInserting(Ink) {
        result := ComCall(13, this, "ptr", Ink, "HRESULT")
        return result
    }

    /**
     * Occurs when the Tablet PC Input Panel has inserted text into the control with input focus. Provides access to the ink the user entered in the Input Panel.
     * @param {Pointer<SAFEARRAY>} Ink Array of <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">Ink</a> objects in the Input Panel.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpaneleventsink-textinserted
     */
    TextInserted(Ink) {
        result := ComCall(14, this, "ptr", Ink, "HRESULT")
        return result
    }
}
