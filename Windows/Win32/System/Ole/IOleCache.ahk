#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IEnumSTATDATA.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides control of the presentation data that gets cached inside of an object. Cached presentation data is available to the container of the object even when the server application is not running or is unavailable.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nn-oleidl-iolecache
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
     * @remarks
     * <b>IOleCache::Cache</b> can specify either data caching or view (presentation) caching. To specify data caching, a valid data format must be passed in <i>pformatetc</i>. For view caching, the cache object itself decides on the format to cache, so a caller would pass a zero data format in <i>pformatetc</i> as follows:
     * 
     * 
     * ``` syntax
     * pFormatetc-&gt;cfFormat == 0
     * ```
     * 
     * A custom object handler can choose not to store data in a given format. Instead, it can synthesize it on demand when requested.
     * 
     * The <i>advf</i> value specifies a member of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. When one of these values (or an OR'd combination of more than one value) is used in this context, these values mean the following.
     * 
     * <table>
     * <tr>
     * <th>ADVF Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * ADVF_NODATA
     * 
     * </td>
     * <td>
     * The cache is not to be updated by changes made to the running object. Instead, the container will update the cache by explicitly calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-setdata">IOleCache::SetData</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-setdata">IDataObject::SetData</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache2-updatecache">IOleCache2::UpdateCache</a>. This flag is usually used when the iconic aspect of an object is being cached.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * ADVF_ONLYONCE
     * 
     * </td>
     * <td>
     * Update the cache one time only. After the update is complete, the advisory connection between the object and the cache is disconnected. The source object for the advisory connection calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * ADVF_PRIMEFIRST
     * 
     * </td>
     * <td>
     * The object is not to wait for the data or view to change before updating the cache. OR'd with ADVF_ONLYONCE, this parameter provides an asynchronous <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> call.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * ADVFCACHE_NOHANDLER
     * 
     * </td>
     * <td>
     * Synonym for ADVFCACHE_FORCEBUILTIN.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * ADVFCACHE_FORCEBUILTIN
     * 
     * </td>
     * <td>
     * Used by DLL object applications and object handlers that draw their objects to cache presentation data to ensure that there is a presentation in the cache. This ensures that the data can be retrieved even when the object or handler code is not available.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * ADVFCACHE_ONSAVE
     * 
     * </td>
     * <td>
     * Updates the cached representation only when the object containing the cache is saved. The cache is also updated when the OLE object changes from the running state back to the loaded state (because a subsequent save operation would require running the object again).
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<FORMATETC>} pformatetc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that specifies the format and other data to be cached. View caching is specified by passing a zero clipboard format in <i>pformatetc</i>.
     * @param {Integer} advf_ A group of flags that control the caching. Possible values come from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. When used in this context, for a cache, these values have specific meanings, which are outlined in Remarks. Refer to the <b>ADVF</b> enumeration for a more detailed description.
     * @returns {Integer} A pointer to a variable that receives the identifier of this connection, which can later be used to turn caching off (by passing it to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-uncache">IOleCache::Uncache</a>). If this value is 0, the connection was not established. The OLE-provided implementation uses nonzero numbers for connection identifiers.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolecache-cache
     */
    Cache(pformatetc, advf_) {
        result := ComCall(3, this, "ptr", pformatetc, "uint", advf_, "uint*", &pdwConnection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwConnection
    }

    /**
     * Removes a cache connection created previously using IOleCache::Cache.
     * @remarks
     * The <b>IOleCache::Uncache</b> method removes a cache connection that was created in a prior call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a>. It uses the <i>dwConnection</i> parameter that was returned by the prior call to <b>IOleCache::Cache</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolecache-uncache
     */
    Uncache(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an enumerator that can be used to enumerate the current cache connections.
     * @remarks
     * The enumerator object returned by this method implements the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> interface. <b>IEnumSTATDATA</b> enumerates the data stored in an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statdata">STATDATA</a> structures containing information about current cache connections.
     * @returns {IEnumSTATDATA} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> pointer variable that receives the interface pointer to the new enumerator object. If this parameter is <b>NULL</b>, there are no cache connections at this time.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolecache-enumcache
     */
    EnumCache() {
        result := ComCall(5, this, "ptr*", &ppenumSTATDATA := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumSTATDATA(ppenumSTATDATA)
    }

    /**
     * Fills the cache as needed using the data provided by the specified data object.
     * @remarks
     * <b>InitCache</b> is usually used when creating an object from a drag-and-drop operation or from a clipboard paste operation. It fills the cache as needed with presentation data from all the data formats provided by the data object provided on the clipboard or in the drag-and-drop operation. Helper functions like <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatefromdata">OleCreateFromData</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatelinkfromdata">OleCreateLinkFromData</a> call this method when needed. If a container does not use these helper functions to create compound document objects, it can use <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a> to set up the cache entries which are then filled by <b>InitCache</b>.
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
     * The pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface is invalid.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolecache-initcache
     */
    InitCache(pDataObject) {
        result := ComCall(6, this, "ptr", pDataObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the cache with data in a specified format and on a specified medium.
     * @remarks
     * <b>IOleCache::SetData</b> is usually called when an object is created from the clipboard or through a drag-and-drop operation, and Embed Source data is used to create the object.
     * 
     * <b>IOleCache::SetData</b> and <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-initcache">IOleCache::InitCache</a> are very similar. There are two main differences. The first difference is that while <b>IOleCache::InitCache</b> initializes the cache with the presentation format provided by the data object, <b>IOleCache::SetData</b> initializes it with a single format. Second, the <b>IOleCache::SetData</b> method ignores the ADVF_NODATA flag while <b>IOleCache::InitCache</b> obeys this flag.
     * 
     * A container can use this method to maintain a single aspect of an object, such as the icon aspect of the object.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure is invalid.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolecache-setdata
     */
    SetData(pformatetc, pmedium, fRelease) {
        result := ComCall(7, this, "ptr", pformatetc, "ptr", pmedium, "int", fRelease, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
