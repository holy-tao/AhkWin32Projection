#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RTC_OFFER_WATCHER_MODE.ahk" { RTC_OFFER_WATCHER_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCEnumWatchers.ahk" { IRTCEnumWatchers }
#Import ".\IRTCEnumBuddies.ahk" { IRTCEnumBuddies }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\RTC_PRESENCE_STATUS.ahk" { RTC_PRESENCE_STATUS }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IRTCCollection.ahk" { IRTCCollection }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\RTC_PRIVACY_MODE.ahk" { RTC_PRIVACY_MODE }
#Import ".\IRTCBuddy.ahk" { IRTCBuddy }
#Import ".\IRTCWatcher.ahk" { IRTCWatcher }
#Import ".\IRTCProfile.ahk" { IRTCProfile }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCClientPresence extends IUnknown {
    /**
     * The interface identifier for IRTCClientPresence
     * @type {Guid}
     */
    static IID := Guid("{11c3cbcc-0744-42d1-968a-51aa1bb274c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCClientPresence interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnablePresence       : IntPtr
        Export               : IntPtr
        Import               : IntPtr
        EnumerateBuddies     : IntPtr
        get_Buddies          : IntPtr
        get_Buddy            : IntPtr
        AddBuddy             : IntPtr
        RemoveBuddy          : IntPtr
        EnumerateWatchers    : IntPtr
        get_Watchers         : IntPtr
        get_Watcher          : IntPtr
        AddWatcher           : IntPtr
        RemoveWatcher        : IntPtr
        SetLocalPresenceInfo : IntPtr
        get_OfferWatcherMode : IntPtr
        put_OfferWatcherMode : IntPtr
        get_PrivacyMode      : IntPtr
        put_PrivacyMode      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCClientPresence.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCCollection} 
     */
    Buddies {
        get => this.get_Buddies()
    }

    /**
     * @type {IRTCCollection} 
     */
    Watchers {
        get => this.get_Watchers()
    }

    /**
     * @type {RTC_OFFER_WATCHER_MODE} 
     */
    OfferWatcherMode {
        get => this.get_OfferWatcherMode()
        set => this.put_OfferWatcherMode(value)
    }

    /**
     * @type {RTC_PRIVACY_MODE} 
     */
    PrivacyMode {
        get => this.get_PrivacyMode()
        set => this.put_PrivacyMode(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} fUseStorage 
     * @param {VARIANT} varStorage 
     * @returns {HRESULT} 
     */
    EnablePresence(fUseStorage, varStorage) {
        result := ComCall(3, this, VARIANT_BOOL, fUseStorage, VARIANT, varStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varStorage 
     * @returns {HRESULT} 
     */
    Export(varStorage) {
        result := ComCall(4, this, VARIANT, varStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varStorage 
     * @param {VARIANT_BOOL} fReplaceAll 
     * @returns {HRESULT} 
     */
    Import(varStorage, fReplaceAll) {
        result := ComCall(5, this, VARIANT, varStorage, VARIANT_BOOL, fReplaceAll, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRTCEnumBuddies} 
     */
    EnumerateBuddies() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumBuddies(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Buddies() {
        result := ComCall(7, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @returns {IRTCBuddy} 
     */
    get_Buddy(bstrPresentityURI) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI

        result := ComCall(8, this, BSTR, bstrPresentityURI, "ptr*", &ppBuddy := 0, "HRESULT")
        return IRTCBuddy(ppBuddy)
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrData 
     * @param {VARIANT_BOOL} fPersistent 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lFlags 
     * @returns {IRTCBuddy} 
     */
    AddBuddy(bstrPresentityURI, bstrUserName, bstrData, fPersistent, pProfile, lFlags) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(9, this, BSTR, bstrPresentityURI, BSTR, bstrUserName, BSTR, bstrData, VARIANT_BOOL, fPersistent, "ptr", pProfile, "int", lFlags, "ptr*", &ppBuddy := 0, "HRESULT")
        return IRTCBuddy(ppBuddy)
    }

    /**
     * 
     * @param {IRTCBuddy} pBuddy 
     * @returns {HRESULT} 
     */
    RemoveBuddy(pBuddy) {
        result := ComCall(10, this, "ptr", pBuddy, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRTCEnumWatchers} 
     */
    EnumerateWatchers() {
        result := ComCall(11, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumWatchers(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Watchers() {
        result := ComCall(12, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @returns {IRTCWatcher} 
     */
    get_Watcher(bstrPresentityURI) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI

        result := ComCall(13, this, BSTR, bstrPresentityURI, "ptr*", &ppWatcher := 0, "HRESULT")
        return IRTCWatcher(ppWatcher)
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrData 
     * @param {VARIANT_BOOL} fBlocked 
     * @param {VARIANT_BOOL} fPersistent 
     * @returns {IRTCWatcher} 
     */
    AddWatcher(bstrPresentityURI, bstrUserName, bstrData, fBlocked, fPersistent) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(14, this, BSTR, bstrPresentityURI, BSTR, bstrUserName, BSTR, bstrData, VARIANT_BOOL, fBlocked, VARIANT_BOOL, fPersistent, "ptr*", &ppWatcher := 0, "HRESULT")
        return IRTCWatcher(ppWatcher)
    }

    /**
     * 
     * @param {IRTCWatcher} pWatcher 
     * @returns {HRESULT} 
     */
    RemoveWatcher(pWatcher) {
        result := ComCall(15, this, "ptr", pWatcher, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_PRESENCE_STATUS} enStatus 
     * @param {BSTR} bstrNotes 
     * @returns {HRESULT} 
     */
    SetLocalPresenceInfo(enStatus, bstrNotes) {
        bstrNotes := bstrNotes is String ? BSTR.Alloc(bstrNotes).Value : bstrNotes

        result := ComCall(16, this, RTC_PRESENCE_STATUS, enStatus, BSTR, bstrNotes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RTC_OFFER_WATCHER_MODE} 
     */
    get_OfferWatcherMode() {
        result := ComCall(17, this, "int*", &penMode := 0, "HRESULT")
        return penMode
    }

    /**
     * 
     * @param {RTC_OFFER_WATCHER_MODE} enMode 
     * @returns {HRESULT} 
     */
    put_OfferWatcherMode(enMode) {
        result := ComCall(18, this, RTC_OFFER_WATCHER_MODE, enMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RTC_PRIVACY_MODE} 
     */
    get_PrivacyMode() {
        result := ComCall(19, this, "int*", &penMode := 0, "HRESULT")
        return penMode
    }

    /**
     * 
     * @param {RTC_PRIVACY_MODE} enMode 
     * @returns {HRESULT} 
     */
    put_PrivacyMode(enMode) {
        result := ComCall(20, this, RTC_PRIVACY_MODE, enMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCClientPresence.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnablePresence := CallbackCreate(GetMethod(implObj, "EnablePresence"), flags, 3)
        this.vtbl.Export := CallbackCreate(GetMethod(implObj, "Export"), flags, 2)
        this.vtbl.Import := CallbackCreate(GetMethod(implObj, "Import"), flags, 3)
        this.vtbl.EnumerateBuddies := CallbackCreate(GetMethod(implObj, "EnumerateBuddies"), flags, 2)
        this.vtbl.get_Buddies := CallbackCreate(GetMethod(implObj, "get_Buddies"), flags, 2)
        this.vtbl.get_Buddy := CallbackCreate(GetMethod(implObj, "get_Buddy"), flags, 3)
        this.vtbl.AddBuddy := CallbackCreate(GetMethod(implObj, "AddBuddy"), flags, 8)
        this.vtbl.RemoveBuddy := CallbackCreate(GetMethod(implObj, "RemoveBuddy"), flags, 2)
        this.vtbl.EnumerateWatchers := CallbackCreate(GetMethod(implObj, "EnumerateWatchers"), flags, 2)
        this.vtbl.get_Watchers := CallbackCreate(GetMethod(implObj, "get_Watchers"), flags, 2)
        this.vtbl.get_Watcher := CallbackCreate(GetMethod(implObj, "get_Watcher"), flags, 3)
        this.vtbl.AddWatcher := CallbackCreate(GetMethod(implObj, "AddWatcher"), flags, 7)
        this.vtbl.RemoveWatcher := CallbackCreate(GetMethod(implObj, "RemoveWatcher"), flags, 2)
        this.vtbl.SetLocalPresenceInfo := CallbackCreate(GetMethod(implObj, "SetLocalPresenceInfo"), flags, 3)
        this.vtbl.get_OfferWatcherMode := CallbackCreate(GetMethod(implObj, "get_OfferWatcherMode"), flags, 2)
        this.vtbl.put_OfferWatcherMode := CallbackCreate(GetMethod(implObj, "put_OfferWatcherMode"), flags, 2)
        this.vtbl.get_PrivacyMode := CallbackCreate(GetMethod(implObj, "get_PrivacyMode"), flags, 2)
        this.vtbl.put_PrivacyMode := CallbackCreate(GetMethod(implObj, "put_PrivacyMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnablePresence)
        CallbackFree(this.vtbl.Export)
        CallbackFree(this.vtbl.Import)
        CallbackFree(this.vtbl.EnumerateBuddies)
        CallbackFree(this.vtbl.get_Buddies)
        CallbackFree(this.vtbl.get_Buddy)
        CallbackFree(this.vtbl.AddBuddy)
        CallbackFree(this.vtbl.RemoveBuddy)
        CallbackFree(this.vtbl.EnumerateWatchers)
        CallbackFree(this.vtbl.get_Watchers)
        CallbackFree(this.vtbl.get_Watcher)
        CallbackFree(this.vtbl.AddWatcher)
        CallbackFree(this.vtbl.RemoveWatcher)
        CallbackFree(this.vtbl.SetLocalPresenceInfo)
        CallbackFree(this.vtbl.get_OfferWatcherMode)
        CallbackFree(this.vtbl.put_OfferWatcherMode)
        CallbackFree(this.vtbl.get_PrivacyMode)
        CallbackFree(this.vtbl.put_PrivacyMode)
    }
}
