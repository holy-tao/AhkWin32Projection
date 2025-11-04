#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on an iSCSI target.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsiscsitarget
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsIscsiTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsIscsiTarget
     * @type {Guid}
     */
    static IID => Guid("{aa8f5055-83e5-4bcc-aa73-19851a36a849}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetSubSystem", "QueryPortalGroups", "QueryAssociatedLuns", "CreatePortalGroup", "Delete", "SetFriendlyName", "SetSharedSecret", "RememberInitiatorSharedSecret", "GetConnectedInitiators"]

    /**
     * 
     * @param {Pointer<VDS_ISCSI_TARGET_PROP>} pTargetProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-getproperties
     */
    GetProperties(pTargetProp) {
        result := ComCall(3, this, "ptr", pTargetProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsSubSystem>} ppSubSystem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-getsubsystem
     */
    GetSubSystem(ppSubSystem) {
        result := ComCall(4, this, "ptr*", ppSubSystem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-queryportalgroups
     */
    QueryPortalGroups(ppEnum) {
        result := ComCall(5, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-queryassociatedluns
     */
    QueryAssociatedLuns(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-createportalgroup
     */
    CreatePortalGroup(ppAsync) {
        result := ComCall(7, this, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-delete
     */
    Delete(ppAsync) {
        result := ComCall(8, this, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-setfriendlyname
     */
    SetFriendlyName(pwszFriendlyName) {
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(9, this, "ptr", pwszFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pTargetSharedSecret 
     * @param {PWSTR} pwszInitiatorName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-setsharedsecret
     */
    SetSharedSecret(pTargetSharedSecret, pwszInitiatorName) {
        pwszInitiatorName := pwszInitiatorName is String ? StrPtr(pwszInitiatorName) : pwszInitiatorName

        result := ComCall(10, this, "ptr", pTargetSharedSecret, "ptr", pwszInitiatorName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInitiatorName 
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pInitiatorSharedSecret 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-rememberinitiatorsharedsecret
     */
    RememberInitiatorSharedSecret(pwszInitiatorName, pInitiatorSharedSecret) {
        pwszInitiatorName := pwszInitiatorName is String ? StrPtr(pwszInitiatorName) : pwszInitiatorName

        result := ComCall(11, this, "ptr", pwszInitiatorName, "ptr", pInitiatorSharedSecret, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<PWSTR>>} pppwszInitiatorList 
     * @param {Pointer<Integer>} plNumberOfInitiators 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-getconnectedinitiators
     */
    GetConnectedInitiators(pppwszInitiatorList, plNumberOfInitiators) {
        pppwszInitiatorListMarshal := pppwszInitiatorList is VarRef ? "ptr*" : "ptr"
        plNumberOfInitiatorsMarshal := plNumberOfInitiators is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pppwszInitiatorListMarshal, pppwszInitiatorList, plNumberOfInitiatorsMarshal, plNumberOfInitiators, "HRESULT")
        return result
    }
}
