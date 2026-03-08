#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IResourceManager interface resolves contentions for system resources.The filter graph manager exposes this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iresourcemanager
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
     * @remarks
     * This method registers a named resource, which can contain a number of resources, and returns a token to be used when requesting this resource. It is not an error if the resource is already registered; if the number in the <i>cResource</i> parameter is less than what is already registered, resources will be deallocated to the new count. To unregister the resource, pass a count of zero in <i>cResource</i>.
     * @param {PWSTR} pName Named resource.
     * @param {Integer} cResource Number of resources.
     * @returns {Integer} Pointer to the returned token identifying the resource to be used in additional calls.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourcemanager-register
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourcemanager-registergroup
     */
    RegisterGroup(pName, cResource, palTokens) {
        pName := pName is String ? StrPtr(pName) : pName

        palTokensMarshal := palTokens is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pName, "int", cResource, palTokensMarshal, palTokens, "int*", &plToken := 0, "HRESULT")
        return plToken
    }

    /**
     * The RequestResource method requests the use of a given registered resource.
     * @remarks
     * When there is more than one request for the resource, the resource manager will decide the priority by using the object of focus passed with each request and comparing it to the object of focus passed in the most recent <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-setfocus">IResourceManager::SetFocus</a> method.
     * 
     * Requests will be filled in the following order of priority:
     * 
     * <ol>
     * <li>Requests made with exactly the same object of focus as the last <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-setfocus">SetFocus</a> method.</li>
     * <li>Requests whose object of focus shares a common source filter whose object of focus shares a common filter graph.</li>
     * <li>Requests in the same process as the focus.</li>
     * </ol>
     * While checking this priority, the resource manager will use <b>QueryInterface</b> on the focus object for IID_IFilter. If found, the resource manager will use <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> methods to check the filter graph and look for common source filters with the current focus object.
     * 
     * A filter should pass the <b>IUnknown</b> interface of the filter in the <i>pFocusObject</i> parameter. The filter graph manager matches filters to the filter graph and will attempt to trace filters to common source filters when checking objects of focus.
     * 
     * The focus object must be valid for the entire lifetime of the request—until either the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-cancelrequest">IResourceManager::CancelRequest</a> method is called, or the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-notifyrelease">IResourceManager::NotifyRelease</a> method is called with the <i>bStillWant</i> parameter set to <b>FALSE</b>.
     * @param {Integer} idResource Resource token retrieved when the resource was registered.
     * @param {IUnknown} pFocusObject Pointer to the <b>IUnknown</b> interface of a focus object associated with a request (typically the <b>IUnknown</b> interface of the filter).
     * @param {IResourceConsumer} pConsumer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iresourceconsumer">IResourceConsumer</a> interface on the object requesting the resource.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Returns S_OK if the requested resource is returned, or S_FALSE if the resource is not available, in which case the resource manager will call the requesting object back when the resource becomes available. Any other return is an error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourcemanager-requestresource
     */
    RequestResource(idResource, pFocusObject, pConsumer) {
        result := ComCall(5, this, "int", idResource, "ptr", pFocusObject, "ptr", pConsumer, "HRESULT")
        return result
    }

    /**
     * The NotifyAcquire method notifies the resource manager that an attempt to acquire a resource has completed.
     * @remarks
     * Use this method after an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourceconsumer-acquireresource">IResourceConsumer::AcquireResource</a> method returns an S_FALSE value, indicating that the acquisition will be asynchronous (that is, handled by a callback mechanism). If the <i>hr</i> parameter is S_OK, the resource manager will assume that the resource is now held by the caller. If the <i>hr</i> parameter is anything other than S_OK, the resource manager will assume that the attempt to acquire the resource failed and will reassign the resource elsewhere.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourcemanager-notifyacquire
     */
    NotifyAcquire(idResource, pConsumer, hr) {
        result := ComCall(6, this, "int", idResource, "ptr", pConsumer, "int", hr, "HRESULT")
        return result
    }

    /**
     * The NotifyRelease method notifies the resource manager that IResourceConsumer has released a resource.
     * @remarks
     * Use this method in response to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourceconsumer-releaseresource">IResourceConsumer::ReleaseResource</a> method, or when you have finished using the resource.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourcemanager-notifyrelease
     */
    NotifyRelease(idResource, pConsumer, bStillWant) {
        result := ComCall(7, this, "int", idResource, "ptr", pConsumer, "int", bStillWant, "HRESULT")
        return result
    }

    /**
     * The CancelRequest method cancels the request for a resource.
     * @remarks
     * This method should be called when the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iresourceconsumer">IResourceConsumer</a> object that requested the resource has not received it and no longer requires it. If it has already received the resource, it should use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-notifyrelease">IResourceManager::NotifyRelease</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourcemanager-cancelrequest
     */
    CancelRequest(idResource, pConsumer) {
        result := ComCall(8, this, "int", idResource, "ptr", pConsumer, "HRESULT")
        return result
    }

    /**
     * The SetFocus method notifies the resource manager that a specified object has been given the focus of the user.
     * @remarks
     * In DirectShow, the object given the user's focus is typically a video renderer whose window has received the focus. The resource manager gives priority to requests for resources in the following order:
     * 
     * <ol>
     * <li>Requests made with the focus object specified in the <i>pFocusObject</i> parameter.</li>
     * <li>Requests whose focus object shares a common source filter.</li>
     * <li>Requests whose focus object shares a common filter graph.</li>
     * <li>Requests in the same process as the focus.</li>
     * </ol>
     * After a focus has been set, the resource manager must maintain a focus object until <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-releasefocus">ReleaseFocus</a> is called. That is, after calling this method, you must use <b>ReleaseFocus</b> before the <b>IUnknown</b> interface of the focus object becomes invalid, unless you can guarantee that <c>SetFocus</c> is called by a different object in the meantime. No reference count is held on the focus object.
     * 
     * The resource manager will hold this pointer until replaced or canceled, and will use it to resolve resource contention. It will use <b>QueryInterface</b> for the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface at least and, if found, will use methods on that interface. It calls methods on <b>IBaseFilter</b> to decide which audio renderer to use if there are two (it will choose the one with a source filter common to the focus object), and also to determine if the two objects are within the same filter graph.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourcemanager-setfocus
     */
    SetFocus(pFocusObject) {
        result := ComCall(9, this, "ptr", pFocusObject, "HRESULT")
        return result
    }

    /**
     * The ReleaseFocus method sets the focus object to NULL in the resource manager if the current focus object is the one specified in this method.
     * @remarks
     * Use this method when the object of focus is about to be destroyed to ensure that the focus is not still being referenced.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourcemanager-releasefocus
     */
    ReleaseFocus(pFocusObject) {
        result := ComCall(10, this, "ptr", pFocusObject, "HRESULT")
        return result
    }
}
