#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClientPresence extends IUnknown{
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
     * 
     * @param {VARIANT_BOOL} fUseStorage 
     * @param {VARIANT} varStorage 
     * @returns {HRESULT} 
     */
    EnablePresence(fUseStorage, varStorage) {
        result := ComCall(3, this, "short", fUseStorage, "ptr", varStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varStorage 
     * @returns {HRESULT} 
     */
    Export(varStorage) {
        result := ComCall(4, this, "ptr", varStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varStorage 
     * @param {VARIANT_BOOL} fReplaceAll 
     * @returns {HRESULT} 
     */
    Import(varStorage, fReplaceAll) {
        result := ComCall(5, this, "ptr", varStorage, "short", fReplaceAll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCEnumBuddies>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateBuddies(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    get_Buddies(ppCollection) {
        result := ComCall(7, this, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @param {Pointer<IRTCBuddy>} ppBuddy 
     * @returns {HRESULT} 
     */
    get_Buddy(bstrPresentityURI, ppBuddy) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI

        result := ComCall(8, this, "ptr", bstrPresentityURI, "ptr", ppBuddy, "int")
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
     * @param {Pointer<IRTCProfile>} pProfile 
     * @param {Integer} lFlags 
     * @param {Pointer<IRTCBuddy>} ppBuddy 
     * @returns {HRESULT} 
     */
    AddBuddy(bstrPresentityURI, bstrUserName, bstrData, fPersistent, pProfile, lFlags, ppBuddy) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(9, this, "ptr", bstrPresentityURI, "ptr", bstrUserName, "ptr", bstrData, "short", fPersistent, "ptr", pProfile, "int", lFlags, "ptr", ppBuddy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCBuddy>} pBuddy 
     * @returns {HRESULT} 
     */
    RemoveBuddy(pBuddy) {
        result := ComCall(10, this, "ptr", pBuddy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCEnumWatchers>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateWatchers(ppEnum) {
        result := ComCall(11, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    get_Watchers(ppCollection) {
        result := ComCall(12, this, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @param {Pointer<IRTCWatcher>} ppWatcher 
     * @returns {HRESULT} 
     */
    get_Watcher(bstrPresentityURI, ppWatcher) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI

        result := ComCall(13, this, "ptr", bstrPresentityURI, "ptr", ppWatcher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrData 
     * @param {VARIANT_BOOL} fBlocked 
     * @param {VARIANT_BOOL} fPersistent 
     * @param {Pointer<IRTCWatcher>} ppWatcher 
     * @returns {HRESULT} 
     */
    AddWatcher(bstrPresentityURI, bstrUserName, bstrData, fBlocked, fPersistent, ppWatcher) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(14, this, "ptr", bstrPresentityURI, "ptr", bstrUserName, "ptr", bstrData, "short", fBlocked, "short", fPersistent, "ptr", ppWatcher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCWatcher>} pWatcher 
     * @returns {HRESULT} 
     */
    RemoveWatcher(pWatcher) {
        result := ComCall(15, this, "ptr", pWatcher, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(16, this, "int", enStatus, "ptr", bstrNotes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penMode 
     * @returns {HRESULT} 
     */
    get_OfferWatcherMode(penMode) {
        result := ComCall(17, this, "int*", penMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enMode 
     * @returns {HRESULT} 
     */
    put_OfferWatcherMode(enMode) {
        result := ComCall(18, this, "int", enMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penMode 
     * @returns {HRESULT} 
     */
    get_PrivacyMode(penMode) {
        result := ComCall(19, this, "int*", penMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enMode 
     * @returns {HRESULT} 
     */
    put_PrivacyMode(enMode) {
        result := ComCall(20, this, "int", enMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
