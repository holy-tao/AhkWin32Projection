#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVdsLun.ahk" { IVdsLun }
#Import ".\VDS_LUN_PLEX_PROP.ahk" { VDS_LUN_PLEX_PROP }
#Import ".\VDS_DRIVE_EXTENT.ahk" { VDS_DRIVE_EXTENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\VDS_HINTS.ahk" { VDS_HINTS }

/**
 * The IVdsLunPlex interface (vdshwprv.h) provides methods for performing query and configuration operations on a LUN plex.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdslunplex
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsLunPlex extends IUnknown {
    /**
     * The interface identifier for IVdsLunPlex
     * @type {Guid}
     */
    static IID := Guid("{0ee1a790-5d2e-4abb-8c99-c481e8be2138}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsLunPlex interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties : IntPtr
        GetLun        : IntPtr
        QueryExtents  : IntPtr
        QueryHints    : IntPtr
        ApplyHints    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsLunPlex.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsLunPlex::GetProperties (vdshwprv.h) method returns the properties of the LUN plex.
     * @returns {VDS_LUN_PLEX_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_plex_prop">VDS_LUN_PLEX_PROP</a> structure allocated and passed in by the caller.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-getproperties
     */
    GetProperties() {
        pPlexProp := VDS_LUN_PLEX_PROP()
        result := ComCall(3, this, VDS_LUN_PLEX_PROP.Ptr, pPlexProp, "HRESULT")
        return pPlexProp
    }

    /**
     * The IVdsLunPlex::GetLun (vdshwprv.h) method returns the LUN to which the plex belongs.
     * @returns {IVdsLun} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdslun">IVdsLun</a> interface pointer. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-getlun
     */
    GetLun() {
        result := ComCall(4, this, "ptr*", &ppLun := 0, "HRESULT")
        return IVdsLun(ppLun)
    }

    /**
     * The IVdsLunPlex::QueryExtents (vdshwprv.h) method returns an array of the drive extents that contribute to the plex.
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive-queryextents">IVdsDrive::QueryExtents</a> method to get the extents on a given drive.
     * @param {Pointer<Pointer<VDS_DRIVE_EXTENT>>} ppExtentArray A pointer to the array of pointers to drive extents passed in by the caller. These are the extents that contribute to the plex. See the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_extent">VDS_DRIVE_EXTENT</a> structure. Callers must free this array by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfExtents A pointer to the number of drive extents returned in <i>ppExtentArray</i>.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information about the array. Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method followed by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *   
     * The LUN plex is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN plex is in a failed state, and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations are complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryextents
     */
    QueryExtents(ppExtentArray, plNumberOfExtents) {
        ppExtentArrayMarshal := ppExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfExtentsMarshal := plNumberOfExtents is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, ppExtentArrayMarshal, ppExtentArray, plNumberOfExtentsMarshal, plNumberOfExtents, "HRESULT")
        return result
    }

    /**
     * The IVdsLunPlex::QueryHints (vdshwprv.h) method returns the hints that are currently applied to the LUN plex.
     * @remarks
     * Callers can specify hints by passing in the <i>pHints</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun">IVdsSubSystem::CreateLun</a> method when creating a LUN, or  by using the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunplex-applyhints">IVdsLunPlex::ApplyHints</a> method to apply a set of new hints to an existing plex.
     * 
     * Note that calls to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-applyhints">IVdsLun::ApplyHints</a> method can impact the plexes that contribute to the LUN. To view hints for the entire LUN, use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-queryhints">IVdsLun::QueryHints</a> method.
     * @returns {VDS_HINTS} Pointer to the returned plex hints. See the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints">VDS_HINTS</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryhints
     */
    QueryHints() {
        pHints := VDS_HINTS()
        result := ComCall(6, this, VDS_HINTS.Ptr, pHints, "HRESULT")
        return pHints
    }

    /**
     * The IVdsLunPlex::ApplyHints (vdshwprv.h) method applies a new set of hints to the LUN plex. Hints applied to a plex affect neither the LUN nor its other plexes.
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryhints">IVdsLunPlex::QueryHints</a> method to get the current hints for the LUN plex.
     * @param {Pointer<VDS_HINTS>} pHints Pointer to the hints to be applied to the LUN plex. See the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints">VDS_HINTS</a> structure. Only fields relevant to a LUN plex are expected to be set; irrelevant fields are ignored.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information about the array. Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method followed by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN plex is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN plex is in a failed state, and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunplex-applyhints
     */
    ApplyHints(pHints) {
        result := ComCall(7, this, VDS_HINTS.Ptr, pHints, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsLunPlex.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.GetLun := CallbackCreate(GetMethod(implObj, "GetLun"), flags, 2)
        this.vtbl.QueryExtents := CallbackCreate(GetMethod(implObj, "QueryExtents"), flags, 3)
        this.vtbl.QueryHints := CallbackCreate(GetMethod(implObj, "QueryHints"), flags, 2)
        this.vtbl.ApplyHints := CallbackCreate(GetMethod(implObj, "ApplyHints"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetLun)
        CallbackFree(this.vtbl.QueryExtents)
        CallbackFree(this.vtbl.QueryHints)
        CallbackFree(this.vtbl.ApplyHints)
    }
}
