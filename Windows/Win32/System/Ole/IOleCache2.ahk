#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleCache.ahk

/**
 * Enables object clients to selectively update each cache that was created with IOleCache::Cache.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolecache2
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleCache2 extends IOleCache{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleCache2
     * @type {Guid}
     */
    static IID => Guid("{00000128-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateCache", "DiscardCache"]

    /**
     * Updates the specified caches. This method is used when the application needs precise control over caching.
     * @param {IDataObject} pDataObject A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object from which the cache is updated. Object handlers and in-process servers typically pass a non-<b>NULL</b> value. A container application usually passes <b>NULL</b>, and the source is obtained from the currently running object.
     * @param {Integer} grfUpdf 
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
     * One of the arguments is not valid.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_NOTRUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <i>pDataObject</i> is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CACHE_E_NOCACHE_UPDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the caches were updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CACHE_S_SOMECACHES_NOTUPDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some of the caches were updated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolecache2-updatecache
     */
    UpdateCache(pDataObject, grfUpdf) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(8, this, "ptr", pDataObject, "uint", grfUpdf, "ptr", pReserved, "HRESULT")
        return result
    }

    /**
     * Discards the caches found in memory.
     * @param {Integer} dwDiscardOptions A value from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-discardcache">DISCARDCACHE</a> enumeration that indicates whether data is to be saved prior to being discarded. Containers that have drawn a large object and need to free up memory can specify DISCARDCACHE_SAVEIFDIRTY so that the newest presentation is saved for the next time the object must be drawn.
     * 
     * Containers that have activated an embedded object, made some changes, and then called <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a> with OLECLOSE_NOSAVE to roll back the changes can specify DISCARDCACHE_NOSAVE to ensure that the native and presentation data are not out of synchronization.
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
     * <dt><b>OLE_E_NOSTORAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no storage available for saving the data in the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_MEDIUMFULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The storage medium is full.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolecache2-discardcache
     */
    DiscardCache(dwDiscardOptions) {
        result := ComCall(9, this, "uint", dwDiscardOptions, "HRESULT")
        return result
    }
}
