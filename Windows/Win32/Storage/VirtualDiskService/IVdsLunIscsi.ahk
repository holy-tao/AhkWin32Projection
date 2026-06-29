#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * The IVdsLunIscsi interface (vdshwprv.h) provides methods for performing query and configuration operations on an iSCSI LUN.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsluniscsi
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsLunIscsi extends IUnknown {
    /**
     * The interface identifier for IVdsLunIscsi
     * @type {Guid}
     */
    static IID := Guid("{0d7c1e64-b59b-45ae-b86a-2c2cc6a42067}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsLunIscsi interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AssociateTargets       : IntPtr
        QueryAssociatedTargets : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsLunIscsi.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsLunIscsi::AssociateTargets (vdshwprv.h) method associates LUNs with subsystem iSCSI targets.
     * @remarks
     * Most subsystems implement only one associated target per LUN, but some allow for multiple associated 
     *     targets.
     * 
     * Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsluniscsi-queryassociatedtargets">IVdsLunIscsi::QueryAssociatedTargets</a> 
     *     method to query target associations. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-queryassociatedluns">IVdsIscsiTarget::QueryAssociatedLuns</a> 
     *     method to query the LUNs associated with a target.
     * @param {Pointer<Guid>} pTargetIdArray A pointer to an array of target <b>VDS_OBJECT_ID</b> data types. The provider 
     *       associates these iSCSI targets with the LUN. This array includes targets already associated with the LUN that 
     *       are to remain so.
     * @param {Integer} lNumberOfTargets The number of targets specified in the <i>pTargetArray</i> parameter.
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
     * This return value signals a software or communication problem inside a provider that caches information 
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
     * The LUN is in a failed state, and is unable to perform the requested operation.
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
     * Another operation is in progress; this operation cannot proceed until the previous operation or 
     *         operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042405L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can be returned from any method that takes a <b>VDS_OBJECT_ID</b> constant. This return 
     *         value indicates that the identifier does not refer to an existing object.
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsluniscsi-associatetargets
     */
    AssociateTargets(pTargetIdArray, lNumberOfTargets) {
        result := ComCall(3, this, Guid.Ptr, pTargetIdArray, "int", lNumberOfTargets, "HRESULT")
        return result
    }

    /**
     * The IVdsLunIscsi::QueryAssociatedTargets (vdshwprv.h) method returns an enumeration of currently associated iSCSI targets.
     * @remarks
     * Most subsystems implement only one associated target per LUN, but some allow for multiple associated 
     *     targets.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsluniscsi-associatetargets">IVdsLunIscsi::AssociateTargets</a> 
     *     method to associate the target. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-queryassociatedluns">IVdsIscsiTarget::QueryAssociatedLuns</a> 
     *     method to query the LUNs associated with a target.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the iSCSI targets  as <a href="https://docs.microsoft.com/windows/desktop/VDS/target-object">target objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the target objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsluniscsi-queryassociatedtargets
     */
    QueryAssociatedTargets() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    Query(iid) {
        if (IVdsLunIscsi.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AssociateTargets := CallbackCreate(GetMethod(implObj, "AssociateTargets"), flags, 3)
        this.vtbl.QueryAssociatedTargets := CallbackCreate(GetMethod(implObj, "QueryAssociatedTargets"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AssociateTargets)
        CallbackFree(this.vtbl.QueryAssociatedTargets)
    }
}
