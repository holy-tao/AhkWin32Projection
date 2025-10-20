#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to manage the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilescache
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesCache extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesCache
     * @type {Guid}
     */
    static IID => Guid("{855d6203-7914-48b9-8d40-4c56f5acffc5}")

    /**
     * The class identifier for OfflineFilesCache
     * @type {Guid}
     */
    static CLSID => Guid("{48c6be7c-3871-43cc-b46f-1449a1bb2ff3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<PWSTR>} rgpszPaths 
     * @param {Integer} cPaths 
     * @param {BOOL} bAsync 
     * @param {Integer} dwSyncControl 
     * @param {Pointer<IOfflineFilesSyncConflictHandler>} pISyncConflictHandler 
     * @param {Pointer<IOfflineFilesSyncProgress>} pIProgress 
     * @param {Pointer<Guid>} pSyncId 
     * @returns {HRESULT} 
     */
    Synchronize(hwndParent, rgpszPaths, cPaths, bAsync, dwSyncControl, pISyncConflictHandler, pIProgress, pSyncId) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", rgpszPaths, "uint", cPaths, "int", bAsync, "uint", dwSyncControl, "ptr", pISyncConflictHandler, "ptr", pIProgress, "ptr", pSyncId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} rgpszPaths 
     * @param {Integer} cPaths 
     * @param {Integer} dwFlags 
     * @param {BOOL} bAsync 
     * @param {Pointer<IOfflineFilesSimpleProgress>} pIProgress 
     * @returns {HRESULT} 
     */
    DeleteItems(rgpszPaths, cPaths, dwFlags, bAsync, pIProgress) {
        result := ComCall(4, this, "ptr", rgpszPaths, "uint", cPaths, "uint", dwFlags, "int", bAsync, "ptr", pIProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszUser 
     * @param {Pointer<PWSTR>} rgpszPaths 
     * @param {Integer} cPaths 
     * @param {Integer} dwFlags 
     * @param {BOOL} bAsync 
     * @param {Pointer<IOfflineFilesSimpleProgress>} pIProgress 
     * @returns {HRESULT} 
     */
    DeleteItemsForUser(pszUser, rgpszPaths, cPaths, dwFlags, bAsync, pIProgress) {
        pszUser := pszUser is String ? StrPtr(pszUser) : pszUser

        result := ComCall(5, this, "ptr", pszUser, "ptr", rgpszPaths, "uint", cPaths, "uint", dwFlags, "int", bAsync, "ptr", pIProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<PWSTR>} rgpszPaths 
     * @param {Integer} cPaths 
     * @param {BOOL} bDeep 
     * @param {BOOL} bAsync 
     * @param {Integer} dwPinControlFlags 
     * @param {Pointer<IOfflineFilesSyncProgress>} pIProgress 
     * @returns {HRESULT} 
     */
    Pin(hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "ptr", rgpszPaths, "uint", cPaths, "int", bDeep, "int", bAsync, "uint", dwPinControlFlags, "ptr", pIProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<PWSTR>} rgpszPaths 
     * @param {Integer} cPaths 
     * @param {BOOL} bDeep 
     * @param {BOOL} bAsync 
     * @param {Integer} dwPinControlFlags 
     * @param {Pointer<IOfflineFilesSyncProgress>} pIProgress 
     * @returns {HRESULT} 
     */
    Unpin(hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(7, this, "ptr", hwndParent, "ptr", rgpszPaths, "uint", cPaths, "int", bDeep, "int", bAsync, "uint", dwPinControlFlags, "ptr", pIProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbEncrypted 
     * @param {Pointer<BOOL>} pbPartial 
     * @returns {HRESULT} 
     */
    GetEncryptionStatus(pbEncrypted, pbPartial) {
        result := ComCall(8, this, "ptr", pbEncrypted, "ptr", pbPartial, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {BOOL} bEncrypt 
     * @param {Integer} dwEncryptionControlFlags 
     * @param {BOOL} bAsync 
     * @param {Pointer<IOfflineFilesSyncProgress>} pIProgress 
     * @returns {HRESULT} 
     */
    Encrypt(hwndParent, bEncrypt, dwEncryptionControlFlags, bAsync, pIProgress) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(9, this, "ptr", hwndParent, "int", bEncrypt, "uint", dwEncryptionControlFlags, "int", bAsync, "ptr", pIProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<IOfflineFilesItem>} ppItem 
     * @returns {HRESULT} 
     */
    FindItem(pszPath, dwQueryFlags, ppItem) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "uint", dwQueryFlags, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<IOfflineFilesItemFilter>} pIncludeFileFilter 
     * @param {Pointer<IOfflineFilesItemFilter>} pIncludeDirFilter 
     * @param {Pointer<IOfflineFilesItemFilter>} pExcludeFileFilter 
     * @param {Pointer<IOfflineFilesItemFilter>} pExcludeDirFilter 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<IOfflineFilesItem>} ppItem 
     * @returns {HRESULT} 
     */
    FindItemEx(pszPath, pIncludeFileFilter, pIncludeDirFilter, pExcludeFileFilter, pExcludeDirFilter, dwQueryFlags, ppItem) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(11, this, "ptr", pszPath, "ptr", pIncludeFileFilter, "ptr", pIncludeDirFilter, "ptr", pExcludeFileFilter, "ptr", pExcludeDirFilter, "uint", dwQueryFlags, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPathOriginal 
     * @param {PWSTR} pszPathNew 
     * @param {BOOL} bReplaceIfExists 
     * @returns {HRESULT} 
     */
    RenameItem(pszPathOriginal, pszPathNew, bReplaceIfExists) {
        pszPathOriginal := pszPathOriginal is String ? StrPtr(pszPathOriginal) : pszPathOriginal
        pszPathNew := pszPathNew is String ? StrPtr(pszPathNew) : pszPathNew

        result := ComCall(12, this, "ptr", pszPathOriginal, "ptr", pszPathNew, "int", bReplaceIfExists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} 
     */
    GetLocation(ppszPath) {
        result := ComCall(13, this, "ptr", ppszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pcbVolumeTotal 
     * @param {Pointer<UInt64>} pcbLimit 
     * @param {Pointer<UInt64>} pcbUsed 
     * @param {Pointer<UInt64>} pcbUnpinnedLimit 
     * @param {Pointer<UInt64>} pcbUnpinnedUsed 
     * @returns {HRESULT} 
     */
    GetDiskSpaceInformation(pcbVolumeTotal, pcbLimit, pcbUsed, pcbUnpinnedLimit, pcbUnpinnedUsed) {
        result := ComCall(14, this, "uint*", pcbVolumeTotal, "uint*", pcbLimit, "uint*", pcbUsed, "uint*", pcbUnpinnedLimit, "uint*", pcbUnpinnedUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbLimit 
     * @param {Integer} cbUnpinnedLimit 
     * @returns {HRESULT} 
     */
    SetDiskSpaceLimits(cbLimit, cbUnpinnedLimit) {
        result := ComCall(15, this, "uint", cbLimit, "uint", cbUnpinnedLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOfflineFilesSyncProgress>} pPinProgress 
     * @param {Pointer<IOfflineFilesSyncProgress>} pUnpinProgress 
     * @returns {HRESULT} 
     */
    ProcessAdminPinPolicy(pPinProgress, pUnpinProgress) {
        result := ComCall(16, this, "ptr", pPinProgress, "ptr", pUnpinProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSettingName 
     * @param {Pointer<IOfflineFilesSetting>} ppSetting 
     * @returns {HRESULT} 
     */
    GetSettingObject(pszSettingName, ppSetting) {
        pszSettingName := pszSettingName is String ? StrPtr(pszSettingName) : pszSettingName

        result := ComCall(17, this, "ptr", pszSettingName, "ptr", ppSetting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumOfflineFilesSettings>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumSettingObjects(ppEnum) {
        result := ComCall(18, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<BOOL>} pbCacheable 
     * @param {Pointer<Int32>} pShareCachingMode 
     * @returns {HRESULT} 
     */
    IsPathCacheable(pszPath, pbCacheable, pShareCachingMode) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(19, this, "ptr", pszPath, "ptr", pbCacheable, "int*", pShareCachingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
