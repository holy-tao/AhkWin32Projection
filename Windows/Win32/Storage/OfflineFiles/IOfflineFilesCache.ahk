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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Synchronize", "DeleteItems", "DeleteItemsForUser", "Pin", "Unpin", "GetEncryptionStatus", "Encrypt", "FindItem", "FindItemEx", "RenameItem", "GetLocation", "GetDiskSpaceInformation", "SetDiskSpaceLimits", "ProcessAdminPinPolicy", "GetSettingObject", "EnumSettingObjects", "IsPathCacheable"]

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<PWSTR>} rgpszPaths 
     * @param {Integer} cPaths 
     * @param {BOOL} bAsync 
     * @param {Integer} dwSyncControl 
     * @param {IOfflineFilesSyncConflictHandler} pISyncConflictHandler 
     * @param {IOfflineFilesSyncProgress} pIProgress 
     * @param {Pointer<Guid>} pSyncId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-synchronize
     */
    Synchronize(hwndParent, rgpszPaths, cPaths, bAsync, dwSyncControl, pISyncConflictHandler, pIProgress, pSyncId) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", rgpszPaths, "uint", cPaths, "int", bAsync, "uint", dwSyncControl, "ptr", pISyncConflictHandler, "ptr", pIProgress, "ptr", pSyncId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} rgpszPaths 
     * @param {Integer} cPaths 
     * @param {Integer} dwFlags 
     * @param {BOOL} bAsync 
     * @param {IOfflineFilesSimpleProgress} pIProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-deleteitems
     */
    DeleteItems(rgpszPaths, cPaths, dwFlags, bAsync, pIProgress) {
        result := ComCall(4, this, "ptr", rgpszPaths, "uint", cPaths, "uint", dwFlags, "int", bAsync, "ptr", pIProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszUser 
     * @param {Pointer<PWSTR>} rgpszPaths 
     * @param {Integer} cPaths 
     * @param {Integer} dwFlags 
     * @param {BOOL} bAsync 
     * @param {IOfflineFilesSimpleProgress} pIProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-deleteitemsforuser
     */
    DeleteItemsForUser(pszUser, rgpszPaths, cPaths, dwFlags, bAsync, pIProgress) {
        pszUser := pszUser is String ? StrPtr(pszUser) : pszUser

        result := ComCall(5, this, "ptr", pszUser, "ptr", rgpszPaths, "uint", cPaths, "uint", dwFlags, "int", bAsync, "ptr", pIProgress, "HRESULT")
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
     * @param {IOfflineFilesSyncProgress} pIProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-pin
     */
    Pin(hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "ptr", rgpszPaths, "uint", cPaths, "int", bDeep, "int", bAsync, "uint", dwPinControlFlags, "ptr", pIProgress, "HRESULT")
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
     * @param {IOfflineFilesSyncProgress} pIProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-unpin
     */
    Unpin(hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(7, this, "ptr", hwndParent, "ptr", rgpszPaths, "uint", cPaths, "int", bDeep, "int", bAsync, "uint", dwPinControlFlags, "ptr", pIProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbEncrypted 
     * @param {Pointer<BOOL>} pbPartial 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-getencryptionstatus
     */
    GetEncryptionStatus(pbEncrypted, pbPartial) {
        result := ComCall(8, this, "ptr", pbEncrypted, "ptr", pbPartial, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {BOOL} bEncrypt 
     * @param {Integer} dwEncryptionControlFlags 
     * @param {BOOL} bAsync 
     * @param {IOfflineFilesSyncProgress} pIProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-encrypt
     */
    Encrypt(hwndParent, bEncrypt, dwEncryptionControlFlags, bAsync, pIProgress) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(9, this, "ptr", hwndParent, "int", bEncrypt, "uint", dwEncryptionControlFlags, "int", bAsync, "ptr", pIProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<IOfflineFilesItem>} ppItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-finditem
     */
    FindItem(pszPath, dwQueryFlags, ppItem) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "uint", dwQueryFlags, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {IOfflineFilesItemFilter} pIncludeFileFilter 
     * @param {IOfflineFilesItemFilter} pIncludeDirFilter 
     * @param {IOfflineFilesItemFilter} pExcludeFileFilter 
     * @param {IOfflineFilesItemFilter} pExcludeDirFilter 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<IOfflineFilesItem>} ppItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-finditemex
     */
    FindItemEx(pszPath, pIncludeFileFilter, pIncludeDirFilter, pExcludeFileFilter, pExcludeDirFilter, dwQueryFlags, ppItem) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(11, this, "ptr", pszPath, "ptr", pIncludeFileFilter, "ptr", pIncludeDirFilter, "ptr", pExcludeFileFilter, "ptr", pExcludeDirFilter, "uint", dwQueryFlags, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPathOriginal 
     * @param {PWSTR} pszPathNew 
     * @param {BOOL} bReplaceIfExists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-renameitem
     */
    RenameItem(pszPathOriginal, pszPathNew, bReplaceIfExists) {
        pszPathOriginal := pszPathOriginal is String ? StrPtr(pszPathOriginal) : pszPathOriginal
        pszPathNew := pszPathNew is String ? StrPtr(pszPathNew) : pszPathNew

        result := ComCall(12, this, "ptr", pszPathOriginal, "ptr", pszPathNew, "int", bReplaceIfExists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-getlocation
     */
    GetLocation(ppszPath) {
        result := ComCall(13, this, "ptr", ppszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbVolumeTotal 
     * @param {Pointer<Integer>} pcbLimit 
     * @param {Pointer<Integer>} pcbUsed 
     * @param {Pointer<Integer>} pcbUnpinnedLimit 
     * @param {Pointer<Integer>} pcbUnpinnedUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-getdiskspaceinformation
     */
    GetDiskSpaceInformation(pcbVolumeTotal, pcbLimit, pcbUsed, pcbUnpinnedLimit, pcbUnpinnedUsed) {
        result := ComCall(14, this, "uint*", pcbVolumeTotal, "uint*", pcbLimit, "uint*", pcbUsed, "uint*", pcbUnpinnedLimit, "uint*", pcbUnpinnedUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbLimit 
     * @param {Integer} cbUnpinnedLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-setdiskspacelimits
     */
    SetDiskSpaceLimits(cbLimit, cbUnpinnedLimit) {
        result := ComCall(15, this, "uint", cbLimit, "uint", cbUnpinnedLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOfflineFilesSyncProgress} pPinProgress 
     * @param {IOfflineFilesSyncProgress} pUnpinProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-processadminpinpolicy
     */
    ProcessAdminPinPolicy(pPinProgress, pUnpinProgress) {
        result := ComCall(16, this, "ptr", pPinProgress, "ptr", pUnpinProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSettingName 
     * @param {Pointer<IOfflineFilesSetting>} ppSetting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-getsettingobject
     */
    GetSettingObject(pszSettingName, ppSetting) {
        pszSettingName := pszSettingName is String ? StrPtr(pszSettingName) : pszSettingName

        result := ComCall(17, this, "ptr", pszSettingName, "ptr*", ppSetting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumOfflineFilesSettings>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-enumsettingobjects
     */
    EnumSettingObjects(ppEnum) {
        result := ComCall(18, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<BOOL>} pbCacheable 
     * @param {Pointer<Integer>} pShareCachingMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache-ispathcacheable
     */
    IsPathCacheable(pszPath, pbCacheable, pShareCachingMode) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(19, this, "ptr", pszPath, "ptr", pbCacheable, "int*", pShareCachingMode, "HRESULT")
        return result
    }
}
