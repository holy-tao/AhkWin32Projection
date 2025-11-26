#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IEnumSTATDATA.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides control of the presentation data that gets cached inside of an object. Cached presentation data is available to the container of the object even when the server application is not running or is unavailable.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolecache
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleCache extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleCache
     * @type {Guid}
     */
    static IID => Guid("{0000011e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cache", "Uncache", "EnumCache", "InitCache", "SetData"]

    /**
     * Specifies the format and other data to be cached inside an embedded object.
     * @param {Pointer<FORMATETC>} pformatetc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that specifies the format and other data to be cached. View caching is specified by passing a zero clipboard format in <i>pformatetc</i>.
     * @param {Integer} advf A group of flags that control the caching. Possible values come from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. When used in this context, for a cache, these values have specific meanings, which are outlined in Remarks. Refer to the <b>ADVF</b> enumeration for a more detailed description.
     * @returns {Integer} A pointer to a variable that receives the identifier of this connection, which can later be used to turn caching off (by passing it to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-uncache">IOleCache::Uncache</a>). If this value is 0, the connection was not established. The OLE-provided implementation uses nonzero numbers for connection identifiers.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolecache-cache
     */
    Cache(pformatetc, advf) {
        result := ComCall(3, this, "ptr", pformatetc, "uint", advf, "uint*", &pdwConnection := 0, "HRESULT")
        return pdwConnection
    }

    /**
     * Removes a cache connection created previously using IOleCache::Cache.
     * @param {Integer} dwConnection The cache connection to be removed. This nonzero value was returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a> when the cache was originally established.
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
     * <dt><b>OLE_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No cache connection exists for <i>dwConnection</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolecache-uncache
     */
    Uncache(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * Creates an enumerator that can be used to enumerate the current cache connections.
     * @returns {IEnumSTATDATA} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> pointer variable that receives the interface pointer to the new enumerator object. If this parameter is <b>NULL</b>, there are no cache connections at this time.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolecache-enumcache
     */
    EnumCache() {
        result := ComCall(5, this, "ptr*", &ppenumSTATDATA := 0, "HRESULT")
        return IEnumSTATDATA(ppenumSTATDATA)
    }

    /**
     * Fills the cache as needed using the data provided by the specified data object.
     * @param {IDataObject} pDataObject A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object from which the cache is to be initialized.
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
     * The pointer to the <a href="/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface is invalid.
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
     * Insufficient memory is available for the operation.
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
     * The cache is not running.
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
     * Only some of the existing caches were updated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolecache-initcache
     */
    InitCache(pDataObject) {
        result := ComCall(6, this, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * Initializes the cache with data in a specified format and on a specified medium.
     * @param {Pointer<FORMATETC>} pformatetc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that specifies the format of the presentation data being placed in the cache.
     * @param {Pointer<STGMEDIUM>} pmedium A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure that specifies the storage medium that contains the presentation data.
     * @param {BOOL} fRelease Indicates the ownership of the storage medium after completion of the method. If <i>fRelease</i> is <b>TRUE</b>, the cache takes ownership, freeing the medium when it is finished using it. When <i>fRelease</i> is <b>FALSE</b>, the caller retains ownership and is responsible for freeing the medium. The cache can only use the storage medium for the duration of the call.
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
     * <dt><b>DV_E_LINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value is not valid for <i>pformatetc</i>-&gt;<b>lindex</b>. Currently, only -1 is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_FORMATETC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_TYMED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value is not valid for <i>pformatetc</i>-&gt;<b>tymed</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_DVASPECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value is not valid for <i>pformatetc</i>-&gt;<b>dwAspect</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is an uninitialized object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_TARGETDEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is static and <i>pformatetc</i>-&gt;<b>ptd</b> is non-<b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolecache-setdata
     */
    SetData(pformatetc, pmedium, fRelease) {
        result := ComCall(7, this, "ptr", pformatetc, "ptr", pmedium, "int", fRelease, "HRESULT")
        return result
    }
}
