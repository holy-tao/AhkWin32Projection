#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCEnumBuddies.ahk
#Include .\IRTCCollection.ahk
#Include .\IRTCBuddy.ahk
#Include .\IRTCEnumWatchers.ahk
#Include .\IRTCWatcher.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClientPresence extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCClientPresence
     * @type {Guid}
     */
    static IID => Guid("{11c3cbcc-0744-42d1-968a-51aa1bb274c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnablePresence", "Export", "Import", "EnumerateBuddies", "get_Buddies", "get_Buddy", "AddBuddy", "RemoveBuddy", "EnumerateWatchers", "get_Watchers", "get_Watcher", "AddWatcher", "RemoveWatcher", "SetLocalPresenceInfo", "get_OfferWatcherMode", "put_OfferWatcherMode", "get_PrivacyMode", "put_PrivacyMode"]

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
     * @type {Integer} 
     */
    OfferWatcherMode {
        get => this.get_OfferWatcherMode()
        set => this.put_OfferWatcherMode(value)
    }

    /**
     * @type {Integer} 
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
        result := ComCall(3, this, "short", fUseStorage, "ptr", varStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varStorage 
     * @returns {HRESULT} 
     */
    Export(varStorage) {
        result := ComCall(4, this, "ptr", varStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varStorage 
     * @param {VARIANT_BOOL} fReplaceAll 
     * @returns {HRESULT} 
     */
    Import(varStorage, fReplaceAll) {
        result := ComCall(5, this, "ptr", varStorage, "short", fReplaceAll, "HRESULT")
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

        result := ComCall(8, this, "ptr", bstrPresentityURI, "ptr*", &ppBuddy := 0, "HRESULT")
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

        result := ComCall(9, this, "ptr", bstrPresentityURI, "ptr", bstrUserName, "ptr", bstrData, "short", fPersistent, "ptr", pProfile, "int", lFlags, "ptr*", &ppBuddy := 0, "HRESULT")
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

        result := ComCall(13, this, "ptr", bstrPresentityURI, "ptr*", &ppWatcher := 0, "HRESULT")
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

        result := ComCall(14, this, "ptr", bstrPresentityURI, "ptr", bstrUserName, "ptr", bstrData, "short", fBlocked, "short", fPersistent, "ptr*", &ppWatcher := 0, "HRESULT")
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
     * @param {Integer} enStatus 
     * @param {BSTR} bstrNotes 
     * @returns {HRESULT} 
     */
    SetLocalPresenceInfo(enStatus, bstrNotes) {
        bstrNotes := bstrNotes is String ? BSTR.Alloc(bstrNotes).Value : bstrNotes

        result := ComCall(16, this, "int", enStatus, "ptr", bstrNotes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OfferWatcherMode() {
        result := ComCall(17, this, "int*", &penMode := 0, "HRESULT")
        return penMode
    }

    /**
     * 
     * @param {Integer} enMode 
     * @returns {HRESULT} 
     */
    put_OfferWatcherMode(enMode) {
        result := ComCall(18, this, "int", enMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivacyMode() {
        result := ComCall(19, this, "int*", &penMode := 0, "HRESULT")
        return penMode
    }

    /**
     * 
     * @param {Integer} enMode 
     * @returns {HRESULT} 
     */
    put_PrivacyMode(enMode) {
        result := ComCall(20, this, "int", enMode, "HRESULT")
        return result
    }
}
