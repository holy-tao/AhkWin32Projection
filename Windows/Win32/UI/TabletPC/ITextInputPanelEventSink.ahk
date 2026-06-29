#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CorrectionMode.ahk" { CorrectionMode }
#Import ".\InPlaceState.ahk" { InPlaceState }
#Import ".\PanelInputArea.ahk" { PanelInputArea }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Defines methods that handle the ITextInputPanel Interface events.
 * @remarks
 * This element is declared in Peninputpanel.h.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nn-peninputpanel-itextinputpaneleventsink
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct ITextInputPanelEventSink extends IUnknown {
    /**
     * The interface identifier for ITextInputPanelEventSink
     * @type {Guid}
     */
    static IID := Guid("{27560408-8e64-4fe1-804e-421201584b31}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextInputPanelEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InPlaceStateChanging      : IntPtr
        InPlaceStateChanged       : IntPtr
        InPlaceSizeChanging       : IntPtr
        InPlaceSizeChanged        : IntPtr
        InputAreaChanging         : IntPtr
        InputAreaChanged          : IntPtr
        CorrectionModeChanging    : IntPtr
        CorrectionModeChanged     : IntPtr
        InPlaceVisibilityChanging : IntPtr
        InPlaceVisibilityChanged  : IntPtr
        TextInserting             : IntPtr
        TextInserted              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextInputPanelEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Occurs when the In-Place state is about to change.
     * @param {InPlaceState} oldInPlaceState The current state, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a>.
     * @param {InPlaceState} newInPlaceState The new state that the Input Panel is changing to, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacestatechanging
     */
    InPlaceStateChanging(oldInPlaceState, newInPlaceState) {
        result := ComCall(3, this, InPlaceState, oldInPlaceState, InPlaceState, newInPlaceState, "HRESULT")
        return result
    }

    /**
     * Occurs when the In-Place state has changed.
     * @param {InPlaceState} oldInPlaceState The current state, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a>.
     * @param {InPlaceState} newInPlaceState The new state that the Input Panel has changed to, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacestatechanged
     */
    InPlaceStateChanged(oldInPlaceState, newInPlaceState) {
        result := ComCall(4, this, InPlaceState, oldInPlaceState, InPlaceState, newInPlaceState, "HRESULT")
        return result
    }

    /**
     * Occurs when the in-place Input Panel size is about to change due to a user resize, auto growth, or an input area change.
     * @remarks
     * Actions causing the Input Panel to change size include changing the screen resolution or DPI settings, rotating the tablet screen, changing the input language, the user explicitly resizing the Input Panel, and changing the theme.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacesizechanging
     */
    InPlaceSizeChanging(oldBoundingRectangle, newBoundingRectangle) {
        result := ComCall(5, this, RECT, oldBoundingRectangle, RECT, newBoundingRectangle, "HRESULT")
        return result
    }

    /**
     * Occurs when the in-place Input Panel size has changed due to a user resize, auto growth, or an input area change.
     * @remarks
     * Actions causing the Input Panel to change size include changing the screen resolution or DPI settings, rotating the tablet screen, changing the input language, the user explicitly resizing the Input Panel, and changing the theme.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacesizechanged
     */
    InPlaceSizeChanged(oldBoundingRectangle, newBoundingRectangle) {
        result := ComCall(6, this, RECT, oldBoundingRectangle, RECT, newBoundingRectangle, "HRESULT")
        return result
    }

    /**
     * Occurs when the input area is about to change on the Tablet PC Input Panel.
     * @param {PanelInputArea} oldInputArea The current input area as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea Enumeration</a>.
     * @param {PanelInputArea} newInputArea The input area the Input Panel is changing to as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea Enumeration</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inputareachanging
     */
    InputAreaChanging(oldInputArea, newInputArea) {
        result := ComCall(7, this, PanelInputArea, oldInputArea, PanelInputArea, newInputArea, "HRESULT")
        return result
    }

    /**
     * Occurs when the input area has changed on the Tablet PC Input Panel.
     * @param {PanelInputArea} oldInputArea The previous input area as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea Enumeration</a>.
     * @param {PanelInputArea} newInputArea The current input area as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea Enumeration</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inputareachanged
     */
    InputAreaChanged(oldInputArea, newInputArea) {
        result := ComCall(8, this, PanelInputArea, oldInputArea, PanelInputArea, newInputArea, "HRESULT")
        return result
    }

    /**
     * Occurs when the correction comb on the Tablet PC Input Panel is about to change modes.
     * @remarks
     * <div class="alert"><b>Note</b>  In Windows 7, this event no longer is raised.		
     * 		</div>
     * <div> </div>
     * @param {CorrectionMode} oldCorrectionMode The current correction mode, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionmode">CorrectionMode Enumeration</a>.
     * @param {CorrectionMode} newCorrectionMode The correction mode the Input Panel is changing to, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionmode">CorrectionMode Enumeration</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-correctionmodechanging
     */
    CorrectionModeChanging(oldCorrectionMode, newCorrectionMode) {
        result := ComCall(9, this, CorrectionMode, oldCorrectionMode, CorrectionMode, newCorrectionMode, "HRESULT")
        return result
    }

    /**
     * Occurs when the correction comb on the Tablet PC Input Panel has changed modes.
     * @remarks
     * <div class="alert"><b>Note</b>  In Windows 7, this event is no longer raised.
     * 		</div>
     * <div> </div>
     * @param {CorrectionMode} oldCorrectionMode The previous correction mode, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionmode">CorrectionMode Enumeration</a>.
     * @param {CorrectionMode} newCorrectionMode The current correction mode, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionmode">CorrectionMode Enumeration</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-correctionmodechanged
     */
    CorrectionModeChanged(oldCorrectionMode, newCorrectionMode) {
        result := ComCall(10, this, CorrectionMode, oldCorrectionMode, CorrectionMode, newCorrectionMode, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacevisibilitychanging
     */
    InPlaceVisibilityChanging(oldVisible, newVisible) {
        result := ComCall(11, this, BOOL, oldVisible, BOOL, newVisible, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacevisibilitychanged
     */
    InPlaceVisibilityChanged(oldVisible, newVisible) {
        result := ComCall(12, this, BOOL, oldVisible, BOOL, newVisible, "HRESULT")
        return result
    }

    /**
     * Occurs when the Tablet PC Input Panel is about to insert text into the control with input focus. Provides access to the ink the user entered in the Input Panel.
     * @remarks
     * There is a minimum of one <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">Ink</a> object for each line of the Input Panel containing text at the time of insertion.
     * @param {Pointer<SAFEARRAY>} _Ink Array of <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">Ink</a> objects in the Input Panel.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-textinserting
     */
    TextInserting(_Ink) {
        result := ComCall(13, this, SAFEARRAY.Ptr, _Ink, "HRESULT")
        return result
    }

    /**
     * Occurs when the Tablet PC Input Panel has inserted text into the control with input focus. Provides access to the ink the user entered in the Input Panel.
     * @remarks
     * There is a minimum of one <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">Ink</a> object for each line of the Input Panel containing text at the time of insertion.
     * @param {Pointer<SAFEARRAY>} _Ink Array of <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">Ink</a> objects in the Input Panel.
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
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-textinserted
     */
    TextInserted(_Ink) {
        result := ComCall(14, this, SAFEARRAY.Ptr, _Ink, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITextInputPanelEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InPlaceStateChanging := CallbackCreate(GetMethod(implObj, "InPlaceStateChanging"), flags, 3)
        this.vtbl.InPlaceStateChanged := CallbackCreate(GetMethod(implObj, "InPlaceStateChanged"), flags, 3)
        this.vtbl.InPlaceSizeChanging := CallbackCreate(GetMethod(implObj, "InPlaceSizeChanging"), flags, 3)
        this.vtbl.InPlaceSizeChanged := CallbackCreate(GetMethod(implObj, "InPlaceSizeChanged"), flags, 3)
        this.vtbl.InputAreaChanging := CallbackCreate(GetMethod(implObj, "InputAreaChanging"), flags, 3)
        this.vtbl.InputAreaChanged := CallbackCreate(GetMethod(implObj, "InputAreaChanged"), flags, 3)
        this.vtbl.CorrectionModeChanging := CallbackCreate(GetMethod(implObj, "CorrectionModeChanging"), flags, 3)
        this.vtbl.CorrectionModeChanged := CallbackCreate(GetMethod(implObj, "CorrectionModeChanged"), flags, 3)
        this.vtbl.InPlaceVisibilityChanging := CallbackCreate(GetMethod(implObj, "InPlaceVisibilityChanging"), flags, 3)
        this.vtbl.InPlaceVisibilityChanged := CallbackCreate(GetMethod(implObj, "InPlaceVisibilityChanged"), flags, 3)
        this.vtbl.TextInserting := CallbackCreate(GetMethod(implObj, "TextInserting"), flags, 2)
        this.vtbl.TextInserted := CallbackCreate(GetMethod(implObj, "TextInserted"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InPlaceStateChanging)
        CallbackFree(this.vtbl.InPlaceStateChanged)
        CallbackFree(this.vtbl.InPlaceSizeChanging)
        CallbackFree(this.vtbl.InPlaceSizeChanged)
        CallbackFree(this.vtbl.InputAreaChanging)
        CallbackFree(this.vtbl.InputAreaChanged)
        CallbackFree(this.vtbl.CorrectionModeChanging)
        CallbackFree(this.vtbl.CorrectionModeChanged)
        CallbackFree(this.vtbl.InPlaceVisibilityChanging)
        CallbackFree(this.vtbl.InPlaceVisibilityChanged)
        CallbackFree(this.vtbl.TextInserting)
        CallbackFree(this.vtbl.TextInserted)
    }
}
