#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Determines the security identifier of the current object's original caller or direct caller. However, the preferred way to get information about an object's callers is to use the ISecurityCallContext interface.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isecurityproperty
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISecurityProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityProperty
     * @type {Guid}
     */
    static IID => Guid("{51372aea-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The class identifier for SecurityProperty
     * @type {Guid}
     */
    static CLSID => Guid("{e74a7215-014d-11d1-a63c-00a0c911b4e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDirectCreatorSID", "GetOriginalCreatorSID", "GetDirectCallerSID", "GetOriginalCallerSID", "ReleaseSID"]

    /**
     * In MTS 2.0, this method retrieves the security identifier of the external process that directly created the current object. Do not use this method in COM+.
     * @param {Pointer<PSID>} pSID A reference to the security ID of the process that directly created the current object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
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
     * The security ID of the process that directly created the current object is returned in the parameter <i>pSid</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOCONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current object does not have a context associated with it because either the component was not imported into an application or the object was not created with one of the COM+ CreateInstance methods.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecurityproperty-getdirectcreatorsid
     */
    GetDirectCreatorSID(pSID) {
        pSIDMarshal := pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pSIDMarshal, pSID, "HRESULT")
        return result
    }

    /**
     * In MTS 2.0, this method retrieves the security identifier of the base process that initiated the activity in which the current object is executing. Do not use this method in COM+.
     * @param {Pointer<PSID>} pSID A reference to the security ID of the base process that initiated the activity in which the current object is executing.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
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
     * The security ID of the original created is returned in the parameter <i>pSid</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOCONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current object does not have a context associated with it because either the component was not imported into an application or the object was not created with one of the COM+ CreateInstance methods.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecurityproperty-getoriginalcreatorsid
     */
    GetOriginalCreatorSID(pSID) {
        pSIDMarshal := pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pSIDMarshal, pSID, "HRESULT")
        return result
    }

    /**
     * Retrieves the security identifier of the external process that called the currently executing method.
     * @param {Pointer<PSID>} pSID A reference to the security ID of the process from which the current method was invoked.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
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
     * The security ID of the process that called the current method is returned in the parameter <i>pSid</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOCONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current object does not have a context associated with it because either the component was not imported into an application or the object was not created with one of the COM+ CreateInstance methods.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecurityproperty-getdirectcallersid
     */
    GetDirectCallerSID(pSID) {
        pSIDMarshal := pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pSIDMarshal, pSID, "HRESULT")
        return result
    }

    /**
     * Retrieves the security identifier of the base process that initiated the call sequence from which the current method was called.
     * @param {Pointer<PSID>} pSID A reference to the security ID of the base process that initiated the call sequence from which the current 
     *       method was called.
     * @returns {HRESULT} This method can return the standard return values <b>E_INVALIDARG</b>, 
     *       <b>E_OUTOFMEMORY</b>, <b>E_UNEXPECTED</b>, and 
     *       <b>E_FAIL</b>, as well as the following values.
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
     * The security ID of the base process that originated the call into the current object is returned in the 
     *         parameter <i>pSid</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOCONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current object does not have a context associated with it because either the component was not 
     *         imported into an application or the object was not created with one of the COM+ 
     *         <b>CreateInstance</b> methods.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecurityproperty-getoriginalcallersid
     */
    GetOriginalCallerSID(pSID) {
        pSIDMarshal := pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pSIDMarshal, pSID, "HRESULT")
        return result
    }

    /**
     * Releases the security identifier returned by one of the other ISecurityProperty methods.
     * @param {PSID} pSID A reference to a security ID.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument passed in the pSid parameter is not a reference to a security ID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecurityproperty-releasesid
     */
    ReleaseSID(pSID) {
        result := ComCall(7, this, "ptr", pSID, "HRESULT")
        return result
    }
}
