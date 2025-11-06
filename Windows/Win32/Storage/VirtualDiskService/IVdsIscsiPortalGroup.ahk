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
     * 
     * @returns {VDS_ISCSI_PORTALGROUP_PROP} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-getproperties
     */
    GetProperties() {
        pPortalGroupProp := VDS_ISCSI_PORTALGROUP_PROP()
        result := ComCall(3, this, "ptr", pPortalGroupProp, "HRESULT")
        return pPortalGroupProp
    }

    /**
     * 
     * @returns {IVdsIscsiTarget} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-gettarget
     */
    GetTarget() {
        result := ComCall(4, this, "ptr*", &ppTarget := 0, "HRESULT")
        return IVdsIscsiTarget(ppTarget)
    }

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-queryassociatedportals
     */
    QueryAssociatedPortals() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * 
     * @param {Guid} portalId 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-addportal
     */
    AddPortal(portalId) {
        result := ComCall(6, this, "ptr", portalId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * 
     * @param {Guid} portalId 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-removeportal
     */
    RemovePortal(portalId) {
        result := ComCall(7, this, "ptr", portalId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-delete
     */
    Delete() {
        result := ComCall(8, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
