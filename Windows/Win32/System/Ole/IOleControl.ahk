#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the features for supporting keyboard mnemonics, ambient properties, and events in control objects.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iolecontrol
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
     * The method completed succesfully.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iolecontrol-getcontrolinfo
     */
    GetControlInfo(pCI) {
        result := ComCall(3, this, "ptr", pCI, "HRESULT")
        return result
    }

    /**
     * Informs a control that the user has pressed a keystroke that represents a keyboard mneumonic.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iolecontrol-onmnemonic
     */
    OnMnemonic(pMsg) {
        result := ComCall(4, this, "ptr", pMsg, "HRESULT")
        return result
    }

    /**
     * Informs a control that one or more of the container's ambient properties has changed.
     * @param {Integer} dispID The dispatch identifier of the ambient property that changed. If this parameter is DISPID_UNKNOWN, it indicates that multiple properties changed. In this case, the control should check all the ambient properties of interest to obtain their current values.
     * @returns {HRESULT} This method returns S_OK in all cases.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iolecontrol-onambientpropertychange
     */
    OnAmbientPropertyChange(dispID) {
        result := ComCall(5, this, "int", dispID, "HRESULT")
        return result
    }

    /**
     * Indicates whether the container is ignoring or accepting events from the control.
     * @param {BOOL} bFreeze Indicates whether the container will ignore (<b>TRUE</b>) or now process (<b>FALSE</b>) events from the control.
     * @returns {HRESULT} This method returns S_OK in all cases.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iolecontrol-freezeevents
     */
    FreezeEvents(bFreeze) {
        result := ComCall(6, this, "int", bFreeze, "HRESULT")
        return result
    }
}
