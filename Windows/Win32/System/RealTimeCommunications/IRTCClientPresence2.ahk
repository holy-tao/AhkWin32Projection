#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_BUDDY_SUBSCRIPTION_TYPE.ahk" { RTC_BUDDY_SUBSCRIPTION_TYPE }
#Import ".\IRTCBuddyGroup.ahk" { IRTCBuddyGroup }
#Import ".\RTC_ACE_SCOPE.ahk" { RTC_ACE_SCOPE }
#Import ".\IRTCClientPresence.ahk" { IRTCClientPresence }
#Import ".\IRTCWatcher2.ahk" { IRTCWatcher2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\RTC_WATCHER_STATE.ahk" { RTC_WATCHER_STATE }
#Import ".\RTC_PRESENCE_STATUS.ahk" { RTC_PRESENCE_STATUS }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\RTC_WATCHER_MATCH_MODE.ahk" { RTC_WATCHER_MATCH_MODE }
#Import ".\IRTCCollection.ahk" { IRTCCollection }
#Import ".\RTC_PRESENCE_PROPERTY.ahk" { RTC_PRESENCE_PROPERTY }
#Import ".\IRTCBuddy2.ahk" { IRTCBuddy2 }
#Import ".\IRTCEnumGroups.ahk" { IRTCEnumGroups }
#Import ".\IRTCProfile.ahk" { IRTCProfile }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCClientPresence2 extends IRTCClientPresence {
    /**
     * The interface identifier for IRTCClientPresence2
     * @type {Guid}
     */
    static IID := Guid("{ad1809e8-62f7-4783-909a-29c9d2cb1d34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCClientPresence2 interfaces
    */
    struct Vtbl extends IRTCClientPresence.Vtbl {
        EnablePresenceEx     : IntPtr
        DisablePresence      : IntPtr
        AddGroup             : IntPtr
        RemoveGroup          : IntPtr
        EnumerateGroups      : IntPtr
        get_Groups           : IntPtr
        get_Group            : IntPtr
        AddWatcherEx         : IntPtr
        get_WatcherEx        : IntPtr
        put_PresenceProperty : IntPtr
        get_PresenceProperty : IntPtr
        SetPresenceData      : IntPtr
        GetPresenceData      : IntPtr
        GetLocalPresenceInfo : IntPtr
        AddBuddyEx           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCClientPresence2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCCollection} 
     */
    Groups {
        get => this.get_Groups()
    }

    /**
     * 
     * @param {IRTCProfile} pProfile 
     * @param {VARIANT} varStorage 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    EnablePresenceEx(pProfile, varStorage, lFlags) {
        result := ComCall(21, this, "ptr", pProfile, VARIANT, varStorage, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisablePresence() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {BSTR} bstrData 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lFlags 
     * @returns {IRTCBuddyGroup} 
     */
    AddGroup(bstrGroupName, bstrData, pProfile, lFlags) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(23, this, BSTR, bstrGroupName, BSTR, bstrData, "ptr", pProfile, "int", lFlags, "ptr*", &ppGroup := 0, "HRESULT")
        return IRTCBuddyGroup(ppGroup)
    }

    /**
     * 
     * @param {IRTCBuddyGroup} pGroup 
     * @returns {HRESULT} 
     */
    RemoveGroup(pGroup) {
        result := ComCall(24, this, "ptr", pGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRTCEnumGroups} 
     */
    EnumerateGroups() {
        result := ComCall(25, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumGroups(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Groups() {
        result := ComCall(26, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @returns {IRTCBuddyGroup} 
     */
    get_Group(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(27, this, BSTR, bstrGroupName, "ptr*", &ppGroup := 0, "HRESULT")
        return IRTCBuddyGroup(ppGroup)
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrData 
     * @param {RTC_WATCHER_STATE} enState 
     * @param {VARIANT_BOOL} fPersistent 
     * @param {RTC_ACE_SCOPE} enScope 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lFlags 
     * @returns {IRTCWatcher2} 
     */
    AddWatcherEx(bstrPresentityURI, bstrUserName, bstrData, enState, fPersistent, enScope, pProfile, lFlags) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(28, this, BSTR, bstrPresentityURI, BSTR, bstrUserName, BSTR, bstrData, RTC_WATCHER_STATE, enState, VARIANT_BOOL, fPersistent, RTC_ACE_SCOPE, enScope, "ptr", pProfile, "int", lFlags, "ptr*", &ppWatcher := 0, "HRESULT")
        return IRTCWatcher2(ppWatcher)
    }

    /**
     * 
     * @param {RTC_WATCHER_MATCH_MODE} enMode 
     * @param {BSTR} bstrPresentityURI 
     * @returns {IRTCWatcher2} 
     */
    get_WatcherEx(enMode, bstrPresentityURI) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI

        result := ComCall(29, this, RTC_WATCHER_MATCH_MODE, enMode, BSTR, bstrPresentityURI, "ptr*", &ppWatcher := 0, "HRESULT")
        return IRTCWatcher2(ppWatcher)
    }

    /**
     * 
     * @param {RTC_PRESENCE_PROPERTY} enProperty 
     * @param {BSTR} bstrProperty 
     * @returns {HRESULT} 
     */
    put_PresenceProperty(enProperty, bstrProperty) {
        bstrProperty := bstrProperty is String ? BSTR.Alloc(bstrProperty).Value : bstrProperty

        result := ComCall(30, this, RTC_PRESENCE_PROPERTY, enProperty, BSTR, bstrProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_PRESENCE_PROPERTY} enProperty 
     * @returns {BSTR} 
     */
    get_PresenceProperty(enProperty) {
        pbstrProperty := BSTR.Owned()
        result := ComCall(31, this, RTC_PRESENCE_PROPERTY, enProperty, BSTR.Ptr, pbstrProperty, "HRESULT")
        return pbstrProperty
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

        result := ComCall(32, this, BSTR, bstrNamespace, BSTR, bstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNamespace 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    GetPresenceData(pbstrNamespace, pbstrData) {
        result := ComCall(33, this, BSTR.Ptr, pbstrNamespace, BSTR.Ptr, pbstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RTC_PRESENCE_STATUS>} penStatus 
     * @param {Pointer<BSTR>} pbstrNotes 
     * @returns {HRESULT} 
     */
    GetLocalPresenceInfo(penStatus, pbstrNotes) {
        penStatusMarshal := penStatus is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, penStatusMarshal, penStatus, BSTR.Ptr, pbstrNotes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrData 
     * @param {VARIANT_BOOL} fPersistent 
     * @param {RTC_BUDDY_SUBSCRIPTION_TYPE} enSubscriptionType 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lFlags 
     * @returns {IRTCBuddy2} 
     */
    AddBuddyEx(bstrPresentityURI, bstrUserName, bstrData, fPersistent, enSubscriptionType, pProfile, lFlags) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(35, this, BSTR, bstrPresentityURI, BSTR, bstrUserName, BSTR, bstrData, VARIANT_BOOL, fPersistent, RTC_BUDDY_SUBSCRIPTION_TYPE, enSubscriptionType, "ptr", pProfile, "int", lFlags, "ptr*", &ppBuddy := 0, "HRESULT")
        return IRTCBuddy2(ppBuddy)
    }

    Query(iid) {
        if (IRTCClientPresence2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnablePresenceEx := CallbackCreate(GetMethod(implObj, "EnablePresenceEx"), flags, 4)
        this.vtbl.DisablePresence := CallbackCreate(GetMethod(implObj, "DisablePresence"), flags, 1)
        this.vtbl.AddGroup := CallbackCreate(GetMethod(implObj, "AddGroup"), flags, 6)
        this.vtbl.RemoveGroup := CallbackCreate(GetMethod(implObj, "RemoveGroup"), flags, 2)
        this.vtbl.EnumerateGroups := CallbackCreate(GetMethod(implObj, "EnumerateGroups"), flags, 2)
        this.vtbl.get_Groups := CallbackCreate(GetMethod(implObj, "get_Groups"), flags, 2)
        this.vtbl.get_Group := CallbackCreate(GetMethod(implObj, "get_Group"), flags, 3)
        this.vtbl.AddWatcherEx := CallbackCreate(GetMethod(implObj, "AddWatcherEx"), flags, 10)
        this.vtbl.get_WatcherEx := CallbackCreate(GetMethod(implObj, "get_WatcherEx"), flags, 4)
        this.vtbl.put_PresenceProperty := CallbackCreate(GetMethod(implObj, "put_PresenceProperty"), flags, 3)
        this.vtbl.get_PresenceProperty := CallbackCreate(GetMethod(implObj, "get_PresenceProperty"), flags, 3)
        this.vtbl.SetPresenceData := CallbackCreate(GetMethod(implObj, "SetPresenceData"), flags, 3)
        this.vtbl.GetPresenceData := CallbackCreate(GetMethod(implObj, "GetPresenceData"), flags, 3)
        this.vtbl.GetLocalPresenceInfo := CallbackCreate(GetMethod(implObj, "GetLocalPresenceInfo"), flags, 3)
        this.vtbl.AddBuddyEx := CallbackCreate(GetMethod(implObj, "AddBuddyEx"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnablePresenceEx)
        CallbackFree(this.vtbl.DisablePresence)
        CallbackFree(this.vtbl.AddGroup)
        CallbackFree(this.vtbl.RemoveGroup)
        CallbackFree(this.vtbl.EnumerateGroups)
        CallbackFree(this.vtbl.get_Groups)
        CallbackFree(this.vtbl.get_Group)
        CallbackFree(this.vtbl.AddWatcherEx)
        CallbackFree(this.vtbl.get_WatcherEx)
        CallbackFree(this.vtbl.put_PresenceProperty)
        CallbackFree(this.vtbl.get_PresenceProperty)
        CallbackFree(this.vtbl.SetPresenceData)
        CallbackFree(this.vtbl.GetPresenceData)
        CallbackFree(this.vtbl.GetLocalPresenceInfo)
        CallbackFree(this.vtbl.AddBuddyEx)
    }
}
