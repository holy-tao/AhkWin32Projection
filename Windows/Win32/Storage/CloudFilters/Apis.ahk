#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\CF_CONNECTION_KEY.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CloudFilters {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static CF_REQUEST_KEY_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CF_PLACEHOLDER_MAX_FILE_IDENTITY_LENGTH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CF_MAX_PRIORITY_HINT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static CF_MAX_PROVIDER_NAME_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CF_MAX_PROVIDER_VERSION_LENGTH => 255
;@endregion Constants

;@region Methods
    /**
     * Gets the platform version information.
     * @param {Pointer<CF_PLATFORM_INFO>} PlatformVersion The platform version information. See <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ns-cfapi-cf_platform_info">CF_PLATFORM_INFO</a> for more details.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetplatforminfo
     * @since windows10.0.16299
     */
    static CfGetPlatformInfo(PlatformVersion) {
        result := DllCall("cldapi.dll\CfGetPlatformInfo", "ptr", PlatformVersion, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs a one time sync root registration.
     * @param {PWSTR} SyncRootPath The path to the sync root to be registered.
     * @param {Pointer<CF_SYNC_REGISTRATION>} Registration Contains information about the sync provider and sync root to be registered.
     * @param {Pointer<CF_SYNC_POLICIES>} Policies The policies of the sync root to be registered.
     * @param {Integer} RegisterFlags Flags for registering previous and new sync roots.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfregistersyncroot
     * @since windows10.0.16299
     */
    static CfRegisterSyncRoot(SyncRootPath, Registration, Policies, RegisterFlags) {
        SyncRootPath := SyncRootPath is String ? StrPtr(SyncRootPath) : SyncRootPath

        result := DllCall("cldapi.dll\CfRegisterSyncRoot", "ptr", SyncRootPath, "ptr", Registration, "ptr", Policies, "int", RegisterFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unregisters a previously registered sync root.
     * @param {PWSTR} SyncRootPath The path to the sync root to be unregistered.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfunregistersyncroot
     * @since windows10.0.16299
     */
    static CfUnregisterSyncRoot(SyncRootPath) {
        SyncRootPath := SyncRootPath is String ? StrPtr(SyncRootPath) : SyncRootPath

        result := DllCall("cldapi.dll\CfUnregisterSyncRoot", "ptr", SyncRootPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates bi-directional communication between a sync provider and the sync filter API.
     * @param {PWSTR} SyncRootPath The path to the sync root.
     * @param {Pointer<CF_CALLBACK_REGISTRATION>} CallbackTable The callback table to be registered.
     * @param {Pointer<Void>} CallbackContext A callback context used by the platform anytime a specified callback function is invoked.
     * @param {Integer} ConnectFlags Provides additional information when a callback is invoked.
     * @returns {CF_CONNECTION_KEY} A connection key representing the communication channel with the sync filter.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfconnectsyncroot
     * @since windows10.0.16299
     */
    static CfConnectSyncRoot(SyncRootPath, CallbackTable, CallbackContext, ConnectFlags) {
        SyncRootPath := SyncRootPath is String ? StrPtr(SyncRootPath) : SyncRootPath

        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        ConnectionKey := CF_CONNECTION_KEY()
        result := DllCall("cldapi.dll\CfConnectSyncRoot", "ptr", SyncRootPath, "ptr", CallbackTable, CallbackContextMarshal, CallbackContext, "int", ConnectFlags, "ptr", ConnectionKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectionKey
    }

    /**
     * Disconnects a communication channel created by CfConnectSyncRoot.
     * @param {CF_CONNECTION_KEY} ConnectionKey The connection key returned from <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfconnectsyncroot">CfConnectSyncRoot</a> that is now used to disconnect the sync root.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfdisconnectsyncroot
     * @since windows10.0.16299
     */
    static CfDisconnectSyncRoot(ConnectionKey) {
        ConnectionKey := ConnectionKey is Win32Handle ? NumGet(ConnectionKey, "ptr") : ConnectionKey

        result := DllCall("cldapi.dll\CfDisconnectSyncRoot", "ptr", ConnectionKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates a transfer of data into a placeholder file or folder.
     * @param {HANDLE} FileHandle The file handle of the placeholder.
     * @returns {Integer} An opaque handle to the placeholder to be serviced.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgettransferkey
     * @since windows10.0.16299
     */
    static CfGetTransferKey(FileHandle) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfGetTransferKey", "ptr", FileHandle, "int64*", &TransferKey := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransferKey
    }

    /**
     * Releases a transfer key obtained by CfGetTransferKey.
     * @param {HANDLE} FileHandle The file handle of the placeholder.
     * @param {Pointer<Integer>} TransferKey An opaque handle to the placeholder.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfreleasetransferkey
     * @since windows10.0.16299
     */
    static CfReleaseTransferKey(FileHandle, TransferKey) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        TransferKeyMarshal := TransferKey is VarRef ? "int64*" : "ptr"

        DllCall("cldapi.dll\CfReleaseTransferKey", "ptr", FileHandle, TransferKeyMarshal, TransferKey)
    }

    /**
     * The main entry point for all connection key based placeholder operations. It is intended to be used by a sync provider to respond to various callbacks from the platform.
     * @param {Pointer<CF_OPERATION_INFO>} OpInfo Information about an operation on a placeholder.
     * @param {Pointer<CF_OPERATION_PARAMETERS>} OpParams Parameters of an operation on a placeholder.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfexecute
     * @since windows10.0.16299
     */
    static CfExecute(OpInfo, OpParams) {
        result := DllCall("cldapi.dll\CfExecute", "ptr", OpInfo, "ptr", OpParams, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Updates the current status of the sync provider.
     * @param {CF_CONNECTION_KEY} ConnectionKey A connection key representing a communication channel with the sync filter.
     * @param {Integer} ProviderStatus The current status of the sync provider.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfupdatesyncproviderstatus
     * @since windows10.0.16299
     */
    static CfUpdateSyncProviderStatus(ConnectionKey, ProviderStatus) {
        ConnectionKey := ConnectionKey is Win32Handle ? NumGet(ConnectionKey, "ptr") : ConnectionKey

        result := DllCall("cldapi.dll\CfUpdateSyncProviderStatus", "ptr", ConnectionKey, "uint", ProviderStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Queries a sync provider to get the status of the provider.
     * @param {CF_CONNECTION_KEY} ConnectionKey A connection key representing a communication channel with the sync filter.
     * @returns {Integer} The current status of the sync provider.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfquerysyncproviderstatus
     * @since windows10.0.16299
     */
    static CfQuerySyncProviderStatus(ConnectionKey) {
        ConnectionKey := ConnectionKey is Win32Handle ? NumGet(ConnectionKey, "ptr") : ConnectionKey

        result := DllCall("cldapi.dll\CfQuerySyncProviderStatus", "ptr", ConnectionKey, "uint*", &ProviderStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProviderStatus
    }

    /**
     * Allows a sync provider to notify the platform of its status on a specified sync root without having to connect with a call to CfConnectSyncRoot first.
     * @param {PWSTR} SyncRootPath Path to the sync root.
     * @param {Pointer<CF_SYNC_STATUS>} SyncStatus The sync status to report; if <b>null</b>, clears the previously-saved sync status. For more information, see the Remarks section, below.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfreportsyncstatus
     * @since windows10.0.17134
     */
    static CfReportSyncStatus(SyncRootPath, SyncStatus) {
        SyncRootPath := SyncRootPath is String ? StrPtr(SyncRootPath) : SyncRootPath

        result := DllCall("cldapi.dll\CfReportSyncStatus", "ptr", SyncRootPath, "ptr", SyncStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates one or more new placeholder files or directories under a sync root tree.
     * @param {PWSTR} BaseDirectoryPath Path to the local directory in which the placeholders are created. This path must be under the sync root of the provider.
     * @param {Pointer<CF_PLACEHOLDER_CREATE_INFO>} PlaceholderArray On successful creation, the <i>PlaceholderArray</i> contains the final USN value and a STATUS_OK message. On return, this array contains an HRESULT value describing whether the placeholder was created or not.
     * @param {Integer} PlaceholderCount The count of placeholders in the <i>PlaceholderArray</i>.
     * @param {Integer} CreateFlags Flags for configuring the  creation of a placeholder.
     * @returns {Integer} The number of entries processed, including failed entries.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfcreateplaceholders
     * @since windows10.0.16299
     */
    static CfCreatePlaceholders(BaseDirectoryPath, PlaceholderArray, PlaceholderCount, CreateFlags) {
        BaseDirectoryPath := BaseDirectoryPath is String ? StrPtr(BaseDirectoryPath) : BaseDirectoryPath

        result := DllCall("cldapi.dll\CfCreatePlaceholders", "ptr", BaseDirectoryPath, "ptr", PlaceholderArray, "uint", PlaceholderCount, "int", CreateFlags, "uint*", &EntriesProcessed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EntriesProcessed
    }

    /**
     * Opens an asynchronous opaque handle to a file or directory (for both normal and placeholder files) and sets up a proper oplock on it based on the open flags.
     * @param {PWSTR} FilePath Fully qualified path to the file or directory to be opened.
     * @param {Integer} Flags Flags to specify permissions on opening the file.
     * @returns {HANDLE} An opaque handle to the file or directory that is just opened. Note that this is not a normal Win32 handle and hence cannot be used with non-CfApi Win32 APIs directly.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfopenfilewithoplock
     * @since windows10.0.16299
     */
    static CfOpenFileWithOplock(FilePath, Flags) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath

        ProtectedHandle := HANDLE()
        result := DllCall("cldapi.dll\CfOpenFileWithOplock", "ptr", FilePath, "int", Flags, "ptr", ProtectedHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProtectedHandle
    }

    /**
     * Allows the caller to reference a protected handle to a Win32 handle which can be used with non-CfApi Win32 APIs.
     * @param {HANDLE} ProtectedHandle The protected handle of a placeholder file.
     * @returns {BOOLEAN} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfreferenceprotectedhandle
     * @since windows10.0.16299
     */
    static CfReferenceProtectedHandle(ProtectedHandle) {
        ProtectedHandle := ProtectedHandle is Win32Handle ? NumGet(ProtectedHandle, "ptr") : ProtectedHandle

        result := DllCall("cldapi.dll\CfReferenceProtectedHandle", "ptr", ProtectedHandle, "char")
        return result
    }

    /**
     * Converts a protected handle to a Win32 handle so that it can be used with all handle-based Win32 APIs.
     * @param {HANDLE} ProtectedHandle The protected handle to be converted.
     * @returns {HANDLE} The corresponding Win32 handle.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetwin32handlefromprotectedhandle
     * @since windows10.0.16299
     */
    static CfGetWin32HandleFromProtectedHandle(ProtectedHandle) {
        ProtectedHandle := ProtectedHandle is Win32Handle ? NumGet(ProtectedHandle, "ptr") : ProtectedHandle

        result := DllCall("cldapi.dll\CfGetWin32HandleFromProtectedHandle", "ptr", ProtectedHandle, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * Releases a protected handle referenced by CfReferenceProtectedHandle.
     * @param {HANDLE} ProtectedHandle The protected handle to be released.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfreleaseprotectedhandle
     * @since windows10.0.16299
     */
    static CfReleaseProtectedHandle(ProtectedHandle) {
        ProtectedHandle := ProtectedHandle is Win32Handle ? NumGet(ProtectedHandle, "ptr") : ProtectedHandle

        DllCall("cldapi.dll\CfReleaseProtectedHandle", "ptr", ProtectedHandle)
    }

    /**
     * Closes the file or directory handle returned by CfOpenFileWithOplock. This should not be used with standard Win32 file handles, only on handles used within CfApi.h.
     * @param {HANDLE} FileHandle The file or directory handle to be closed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfclosehandle
     * @since windows10.0.16299
     */
    static CfCloseHandle(FileHandle) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        DllCall("cldapi.dll\CfCloseHandle", "ptr", FileHandle)
    }

    /**
     * Converts a normal file/directory to a placeholder file/directory.
     * @param {HANDLE} FileHandle Handle to the file or directory to be converted.
     * @param {Pointer} FileIdentity A user mode buffer that contains the opaque file or directory information supplied by the caller. Optional if the caller is not dehydrating the file at the same time, or if the caller is converting a directory. Cannot exceed 4KB in size.
     * @param {Integer} FileIdentityLength Length, in bytes, of the <i>FileIdentity</i>.
     * @param {Integer} ConvertFlags Placeholder conversion flags.
     * @param {Pointer<OVERLAPPED>} Overlapped When specified and combined with an asynchronous <i>FileHandle</i>, <i>Overlapped</i> allows the platform to perform the <b>CfConvertToPlaceholder</b> call asynchronously. See the Remarks for more details.
     * 
     * If not specified, the platform will perform the API call synchronously, regardless of how the handle was created.
     * @returns {Integer} The final USN value after convert actions are performed.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfconverttoplaceholder
     * @since windows10.0.16299
     */
    static CfConvertToPlaceholder(FileHandle, FileIdentity, FileIdentityLength, ConvertFlags, Overlapped) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfConvertToPlaceholder", "ptr", FileHandle, "ptr", FileIdentity, "uint", FileIdentityLength, "int", ConvertFlags, "int64*", &ConvertUsn := 0, "ptr", Overlapped, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConvertUsn
    }

    /**
     * Updates characteristics of the placeholder file or directory.
     * @param {HANDLE} FileHandle A handle to the file or directory whose metadata is to be updated.
     * @param {Pointer<CF_FS_METADATA>} FsMetadata File system metadata to be updated for the placeholder. Values of 0 for the metadata indicate there are no updates.
     * @param {Pointer} FileIdentity A user mode buffer that contains file or directory information supplied by the caller. Should not exceed 4KB in size.
     * @param {Integer} FileIdentityLength Length, in bytes, of the <i>FileIdentity</i>.
     * @param {Pointer<CF_FILE_RANGE>} DehydrateRangeArray A range of an existing placeholder that will no longer be considered valid after the call to <b>CfUpdatePlaceholder</b>.
     * @param {Integer} DehydrateRangeCount The count of a series of discrete <i>DehydrateRangeArray</i> partitions of placeholder data.
     * @param {Integer} UpdateFlags Update flags for placeholders.
     * @param {Pointer<Integer>} UpdateUsn On input, <i>UpdateUsn</i> instructs the platform to only perform the update if the file still has the same USN value as the one passed in.  This serves a similar purpose to <b>CF_UPDATE_FLAG_VERIFY_IN_SYNC</b> but also encompasses local metadata changes.  
     * 
     * On return, <i>UpdateUsn</i> receives the final USN value after update actions were performed.
     * @param {Pointer<OVERLAPPED>} Overlapped When specified and combined with an asynchronous <i>FileHandle</i>, <i>Overlapped</i> allows the platform to perform the <b>CfUpdatePlaceholder</b> call asynchronously. See the Remarks for more details.
     * 
     * If not specified, the platform will perform the API call synchronously, regardless of how the handle was created.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfupdateplaceholder
     * @since windows10.0.16299
     */
    static CfUpdatePlaceholder(FileHandle, FsMetadata, FileIdentity, FileIdentityLength, DehydrateRangeArray, DehydrateRangeCount, UpdateFlags, UpdateUsn, Overlapped) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        UpdateUsnMarshal := UpdateUsn is VarRef ? "int64*" : "ptr"

        result := DllCall("cldapi.dll\CfUpdatePlaceholder", "ptr", FileHandle, "ptr", FsMetadata, "ptr", FileIdentity, "uint", FileIdentityLength, "ptr", DehydrateRangeArray, "uint", DehydrateRangeCount, "int", UpdateFlags, UpdateUsnMarshal, UpdateUsn, "ptr", Overlapped, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reverts a placeholder back to a regular file, stripping away all special characteristics such as the reparse tag, the file identity, etc.
     * @param {HANDLE} FileHandle A handle to the file or directory placeholder that is about to be reverted to normal file or directory. An attribute or no-access handle is sufficient.
     * @param {Integer} RevertFlags Placeholder revert flags.
     * @param {Pointer<OVERLAPPED>} Overlapped When specified and combined with an asynchronous <i>FileHandle</i>, <i>Overlapped</i> allows the platform to perform the <b>CfRevertPlaceholder</b> call asynchronously. See the Remarks for more details.
     * 
     * If not specified, the platform will perform the API call synchronously, regardless of how the handle was created.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfrevertplaceholder
     * @since windows10.0.16299
     */
    static CfRevertPlaceholder(FileHandle, RevertFlags, Overlapped) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfRevertPlaceholder", "ptr", FileHandle, "int", RevertFlags, "ptr", Overlapped, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Hydrates a placeholder file by ensuring that the specified byte range is present on-disk in the placeholder. This is valid for files only.
     * @param {HANDLE} FileHandle Handle of the placeholder file to be hydrated. An attribute or no-access handle is sufficient.
     * @param {Integer} StartingOffset The starting point offset of the placeholder file data.
     * @param {Integer} Length The length, in bytes,  of the placeholder file whose data must be available locally on the disk after the API completes successfully. A length of -1 signifies end of file.
     * @param {Integer} HydrateFlags Placeholder hydration flags.
     * @param {Pointer<OVERLAPPED>} Overlapped When specified and combined with an asynchronous <i>FileHandle</i>, <i>Overlapped</i> allows the platform to perform the <b>CfHydratePlaceholder</b> call asynchronously. See the Remarks for more details.
     * 
     * If not specified, the platform will perform the API call synchronously, regardless of how the handle was created.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfhydrateplaceholder
     * @since windows10.0.16299
     */
    static CfHydratePlaceholder(FileHandle, StartingOffset, Length, HydrateFlags, Overlapped) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfHydratePlaceholder", "ptr", FileHandle, "int64", StartingOffset, "int64", Length, "int", HydrateFlags, "ptr", Overlapped, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Integer} StartingOffset 
     * @param {Integer} Length 
     * @param {Integer} DehydrateFlags 
     * @param {Pointer<OVERLAPPED>} Overlapped 
     * @returns {HRESULT} 
     */
    static CfDehydratePlaceholder(FileHandle, StartingOffset, Length, DehydrateFlags, Overlapped) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfDehydratePlaceholder", "ptr", FileHandle, "int64", StartingOffset, "int64", Length, "int", DehydrateFlags, "ptr", Overlapped, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This sets the pin state of a placeholder, used to represent a user’s intent. Any application (not just the sync provider) can call this function.
     * @param {HANDLE} FileHandle The handle of the placeholder file. The caller must have READ_DATA or WRITE_DAC access to the placeholder.
     * @param {Integer} PinState The pin state of the placeholder file.
     * @param {Integer} PinFlags The pin state flags.
     * @param {Pointer<OVERLAPPED>} Overlapped Allows the call to be performed asynchronously. See the Remarks section for more details.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfsetpinstate
     * @since windows10.0.16299
     */
    static CfSetPinState(FileHandle, PinState, PinFlags, Overlapped) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfSetPinState", "ptr", FileHandle, "int", PinState, "int", PinFlags, "ptr", Overlapped, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the in-sync state for a placeholder file or folder.
     * @param {HANDLE} FileHandle A handle to the placeholder.	The caller must have WRITE_DATA or WRITE_DAC access to the placeholder.
     * @param {Integer} InSyncState The in-sync state. See <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ne-cfapi-cf_in_sync_state">CF_IN_SYNC_STATE</a> for more details.
     * @param {Integer} InSyncFlags The in-sync state flags. See <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ne-cfapi-cf_set_in_sync_flags">CF_SET_IN_SYNC_FLAGS</a> for more details.
     * @param {Pointer<Integer>} InSyncUsn This parameter needs to be a NULL pointer.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfsetinsyncstate
     * @since windows10.0.16299
     */
    static CfSetInSyncState(FileHandle, InSyncState, InSyncFlags, InSyncUsn) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        InSyncUsnMarshal := InSyncUsn is VarRef ? "int64*" : "ptr"

        result := DllCall("cldapi.dll\CfSetInSyncState", "ptr", FileHandle, "int", InSyncState, "int", InSyncFlags, InSyncUsnMarshal, InSyncUsn, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allows a sync provider to instruct the platform to use a specific correlation vector for telemetry purposes on a placeholder file. This is optional.
     * @param {HANDLE} FileHandle The handle to the placeholder file.
     * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector A specific correlation vector to be associated with the <i>FileHandle</i>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfsetcorrelationvector
     * @since windows10.0.16299
     */
    static CfSetCorrelationVector(FileHandle, CorrelationVector) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfSetCorrelationVector", "ptr", FileHandle, "ptr", CorrelationVector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allows the sync provider to query the current correlation vector for a given placeholder file.
     * @param {HANDLE} FileHandle The handle to the placeholder file.
     * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector The correlation vector for the <i>FileHandle</i>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetcorrelationvector
     * @since windows10.0.16299
     */
    static CfGetCorrelationVector(FileHandle, CorrelationVector) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfGetCorrelationVector", "ptr", FileHandle, "ptr", CorrelationVector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a set of placeholder states based on the FileAttributes and ReparseTag values of the file.
     * @param {Integer} FileAttributes The file attribute information.
     * @param {Integer} ReparseTag The reparse tag information from a file.
     * @returns {Integer} Can include <a href="/windows/desktop/api/cfapi/ne-cfapi-cf_placeholder_state">CF_PLACEHOLDER_STATE</a>; The placeholder state.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetplaceholderstatefromattributetag
     * @since windows10.0.16299
     */
    static CfGetPlaceholderStateFromAttributeTag(FileAttributes, ReparseTag) {
        result := DllCall("cldapi.dll\CfGetPlaceholderStateFromAttributeTag", "uint", FileAttributes, "uint", ReparseTag, "uint")
        return result
    }

    /**
     * Gets a set of placeholder states based on the various information of the file.
     * @param {Pointer<Void>} InfoBuffer An info buffer about the file.
     * @param {Integer} InfoClass An info class so the function knows how to interpret the <i>InfoBuffer</i>.
     * @returns {Integer} Can include <a href="/windows/desktop/api/cfapi/ne-cfapi-cf_placeholder_state">CF_PLACEHOLDER_STATE</a>; The placeholder state.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetplaceholderstatefromfileinfo
     * @since windows10.0.16299
     */
    static CfGetPlaceholderStateFromFileInfo(InfoBuffer, InfoClass) {
        InfoBufferMarshal := InfoBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("cldapi.dll\CfGetPlaceholderStateFromFileInfo", InfoBufferMarshal, InfoBuffer, "int", InfoClass, "uint")
        return result
    }

    /**
     * Gets a set of placeholder states based on the WIN32_FIND_DATA structure.
     * @param {Pointer<WIN32_FIND_DATAA>} FindData The find data information on the file.
     * @returns {Integer} Can include <a href="/windows/desktop/api/cfapi/ne-cfapi-cf_placeholder_state">CF_PLACEHOLDER_STATE</a>; The placeholder state.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetplaceholderstatefromfinddata
     * @since windows10.0.16299
     */
    static CfGetPlaceholderStateFromFindData(FindData) {
        result := DllCall("cldapi.dll\CfGetPlaceholderStateFromFindData", "ptr", FindData, "uint")
        return result
    }

    /**
     * Gets various characteristics of a placeholder file or folder.
     * @param {HANDLE} FileHandle A handle to the placeholder whose information will be queried.
     * @param {Integer} InfoClass Placeholder information. This can be set to either <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ns-cfapi-cf_placeholder_standard_info">CF_PLACEHOLDER_STANDARD_INFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ns-cfapi-cf_placeholder_basic_info">CF_PLACEHOLDER_BASIC_INFO</a>.
     * @param {Pointer} InfoBuffer A pointer to a buffer that will receive information.
     * @param {Integer} InfoBufferLength The length of the <i>InfoBuffer</i>, in bytes.
     * @returns {Integer} The number of bytes returned in the <i>InfoBuffer</i>.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetplaceholderinfo
     * @since windows10.0.16299
     */
    static CfGetPlaceholderInfo(FileHandle, InfoClass, InfoBuffer, InfoBufferLength) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfGetPlaceholderInfo", "ptr", FileHandle, "int", InfoClass, "ptr", InfoBuffer, "uint", InfoBufferLength, "uint*", &ReturnedLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ReturnedLength
    }

    /**
     * Gets various sync root information given a file under the sync root.
     * @param {PWSTR} FilePath A fully qualified path to a file whose sync root information is to be queried
     * @param {Integer} InfoClass Types of sync root information.
     * @param {Pointer<Void>} InfoBuffer A pointer to a buffer that will receive the sync root information.
     * @param {Integer} InfoBufferLength Length, in bytes, of the <i>InfoBuffer</i>.
     * @param {Pointer<Integer>} ReturnedLength Length, in bytes, of the returned sync root information. Refer to <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfregistersyncroot">CfRegisterSyncRoot</a> for details about the sync root information.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetsyncrootinfobypath
     * @since windows10.0.16299
     */
    static CfGetSyncRootInfoByPath(FilePath, InfoClass, InfoBuffer, InfoBufferLength, ReturnedLength) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath

        InfoBufferMarshal := InfoBuffer is VarRef ? "ptr" : "ptr"
        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        result := DllCall("cldapi.dll\CfGetSyncRootInfoByPath", "ptr", FilePath, "int", InfoClass, InfoBufferMarshal, InfoBuffer, "uint", InfoBufferLength, ReturnedLengthMarshal, ReturnedLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets various characteristics of the sync root containing a given file specified by a file handle.
     * @param {HANDLE} FileHandle Handle of the file under the sync root whose information is to be queried.
     * @param {Integer} InfoClass Types of sync root information.
     * @param {Pointer<Void>} InfoBuffer A pointer to a buffer that will receive the sync root information.
     * @param {Integer} InfoBufferLength Length, in bytes, of the <i>InfoBuffer</i>.
     * @param {Pointer<Integer>} ReturnedLength The number of bytes returned in the <i>InfoBuffer</i>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetsyncrootinfobyhandle
     * @since windows10.0.16299
     */
    static CfGetSyncRootInfoByHandle(FileHandle, InfoClass, InfoBuffer, InfoBufferLength, ReturnedLength) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        InfoBufferMarshal := InfoBuffer is VarRef ? "ptr" : "ptr"
        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        result := DllCall("cldapi.dll\CfGetSyncRootInfoByHandle", "ptr", FileHandle, "int", InfoClass, InfoBufferMarshal, InfoBuffer, "uint", InfoBufferLength, ReturnedLengthMarshal, ReturnedLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets range information about a placeholder file or folder.
     * @param {HANDLE} FileHandle The handle of the placeholder file to be queried.
     * @param {Integer} InfoClass Types of the range of placeholder data.
     * @param {Integer} StartingOffset Offset of the starting point of the range of data.
     * @param {Integer} Length Length of the range of data.
     * @param {Pointer} InfoBuffer Pointer to a buffer to receive the data.
     * @param {Integer} InfoBufferLength Length, in bytes, of <i>InfoBuffer</i>.
     * @returns {Integer} The length of the returned range of placeholder data in the <i>InfoBuffer</i>.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfgetplaceholderrangeinfo
     * @since windows10.0.16299
     */
    static CfGetPlaceholderRangeInfo(FileHandle, InfoClass, StartingOffset, Length, InfoBuffer, InfoBufferLength) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("cldapi.dll\CfGetPlaceholderRangeInfo", "ptr", FileHandle, "int", InfoClass, "int64", StartingOffset, "int64", Length, "ptr", InfoBuffer, "uint", InfoBufferLength, "uint*", &ReturnedLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ReturnedLength
    }

    /**
     * 
     * @param {CF_CONNECTION_KEY} ConnectionKey 
     * @param {Integer} TransferKey 
     * @param {Integer} FileId 
     * @param {Integer} InfoClass 
     * @param {Integer} StartingOffset 
     * @param {Integer} RangeLength 
     * @param {Pointer} InfoBuffer 
     * @param {Integer} InfoBufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetplaceholderrangeinfoforhydration
     */
    static CfGetPlaceholderRangeInfoForHydration(ConnectionKey, TransferKey, FileId, InfoClass, StartingOffset, RangeLength, InfoBuffer, InfoBufferSize) {
        ConnectionKey := ConnectionKey is Win32Handle ? NumGet(ConnectionKey, "ptr") : ConnectionKey

        result := DllCall("cldapi.dll\CfGetPlaceholderRangeInfoForHydration", "ptr", ConnectionKey, "int64", TransferKey, "int64", FileId, "int", InfoClass, "int64", StartingOffset, "int64", RangeLength, "ptr", InfoBuffer, "uint", InfoBufferSize, "uint*", &InfoBufferWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InfoBufferWritten
    }

    /**
     * Allows a sync provider to report progress out-of-band.
     * @param {CF_CONNECTION_KEY} ConnectionKey A connection key representing a communication channel with the sync filter.
     * @param {Integer} TransferKey An opaque handle to the placeholder.
     * @param {Integer} ProviderProgressTotal The total progress of the sync provider in response to a fetch data callback.
     * @param {Integer} ProviderProgressCompleted The completed progress of the sync provider in response to a fetch data callback.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//cfapi/nf-cfapi-cfreportproviderprogress
     * @since windows10.0.16299
     */
    static CfReportProviderProgress(ConnectionKey, TransferKey, ProviderProgressTotal, ProviderProgressCompleted) {
        ConnectionKey := ConnectionKey is Win32Handle ? NumGet(ConnectionKey, "ptr") : ConnectionKey

        result := DllCall("cldapi.dll\CfReportProviderProgress", "ptr", ConnectionKey, "int64", TransferKey, "int64", ProviderProgressTotal, "int64", ProviderProgressCompleted, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CF_CONNECTION_KEY} ConnectionKey 
     * @param {Integer} TransferKey 
     * @param {Integer} RequestKey 
     * @param {Integer} ProviderProgressTotal 
     * @param {Integer} ProviderProgressCompleted 
     * @param {Integer} TargetSessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfreportproviderprogress2
     */
    static CfReportProviderProgress2(ConnectionKey, TransferKey, RequestKey, ProviderProgressTotal, ProviderProgressCompleted, TargetSessionId) {
        ConnectionKey := ConnectionKey is Win32Handle ? NumGet(ConnectionKey, "ptr") : ConnectionKey

        result := DllCall("cldapi.dll\CfReportProviderProgress2", "ptr", ConnectionKey, "int64", TransferKey, "int64", RequestKey, "int64", ProviderProgressTotal, "int64", ProviderProgressCompleted, "uint", TargetSessionId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
