#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCClientPresence.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClientPresence2 extends IRTCClientPresence{
    /**
     * The interface identifier for IRTCClientPresence2
     * @type {Guid}
     */
    static IID => Guid("{ad1809e8-62f7-4783-909a-29c9d2cb1d34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * 
     * @param {Pointer<IRTCProfile>} pProfile 
     * @param {VARIANT} varStorage 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    EnablePresenceEx(pProfile, varStorage, lFlags) {
        result := ComCall(21, this, "ptr", pProfile, "ptr", varStorage, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisablePresence() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {BSTR} bstrData 
     * @param {Pointer<IRTCProfile>} pProfile 
     * @param {Integer} lFlags 
     * @param {Pointer<IRTCBuddyGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    AddGroup(bstrGroupName, bstrData, pProfile, lFlags, ppGroup) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(23, this, "ptr", bstrGroupName, "ptr", bstrData, "ptr", pProfile, "int", lFlags, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCBuddyGroup>} pGroup 
     * @returns {HRESULT} 
     */
    RemoveGroup(pGroup) {
        result := ComCall(24, this, "ptr", pGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCEnumGroups>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateGroups(ppEnum) {
        result := ComCall(25, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    get_Groups(ppCollection) {
        result := ComCall(26, this, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {Pointer<IRTCBuddyGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    get_Group(bstrGroupName, ppGroup) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(27, this, "ptr", bstrGroupName, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrData 
     * @param {Integer} enState 
     * @param {VARIANT_BOOL} fPersistent 
     * @param {Integer} enScope 
     * @param {Pointer<IRTCProfile>} pProfile 
     * @param {Integer} lFlags 
     * @param {Pointer<IRTCWatcher2>} ppWatcher 
     * @returns {HRESULT} 
     */
    AddWatcherEx(bstrPresentityURI, bstrUserName, bstrData, enState, fPersistent, enScope, pProfile, lFlags, ppWatcher) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(28, this, "ptr", bstrPresentityURI, "ptr", bstrUserName, "ptr", bstrData, "int", enState, "short", fPersistent, "int", enScope, "ptr", pProfile, "int", lFlags, "ptr", ppWatcher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enMode 
     * @param {BSTR} bstrPresentityURI 
     * @param {Pointer<IRTCWatcher2>} ppWatcher 
     * @returns {HRESULT} 
     */
    get_WatcherEx(enMode, bstrPresentityURI, ppWatcher) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI

        result := ComCall(29, this, "int", enMode, "ptr", bstrPresentityURI, "ptr", ppWatcher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enProperty 
     * @param {BSTR} bstrProperty 
     * @returns {HRESULT} 
     */
    put_PresenceProperty(enProperty, bstrProperty) {
        bstrProperty := bstrProperty is String ? BSTR.Alloc(bstrProperty).Value : bstrProperty

        result := ComCall(30, this, "int", enProperty, "ptr", bstrProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enProperty 
     * @param {Pointer<BSTR>} pbstrProperty 
     * @returns {HRESULT} 
     */
    get_PresenceProperty(enProperty, pbstrProperty) {
        result := ComCall(31, this, "int", enProperty, "ptr", pbstrProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrNamespace 
     * @param {BSTR} bstrData 
     * @returns {HRESULT} 
     */
    SetPresenceData(bstrNamespace, bstrData) {
        bstrNamespace := bstrNamespace is String ? BSTR.Alloc(bstrNamespace).Value : bstrNamespace
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(32, this, "ptr", bstrNamespace, "ptr", bstrData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNamespace 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    GetPresenceData(pbstrNamespace, pbstrData) {
        result := ComCall(33, this, "ptr", pbstrNamespace, "ptr", pbstrData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penStatus 
     * @param {Pointer<BSTR>} pbstrNotes 
     * @returns {HRESULT} 
     */
    GetLocalPresenceInfo(penStatus, pbstrNotes) {
        result := ComCall(34, this, "int*", penStatus, "ptr", pbstrNotes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrData 
     * @param {VARIANT_BOOL} fPersistent 
     * @param {Integer} enSubscriptionType 
     * @param {Pointer<IRTCProfile>} pProfile 
     * @param {Integer} lFlags 
     * @param {Pointer<IRTCBuddy2>} ppBuddy 
     * @returns {HRESULT} 
     */
    AddBuddyEx(bstrPresentityURI, bstrUserName, bstrData, fPersistent, enSubscriptionType, pProfile, lFlags, ppBuddy) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(35, this, "ptr", bstrPresentityURI, "ptr", bstrUserName, "ptr", bstrData, "short", fPersistent, "int", enSubscriptionType, "ptr", pProfile, "int", lFlags, "ptr", ppBuddy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
