#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Determines the security identifier of the current object's original caller or direct caller. However, the preferred way to get information about an object's callers is to use the ISecurityCallContext interface.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-isecurityproperty
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
     * @param {Pointer<PSID>} _pSID 
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-getdirectcreatorsid
     */
    GetDirectCreatorSID(_pSID) {
        _pSIDMarshal := _pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, _pSIDMarshal, _pSID, "HRESULT")
        return result
    }

    /**
     * In MTS 2.0, this method retrieves the security identifier of the base process that initiated the activity in which the current object is executing. Do not use this method in COM+.
     * @param {Pointer<PSID>} _pSID 
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-getoriginalcreatorsid
     */
    GetOriginalCreatorSID(_pSID) {
        _pSIDMarshal := _pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, _pSIDMarshal, _pSID, "HRESULT")
        return result
    }

    /**
     * Retrieves the security identifier of the external process that called the currently executing method.
     * @remarks
     * Use the <b>GetDirectCallerSID</b> method to determine the security ID of the process that called the object's currently executing method. Security is enforced across process boundaries. This means that the security ID returned by <b>GetDirectCallerSID</b> is the security ID associated with the process that called into the process in which the current object is running, not necessarily the immediate caller into the object itself. If an object calls into another object within the same process, when the second object calls <b>GetDirectCallerSID</b> it gets the security ID of the most immediate caller outside its own process boundary, not the security ID of the object that directly called into it.
     * 
     * The following scenarios illustrate the functionality of the <b>GetDirectCallerSID</b> method:
     * 
     * <ul>
     * <li>A base process running on Server A, as user A, calls into Object X on Server B, running as user B. Then Object X calls into Object Y, running on Server C. If Object Y calls <b>GetDirectCallerSID</b>, the security ID of user B is returned.
     * </li>
     * <li>A base process, running on Server A as user A, calls into Object X on Server B, running as user B. Then Object X calls into Object Y, running in the same process as Object X, also on Server B. When Object Y calls <b>GetDirectCallerSID</b>, the security ID of user A is returned, not the security ID of user B.
     * </li>
     * </ul>
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecurityproperty-releasesid">ISecurityProperty::ReleaseSID</a> on a security ID when you finish using it.
     * @param {Pointer<PSID>} _pSID 
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-getdirectcallersid
     */
    GetDirectCallerSID(_pSID) {
        _pSIDMarshal := _pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, _pSIDMarshal, _pSID, "HRESULT")
        return result
    }

    /**
     * Retrieves the security identifier of the base process that initiated the call sequence from which the current method was called.
     * @remarks
     * You use the 
     *      <b>GetOriginalCallerSID</b> method to 
     *      determine the security ID of the original process that initiated the call sequence from which the current method 
     *      was called, not the originator (or creator) of the process. Although a pointer to an object can be passed through 
     *      a series of servers and users, 
     *      <b>GetOriginalCallerSID</b> always 
     *      returns the first server and user of the process, even if that user was not the original creator of the object. 
     *      The following scenario illustrates the functionality of the 
     *      <b>GetOriginalCallerSID</b> method.
     * 
     * :::image type="content" source="./images/ff4d2c22-6e80-48e0-a6ca-4622b703e9e9.png" border="false" alt-text="Diagram showing the results of the GetOriginalCallerSID method for object references passed between four servers running two base processes.":::
     * 
     * <ol>
     * <li>Base Process 1, running on Server A as user A, creates Object X, on Server B, running as user B.</li>
     * <li>Base Process 1 passes its reference on Object X to Base Process 2, running on Server D as user D.</li>
     * <li>Base Process 2 uses that reference to call into Object X.</li>
     * <li>Object X calls into Object Y, running on Server C. If Object Y then calls 
     *       <b>GetOriginalCallerSID</b>, the 
     *       security ID of user D is returned, not user A, who originally created the object.</li>
     * </ol>
     * <div class="alert"><b>Note</b>  Usually, an object's original caller is the same process as its original creator. The only situation in 
     *      which the original caller and the original creator would be different is one in which the original creator passes 
     *      a reference to another process and the other process initiates the call sequence (as in the preceding 
     *      example).</div>
     * <div> </div>
     * The path to the original caller is broken if any object along the chain was created by some means other than 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-createinstance">IObjectContext::CreateInstance</a> or 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-itransactioncontext-createinstance">ITransactionContext::CreateInstance</a>. 
     *      For example, if Base Process 1 uses <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> 
     *      to create Object X, when Object Y calls 
     *      <b>GetOriginalCallerSID</b> the security 
     *      ID it gets back is the security ID of user B, not user D. This is because the call sequence is traced back 
     *      through the objects' context and COM+ can create a context only for an object that is created with either 
     *      <b>IObjectContext::CreateInstance</b> or 
     *      <b>ITransactionContext::CreateInstance</b>.
     * 
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecurityproperty-releasesid">ReleaseSID</a> on a security 
     *     ID when you finish using it.
     * @param {Pointer<PSID>} _pSID 
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-getoriginalcallersid
     */
    GetOriginalCallerSID(_pSID) {
        _pSIDMarshal := _pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, _pSIDMarshal, _pSID, "HRESULT")
        return result
    }

    /**
     * Releases the security identifier returned by one of the other ISecurityProperty methods.
     * @remarks
     * You should always invoke the <b>ReleaseSID</b> method to release any security ID pointers returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecurityproperty-getdirectcallersid">GetDirectCallerSID</a>, <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecurityproperty-getdirectcreatorsid">GetDirectCreatorSID</a>, <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecurityproperty-getoriginalcallersid">GetOriginalCallerSID</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecurityproperty-getoriginalcreatorsid">GetOriginalCreatorSID</a> methods.
     * @param {PSID} _pSID 
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-releasesid
     */
    ReleaseSID(_pSID) {
        result := ComCall(7, this, "ptr", _pSID, "HRESULT")
        return result
    }
}
