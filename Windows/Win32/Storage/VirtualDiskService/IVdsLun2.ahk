#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_HINTS2.ahk" { VDS_HINTS2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsLun2 interface (vdshwprv.h) provides methods for applying and querying logical unit number (LUN) hints.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdslun2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsLun2 extends IUnknown {
    /**
     * The interface identifier for IVdsLun2
     * @type {Guid}
     */
    static IID := Guid("{e5b3a735-9efb-499a-8071-4394d9ee6fcb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsLun2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryHints2 : IntPtr
        ApplyHints2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsLun2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsLun2::QueryHints2 (vdshwprv.h) method returns the hints currently applied to the LUN. This method is identical to the IVdsLun::QueryHints method.
     * @remarks
     * Callers can specify hints by passing in the <i>pHints2</i> parameter to the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun">IVdsSubSystem2::CreateLun2</a> method when 
     *     creating a LUN or by using the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-applyhints">IVdsLun2::ApplyHints2</a> 
     *     method to apply a set of new hints to an existing LUN.
     * @returns {VDS_HINTS2} A pointer to the returned LUN hints. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun2-queryhints2
     */
    QueryHints2() {
        pHints2 := VDS_HINTS2()
        result := ComCall(3, this, VDS_HINTS2.Ptr, pHints2, "HRESULT")
        return pHints2
    }

    /**
     * The IVdsLun2::ApplyHints2 (vdshwprv.h) method applies a new set of hints to the LUN. Hints that are applied to a LUN are simultaneously applied to all plexes.
     * @remarks
     * Callers can also specify hints by passing in the <i>pHints</i> 
     *     parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun">IVdsSubSystem2::CreateLun2</a> 
     *     method when creating a LUN. To query for existing hints, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun2-queryhints2">IVdsLun2::QueryHints2</a> method.
     * @param {Pointer<VDS_HINTS2>} pHints2 A pointer to the new hints to be applied to the LUN. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure.
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
     * There is a software or communication problem inside a provider that caches information 
     *         about the array. Use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore 
     *         the cache.
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
     * The LUN object is no longer present.
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
     * The LUN is in a failed state and unable to perform the requested operation.
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
     * Another operation is in progress. This operation cannot proceed until the previous operation or 
     *         operations are complete.
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun2-applyhints2
     */
    ApplyHints2(pHints2) {
        result := ComCall(4, this, VDS_HINTS2.Ptr, pHints2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsLun2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryHints2 := CallbackCreate(GetMethod(implObj, "QueryHints2"), flags, 2)
        this.vtbl.ApplyHints2 := CallbackCreate(GetMethod(implObj, "ApplyHints2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryHints2)
        CallbackFree(this.vtbl.ApplyHints2)
    }
}
