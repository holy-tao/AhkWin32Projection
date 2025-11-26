#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IMoniker.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a linked object to provide its container with functions pertaining to linking.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolelink
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleLink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleLink
     * @type {Guid}
     */
    static IID => Guid("{0000011d-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUpdateOptions", "GetUpdateOptions", "SetSourceMoniker", "GetSourceMoniker", "SetSourceDisplayName", "GetSourceDisplayName", "BindToSource", "BindIfRunning", "GetBoundSource", "UnbindSource", "Update"]

    /**
     * Specifies how often a linked object should update its cached data.
     * @param {Integer} dwUpdateOpt Specifies how often a linked object should update its cached data. The possible values for <i>dwUpdateOpt</i> are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-oleupdate">OLEUPDATE</a>.
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
     * The supplied value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-setupdateoptions
     */
    SetUpdateOptions(dwUpdateOpt) {
        result := ComCall(3, this, "uint", dwUpdateOpt, "HRESULT")
        return result
    }

    /**
     * Retrieves a value indicating how often the linked object updates its cached data.
     * @returns {Integer} A pointer to a variable that receives the current value for the linked object's update option, indicating how often the linked object updates the cached data for the linked object. The possible values for <i>pdwUpdateOpt</i> are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-oleupdate">OLEUPDATE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-getupdateoptions
     */
    GetUpdateOptions() {
        result := ComCall(4, this, "uint*", &pdwUpdateOpt := 0, "HRESULT")
        return pdwUpdateOpt
    }

    /**
     * Sets the moniker for the link source.
     * @param {IMoniker} pmk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on a moniker that identifies the new link source of the linked object. A value of <b>NULL</b> breaks the link.
     * @param {Pointer<Guid>} rclsid The CLSID of the link source that the linked object should use to access information about the linked object when it is not bound.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-setsourcemoniker
     */
    SetSourceMoniker(pmk, rclsid) {
        result := ComCall(5, this, "ptr", pmk, "ptr", rclsid, "HRESULT")
        return result
    }

    /**
     * Retrieves the moniker identifying the link source of a linked object.
     * @returns {IMoniker} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to an absolute moniker that identifies the link source. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on <i>ppmk</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs the implementation must set <i>ppmk</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-getsourcemoniker
     */
    GetSourceMoniker() {
        result := ComCall(6, this, "ptr*", &ppmk := 0, "HRESULT")
        return IMoniker(ppmk)
    }

    /**
     * Sets the display name for the link source.
     * @param {PWSTR} pszStatusText A pointer to the display name of the new link source. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} This method returns S_OK on success.
     * 
     * Values from <a href="/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> may also be returned here.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-setsourcedisplayname
     */
    SetSourceDisplayName(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(7, this, "ptr", pszStatusText, "HRESULT")
        return result
    }

    /**
     * Retrieves the display name of the link source of the linked object.
     * @returns {PWSTR} Address of a pointer variable that receives a pointer to the display name of the link source. If an error occurs, <i>ppszDisplayName</i> is set to <b>NULL</b>; otherwise, the implementation must use <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">IMalloc::Alloc</a> to allocate the string returned in <i>ppszDisplayName</i>, and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">IMalloc::Free</a> to free it. Both caller and called use the allocator returned by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetmalloc">CoGetMalloc</a>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-getsourcedisplayname
     */
    GetSourceDisplayName() {
        result := ComCall(8, this, "ptr*", &ppszDisplayName := 0, "HRESULT")
        return ppszDisplayName
    }

    /**
     * Activates the connection to the link source by binding the moniker stored within the linked object.
     * @param {Integer} bindflags Specifies how to proceed if the link source has a different CLSID from the last time it was bound. If this parameter is zero and the CLSIDs are different, the method fails and returns OLE_E_CLASSDIFF. If the OLELINKBIND_EVENIFCLASSDIFF value from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olelinkbind">OLELINKBIND</a> enumeration is specified and the CLSIDs are different, the method binds successfully and updates the CLSID stored in the linked object.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this binding operation. This parameter can be <b>NULL</b>. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the binding implementation should retrieve information about its environment. For more information, see <b>IBindCtx</b>.
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
     * <dt><b>OLE_E_CLASSDIFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link source was not bound because its CLSID has changed. This error is returned only if the OLELINKBIND_EVENIFCLASSDIFF flag is not specified in the <i>bindflags</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link source could not be found or (if the link source's moniker is a composite) some intermediate object identified in the composite could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNSPEC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link's moniker is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Binding the moniker might require calling the <a href="/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a> function; therefore, this method may return errors generated by <b>CreateBindCtx</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-bindtosource
     */
    BindToSource(bindflags, pbc) {
        result := ComCall(9, this, "uint", bindflags, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * Activates the connection between the linked object and the link source if the link source is already running.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link source is not running.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Binding the moniker might require calling <a href="/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a>, <a href="/windows/desktop/api/objidl/nf-objidl-imoniker-isrunning">IMoniker::IsRunning</a>, or <a href="/windows/desktop/api/oleidl/nf-oleidl-iolelink-bindtosource">IOleLink::BindToSource</a>; therefore, errors generated by these functions can also be returned.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-bindifrunning
     */
    BindIfRunning() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to the link source if the connection is active.
     * @returns {IUnknown} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> pointer variable that receives the interface pointer to the link source. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on <i>ppunk</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>. If an error occurs, the implementation sets <i>ppunk</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-getboundsource
     */
    GetBoundSource() {
        result := ComCall(11, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Breaks the connection between a linked object and its link source.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-unbindsource
     */
    UnbindSource() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Updates the compound document's cached data for a linked object. This involves binding to the link source, if it is not already bound.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in binding the link source. This parameter can be <b>NULL</b>. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the binding implementation should retrieve information about its environment. For more information, see <b>IBindCtx</b>.
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
     * <dt><b>CACHE_E_NOCACHE_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bind operation worked but no caches were updated.
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
     * The bind operation worked but not all caches were updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_CANT_BINDTOSOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to bind to the link source.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolelink-update
     */
    Update(pbc) {
        result := ComCall(13, this, "ptr", pbc, "HRESULT")
        return result
    }
}
