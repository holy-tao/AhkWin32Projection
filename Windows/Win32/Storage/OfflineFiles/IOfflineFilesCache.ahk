#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesItem.ahk
#Include .\IOfflineFilesSetting.ahk
#Include .\IEnumOfflineFilesSettings.ahk
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
     * Synchronizes files and directories in the Offline Files cache with their corresponding copies in the applicable network shared folders.
     * @param {HWND} hwndParent Identifies the parent window for any user interface elements displayed. This parameter is ignored if the 
     *      <b>OFFLINEFILES_SYNC_CONTROL_FLAG_INTERACTIVE</b> flag is not set in the <i>dwSyncControl</i> 
     *      parameter.
     * @param {Pointer<PWSTR>} rgpszPaths Array of pointers, each to a fully qualified UNC path of a file or directory to be synchronized.
     * @param {Integer} cPaths Number of paths in the <i>rgpszPaths</i> array.
     * @param {BOOL} bAsync Indicates if the operation is to be performed asynchronously. If this parameter is 
     *       <b>TRUE</b>, the operation is placed on a separate thread in the system thread pool and the 
     *       function returns immediately.  If this parameter is <b>FALSE</b>, the function returns when 
     *       the operation is complete.
     * @param {Integer} dwSyncControl Flags to control the behavior of the entire sync operation. Behaviors such as sync direction (in, out), the 
     *       pinning of LNK targets, as well as the pinning of new files are controlled through these flags. The following 
     *       list describes the meaning of each flag.
     * @param {IOfflineFilesSyncConflictHandler} pISyncConflictHandler An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessyncconflicthandler">IOfflineFilesSyncConflictHandler</a> 
     *      interface pointer to a conflict handler implementation. If provided, the sync operation calls the conflict 
     *      handler to resolve sync conflicts as they are encountered during the operation.  The handler receives a code 
     *      describing the type of conflict then returns a code indicating if the conflict has been resolved or some other 
     *      action to be taken by the sync operation.  This parameter is optional and can be <b>NULL</b>. If this parameter is <b>NULL</b>, 
     *      the default action is taken in the Offline Files service. Normally this results in the conflict being recorded in 
     *      the user's sync conflict store for later presentation in Sync Center.
     * @param {IOfflineFilesSyncProgress} pIProgress Interface to an event sink that will receive progress events during the operation.  This parameter is optional and can  be <b>NULL</b>.
     * @param {Pointer<Guid>} pSyncId A unique ID applied to this sync operation.  This ID will be included with all published events 
     *      (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesevents">IOfflineFilesEvents</a>) related to this operation. This 
     *      parameter is optional and can be <b>NULL</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * Returns <code>HRESULT_FROM_WIN32(ERROR_CANCELLED)</code> if the operation is canceled.
     * 
     * Monitor <a href="/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessyncprogress">IOfflineFilesSyncProgress</a> events to 
     *        detect failures associated with individual files.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-synchronize
     */
    Synchronize(hwndParent, rgpszPaths, cPaths, bAsync, dwSyncControl, pISyncConflictHandler, pIProgress, pSyncId) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        rgpszPathsMarshal := rgpszPaths is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hwndParent, rgpszPathsMarshal, rgpszPaths, "uint", cPaths, "int", bAsync, "uint", dwSyncControl, "ptr", pISyncConflictHandler, "ptr", pIProgress, "ptr", pSyncId, "HRESULT")
        return result
    }

    /**
     * Deletes files and directories from the local cache.
     * @param {Pointer<PWSTR>} rgpszPaths Array of pointers, each to a fully qualified UNC path of a file or directory to be deleted.
     * @param {Integer} cPaths Number of paths in the <i>rgpszPaths</i> array.
     * @param {Integer} dwFlags 
     * @param {BOOL} bAsync Indicates if the operation is to be performed asynchronously.  If this parameter is <b>TRUE</b>, the operation is scheduled for asynchronous operation and the function returns immediately.  If this parameter is <b>FALSE</b>, the function returns when the operation is complete.
     * @param {IOfflineFilesSimpleProgress} pIProgress Interface to an event sink that will receive progress events during the operation.  If events are not desired, this parameter may be <b>NULL</b>.  Providing an event sink is highly recommended for asynchronous operation.  A progress implementation is the only way to be notified when the asynchronous operation completes.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * Returns <code>HRESULT_FROM_WIN32(ERROR_CANCELLED)</code>  if the operation is canceled.
     * Returns HRESULT_FROM_WIN32(ERROR_MORE_DATA)  if errors occurred during the operation.  Use the <a href="/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilessimpleprogress-itemresult">IOfflineFilesSimpleProgress::ItemResult</a> callback method to detect errors as they occur.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-deleteitems
     */
    DeleteItems(rgpszPaths, cPaths, dwFlags, bAsync, pIProgress) {
        rgpszPathsMarshal := rgpszPaths is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, rgpszPathsMarshal, rgpszPaths, "uint", cPaths, "uint", dwFlags, "int", bAsync, "ptr", pIProgress, "HRESULT")
        return result
    }

    /**
     * Deletes a user's files and directories from the local cache.
     * @param {PWSTR} pszUser Text string identifying the user for which the files are to be deleted for.  This option is available only to administrators on the local computer.  The text string may be the user's SID in string format or the user's <i>domain\user</i> logon name string.
     * @param {Pointer<PWSTR>} rgpszPaths Array of pointers, each to a fully qualified UNC path of a file or directory to be deleted.
     * @param {Integer} cPaths Number of paths in <i>rgpszPaths</i>.
     * @param {Integer} dwFlags 
     * @param {BOOL} bAsync Indicates whether the operation is to be performed asynchronously.  If this parameter is <b>TRUE</b>, the operation is scheduled for asynchronous operation and the function returns immediately.  If this parameter is <b>FALSE</b>, the function returns when the operation is complete.
     * @param {IOfflineFilesSimpleProgress} pIProgress Interface to an event sink that will receive progress events during the operation.  If events are not desired, this parameter can be <b>NULL</b>.  Providing an event sink is highly recommended for asynchronous operation.  A progress implementation is the only way to be notified when the asynchronous operation completes.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * Returns <code>HRESULT_FROM_WIN32(ERROR_CANCELLED)</code>  if the operation is canceled.
     * Returns <code>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</code>  if errors occurred during the operation.  Use the <a href="/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilessimpleprogress-itemresult">IOfflineFilesSimpleProgress::ItemResult</a> callback method to detect errors as they occur.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-deleteitemsforuser
     */
    DeleteItemsForUser(pszUser, rgpszPaths, cPaths, dwFlags, bAsync, pIProgress) {
        pszUser := pszUser is String ? StrPtr(pszUser) : pszUser

        rgpszPathsMarshal := rgpszPaths is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pszUser, rgpszPathsMarshal, rgpszPaths, "uint", cPaths, "uint", dwFlags, "int", bAsync, "ptr", pIProgress, "HRESULT")
        return result
    }

    /**
     * Pins files, directories, and network shared folders.
     * @param {HWND} hwndParent Identifies the parent window for any user interface elements displayed. This parameter is ignored if the <b>OFFLINEFILES_PIN_CONTROL_FLAG_INTERACTIVE</b> flag is not set in the <i>dwPinControlFlags</i> parameter.
     * @param {Pointer<PWSTR>} rgpszPaths Array of pointers, each to a fully qualified UNC path of a file or directory to be pinned.
     * @param {Integer} cPaths Number of paths in <i>rgpszPaths</i>.
     * @param {BOOL} bDeep If one or more of the paths provided refers to a directory or shared folder, this argument indicates whether all children (files and subdirectories) are to be pinned as well.  If this parameter is <b>TRUE</b>, all children are pinned recursively.  If this parameter is <b>FALSE</b>, only the directory itself is pinned, not its children. When the next synchronization operation occurs, all children are pinned recursively.
     * @param {BOOL} bAsync Indicates if the operation is to be performed asynchronously.  If this parameter is <b>TRUE</b>, the operation is scheduled for asynchronous operation and the function returns immediately.  If this parameter is <b>FALSE</b>, the function returns when the operation is complete.
     * @param {Integer} dwPinControlFlags Controls behavior of the pin operation.  May be one or more of the following flags.
     * @param {IOfflineFilesSyncProgress} pIProgress Interface to an event sink that will receive progress events during the operation.  If events are not desired, this parameter may be <b>NULL</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * Returns <code>HRESULT_FROM_WIN32(ERROR_CANCELLED)</code> if the operation is canceled.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-pin
     */
    Pin(hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        rgpszPathsMarshal := rgpszPaths is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", hwndParent, rgpszPathsMarshal, rgpszPaths, "uint", cPaths, "int", bDeep, "int", bAsync, "uint", dwPinControlFlags, "ptr", pIProgress, "HRESULT")
        return result
    }

    /**
     * Unpins files, directories, and network shared folders from the Offline Files cache.
     * @param {HWND} hwndParent Identifies the parent window for any user interface elements displayed. This parameter is ignored if the <b>OFFLINEFILES_PIN_CONTROL_FLAG_INTERACTIVE</b> flag is not set in the <i>dwPinControlFlags</i> parameter.
     * @param {Pointer<PWSTR>} rgpszPaths Array of pointers, each to a fully qualified UNC path of a file or directory to be unpinned.
     * @param {Integer} cPaths Number of paths in the <i>rgpszPaths</i> array.
     * @param {BOOL} bDeep If one or more of the paths provided refers to a directory or shared folder, this argument indicates whether all subdirectories are to be unpinned as well.  If this parameter is <b>TRUE</b>, all subdirectories are unpinned recursively.  If this parameter is <b>FALSE</b>, only files that are immediate children of the directory are unpinned.
     * @param {BOOL} bAsync Indicates if the operation is to be performed asynchronously.  If this parameter is <b>TRUE</b>, the operation is scheduled for asynchronous operation and the function returns immediately.  If this parameter is <b>FALSE</b>, the function returns when the operation is complete.
     * @param {Integer} dwPinControlFlags Controls the behavior of the unpin operation.  May be one or more of the following flags.
     * @param {IOfflineFilesSyncProgress} pIProgress Interface to an event sink that will receive progress events during the operation.  If events are not desired, this parameter may be <b>NULL</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * Returns <code>HRESULT_FROM_WIN32(ERROR_CANCELLED)</code> if the operation is canceled.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-unpin
     */
    Unpin(hwndParent, rgpszPaths, cPaths, bDeep, bAsync, dwPinControlFlags, pIProgress) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        rgpszPathsMarshal := rgpszPaths is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", hwndParent, rgpszPathsMarshal, rgpszPaths, "uint", cPaths, "int", bDeep, "int", bAsync, "uint", dwPinControlFlags, "ptr", pIProgress, "HRESULT")
        return result
    }

    /**
     * Retrieves the current encryption state (encrypted or unencrypted) of the Offline Files cache.
     * @param {Pointer<BOOL>} pbEncrypted Receives <b>TRUE</b> if the Offline Files cache is configured to be encrypted; <b>FALSE</b> if configured to be unencrypted.
     * @param {Pointer<BOOL>} pbPartial Receives <b>TRUE</b> if the Offline Files cache is partially encrypted or partially unencrypted based on the value returned in <i>pbEncrypted</i>; <b>FALSE</b> if it is fully encrypted or unencrypted.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-getencryptionstatus
     */
    GetEncryptionStatus(pbEncrypted, pbPartial) {
        pbEncryptedMarshal := pbEncrypted is VarRef ? "int*" : "ptr"
        pbPartialMarshal := pbPartial is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pbEncryptedMarshal, pbEncrypted, pbPartialMarshal, pbPartial, "HRESULT")
        return result
    }

    /**
     * Encrypts or unencrypts the contents of the Offline Files cache cached for the calling user.
     * @param {HWND} hwndParent Identifies the parent window for any user interface elements displayed. This parameter is ignored if the <b>OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_INTERACTIVE</b> flag is not set in the <i>dwEncryptionControlFlags</i> parameter.
     * @param {BOOL} bEncrypt <b>TRUE</b> to encrypt, <b>FALSE</b> to unencrypt.
     * @param {Integer} dwEncryptionControlFlags 
     * @param {BOOL} bAsync Indicates whether the operation is to be performed asynchronously.  If this parameter is <b>TRUE</b>, the operation is scheduled for asynchronous operation and the function returns immediately.  If this parameter is <b>FALSE</b>, the function returns when the operation is complete.
     * @param {IOfflineFilesSyncProgress} pIProgress Interface to an event sink that will receive progress events during the operation.  If events are not desired, this parameter may be <b>NULL</b>.  Note that this parameter is highly recommended for asynchronous operation.  A progress implementation is the only way to be notified when the asynchronous operation completes.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * Returns <code>HRESULT_FROM_WIN32(ERROR_CANCELLED)</code> if the operation is canceled.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-encrypt
     */
    Encrypt(hwndParent, bEncrypt, dwEncryptionControlFlags, bAsync, pIProgress) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(9, this, "ptr", hwndParent, "int", bEncrypt, "uint", dwEncryptionControlFlags, "int", bAsync, "ptr", pIProgress, "HRESULT")
        return result
    }

    /**
     * Locates a particular file or directory item in the cache.
     * @param {PWSTR} pszPath UNC path of the file or directory to be located.
     * @param {Integer} dwQueryFlags Flags affecting the amount of query activity at the time the item is located in the cache. The parameter may contain one or more of the following bit flags.
     * @returns {IOfflineFilesItem} Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitem">IOfflineFilesItem</a> interface of the cache item.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-finditem
     */
    FindItem(pszPath, dwQueryFlags) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "uint", dwQueryFlags, "ptr*", &ppItem := 0, "HRESULT")
        return IOfflineFilesItem(ppItem)
    }

    /**
     * Locates a particular file or directory item in the cache.
     * @param {PWSTR} pszPath UNC path of the file or directory to be located.
     * @param {IOfflineFilesItemFilter} pIncludeFileFilter If provided, references the filter applied to the decision to include files.  This parameter is optional and can be <b>NULL</b>.
     * @param {IOfflineFilesItemFilter} pIncludeDirFilter If provided, references the filter applied to the decision to include directories.  This parameter is optional and can be <b>NULL</b>.
     * @param {IOfflineFilesItemFilter} pExcludeFileFilter If provided, references the filter applied to the decision to exclude files.  This parameter is optional and can be <b>NULL</b>.
     * @param {IOfflineFilesItemFilter} pExcludeDirFilter If provided, references the "filter" applied to the decision to exclude directories.  This parameter is optional and may be <b>NULL</b>.
     * @param {Integer} dwQueryFlags Flags affecting the amount of query activity at the time the item is located in the cache. The parameter can contain one or more of the following bit flags.
     * @returns {IOfflineFilesItem} Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitem">IOfflineFilesItem</a> interface of the cache item.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-finditemex
     */
    FindItemEx(pszPath, pIncludeFileFilter, pIncludeDirFilter, pExcludeFileFilter, pExcludeDirFilter, dwQueryFlags) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(11, this, "ptr", pszPath, "ptr", pIncludeFileFilter, "ptr", pIncludeDirFilter, "ptr", pExcludeFileFilter, "ptr", pExcludeDirFilter, "uint", dwQueryFlags, "ptr*", &ppItem := 0, "HRESULT")
        return IOfflineFilesItem(ppItem)
    }

    /**
     * Renames an item in the cache.
     * @param {PWSTR} pszPathOriginal Fully qualified UNC path of the item (server, share, file or directory) to be renamed.
     * @param {PWSTR} pszPathNew The new path to replace <i>pszPathOriginal</i> if the item that  <i>pszPathOriginal</i> points to exists in the cache.
     * @param {BOOL} bReplaceIfExists This parameter is reserved for future use.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-renameitem
     */
    RenameItem(pszPathOriginal, pszPathNew, bReplaceIfExists) {
        pszPathOriginal := pszPathOriginal is String ? StrPtr(pszPathOriginal) : pszPathOriginal
        pszPathNew := pszPathNew is String ? StrPtr(pszPathNew) : pszPathNew

        result := ComCall(12, this, "ptr", pszPathOriginal, "ptr", pszPathNew, "int", bReplaceIfExists, "HRESULT")
        return result
    }

    /**
     * Retrieves the current fully qualified directory path of the Offline Files cache.
     * @returns {PWSTR} Address of pointer variable to accept the address of a string containing the fully qualified path of the Offline Files cache directory.  Upon successful return, the caller is expected to free the returned buffer by using  the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-getlocation
     */
    GetLocation() {
        result := ComCall(13, this, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * Retrieves the amount of disk space used by the Offline Files cache as well as the space limits applied to cache usage.
     * @param {Pointer<Integer>} pcbVolumeTotal Receives the size, in bytes, of the volume hosting the Offline Files cache.
     * @param {Pointer<Integer>} pcbLimit Receives the limit on the maximum amount of bytes that can be stored in the Offline Files cache.
     * @param {Pointer<Integer>} pcbUsed Receives the current number of bytes used by all files that are pinned and automatically cached in the Offline Files cache.
     * @param {Pointer<Integer>} pcbUnpinnedLimit Receives the limit on the maximum amount of bytes that can be stored in the Offline Files cache for automatically cached files.
     * @param {Pointer<Integer>} pcbUnpinnedUsed Receives the current number of bytes used by all automatically cached files in the Offline Files cache.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-getdiskspaceinformation
     */
    GetDiskSpaceInformation(pcbVolumeTotal, pcbLimit, pcbUsed, pcbUnpinnedLimit, pcbUnpinnedUsed) {
        pcbVolumeTotalMarshal := pcbVolumeTotal is VarRef ? "uint*" : "ptr"
        pcbLimitMarshal := pcbLimit is VarRef ? "uint*" : "ptr"
        pcbUsedMarshal := pcbUsed is VarRef ? "uint*" : "ptr"
        pcbUnpinnedLimitMarshal := pcbUnpinnedLimit is VarRef ? "uint*" : "ptr"
        pcbUnpinnedUsedMarshal := pcbUnpinnedUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pcbVolumeTotalMarshal, pcbVolumeTotal, pcbLimitMarshal, pcbLimit, pcbUsedMarshal, pcbUsed, pcbUnpinnedLimitMarshal, pcbUnpinnedLimit, pcbUnpinnedUsedMarshal, pcbUnpinnedUsed, "HRESULT")
        return result
    }

    /**
     * Sets disk space usage limits on the Offline Files cache.
     * @param {Integer} cbLimit Specifies the limit on the maximum amount of bytes that can be stored in the Offline Files cache.
     * @param {Integer} cbUnpinnedLimit Specifies the limit on the maximum amount of bytes that can be stored in the Offline Files cache for automatically cached files.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-setdiskspacelimits
     */
    SetDiskSpaceLimits(cbLimit, cbUnpinnedLimit) {
        result := ComCall(15, this, "uint", cbLimit, "uint", cbUnpinnedLimit, "HRESULT")
        return result
    }

    /**
     * Causes Offline Files to process the &quot;administratively assigned offline files&quot; group policy.
     * @param {IOfflineFilesSyncProgress} pPinProgress Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessyncprogress">IOfflineFilesSyncProgress</a> interface that receives progress notifications as items are being pinned in the Offline Files cache.
     * @param {IOfflineFilesSyncProgress} pUnpinProgress Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessyncprogress">IOfflineFilesSyncProgress</a> interface that receives progress notifications as items are being unpinned from the Offline Files cache.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-processadminpinpolicy
     */
    ProcessAdminPinPolicy(pPinProgress, pUnpinProgress) {
        result := ComCall(16, this, "ptr", pPinProgress, "ptr", pUnpinProgress, "HRESULT")
        return result
    }

    /**
     * Creates an object that represents a particular Offline Files setting.
     * @param {PWSTR} pszSettingName 
     * @returns {IOfflineFilesSetting} If the setting exists, a pointer to the object's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessetting">IOfflineFilesSetting</a> interface is returned.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-getsettingobject
     */
    GetSettingObject(pszSettingName) {
        pszSettingName := pszSettingName is String ? StrPtr(pszSettingName) : pszSettingName

        result := ComCall(17, this, "ptr", pszSettingName, "ptr*", &ppSetting := 0, "HRESULT")
        return IOfflineFilesSetting(ppSetting)
    }

    /**
     * Creates an enumerator of instances of IOfflineFilesSetting.
     * @returns {IEnumOfflineFilesSettings} On success, receives the address of an instance of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-ienumofflinefilessettings">IEnumOfflineFilesSettings</a>.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-enumsettingobjects
     */
    EnumSettingObjects() {
        result := ComCall(18, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumOfflineFilesSettings(ppEnum)
    }

    /**
     * Determines whether a specified UNC path is in the Offline Files cache.
     * @param {PWSTR} pszPath The UNC path of the item.
     * @param {Pointer<BOOL>} pbCacheable Receives <b>TRUE</b> if the item is in the Offline Files cache, <b>FALSE</b> if not.
     * @param {Pointer<Integer>} pShareCachingMode Receives one of the following <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_caching_mode">OFFLINEFILES_CACHING_MODE</a> enumeration values indicating the caching configuration of the applicable network shared folder under which the specified item exists.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilescache-ispathcacheable
     */
    IsPathCacheable(pszPath, pbCacheable, pShareCachingMode) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        pbCacheableMarshal := pbCacheable is VarRef ? "int*" : "ptr"
        pShareCachingModeMarshal := pShareCachingMode is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "ptr", pszPath, pbCacheableMarshal, pbCacheable, pShareCachingModeMarshal, pShareCachingMode, "HRESULT")
        return result
    }
}
