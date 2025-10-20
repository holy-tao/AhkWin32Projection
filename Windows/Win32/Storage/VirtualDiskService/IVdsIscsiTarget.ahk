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
     * 
     * @param {Pointer<VDS_ISCSI_TARGET_PROP>} pTargetProp 
     * @returns {HRESULT} 
     */
    GetProperties(pTargetProp) {
        result := ComCall(3, this, "ptr", pTargetProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsSubSystem>} ppSubSystem 
     * @returns {HRESULT} 
     */
    GetSubSystem(ppSubSystem) {
        result := ComCall(4, this, "ptr", ppSubSystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryPortalGroups(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryAssociatedLuns(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    CreatePortalGroup(ppAsync) {
        result := ComCall(7, this, "ptr", ppAsync, "int")
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

    /**
     * 
     * @param {PWSTR} pwszFriendlyName 
     * @returns {HRESULT} 
     */
    SetFriendlyName(pwszFriendlyName) {
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(9, this, "ptr", pwszFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pTargetSharedSecret 
     * @param {PWSTR} pwszInitiatorName 
     * @returns {HRESULT} 
     */
    SetSharedSecret(pTargetSharedSecret, pwszInitiatorName) {
        pwszInitiatorName := pwszInitiatorName is String ? StrPtr(pwszInitiatorName) : pwszInitiatorName

        result := ComCall(10, this, "ptr", pTargetSharedSecret, "ptr", pwszInitiatorName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInitiatorName 
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pInitiatorSharedSecret 
     * @returns {HRESULT} 
     */
    RememberInitiatorSharedSecret(pwszInitiatorName, pInitiatorSharedSecret) {
        pwszInitiatorName := pwszInitiatorName is String ? StrPtr(pwszInitiatorName) : pwszInitiatorName

        result := ComCall(11, this, "ptr", pwszInitiatorName, "ptr", pInitiatorSharedSecret, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pppwszInitiatorList 
     * @param {Pointer<Int32>} plNumberOfInitiators 
     * @returns {HRESULT} 
     */
    GetConnectedInitiators(pppwszInitiatorList, plNumberOfInitiators) {
        result := ComCall(12, this, "ptr", pppwszInitiatorList, "int*", plNumberOfInitiators, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
