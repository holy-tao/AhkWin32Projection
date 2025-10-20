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
     * 
     * @param {Pointer<VDS_ISCSI_PORTALGROUP_PROP>} pPortalGroupProp 
     * @returns {HRESULT} 
     */
    GetProperties(pPortalGroupProp) {
        result := ComCall(3, this, "ptr", pPortalGroupProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsIscsiTarget>} ppTarget 
     * @returns {HRESULT} 
     */
    GetTarget(ppTarget) {
        result := ComCall(4, this, "ptr", ppTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryAssociatedPortals(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} portalId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    AddPortal(portalId, ppAsync) {
        result := ComCall(6, this, "ptr", portalId, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} portalId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    RemovePortal(portalId, ppAsync) {
        result := ComCall(7, this, "ptr", portalId, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    Delete(ppAsync) {
        result := ComCall(8, this, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
