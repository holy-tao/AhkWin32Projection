#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the features for supporting keyboard mnemonics, ambient properties, and events in control objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-iolecontrol
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleControl
     * @type {Guid}
     */
    static IID => Guid("{b196b288-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetControlInfo", "OnMnemonic", "OnAmbientPropertyChange", "FreezeEvents"]

    /**
     * Retrieves information about the control's keyboard mnemonics and behavior.
     * @param {Pointer<CONTROLINFO>} pCI A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-controlinfo">CONTROLINFO</a> structure that receives the information.
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
     * The control has no mnemonics.
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
     * The address in <i>pCI</i> is not valid. For example, it may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-iolecontrol-getcontrolinfo
     */
    GetControlInfo(pCI) {
        result := ComCall(3, this, "ptr", pCI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Informs a control that the user has pressed a keystroke that represents a keyboard mnemonic.
     * @remarks
     * The keystroke must match one of the <b>ACCEL</b> entries in the mnemonic table returned through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iolecontrol-getcontrolinfo">IOleControl::GetControlInfo</a>. The control takes whatever action is appropriate for the keystroke.
     * 
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     *  A container of a control is allowed to cache the control's <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-controlinfo">CONTROLINFO</a> structure, provided that the container implements <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iolecontrolsite-oncontrolinfochanged">IOleControlSite::OnControlInfoChanged</a> to know when it must update its cached information.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If a control changes the contents of its <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-controlinfo">CONTROLINFO</a> structure, it must notify its container by calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iolecontrolsite-oncontrolinfochanged">IOleControlSite::OnControlInfoChanged</a>.
     * @param {Pointer<MSG>} pMsg A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure describing the keystroke to be processed.
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
     * The control does not handle mnemonics. This indicates an unexpected condition and a caller error. For example, the caller has mismatched which control has which mnemonic.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-iolecontrol-onmnemonic
     */
    OnMnemonic(pMsg) {
        result := ComCall(4, this, "ptr", pMsg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Informs a control that one or more of the container's ambient properties has changed.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * S_OK is returned in all cases even when the control does not support ambient properties or some other failure has occurred. The caller sending the notification cannot attempt to use an error code (such as E_NOTIMPL) to determine whether to send the notification in the future. Such semantics are not part of this interface.
     * @param {Integer} dispID The dispatch identifier of the ambient property that changed. If this parameter is DISPID_UNKNOWN, it indicates that multiple properties changed. In this case, the control should check all the ambient properties of interest to obtain their current values.
     * @returns {HRESULT} This method returns S_OK in all cases.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-iolecontrol-onambientpropertychange
     */
    OnAmbientPropertyChange(dispID) {
        result := ComCall(5, this, "int", dispID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates whether the container is ignoring or accepting events from the control.
     * @remarks
     * The control is not required to stop sending events when <i>bFreeze</i> is <b>TRUE</b>. However, the container is not going to process them in this case. If a control depends on the container's processing -- as with request events that return information from the container -- the control must either discard the event or queue the event to send later when <i>bFreeze</i> is <b>FALSE</b>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * As with <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iolecontrol-onambientpropertychange">IOleControl::OnAmbientPropertyChange</a>, S_OK is returned in all cases in order to prevent a container from making assumptions about a control's behavior based on return values.
     * @param {BOOL} bFreeze Indicates whether the container will ignore (<b>TRUE</b>) or now process (<b>FALSE</b>) events from the control.
     * @returns {HRESULT} This method returns S_OK in all cases.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-iolecontrol-freezeevents
     */
    FreezeEvents(bFreeze) {
        result := ComCall(6, this, "int", bFreeze, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
