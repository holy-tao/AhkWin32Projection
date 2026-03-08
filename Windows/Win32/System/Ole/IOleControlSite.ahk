#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods that enable a site object to manage each embedded control within a container.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iolecontrolsite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleControlSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleControlSite
     * @type {Guid}
     */
    static IID => Guid("{b196b289-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnControlInfoChanged", "LockInPlaceActive", "GetExtendedControl", "TransformCoords", "TranslateAccelerator", "OnFocus", "ShowPropertyFrame"]

    /**
     * Informs the container that the control's CONTROLINFO structure has changed and that the container should call the control's IOleControl::GetControlInfo for an update.
     * @returns {HRESULT} This method returns S_OK in all cases.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-oncontrolinfochanged
     */
    OnControlInfoChanged() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether a control should remain in-place active. Calls to this method typically nest an event to ensure that the object's activation state remains stable throughout the processing of the event.
     * @remarks
     * This method affects the control's in-place active state but not its UI-active state.
     * @param {BOOL} fLock Indicates whether to ensure the in-place active state (<b>TRUE</b>) or to allow activation to change (<b>FALSE</b>). When <b>TRUE</b>, a supporting container must not deactivate the in-place object until this method is called again with <b>FALSE</b>.
     * @returns {HRESULT} This method can return the following values.
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
     * The lock or unlock was made successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container does not support in-place locking.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-lockinplaceactive
     */
    LockInPlaceActive(fLock) {
        result := ComCall(4, this, "int", fLock, "HRESULT")
        return result
    }

    /**
     * Retrieves an IDispatch pointer to the extended control that the container uses to wrap the real control.
     * @remarks
     * This method gives the real control access to whatever properties and methods the container maintains in the extended control. These properties and methods would otherwise be inaccessible to the control.
     * 
     * 
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The returned pointer is the responsibility of the caller, which must release it when it is no longer needed.
     * @returns {IDispatch} A pointer to an <b>IDispatch</b> pointer variable that receives the interface pointer to the extended control. If an error occurs, the implementation must set *<i>ppDisp</i> to <b>NULL</b>. On success, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when *<i>ppDisp</i> is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-getextendedcontrol
     */
    GetExtendedControl() {
        result := ComCall(5, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * Converts coordinates expressed in HIMETRIC units (as is standard in OLE) to the units specified by the container.
     * @remarks
     * A control uses this method when it has to send coordinates to a container within an event or some other custom call or when the control has container coordinates that it needs to convert into <b>HIMETRIC</b> units.
     * @param {Pointer<POINTL>} pPtlHimetric Address of a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure containing coordinates expressed in <b>HIMETRIC</b> units. This is an [in] parameter when <i>dwFlags</i> contains XFORMCOORDS_HIMETRICTOCONTAINER; it is an [out] parameter with XFORMCOORDS_CONTAINERTOHIMETRIC. In the latter case, the contents are undefined on error.
     * @param {Pointer<POINTF>} pPtfContainer Address of a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-pointf">POINTF</a> structure that receives the converted coordinates. This is an [in] parameter when <i>dwFlags</i> contains XFORMCOORDS_CONTAINERTOHIMETRIC; it is an [out] parameter with XFORMCOORDS_HIMETRICTOCONTAINER. In the latter case, the contents are undefined on error.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and E_UNEXPECTED, as well as the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container does not require any special coordinate conversions. The container deals completely in <b>HIMETRIC</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>pPtlHimetric</i> or <i>pPtfContainer</i> is not valid. For example, it may be <b>NULL</b>.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-transformcoords
     */
    TransformCoords(pPtlHimetric, pPtfContainer, dwFlags) {
        result := ComCall(6, this, "ptr", pPtlHimetric, "ptr", pPtfContainer, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Passes a keystroke to the control site for processing.
     * @remarks
     * This method is called by a control that can be UI-active. In such cases, a control can process all keystrokes first through <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceactiveobject-translateaccelerator">IOleInPlaceActiveObject::TranslateAccelerator</a>, according to normal OLE Compound Document rules. Inside that method, the control can give the container certain messages to process first by calling <b>IOleControlSite::TranslateAccelerator</b> and using the return value to determine if any processing took place. Otherwise, the control always processes the message first. If the control does not use the keystroke as an accelerator, it passes the keystroke to the container through this method.
     * @param {Pointer<MSG>} pMsg A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure describing the keystroke to be processed.
     * @param {Integer} grfModifiers Flags describing the state of the Control, Alt, and Shift keys. The value of the flag can be any valid <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms683763(v=vs.85)">KEYMODIFIERS</a> enumeration values.
     * @returns {HRESULT} This method can return the following values.
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
     * The container processed the message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container did not process the message. This value must also be returned in all other error cases besides E_NOTIMPL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container does not implement accelerator support.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-translateaccelerator
     */
    TranslateAccelerator(pMsg, grfModifiers) {
        result := ComCall(7, this, "ptr", pMsg, "uint", grfModifiers, "HRESULT")
        return result
    }

    /**
     * Indicates whether the control managed by this control site has gained or lost the focus.
     * @remarks
     * The container uses this information to update the state of <b>Default</b> and <b>Cancel</b> buttons according to how the control with the focus processes Return or Esc keys. A control's behavior regarding the Return and Esc keys is specified in the control's <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-controlinfo">CONTROLINFO</a> structure. See <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iolecontrol-getcontrolinfo">IOleControl::GetControlInfo</a> for more information.
     * @param {BOOL} fGotFocus Indicates whether the control gained (TRUE) or lost the focus (FALSE).
     * @returns {HRESULT} This method returns S_OK in all cases.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-onfocus
     */
    OnFocus(fGotFocus) {
        result := ComCall(8, this, "int", fGotFocus, "HRESULT")
        return result
    }

    /**
     * Instructs a container to display a property sheet for the control embedded in this site.
     * @remarks
     * A control must always call this method in the container first when it intends to show its own property pages. Calling this method gives the container a chance to have those property pages work with the container's extended controls. The container may include its own property pages as well in such cases, which doesn't affect the control at all. If the container does not implement this method or if it returns a failure of any kind, the control can show its property pages directly. Otherwise, the container has shown the pages.
     * @returns {HRESULT} This method can return the standard return value E_OUTOFMEMORY, as well as the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container does not need to show property pages itself.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-showpropertyframe
     */
    ShowPropertyFrame() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
