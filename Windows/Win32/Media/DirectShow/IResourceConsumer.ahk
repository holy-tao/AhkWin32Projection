#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IResourceConsumer interface provides a callback mechanism for objects using the IResourceManager interface.An object must implement IResourceConsumer if it uses the IResourceManager interface to request resources from the filter graph manager.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iresourceconsumer
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IResourceConsumer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceConsumer
     * @type {Guid}
     */
    static IID => Guid("{56a868ad-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireResource", "ReleaseResource"]

    /**
     * The AcquireResource method notifies the resource consumer that a resource might be acquired.
     * @param {Integer} idResource Resource identifier of the resource to be acquired.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Consumer has successfully acquired the resource.
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
     * Consumer has not acquired the resource but will use <a href="/windows/desktop/api/strmif/nf-strmif-iresourcemanager-notifyacquire">IResourceManager::NotifyAcquire</a> when it does.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_RESOURCE_NOT_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Consumer no longer needs the resource.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The method may return some other error code, if the consumer fails to acquire the resource.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourceconsumer-acquireresource
     */
    AcquireResource(idResource) {
        result := ComCall(3, this, "int", idResource, "HRESULT")
        return result
    }

    /**
     * The ReleaseResource method requests the resource consumer to release the specified resource.
     * @param {Integer} idResource Resource identifier to be released.
     * @returns {HRESULT} Returns S_OK if the consumer has released it and requires it again when it becomes available, or S_FALSE if the consumer has not released it but will use <a href="/windows/desktop/api/strmif/nf-strmif-iresourcemanager-notifyrelease">IResourceManager::NotifyRelease</a> when it does.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iresourceconsumer-releaseresource
     */
    ReleaseResource(idResource) {
        result := ComCall(4, this, "int", idResource, "HRESULT")
        return result
    }
}
