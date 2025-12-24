#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IResourceManager interface resolves contentions for system resources.The filter graph manager exposes this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iresourcemanager
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IResourceManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceManager
     * @type {Guid}
     */
    static IID => Guid("{56a868ac-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "RegisterGroup", "RequestResource", "NotifyAcquire", "NotifyRelease", "CancelRequest", "SetFocus", "ReleaseFocus"]

    /**
     * The Register method registers a single named resource with the resource manager.
     * @param {PWSTR} pName Named resource.
     * @param {Integer} cResource Number of resources.
     * @returns {Integer} Pointer to the returned token identifying the resource to be used in additional calls.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourcemanager-register
     */
    Register(pName, cResource) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(3, this, "ptr", pName, "int", cResource, "int*", &plToken := 0, "HRESULT")
        return plToken
    }

    /**
     * The RegisterGroup method registers a named resource group with the resource manager.
     * @param {PWSTR} pName Named resource group.
     * @param {Integer} cResource Number of resources in the group.
     * @param {Pointer<Integer>} palTokens Pointer to an array of resources in the group.
     * @returns {Integer} Pointer to the returned group resource identifier.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourcemanager-registergroup
     */
    RegisterGroup(pName, cResource, palTokens) {
        pName := pName is String ? StrPtr(pName) : pName

        palTokensMarshal := palTokens is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pName, "int", cResource, palTokensMarshal, palTokens, "int*", &plToken := 0, "HRESULT")
        return plToken
    }

    /**
     * The RequestResource method requests the use of a given registered resource.
     * @param {Integer} idResource Resource token retrieved when the resource was registered.
     * @param {IUnknown} pFocusObject Pointer to the <b>IUnknown</b> interface of a focus object associated with a request (typically the <b>IUnknown</b> interface of the filter).
     * @param {IResourceConsumer} pConsumer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iresourceconsumer">IResourceConsumer</a> interface on the object requesting the resource.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Returns S_OK if the requested resource is returned, or S_FALSE if the resource is not available, in which case the resource manager will call the requesting object back when the resource becomes available. Any other return is an error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourcemanager-requestresource
     */
    RequestResource(idResource, pFocusObject, pConsumer) {
        result := ComCall(5, this, "int", idResource, "ptr", pFocusObject, "ptr", pConsumer, "HRESULT")
        return result
    }

    /**
     * The NotifyAcquire method notifies the resource manager that an attempt to acquire a resource has completed.
     * @param {Integer} idResource Token for the registered resource.
     * @param {IResourceConsumer} pConsumer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iresourceconsumer">IResourceConsumer</a> interface of the object requesting the resource.
     * @param {HRESULT} hr Value indicating the success of the acquisition; S_OK if the resource was acquired, or an error value if not.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation. <b>HRESULT</b> can be one of the following standard constants, or other values not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * <b>NULL</b> pointer argument.
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
     * Invalid argument.
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
     * Method isn't supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK or NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourcemanager-notifyacquire
     */
    NotifyAcquire(idResource, pConsumer, hr) {
        result := ComCall(6, this, "int", idResource, "ptr", pConsumer, "int", hr, "HRESULT")
        return result
    }

    /**
     * The NotifyRelease method notifies the resource manager that IResourceConsumer has released a resource.
     * @param {Integer} idResource Resource token.
     * @param {IResourceConsumer} pConsumer Pointer to the object releasing the resource.
     * @param {BOOL} bStillWant Flag that specifies whether the resource is still required. Set to <b>TRUE</b> to indicate that you still want the resource when it is next available, or <b>FALSE</b> if you no longer want the resource.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation. <b>HRESULT</b> can be one of the following standard constants, or other values not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * <b>NULL</b> pointer argument.
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
     * Invalid argument.
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
     * Method isn't supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK or NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourcemanager-notifyrelease
     */
    NotifyRelease(idResource, pConsumer, bStillWant) {
        result := ComCall(7, this, "int", idResource, "ptr", pConsumer, "int", bStillWant, "HRESULT")
        return result
    }

    /**
     * The CancelRequest method cancels the request for a resource.
     * @param {Integer} idResource Resource identifier of a pending request.
     * @param {IResourceConsumer} pConsumer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iresourceconsumer">IResourceConsumer</a> interface that made the request.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation. <b>HRESULT</b> can be one of the following standard constants, or other values not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * <b>NULL</b> pointer argument.
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
     * Invalid argument.
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
     * Method isn't supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK or NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourcemanager-cancelrequest
     */
    CancelRequest(idResource, pConsumer) {
        result := ComCall(8, this, "int", idResource, "ptr", pConsumer, "HRESULT")
        return result
    }

    /**
     * The SetFocus method notifies the resource manager that a specified object has been given the focus of the user.
     * @param {IUnknown} pFocusObject Pointer to the object that has been given the user's focus.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation. <b>HRESULT</b> can be one of the following standard constants, or other values not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * <b>NULL</b> pointer argument.
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
     * Invalid argument.
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
     * Method isn't supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK or NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourcemanager-setfocus
     */
    SetFocus(pFocusObject) {
        result := ComCall(9, this, "ptr", pFocusObject, "HRESULT")
        return result
    }

    /**
     * The ReleaseFocus method sets the focus object to NULL in the resource manager if the current focus object is the one specified in this method.
     * @param {IUnknown} pFocusObject Pointer to the focus object.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation. <b>HRESULT</b> can be one of the following standard constants, or other values not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * <b>NULL</b> pointer argument.
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
     * Invalid argument.
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
     * Method isn't supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK or NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourcemanager-releasefocus
     */
    ReleaseFocus(pFocusObject) {
        result := ComCall(10, this, "ptr", pFocusObject, "HRESULT")
        return result
    }
}
