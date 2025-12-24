#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_ISCSI_PORTALGROUP_PROP.ahk
#Include .\IVdsIscsiTarget.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration services on an iSCSI portal group.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsiscsiportalgroup
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsIscsiPortalGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsIscsiPortalGroup
     * @type {Guid}
     */
    static IID => Guid("{fef5f89d-a3dd-4b36-bf28-e7dde045c593}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetTarget", "QueryAssociatedPortals", "AddPortal", "RemovePortal", "Delete"]

    /**
     * Returns the properties of a portal group.
     * @returns {VDS_ISCSI_PORTALGROUP_PROP} The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_portalgroup_prop">VDS_ISCSI_PORTALGROUP_PROP</a> 
     *       structure allocated and passed in by the caller.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiportalgroup-getproperties
     */
    GetProperties() {
        pPortalGroupProp := VDS_ISCSI_PORTALGROUP_PROP()
        result := ComCall(3, this, "ptr", pPortalGroupProp, "HRESULT")
        return pPortalGroupProp
    }

    /**
     * Returns the target to which the portal group belongs.
     * @returns {IVdsIscsiTarget} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsiscsitarget">IVdsIscsiTarget</a>. VDS initializes the 
     *       interface on return. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiportalgroup-gettarget
     */
    GetTarget() {
        result := ComCall(4, this, "ptr*", &ppTarget := 0, "HRESULT")
        return IVdsIscsiTarget(ppTarget)
    }

    /**
     * Returns an enumeration of the portals with which the portal group is associated.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the portals  as <a href="https://docs.microsoft.com/windows/desktop/VDS/portal-object">portal objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the portal  objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiportalgroup-queryassociatedportals
     */
    QueryAssociatedPortals() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Adds a portal to a portal group.
     * @param {Guid} portalId The <b>VDS_OBJECT_ID</b> of the portal to be added to the portal group.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait for, 
     *       or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called and a success HRESULT value is returned, the interfaces returned in 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiportalgroup-addportal
     */
    AddPortal(portalId) {
        result := ComCall(6, this, "ptr", portalId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Removes a portal from a portal group.
     * @param {Guid} portalId The <b>VDS_OBJECT_ID</b> of the portal to be removed from the portal group.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait for, 
     *       or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called and a success HRESULT value is returned, the interfaces returned in 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer.
     *      However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiportalgroup-removeportal
     */
    RemovePortal(portalId) {
        result := ComCall(7, this, "ptr", portalId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Deletes the portal group.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait for, 
     *       or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called and a success HRESULT value is returned, the interfaces returned in 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer.
     *      However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiportalgroup-delete
     */
    Delete() {
        result := ComCall(8, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
