#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides proper maintenance of caches. It maintains the caches by connecting the running object's IDataObject implementation to the cache, allowing the cache to receive notifications from the running object.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-iolecachecontrol
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleCacheControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleCacheControl
     * @type {Guid}
     */
    static IID => Guid("{00000129-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnRun", "OnStop"]

    /**
     * Notifies the cache that the data source object has entered the running state so that the cache object can establish advise sinks as needed.
     * @remarks
     * When <b>OnRun</b> is called, the cache sets up advisory connections as necessary with the source data object so it can receive notifications. The advisory connection created between the running object and the cache is destroyed when <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecachecontrol-onstop">IOleCacheControl::OnStop</a> is called.
     * 
     * Some object handlers or in-process servers might use the cache passively, and not call <b>OnRun</b>. These applications must call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache2-updatecache">IOleCache2::UpdateCache</a>, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-initcache">IOleCache::InitCache</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-setdata">IOleCache::SetData</a> to fill the cache when necessary to ensure that the cache gets updated.
     * 
     * <b>OnRun</b> does not add a reference count on the pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> passed in <i>pDataObject</i>. Because it is the responsibility of the caller of <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olerun">OleRun</a> to ensure that the lifetime of the <i>pDataObject</i> pointer lasts until <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecachecontrol-onstop">OnStop</a> is called, the caller must be holding a pointer to <b>IDataObject</b> on the data object of interest.
     * @param {IDataObject} pDataObject A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object that is entering the running state.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the  arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecachecontrol-onrun
     */
    OnRun(pDataObject) {
        result := ComCall(3, this, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * Notifies the cache that it should terminate any existing advise sinks. No indication is given as to whether a connection actually existed.
     * @remarks
     * The data advisory connection between the running object and the cache is destroyed as part of calling <b>OnStop</b>.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory is available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecachecontrol-onstop
     */
    OnStop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
