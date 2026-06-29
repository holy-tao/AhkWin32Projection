#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_ISCSI_PORTALGROUP_PROP.ahk" { VDS_ISCSI_PORTALGROUP_PROP }
#Import ".\IVdsAsync.ahk" { IVdsAsync }
#Import ".\IVdsIscsiTarget.ahk" { IVdsIscsiTarget }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * The IVdsIscsiPortalGroup interface (vdshwprv.h) provides methods for performing query and configuration services on an iSCSI portal group.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsiscsiportalgroup
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsIscsiPortalGroup extends IUnknown {
    /**
     * The interface identifier for IVdsIscsiPortalGroup
     * @type {Guid}
     */
    static IID := Guid("{fef5f89d-a3dd-4b36-bf28-e7dde045c593}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsIscsiPortalGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties          : IntPtr
        GetTarget              : IntPtr
        QueryAssociatedPortals : IntPtr
        AddPortal              : IntPtr
        RemovePortal           : IntPtr
        Delete                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsIscsiPortalGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsIscsiPortalGroup::GetProperties (vdshwprv.h) method returns the properties of a portal group.
     * @returns {VDS_ISCSI_PORTALGROUP_PROP} The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_portalgroup_prop">VDS_ISCSI_PORTALGROUP_PROP</a> 
     *       structure allocated and passed in by the caller.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-getproperties
     */
    GetProperties() {
        pPortalGroupProp := VDS_ISCSI_PORTALGROUP_PROP()
        result := ComCall(3, this, VDS_ISCSI_PORTALGROUP_PROP.Ptr, pPortalGroupProp, "HRESULT")
        return pPortalGroupProp
    }

    /**
     * The IVdsIscsiPortalGroup::GetTarget (vdshwprv.h) method returns the target to which the portal group belongs.
     * @returns {IVdsIscsiTarget} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsiscsitarget">IVdsIscsiTarget</a>. VDS initializes the 
     *       interface on return. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-gettarget
     */
    GetTarget() {
        result := ComCall(4, this, "ptr*", &ppTarget := 0, "HRESULT")
        return IVdsIscsiTarget(ppTarget)
    }

    /**
     * The IVdsIscsiPortalGroup::QueryAssociatedPortals (vdshwprv.h) method returns an enumeration of the portals with which the portal group is associated.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the portals  as <a href="https://docs.microsoft.com/windows/desktop/VDS/portal-object">portal objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the portal  objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-queryassociatedportals
     */
    QueryAssociatedPortals() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * The IVdsIscsiPortalGroup::AddPortal (vdshwprv.h) method adds a portal to a portal group.
     * @param {Guid} portalId The <b>VDS_OBJECT_ID</b> of the portal to be added to the portal group.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait for, 
     *       or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called and a success HRESULT value is returned, the interfaces returned in 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-addportal
     */
    AddPortal(portalId) {
        result := ComCall(6, this, Guid, portalId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsIscsiPortalGroup::RemovePortal (vdshwprv.h) method removes a portal from a portal group.
     * @param {Guid} portalId The <b>VDS_OBJECT_ID</b> of the portal to be removed from the portal group.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait for, 
     *       or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called and a success HRESULT value is returned, the interfaces returned in 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer.
     *      However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-removeportal
     */
    RemovePortal(portalId) {
        result := ComCall(7, this, Guid, portalId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsIscsiPortalGroup::Delete (vdshwprv.h) method deletes the portal group.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait for, 
     *       or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called and a success HRESULT value is returned, the interfaces returned in 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer.
     *      However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-delete
     */
    Delete() {
        result := ComCall(8, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    Query(iid) {
        if (IVdsIscsiPortalGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.GetTarget := CallbackCreate(GetMethod(implObj, "GetTarget"), flags, 2)
        this.vtbl.QueryAssociatedPortals := CallbackCreate(GetMethod(implObj, "QueryAssociatedPortals"), flags, 2)
        this.vtbl.AddPortal := CallbackCreate(GetMethod(implObj, "AddPortal"), flags, 3)
        this.vtbl.RemovePortal := CallbackCreate(GetMethod(implObj, "RemovePortal"), flags, 3)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetTarget)
        CallbackFree(this.vtbl.QueryAssociatedPortals)
        CallbackFree(this.vtbl.AddPortal)
        CallbackFree(this.vtbl.RemovePortal)
        CallbackFree(this.vtbl.Delete)
    }
}
