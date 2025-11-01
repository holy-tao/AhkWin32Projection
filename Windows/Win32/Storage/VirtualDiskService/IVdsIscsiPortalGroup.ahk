#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<VDS_ISCSI_PORTALGROUP_PROP>} pPortalGroupProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-getproperties
     */
    GetProperties(pPortalGroupProp) {
        result := ComCall(3, this, "ptr", pPortalGroupProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsIscsiTarget>} ppTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-gettarget
     */
    GetTarget(ppTarget) {
        result := ComCall(4, this, "ptr*", ppTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-queryassociatedportals
     */
    QueryAssociatedPortals(ppEnum) {
        result := ComCall(5, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} portalId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-addportal
     */
    AddPortal(portalId, ppAsync) {
        result := ComCall(6, this, "ptr", portalId, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} portalId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-removeportal
     */
    RemovePortal(portalId, ppAsync) {
        result := ComCall(7, this, "ptr", portalId, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-delete
     */
    Delete(ppAsync) {
        result := ComCall(8, this, "ptr*", ppAsync, "HRESULT")
        return result
    }
}
