#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
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
     * @remarks
     * The *platform* is defined as the combination of the filter and the API library, which are always kept in sync with each other. This API is mainly intended for sync providers that run on multiple Windows versions and need to make decisions based on the platform capabilities. The platform version information consists of three parts: build number, revision number, and integration number. The build number and revision number change when the platform is serviced by Windows Update. The integration number on its own is indicative of the platform capability, both in terms of the API contracts and the availability of critical bug fixes. The integration number increments monotonically. The platform never loses capability with the increment of the integration number. Applications that are cloud files aware may also find this API useful.
     * @param {Pointer<CF_PLATFORM_INFO>} PlatformVersion The platform version information. See [CF_PLATFORM_INFO](ns-cfapi-cf_platform_info.md) for more details.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetplatforminfo
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
     * @remarks
     * This can be used at a sync provider install time, first time set up for an individual user, or when a user configures another sync root (if this scenario is supported).
     * 
     * >[!NOTE]
     * >No two sync root trees are allowed to overlap. Because directory hard links are forbidden by the file system, the only way for two sync roots to overlap is if they have a direct ancestor/descendant relationship. The platform is responsible for persistently remembering all sync roots registered on a given volume, and failing any attempt to create overlapping sync roots.
     * 
     * A sync provider should have **WRITE_DATA** or **WRITE_DAC** access to the sync root to be registered or the registration will fail with **ERROR_CLOUD_FILE_ACCESS_DENIED**.
     * 
     * The sync provider should supply a registration record that contains various identities of the sync provider itself and the sync root to be registered, a set of policies that the platform uses to adjust its behavior on a per-sync-root basis, and a set of registration flags that allow finer control of the registration operation by the sync provider.
     * 
     * Unless explicitly called out as optional, all fields are mandatory and not providing them will result in the API call failing with an invalid parameter error.
     * 
     * All structures wherein future extensions are expected start with a **StructSize** field. The caller is responsible for the accurate accounting of the structure size.
     * 
     * The platform currently supports five types of *Policies*:
     * 
     * **Hydration Policy**
     * 
     * The hydration policy allows a sync provider to control how placeholder files should be hydrated by the platform. It consists of a primary policy and a set of policy modifiers.
     * 
     * The primary hydration policy has four different values:
     * 
     * | Policy | Description |
     * |--------|--------|
     * | **ALWAYS_FULL** | The platform will fail (with **ERROR_CLOUD_FILE_INVALID_REQUEST**) any placeholder operation that could result in a not fully hydrated placeholder, which includes [CfCreatePlaceholders](nf-cfapi-cfcreateplaceholders.md), [CfDehydratePlaceholder](/previous-versions/mt827480(v=vs.85)), [CfUpdatePlaceholder](nf-cfapi-cfupdateplaceholder.md) with the dehydrate option, and [CfConvertToPlaceholder](nf-cfapi-cfconverttoplaceholder.md) with the dehydrate option. |
     * | **FULL** | The platform will allow a placeholder to be dehydrated. When the platform detects access to a dehydrated placeholder, it will ensure that the full content of the placeholder is available locally before completing the user IO request, even if the request is only asking for 1 byte. |
     * | **PROGRESSIVE** | The platform will allow a placeholder to be dehydrated. When the platform detects access to a dehydrated placeholder, it will complete the user IO request as soon as it determines that sufficient data is received from the sync provider. However, the platform promises to continue requesting the remaining content in the placeholder from the sync provider in the background until either the full content of the placeholder is available locally or the last user handle on the placeholder is closed. <br/><br/>**Note:** Sync providers that opt in for **PROGRESSIVE** may not assume that hydration callbacks arrive sequentially from offset `0`. In other words, sync providers with **PROGRESSIVE** policy are expected to handle random seeks on the placeholder. |
     * | **PARTIAL** | This policy is very similar to **PROGRESSIVE**, with the only difference being the lack of continuous hydration in the background. |
     * 
     * Three policy modifiers are currently supported. In general, modifiers can be mixed and matched with any primary policies and other policy modifiers so long as the combination is not self-conflicting.
     * 
     * | Modifier | Description |
     * |--------|--------|
     * | **VALIDATION_REQUIRED** | This policy modifier offers two guarantees to a sync provider. First, it guarantees that the data returned by the sync provider is always persisted to the disk prior to it being returned to the user application. Second, it allows the sync provider to retrieve the same data it has returned previously to the platform and validate its integrity. Only upon a successful confirmation of the integrity by the sync provider will the platform complete the user IO request. This modifier helps support end-to-end data integrity at the cost of extra disk IOs. |
     * | **STREAMING_ALLOWED** | This policy modifier grants the platform the permission to not store any data returned by a sync provider on local disks. This policy modifier is mutually exclusive with **VALIDATION_REQUIRED**. The API fails with **ERROR_INVALID_PARAMETER** when both flags are specified. |
     * | **AUTO_DEHYDRATION_ALLOWED** | This policy modifier grants the platform the permission to dehydrate in-sync cloud file placeholders without the help of sync providers. Without this flag, the platform is not allowed to call [CfDehydratePlaceholder](/previous-versions/mt827480(v=vs.85)) directly. Instead, the only supported way to dehydrate a cloud file placeholder is to clear the file’s pinned attribute and set the file’s unpinned attribute and then the actual dehydration will be performed asynchronously by the sync engine after it receives the directory change notification on the two attributes. When this flag is specified, the platform will be allowed to invoke **CfDehydratePlaceholder** directly on any in-sync cloud file placeholder. It is recommended for sync providers to support auto dehydration. |
     * 
     * **Population Policy**
     * 
     * The population policy allows a sync provider to control how placeholder namespace (both directories and files) should be created by the platform. There are currently three primary policies with no modifiers defined:
     * 
     * | Policy | Description |
     * |--------|--------|
     * | **ALWAYS_FULL** | The platform assumes that the full name space is always available locally. It will never forward any directory enumeration request to the sync provider. |
     * | **FULL** | When the platform detects access on a not fully populated directory, it will request the sync provider return all entries under the directory before completing the user request. |
     * | **PARTIAL** | When the platform detects access on a not fully populated directory, it will request only the entries required by the user application from the sync provider. |
     * 
     * **InSync Tracking Policy**
     * 
     * The **InSync** policy allows a sync provider to control when the platform should clear the in-sync state on a placeholder. In addition to always clearing in-sync on any data modification, the platform currently can clear in-sync on changes of any combinations of three file attributes (**ReadOnly**, **System**, and **Hidden**) and two file times (**CreateTime** and **LastWriteTime**). These policies can be applied to files and directories separately.
     * 
     * **Hardlink Policy**
     * 
     * By default, the platform does not allow hard links to be created on any placeholder. Sync providers that are capable of handling hard links however can instruct the platform to enable the support via the **ALLOWED** policy. With this policy, applications can create as many hard links as the file system supports so long as the links are under either the same sync root or no sync root. The platform will force a placeholder to be hydrated when the first out-of-sync-root link is introduced and revert a placeholder to normal file when its last in-sync-root link is removed. Hardlink creation that is not compatible with the policy will be failed with **STATUS_CLOUD_FILES_INCOMPATIBLE_HARDLINKS**. Placeholder operations that are not compatible with the policy will also be failed with **STATUS_CLOUD_FILES_INCOMPATIBLE_HARDLINKS**.
     * 
     * **Placeholder Management Policy**
     * 
     * By default, only a sync provider can perform placeholder management operations in a sync root. Non sync provider processes can perform placeholder management operations only if the sync root is inactive, i.e., when the sync root is not connected to by any sync provider. These policies, when enabled, allow non sync provider processes to perform respective placeholder management operations in an active sync root. **CF_PLACEHOLDER_MANAGEMENT_POLICY_DEFAULT** is the default policy allowing only a connected sync provider to perform any placeholder management operations. The following policies can be specified in any combination:
     * 
     * | Policy | Description |
     * |--------|--------|
     * | **CF_PLACEHOLDER_MANAGEMENT_POLICY_CREATE_UNRESTRICTED** | When this policy is specified during registration, any process can create a placeholder within an active sync root by calling [CfCreatePlaceholders](nf-cfapi-cfcreateplaceholders.md). |
     * | **CF_PLACEHOLDER_MANAGEMENT_POLICY_CONVERT_UNRESTRICTED** | When this policy is specified during registration, any process can convert a file or a directory within an active sync root to a placeholder by calling [CfConvertToPlaceholder](nf-cfapi-cfconverttoplaceholder.md). |
     * | **CF_PLACEHOLDER_MANAGEMENT_POLICY_UPDATE_UNRESTRICTED** | When this policy is specified during registration, any process can update a placeholder within an active sync root by calling [CfUpdatePlaceholder](nf-cfapi-cfupdateplaceholder.md). |
     * 
     * >[!NOTE]
     * >These flags are supported only if **PlatformVersion.IntegrationNumber** obtained from [CfGetPlatformInfo](nf-cfapi-cfgetplatforminfo.md) is `0x310` or higher.
     * @param {PWSTR} SyncRootPath The path to the sync root to be registered.
     * @param {Pointer<CF_SYNC_REGISTRATION>} Registration Contains information about the sync provider and sync root to be registered.
     * 
     * **ProviderName** and **ProviderVersion** are end-user facing strings with a maximum length of 255 characters each.
     * 
     * Both **SyncRootIdentity** and **FileIdentity** are optional and when not provided their corresponding buffer lengths should be set to `0` as well. They are a way for a sync provider to persistently associate arbitrary data with a sync root.
     * 
     * The platform will provide **SyncRootIdentity** back to the sync provider in any callbacks to the sync provider. The sync root **FileIdentity** blob will be provided only when the subject of the callback is the sync root itself.
     * 
     * This facility is provided solely for the convenience of the sync provider, and both blobs have no special meaning outside of the sync provider.
     * 
     * The maximum-allowed length of **FileIdentity** is 4KB and the maximum-allowed length of **SyncRootIdentity** is 64KB. The API fails with **ERROR_INVALID_PARAMETER** when either maximum length is exceeded.
     * 
     * **ProviderId** is a GUID that is meant to identify a specific sync provider. It is optional. If not provided, the platform generates a GUID using the MD5 hash of the **ProviderName** string. The information is used for telemetry only such that the platform can better correlate activities from the same sync provider more efficiently and more accurately even if the sync provider registers sync roots with different **ProviderName** strings. It is recommended that a sync provider always supply the same GUID for all versions of its sync product(s). However, sync providers are free to choose different **ProviderName** strings for the sake of the best user experience.
     * @param {Pointer<CF_SYNC_POLICIES>} Policies The policies of the sync root to be registered.
     * @param {Integer} RegisterFlags Flags for registering previous and new sync roots.
     * 
     * | Flag | Description |
     * |--------|--------|
     * | **CF_REGISTER_FLAG_UPDATE** | A sync provider can pass **CF_REGISTER_FLAG_UPDATE** to re-register previously registered sync root identities and policies. |
     * | **CF_REGISTER_FLAG_DISABLE_ON_DEMAND_POPULATION_ON_ROOT** | The on-demand directory/folder population behavior is globally controlled by the population policy. This flag allows a sync provider to opt out of the on-demand population behavior just for the sync root itself while keeping on-demand population on for all other directories under the sync root. This is useful when the sync provider would like to pre-populate the immediate child files/directories of the sync root. |
     * | **CF_REGISTER_FLAG_MARK_IN_SYNC_ON_ROOT** | This flag allows a sync provider to mark the sync root to be registered in-sync simultaneously at the registration time. The alternative is to call [CfSetInSyncState](nf-cfapi-cfsetinsyncstate.md) on the sync root later. |
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfregistersyncroot
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
     * @remarks
     * Unregisters a sync root that was registered with [CfRegisterSyncRoot](nf-cfapi-cfregistersyncroot.md). This is typically called at the sync provider uninstall time, when a user account is deleted, or when a user opts to no longer sync a directory tree (if supported by the sync provider). If the sync root to be unregistered has never been registered before, the API fails with **STATUS_CLOUD_FILE_NOT_UNDER_SYNC_ROOT**.
     * 
     * The sync provider should have **WRITE_DATA** or **WRITE_DAC** access to the sync root to be unregistered, or  unregistration will fail with **HRESULT(ERROR_CLOUD_FILE_ACCESS_DENIED)**. Unregistration will also fail with **HRESULT(ERROR_CLOUD_FILE_INVALID_REQUEST)** if a sync provider is *connected* to the sync root.
     * 
     * Unregisters a sync root by traversing the directory tree of the sync root.
     * 
     * For placeholder files:
     * 
     * - If a placeholder file is fully hydrated, it is reverted back to a "normal" file.
     * - If a placeholder file is not hydrated, it is permanently deleted from the local machine.
     * 
     * For placeholder directories:
     * 
     * - If a placeholder directory is fully populated, it is reverted back to a "normal" directory.
     * - If a placeholder directory is not fully populated, the directory is permanently deleted from the local machine.
     * 
     * >[!NOTE]
     * >If the placeholder files or directories cannot be reverted or deleted, it will be skipped, and the unregistering process will continue until the full sync root tree has been traversed.
     * @param {PWSTR} SyncRootPath The path to the sync root to be unregistered.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfunregistersyncroot
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
     * @remarks
     * This initiates a bi-directional communication channel between the sync provider and the sync filter. A sync provider typically calls this API soon after startup, once it has been initialized and is ready to service requests.
     * 
     * The sync root must be registered with the platform prior to being connected. For a given *SyncRootPath*, there can be at most one connection established at any given time.
     * 
     *  The sync provider should have **WRITE_DATA** or **WRITE_DAC** access to the sync root to be connected or the API will be failed with **HRESULT(ERROR_CLOUD_FILE_ACCESS_DENIED)**.
     * @param {PWSTR} SyncRootPath The path to the sync root.
     * @param {Pointer<CF_CALLBACK_REGISTRATION>} CallbackTable The callback table to be registered. This parameter is how the sync provider tells the library which functions to call for various types of requests from the platform. It is an array of structures containing a callback type and associated function pointer. The sync provider only needs to register the callbacks it implements. The *CallbackTable* array should always end with **CF_CALLBACK_REGISTRATION_END**.
     * @param {Pointer<Void>} CallbackContext *CallbackContext* is provided for the convenience of the sync provider. The platform will remember this *CallbackContext* and pass it back to the sync provider any time one of its callback functions is invoked on the current sync root. A good use for the *CallbackContext* would be a pointer into the sync provider’s own structure that maintains state for this connection.
     * @param {Integer} ConnectFlags The sync provider can request additional information be provided when its callbacks are invoked by passing *ConnectFlags* to this API. The following flags are supported:
     * 
     * | Request | Description |
     * |--------|--------|
     * | **REQUEST_PROCESS_INFO** | The platform returns the full image path of the hydrating process in the callback parameters when this flag is specified. |
     * | **REQUIRE_FULL_FILE_PATH** | The platform returns the full path of the placeholder being requested in the callback parameters when this flag is specified. |
     * | **BLOCK_SELF_IMPLICIT_HYDRATION** | The implicit hydration, which is not performed via [CfHydratePlaceholder](nf-cfapi-cfhydrateplaceholder.md), can happen when Anti-Virus software scans sync provider’s file system activities on non-hydrated cloud file placeholders. This kind of implicit hydrations is not expected. If the sync provider never initiates implicit hydration operations itself, it can instruct the platform block all such implicit hydration operations as opposed to failing the **FETCH_DATA** callbacks later. |
     * @param {Pointer<CF_CONNECTION_KEY>} ConnectionKey On successful return, this API will return an opaque *ConnectionKey* back to the sync provider. This represents the communication channel that was just established, and the sync provider may remember the *ConnectionKey* and pass it when calling various sync provider APIs. If a sync provider only expects to establish a single connection, then the *ConnectionKey* could be stored in a global. However, the platform supports a single provider process connecting to multiple different sync roots at the same time, and for each connection there will be a different *ConnectionKey* returned. A good place to store each *ConnectionKey* would be inside the sync provider’s internal structure identified by the *CallbackContext*.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfconnectsyncroot
     * @since windows10.0.16299
     */
    static CfConnectSyncRoot(SyncRootPath, CallbackTable, CallbackContext, ConnectFlags, ConnectionKey) {
        SyncRootPath := SyncRootPath is String ? StrPtr(SyncRootPath) : SyncRootPath

        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("cldapi.dll\CfConnectSyncRoot", "ptr", SyncRootPath, "ptr", CallbackTable, CallbackContextMarshal, CallbackContext, "int", ConnectFlags, "ptr", ConnectionKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disconnects a communication channel created by CfConnectSyncRoot.
     * @remarks
     * This removes the communication channel with the platform that was previously established using [CfConnectSyncRoot](nf-cfapi-cfconnectsyncroot.md).
     * 
     * A sync provider can still receive callbacks during the **CfDisconnectSyncRoot** call, and the provider is free to choose whether the call needs to fail or be serviced. Either choice will not cause disruptions to the sync provider.
     * 
     * After a call to **CfDisconnectSyncRoot** returns, the sync provider will no longer receive callbacks and the platform will fail any operation that depends on said callbacks.
     * 
     * A sync provider should have **WRITE_DATA** or **WRITE_DAC** access to the sync root to be disconnected or a call to **CfDisconnectSyncRoot** will be failed with **HRESULT(ERROR_CLOUD_FILE_ACCESS_DENIED)**. Also, if the sync root has not been previously connected, the call will be failed with invalid parameters. This API could be called as part of gracefully shutting down the sync provider. However, if the sync provider process chooses to terminate without calling this API, or unexpectedly crashes, the platform will detect this and perform the necessary cleanup.
     * @param {CF_CONNECTION_KEY} ConnectionKey The connection key returned from [CfConnectSyncRoot](nf-cfapi-cfconnectsyncroot.md) that is now used to disconnect the sync root.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfdisconnectsyncroot
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
     * @remarks
     * This API is available for sync providers that may wish to proactively initiate a transfer of data into a placeholder, as an alternative to calling [CfHydratePlaceholder](nf-cfapi-cfhydrateplaceholder.md). **CfGetTransferKey** returns the same *TransferKey* that a fetch data callback would have returned. The sync provider can then pass the *TransferKey* in subsequent calls to the [CfExecute](nf-cfapi-cfexecute.md) API. In this way, the transfer of data is driven by the sync provider rather than the filter.
     * 
     * A sync provider should have **READ_DATA** or **WRITE_DAC** access to the file whose transfer key is to be obtained or **CfGetTransferKey** will be failed with **HRESULT(ERROR_CLOUD_FILE_ACCESS_DENIED)**.
     * 
     * The *TransferKey* is valid as long as the *FileHandle* used to obtain it remains open. The sync provider must pass the *TransferKey* to [CfExecute](nf-cfapi-cfexecute.md) to perform the desired operation on the placeholder file or folder. When a *TransferKey* is no longer being used, it must be released using [CfReleaseTransferKey](nf-cfapi-cfreleasetransferkey.md).
     * @param {HANDLE} FileHandle The file handle of the placeholder.
     * @returns {Integer} An opaque handle to the placeholder to be serviced.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgettransferkey
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
     * @remarks
     * **CfReleaseTransferKey** has no security requirement.
     * @param {HANDLE} FileHandle The file handle of the placeholder.
     * @param {Pointer<Integer>} TransferKey An opaque handle to the placeholder.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfreleasetransferkey
     * @since windows10.0.16299
     */
    static CfReleaseTransferKey(FileHandle, TransferKey) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        TransferKeyMarshal := TransferKey is VarRef ? "int64*" : "ptr"

        DllCall("cldapi.dll\CfReleaseTransferKey", "ptr", FileHandle, TransferKeyMarshal, TransferKey)
    }

    /**
     * The main entry point for all connection key based placeholder operations. It is intended to be used by a sync provider to respond to various callbacks from the platform.
     * @remarks
     * A valid call to **CfExecute** will reset the timers of all pending callback requests that belong to the same sync provider process.
     * 
     * **CfExecute** takes two variable-sized arguments, i.e., [CF_OPERATION_INFO](ns-cfapi-cf_operation_info.md) and [CF_OPERATION_PARAMETERS](ns-cfapi-cf_operation_parameters.md), with one identifying the operation type and the other supplying detailed operation parameters.
     * Both arguments start with a **StructSize** field at the beginning of the corresponding structures. Callers of **CfExecute** are responsible for accurate accounting of the structure size.
     * 
     * The platform provides **ConnectionKey**, **TransferKey**, and **CorrelationVector** to all callback functions registered with [CfConnectSyncRoot](nf-cfapi-cfconnectsyncroot.md). Additionally, sync providers can obtain **TransferKey** using **CfGetTransferKey** and **CorrelationVector** using [CfGetCorrelationVector](nf-cfapi-cfgetcorrelationvector.md).
     * 
     * Optionally, sync providers can supply a sync status blob to the platform. If a non-null pointer is set in the **SyncStatus** field in **CF_OPERATION_INFO**, its content will be retained on the file until the last handle on it is removed. The platform will query this information upon any failed operations on a cloud file placeholder. If one is available, the platform will use the information provided to construct a more meaningful and actionable message to the user.
     * 
     * If a null pointer is set in the **SyncStatus** field in **CF_OPERATION_INFO**, the platform will clear the previously set sync status (if one exists).
     * 
     * All operations can be performed in an arbitrary thread context in the sync provider process.
     * @param {Pointer<CF_OPERATION_INFO>} OpInfo Information about an operation on a placeholder.
     * @param {Pointer<CF_OPERATION_PARAMETERS>} OpParams Parameters of an operation on a placeholder.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfexecute
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
     * @param {Integer} ProviderStatus The current status of the sync provider. The status persists for the life of the sync root connection. The sync root connection is torn down either when [CfDisconnectSyncRoot](nf-cfapi-cfdisconnectsyncroot.md) is called or if the sync provider process is terminated.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfupdatesyncproviderstatus
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
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfquerysyncproviderstatus
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
     * @remarks
     * When a non-null [CF_SYNC_STATUS](ns-cfapi-cf_sync_status.md) is provided in the *SyncStatus* parameter, the information will be remembered on the sync root until it is cleared explicitly by the sync provider or when the machine reboots. The platform will query this information upon any failed operations on a cloud file placeholder, using the following process:
     * 
     * 1. The platform will first search for sync status at the file level.
     * 2. If no sync status is found, the platform will then search for sync status registered at the sync root level, which is done through this function.
     * 3. Once a sync status is located, the platform will use the information provided to construct a more meaningful and actionable message to the user.
     * 
     * **CfReportSyncStatus** clears the previously-saved sync status when being called with a `NULL` sync status. No change will be made to the existing sync status if the function call fails.
     * @param {PWSTR} SyncRootPath Path to the sync root.
     * @param {Pointer<CF_SYNC_STATUS>} SyncStatus The sync status to report; if `NULL`, clears the previously-saved sync status. For more information, see the [Remarks](#-remarks) section, below.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfreportsyncstatus
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
     * @remarks
     * Creating a placeholder with this function is preferred compared to creating a new file with [CreateFile](/windows/win32/api/fileapi/nf-fileapi-createfilea) and then converting it to a placeholder with [CfConvertToPlaceholder](nf-cfapi-cfconverttoplaceholder.md); both for efficiency and because it eliminates the time window where the file is not a placeholder. The function can also create multiple files or directories in a batch, which can also be more efficient.
     * 
     * This function is useful when performing an initial sync of files or directories from the cloud down to the client, or when syncing down a newly created single file or directory from the cloud.
     * @param {PWSTR} BaseDirectoryPath Path to the local directory in which the placeholders are created. Keep the following in mind when specifying the path:
     * 
     * - This path must be contained in a registered sync root tree. It can be the sync root directory itself, or any descendant directory. Otherwise, the call will fail with **STATUS_CLOUD_FILE_NOT_UNDER_SYNC_ROOT**.
     * - The sync root must be registered with a valid hydration policy that is not **CF_HYDRATION_POLICY_ALWAYS_FULL**, otherwise the call will fail with **STATUS_CLOUD_FILE_NOT_SUPPORTED**.
     * - The caller must have **WRITE_DATA** or **WRITE_DAC** access to the base directory under which the placeholder is about to be created. Otherwise the operation will be failed with **STATUS_CLOUD_FILE_ACCESS_DENIED**.
     * @param {Pointer<CF_PLACEHOLDER_CREATE_INFO>} PlaceholderArray On successful creation, the *PlaceholderArray* contains the final USN value and a `STATUS_OK` message. On return, this array contains an **HRESULT** value describing whether the placeholder was created or not. *PlaceholderArray* points to an array of placeholders to be created, relative to *BaseDirectoryPath*. Each entry in the array includes the following fields:
     * 
     * - **RelativeFileName** is the name of the child placeholder, both file and directory, to be created.
     * - **FsMetadata** contains file system metadata about the placeholder to be created, including all timestamps, file attributes and file size (*optional for directories*).
     * - **FileIdentity** and **FileIdentityLength** describe a user mode buffer that contains the opaque file information supplied by the sync provider. The **FileIdentity** blob should not exceed **CF_PLACEHOLDER_MAX_FILE_IDENTITY_LENGTH** (defined to 4KB) in size. **FileIdentity** gets passed back to the sync provider in all callbacks. This is a mandatory field for files.
     * 
     * A sync provider can choose the following flags or a combination of them on a per-placeholder basis:
     * 
     * - **CF_PLACEHOLDER_CREATE_FLAG_DISABLE_ON_DEMAND_POPULATION** - This flag is applicable for a child placeholder directory only. When the flag is present, the newly created child placeholder directory is considered to have all of its children present locally hence accessing it in the future will not trigger any **FETCH_PLACEHOLDERS** callback on it. When the flag is absent, the newly created placeholder directory is considered partial and future access will trigger **FETCH_PLACEHOLDERS**.
     * - **CF_PLACEHOLDER_CREATE_FLAG_MARK_IN_SYNC** - This flag is applicable for both placeholder files and directories. When this flag is present, the newly created placeholder will be marked as in-sync as part of the **TRANSFER_PLACEHOLDERS** operation.
     * - **CF_PLACEHOLDER_CREATE_FLAG_ALWAYS_FULL** - This flag is enforced on a placeholder file only. It can be set on a placeholder directory, but it has no effect. When this flag is present, the newly created placeholder will be marked as always full. Once hydrated, any attempt to dehydrate such a file placeholder will fail with error code **ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED**.
     * @param {Integer} PlaceholderCount The count of placeholders in the *PlaceholderArray*.
     * @param {Integer} CreateFlags Flags for configuring the creation of a placeholder. *CreateFlags* can be set to the following values:
     * 
     * - **CF_CREATE_FLAG_NONE** is the default mode where the API processes all entries in the array even when errors are encountered.
     * - **CF_CREATE_FLAG_STOP_ON_ERROR** causes the API to return immediately if creation of a placeholder fails. In that case, the API returns the failure code.
     * @returns {Integer} The number of entries processed, including failed entries. If **CF_CREATE_FLAG_STOP_ON_ERROR** was not specified in *CreateFlags*, the API returns the first failure code encountered, but continues processing as many entries as possible; the caller must then inspect the array to see which placeholder creation(s) failed.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfcreateplaceholders
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
     * @remarks
     * When the oplock is broken, the API will handle the break notification automatically on behalf of the caller by draining all active requests and then closing the underlying Win32 handle.  
     * 
     * This aims to remove the complexity related to oplock usages. The caller must close the handle returned by **CfOpenFileWithOplock** with [CfCloseHandle](nf-cfapi-cfclosehandle.md).
     * @param {PWSTR} FilePath Fully qualified path to the file or directory to be opened.
     * @param {Integer} Flags 
     * @param {Pointer<HANDLE>} ProtectedHandle An opaque handle to the file or directory that is just opened. Note that this is not a normal Win32 handle and hence cannot be used with non-CfApi Win32 APIs directly.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfopenfilewithoplock
     * @since windows10.0.16299
     */
    static CfOpenFileWithOplock(FilePath, Flags, ProtectedHandle) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath

        result := DllCall("cldapi.dll\CfOpenFileWithOplock", "ptr", FilePath, "int", Flags, "ptr", ProtectedHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allows the caller to reference a protected handle to a Win32 handle which can be used with non-CfApi Win32 APIs.
     * @remarks
     * Every **CfReferenceProtectedHandle** call must be matched  with a [CfReleaseProtectedHandle](nf-cfapi-cfreleaseprotectedhandle.md) call. It is not recommended to reference a protected handle for a long period of time, as doing so will prevent the oplock break notification from being acknowledged.
     * 
     * The caller should instead break up long running tasks into smaller sub-tasks and reference/release the protected handle for each sub-task.
     * @param {HANDLE} ProtectedHandle The protected handle of a placeholder file.
     * @returns {BOOLEAN} If this function succeeds, it returns `TRUE`. Otherwise, it returns `FALSE`.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfreferenceprotectedhandle
     * @since windows10.0.16299
     */
    static CfReferenceProtectedHandle(ProtectedHandle) {
        ProtectedHandle := ProtectedHandle is Win32Handle ? NumGet(ProtectedHandle, "ptr") : ProtectedHandle

        result := DllCall("cldapi.dll\CfReferenceProtectedHandle", "ptr", ProtectedHandle, "char")
        return result
    }

    /**
     * Converts a protected handle to a Win32 handle so that it can be used with all handle-based Win32 APIs.
     * @remarks
     * The caller must have referenced the protected handle prior to this call using [CfReferenceProtectedHandle](nf-cfapi-cfreferenceprotectedhandle.md) to ensure that the use of the Win32 handle is tracked, and the Win32 API call that consumes the Win32 handle is synchronized with the oplock break notification acknowledgment.
     * 
     * The caller must release the reference on the protected handle after being done with the Win32 handle using [CfReleaseProtectedHandle](nf-cfapi-cfreleaseprotectedhandle.md).
     * 
     * In no circumstances should the caller close the Win32 handle returned using [CfCloseHandle](nf-cfapi-cfclosehandle.md).
     * @param {HANDLE} ProtectedHandle The protected handle to be converted.
     * @returns {HANDLE} The corresponding Win32 handle.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetwin32handlefromprotectedhandle
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
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfreleaseprotectedhandle
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
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfclosehandle
     * @since windows10.0.16299
     */
    static CfCloseHandle(FileHandle) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        DllCall("cldapi.dll\CfCloseHandle", "ptr", FileHandle)
    }

    /**
     * Converts a normal file/directory to a placeholder file/directory.
     * @remarks
     * In the file case, the caller must acquire an exclusive handle to the file if it also intends to dehydrate the file at the same time or data corruption can occur. To minimize the impact on user applications it is highly recommended that the caller obtain the exclusiveness using proper oplocks (via [CfOpenFileWithOplock](nf-cfapi-cfopenfilewithoplock.md)) as opposed to using a share-nothing handle.
     * 
     * To convert a placeholder:
     * 
     * - The file or directory to be converted must be contained in a registered sync root tree; it can be the sync root directory itself, or any descendant directory; otherwise, the call with be failed with **HRESULT(ERROR_CLOUD_FILE_NOT_UNDER_SYNC_ROOT)**.
     * - If dehydration is requested, the sync root must be registered with a valid hydration policy that is not **CF_HYDRATION_POLICY_ALWAYS_FULL**; otherwise the call will be failed with **HRESULT(ERROR_CLOUD_FILE_NOT_SUPPORTED)**.
     * - If dehydration is requested, the placeholder must not be pinned locally or the call with be failed with **HRESULT(ERROR_CLOUD_FILE_PINNED)**.
     * - If dehydration is requested, the placeholder must be in sync or the call with be failed with **HRESULT(ERROR_CLOUD_FILE_NOT_IN_SYNC)**.
     * - The caller must have **WRITE_DATA** or **WRITE_DAC** access to the file or directory to be converted. Otherwise the operation will be failed with **HRESULT(ERROR_CLOUD_FILE_ACCESS_DENIED)**.
     * 
     * If the API returns **HRESULT_FROM_WIN32(ERROR_IO_PENDING)** when using *Overlapped* asynchronously, the caller can then wait using [GetOverlappedResult](/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult).
     * @param {HANDLE} FileHandle Handle to the file or directory to be converted.
     * @param {Pointer} FileIdentity A user mode buffer that contains the opaque file or directory information supplied by the caller. Optional if the caller is not dehydrating the file at the same time, or if the caller is converting a directory. *FileIdentity* gets passed back to the sync provider in all callbacks. Cannot exceed 4KB in size.
     * @param {Integer} FileIdentityLength Length, in bytes, of the *FileIdentity*.
     * @param {Integer} ConvertFlags Placeholder conversion flags. *ConvertFlags* can be set to the following values:
     * 
     * | Flag | Description |
     * |--------|--------|
     * | **CF_CONVERT_FLAG_MARK_IN_SYNC** | If this is specified, the platform marks the converted placeholder as in sync with cloud upon a successful conversion of the file. |
     * | **CF_CONVERT_FLAG_DEHYDRATE** | This is applicable for files only. When specified, the platform dehydrates the file after converting it to a placeholder successfully. The caller must acquire an exclusive handle when specifying this flag or data corruptions can occur. Note that the platform does not validate the exclusiveness of the handle. |
     * | **CF_CONVERT_FLAG_ENABLE_ON_DEMAND_POPULATION** | This is applicable for directories only. When specified, it marks the converted placeholder directory partially populated such that any future access to it will result in a **FETCH_PLACEHOLDERS** callback sent to the sync provider. |
     * | **CF_CONVERT_FLAG_ALWAYS_FULL** | This is effective on placeholder files only. Once a file is converted to a placeholder with this flag, the placeholder is marked always full. Any attempt to dehydrate such a placeholder will fail with error code **ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED**. |
     * | **CF_CONVERT_FLAG_FORCE_CONVERT_TO_CLOUD_FILE** | When specified, the platform allows a sync engine to atomically convert a non-cloud files placeholder (having another reparse tag/data) to a cloud files placeholder. Note that the API normally fails conversion of any non-placeholder file to a placeholder.<br/><br/>The combination **(CF\_CONVERT\_FLAG\_FORCE\_CONVERT\_TO\_CLOUD\_FILE \| CF\_CONVERT\_FLAG\_DEHYDRATE)** is especially useful in migration scenarios when certain providers are migrating from another platform to cloud files platform and they intend to convert hydrated placeholders on the older platform to dehydrated placeholders on the cloud files platform atomically. Just this flag should be passed for converting full placeholders to cloud files placeholders. If the older platform implements full files as a regular, non-placeholder files, this flag is not needed. Passing this flag on a directory converts directories to cloud files as well, though the **DEHYDRATE** flag doesn’t apply to directories.<br/><br/>Even when the policy **CF\_PLACEHOLDER\_MANAGEMENT\_POLICY\_CONVERT\_TO\_UNRESTRICTED** was specified with [CfRegisterSyncRoot](nf-cfapi-cfregistersyncroot.md), only processes that have registered/connected to the cloud files sync root are allowed to specify this flag.<br/><br/>**Note:** The flag is supported only if the `PlatformVersion.IntegrationNumber` obtained from [CfGetPlatformInfo](nf-cfapi-cfgetplatforminfo.md) is `0x500` or higher. |
     * @param {Pointer<OVERLAPPED>} Overlapped When specified and combined with an asynchronous *FileHandle*, *Overlapped* allows the platform to perform the **CfConvertToPlaceholder** call asynchronously. See the [Remarks](#-remarks) for more details.
     * 
     * If not specified, the platform will perform the API call synchronously, regardless of how the handle was created.
     * @returns {Integer} When specified, this is the final USN value after convert actions are performed.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfconverttoplaceholder
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
     * @remarks
     * To update a placeholder:
     * 
     * - The placeholder to be updated must be contained in a registered sync root tree; it can be the sync root directory itself, or any descendant directory; otherwise, the call with be failed with **HRESULT(ERROR_CLOUD_FILE_NOT_UNDER_SYNC_ROOT)**.
     * - If dehydration is requested, the sync root must be registered with a valid hydration policy that is not **CF_HYDRATION_POLICY_ALWAYS_FULL**; otherwise the call will be failed with **HRESULT(ERROR_CLOUD_FILE_NOT_SUPPORTED)**.
     * - If dehydration is requested, the placeholder must not be pinned locally or the call with be failed with **HRESULT(ERROR_CLOUD_FILE_PINNED)**.
     * - If dehydration is requested, the placeholder must be in sync or the call with be failed with **HRESULT(ERROR_CLOUD_FILE_NOT_IN_SYNC)**.
     * - The caller must have **WRITE_DATA** or **WRITE_DAC** access to the placeholder to be updated. Otherwise the operation will be failed with **HRESULT(ERROR_CLOUD_FILE_ACCESS_DENIED)**.
     * 
     * If the API returns **HRESULT_FROM_WIN32(ERROR_IO_PENDING)** when using *Overlapped* asynchronously, the caller can then wait using [GetOverlappedResult](/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult).
     * @param {HANDLE} FileHandle *FileHandle* is a handle to the file or directory whose metadata is to be updated. In the case of a file, the caller must acquire an exclusive handle to the file if it also intends to dehydrate the file at the same time or data corruption can occur. To minimize the impact on user applications, it is highly recommended that the caller obtain the exclusiveness using proper oplocks (via [CfOpenFileWithOplock](nf-cfapi-cfopenfilewithoplock.md)) as opposed to using a share-nothing handle.
     * @param {Pointer<CF_FS_METADATA>} FsMetadata *FsMetadata* contains file system metadata about the placeholder to be updated, including all timestamps, file attributes, and file size (optional for directories). This is an optional field. If not provided, all these fields remain intact after the call.
     * 
     * - A `0` value in a **timestamp** field (**CreationTime**, **LastAccessTime**, **LastWriteTime**, and **ChangeTime**) means no change to the current timestamp on the file.
     * - A `0` value in **FileAttributes** means no change to the current file attributes on the file.
     * - There is no special value in **FileSize**; a `0` value in **FileSize** truncates the file size to `0`.
     * @param {Pointer} FileIdentity *FileIdentity* is a user mode buffer that contains the opaque file or directory information supplied by the caller. The *FileIdentity* blob should not exceed 4KB in size. *FileIdentity* gets passed back to the sync provider in all callbacks. This is optional if an update is not needed or if the caller wants to remove the *FileIdentity* blob from the placeholder to be updated.
     * @param {Integer} FileIdentityLength Length, in bytes, of the *FileIdentity*.
     * @param {Pointer<CF_FILE_RANGE>} DehydrateRangeArray This array specifies ranges of the existing placeholder that will no longer be considered valid after the update.
     * 
     * The simplest use of this parameter is to pass a single range, telling the platform that the entire byte range of data is now invalid. A more complex use of this parameter is to provide a series of discrete ranges to be considered invalid. This implies that the sync provider can distinguish changes on a sub-file level. All the offsets and lengths should be **PAGE_SIZE** Aligned. The platform will ensure that all the ranges specified get dehydrated as part of the update. If dehydration of any ranges fails the API will fail rather than result in torn file contents.
     * 
     * >[!NOTE]
     * >Passing a single range with Offset **0** and Length **CF_EOF** will invalidate the entire file - This has the same effect as passing the flag **CF_UPDATE_FLAG_DEHYDRATE** instead. Also, passing **CF_UPDATE_FLAG_DEHYDRATE** causes *DehydrateRangeArray* to be silently dropped
     * @param {Integer} DehydrateRangeCount The count of a series of discrete *DehydrateRangeArray* partitions of placeholder data.
     * @param {Integer} UpdateFlags Update flags for placeholders. UpdateFlags can be set to the following values:
     * 
     * | Flag | Description |
     * |--------|--------|
     * | **CF_UPDATE_FLAG_VERIFY_IN_SYNC** | The update will fail if the **IN_SYNC** attribute is not currently set on the placeholder. This is to prevent a race between syncing changes from the cloud down to a local placeholder and the placeholder’s data stream getting locally modified. |
     * | **CF_UPDATE_FLAG_MARK_IN_SYNC** | The platform marks the placeholder as in-sync upon a successful update placeholder operation. |
     * | **CF_UPDATE_FLAG_DEHYDRATE** | Applicable for files only. When specified, the platform dehydrates the file after updating the placeholder successfully. The caller must acquire an exclusive handle when specifying this flag or data corruptions can occur. Note that the platform does not validate the exclusiveness of the handle. |
     * | **CF_UPDATE_FLAG_ENABLE_ON_DEMAND_POPULATION** | Applicable for directories only. When specified, it marks the updated placeholder directory partially populated such that any future access to it will result in a **FETCH_PLACEHOLDERS** callback sent to the sync provider. |
     * | **CF_UPDATE_FLAG_DISABLE_ON_DEMAND_POPULATION** | Applicable for directories only. When specified, it marks the updated placeholder directory fully populated such that any future access to it will be handled by the platform without any callbacks to the sync provider. |
     * | **CF_UPDATE_FLAG_REMOVE_FILE_IDENTITY** | *FileIdentity* and *FileIdentityLength* are ignored and the platform will remove the existing file identity blob on the placeholder upon a successful update call. |
     * | **CF_UPDATE_FLAG_CLEAR_IN_SYNC** | The platform marks the placeholder as not in-sync upon a successful update placeholder operation. |
     * | **CF_UPDATE_FLAG_REMOVE_PROPERTY** | The platform removes all existing extrinsic properties on the placeholder. |
     * | **CF_UPDATE_FLAG_PASSTHROUGH_FS_METADATA** | The platform passes **CF_FS_METADATA** to the file system without any filtering; otherwise the platform skips setting any fields whose value is `0`. |
     * | **CF_UPDATE_FLAG_ALWAYS_FULL** | Effective on placeholder files only. When specified, the placeholder to be updated is marked always full. Once hydrated, any attempt to dehydrate such a placeholder file will fail with error code **ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED**. |
     * | **CF_UPDATE_FLAG_ALLOW_PARTIAL** | Effective on placeholder files only. When specified, the always full state on a placeholder file, if present, is cleared thus allowing it to be dehydrated again. It is invalid to specify this flag along with **CF_UPDATE_FLAG_ALWAYS_FULL** and error code **ERROR_CLOUD_FILE_INVALID_REQUEST** will be returned as a result. |
     * @param {Pointer<Integer>} UpdateUsn On input, *UpdateUsn* instructs the platform to only perform the update if the file still has the same USN value as the one passed in. This serves a similar purpose to **CF_UPDATE_FLAG_VERIFY_IN_SYNC** but also encompasses local metadata changes. Passing a pointer to a USN value of `0` on input is the same as passing a `NULL` pointer.
     * 
     * On return, *UpdateUsn* receives the final USN value after update actions were performed.
     * @param {Pointer<OVERLAPPED>} Overlapped When specified and combined with an asynchronous *FileHandle*, *Overlapped* allows the platform to perform the **CfUpdatePlaceholder** call asynchronously. See the [Remarks](#-remarks) for more details.
     * 
     * If not specified, the platform will perform the API call synchronously, regardless of how the handle was created.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfupdateplaceholder
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
     * @remarks
     * The caller must have **WRITE_DATA** or **WRITE_DAC** access to the placeholder to be reverted.
     * 
     * If the placeholder is not already fully hydrated at the time of the call, then the filter will send a **FETCH_DATA** callback to the sync provider  to hydrate the file. If the file can’t be hydrated, the revert will fail with status **STATUS_CLOUD_FILE_ACCESS_DENIED**.
     * 
     * If the API returns HRESULT_FROM_WIN32(ERROR_IO_PENDING) when using *Overlapped* asynchronously, the caller can then wait using [GetOverlappedResult](/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult).
     * @param {HANDLE} FileHandle A handle to the file or directory placeholder that is about to be reverted to a normal file or directory. The platform properly synchronizes the revert operation with other active requests. An attribute or no-access handle is sufficient.
     * @param {Integer} RevertFlags Placeholder revert flags. *RevertFlags* should be set to **CF_REVERT_FLAG_NONE**.
     * @param {Pointer<OVERLAPPED>} Overlapped When specified and combined with an asynchronous *FileHandle*, *Overlapped* allows the platform to perform the **CfRevertPlaceholder** call asynchronously. See the [Remarks](#-remarks) for more details.
     * 
     * If not specified, the platform will perform the API call synchronously, regardless of how the handle was created.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfrevertplaceholder
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
     * @remarks
     * The caller must have **READ_DATA** or **WRITE_DAC** access to the placeholder to be hydrated.
     * 
     * If the API returns **HRESULT_FROM_WIN32(ERROR_IO_PENDING)** when using *Overlapped* asynchronously, the caller can then wait using [GetOverlappedResult](/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult).
     * @param {HANDLE} FileHandle Handle of the placeholder file to be hydrated. An attribute or no-access handle is sufficient.
     * @param {Integer} StartingOffset The starting point offset of the placeholder file data.
     * @param {Integer} Length The length, in bytes, of the placeholder file whose data must be available locally on the disk after the API completes successfully. A length of `CF_EOF` (defined as -1) signifies end of file. For any subrange that is not present in the placeholder, the platform will fetch the data from the sync provider and store it on disk in the placeholder.
     * @param {Integer} HydrateFlags The placeholder hydration flags. *HydrateFlags* must be set to **CF_HYDRATE_FLAG_NONE**.
     * @param {Pointer<OVERLAPPED>} Overlapped When specified and combined with an asynchronous *FileHandle*, *Overlapped* allows the platform to perform the **CfHydratePlaceholder** call asynchronously. See the [Remarks](#-remarks) for more details.
     * 
     * If not specified, the platform will perform the API call synchronously, regardless of how the handle was created.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfhydrateplaceholder
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
     * @remarks
     * When specified and combined with an asynchronous *FileHandle*, *Overlapped* allows the platform to perform the call asynchronously.  
     * 
     * The caller must have initialized the overlapped structure with an event to wait on. If this returns **HRESULT_FROM_WIN32(ERROR_IO_PENDING)**, the caller can then wait using [GetOverlappedResult](/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult). If not specified, the platform will perform the API call synchronously, regardless of how the handle was created.
     * @param {HANDLE} FileHandle The handle of the placeholder file. The platform properly synchronizes the operation with other active requests. An attribute or no-access handle is sufficient. The caller must have **READ_DATA** or **WRITE_DAC** access to the placeholder, otherwise the operation will be failed with **STATUS_CLOUD_FILE_ACCESS_DENIED**.
     * @param {Integer} PinState The pin state of the placeholder file. For a list of valid *PinState* values, see [CF_PIN_STATE](ne-cfapi-cf_pin_state.md).
     * @param {Integer} PinFlags The pin state flags. *PinFlags* can be set to the following values:
     * 
     * - If **CF_PIN_FLAG_RECURSE** is specified, the platform applies the pin state to *FileHandle* and every file recursively beneath it (relevant only if *FileHandle* is a handle to a directory).
     * - If **CF_PIN_FLAG_RECURSE_ONLY** is specified, the platform applies the pin state to every file recursively beneath *FileHandle*, but not to *FileHandle* itself.
     * - If **CF_PIN_FLAG_RECURSE_STOP_ERROR** is specified, the platform will stop the recursion when encountering first error. Otherwise, the platform skips the error and continues the recursion.
     * @param {Pointer<OVERLAPPED>} Overlapped Allows the call to be performed asynchronously. See the [Remarks](#-remarks) section for more details.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfsetpinstate
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
     * @param {HANDLE} FileHandle A handle to the placeholder. The platform properly synchronizes the operation with other active requests. An attribute or no-access handle is sufficient. The caller must have **WRITE_DATA** or **WRITE_DAC** access to the placeholder.
     * @param {Integer} InSyncState 
     * @param {Integer} InSyncFlags The in-sync state flags. See [CF_SET_IN_SYNC_FLAGS](ne-cfapi-cf_set_in_sync_flags.md) for more details.
     * @param {Pointer<Integer>} InSyncUsn When specified, on input, *InSyncUsn* instructs the platform to only perform in-sync setting if the file still has the same USN value as the one passed in. This is to close a race where the sync provider has just sync’d placeholder changes up to the cloud, but before the call to **CfSetInSyncState**, the placeholder changed in some way. Passing a pointer to a USN value of `0` on input is the same as passing a `NULL` pointer. On return, *InSYncUsn* receives the final USN value after setting the in-sync state.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfsetinsyncstate
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
     * @remarks
     * The platform automatically assigns a correlation vector to each file when it is first opened, and provides this correlation vector with each callback to the sync provider as part of the common [CF_CALLBACK_INFO](ns-cfapi-cf_callback_info.md). It is suggested that the sync engine call this function to increment the last digit of the correlation vector “clock” as the sync provider progresses through internal stages (as defined by the sync provider) of satisfying the request.
     * @param {HANDLE} FileHandle The handle to the placeholder file. The platform properly synchronizes the operation with other active requests. An attribute or no-access handle is sufficient.
     * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector A specific correlation vector to be associated with the *FileHandle*.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfsetcorrelationvector
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
     * @remarks
     * The caller must have **READ_DATA** or **WRITE_DAC** access to the placeholder to be hydrated. Otherwise the operation will be failed with **STATUS_CLOUD_FILE_ACCESS_DENIED**.
     * @param {HANDLE} FileHandle The handle to the placeholder file. The platform properly synchronizes the operation with other active requests. An attribute or no-access handle is sufficient.
     * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector The correlation vector currently associated with the *FileHandle*.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetcorrelationvector
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
     * @remarks
     * The *FileAttributes* and *ReparseTag* can be obtained by listing the directory containing the file or by directly querying *FileAttributeTagInfo* on the file.
     * 
     * The following [CF_PLACEHOLDER_STATE](ne-cfapi-cf_placeholder_state.md) values can be returned:
     * 
     * | Placeholder state | Description |
     * | **CF_PLACEHOLDER_STATE_NO_STATES** | When returned, the file or directory whose attributes and reparse tag examined by the API is not a cloud files placeholder. |
     * | **CF_PLACEHOLDER_STATE_PLACEHOLDER** | When set, the file or directory whose attributes and reparse tag examined by the API is a cloud files placeholder. |
     * | **CF_PLACEHOLDER_STATE_SYNC_ROOT** | When set, the directory is not only a cloud files placeholder directory but also the sync root. |
     * | **CF_PLACEHOLDER_STATE_ESSENTIAL_PROP_PRESENT** | When set, the file or directory must be a cloud files placeholder, and there exists an essential property in the property store of the file or directory. |
     * | **CF_PLACEHOLDER_STATE_IN_SYNC** | When set, the file or directory must be a cloud files placeholder, and its content is in sync with the cloud. |
     * | **CF_PLACEHOLDER_STATE_PARTIAL** | When set, the file or directory must be a cloud files placeholder, and its content is not ready to be consumed by the user application (though it may or may not be fully present locally). An example is a placeholder file whose content has been fully downloaded to the local disk but yet to be validated by a sync provider that has registered the sync root with the hydration modifier **VERIFICATION_REQUIRED**. |
     * | **CF_PLACEHOLDER_STATE_PARTIALLY_ON_DISK** | When set, the file or directory must be a cloud files placeholder and its content is not fully present locally. When **PARTIALLY_ON_DISK** is set, **PARTIAL** must also be set. |
     * | **CF_PLACEHOLDER_STATE_INVALID** | This is an invalid state when the API fails to parse the various information of the file or directory. |
     * @param {Integer} FileAttributes The file attribute information.
     * @param {Integer} ReparseTag The reparse tag information from a file.
     * @returns {Integer} Can include [CF_PLACEHOLDER_STATE](ne-cfapi-cf_placeholder_state.md); the placeholder state.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetplaceholderstatefromattributetag
     * @since windows10.0.16299
     */
    static CfGetPlaceholderStateFromAttributeTag(FileAttributes, ReparseTag) {
        result := DllCall("cldapi.dll\CfGetPlaceholderStateFromAttributeTag", "uint", FileAttributes, "uint", ReparseTag, "uint")
        return result
    }

    /**
     * Gets a set of placeholder states based on the various information of the file.
     * @remarks
     * The input is a buffer containing information returned by [GetFileInformationByHandleEx](/windows/win32/api/winbase/nf-winbase-getfileinformationbyhandleex), and the corresponding *InfoClass* so the API knows how to interpret the buffer.
     * 
     * Not all information classes supported by [GetFileInformationByHandleEx](/windows/win32/api/winbase/nf-winbase-getfileinformationbyhandleex) are supported by this API. If the *FileAttributes* and *ReparseTag* can’t be extracted from a given information class, this API will return **CF_PLACEHOLDER_STATE_INVALID** and set last error properly.
     * @param {Pointer<Void>} InfoBuffer An info buffer about the file.
     * @param {Integer} InfoClass An info class so the function knows how to interpret the *InfoBuffer*.
     * @returns {Integer} Can include [CF_PLACEHOLDER_STATE](ne-cfapi-cf_placeholder_state.md); the placeholder state.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetplaceholderstatefromfileinfo
     * @since windows10.0.16299
     */
    static CfGetPlaceholderStateFromFileInfo(InfoBuffer, InfoClass) {
        InfoBufferMarshal := InfoBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("cldapi.dll\CfGetPlaceholderStateFromFileInfo", InfoBufferMarshal, InfoBuffer, "int", InfoClass, "uint")
        return result
    }

    /**
     * Gets a set of placeholder states based on the WIN32_FIND_DATA structure.
     * @remarks
     * The **WIN32_FIND_DATA** structure is obtained from the [FindFirstFile](/windows/win32/api/fileapi/nf-fileapi-findfirstfilea)/[FindNextFile](/windows/win32/api/fileapi/nf-fileapi-findnextfilea) functions.
     * @param {Pointer<WIN32_FIND_DATAA>} FindData The find data information on the file.
     * @returns {Integer} Can include [CF_PLACEHOLDER_STATE](ne-cfapi-cf_placeholder_state.md); the placeholder state.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetplaceholderstatefromfinddata
     * @since windows10.0.16299
     */
    static CfGetPlaceholderStateFromFindData(FindData) {
        result := DllCall("cldapi.dll\CfGetPlaceholderStateFromFindData", "ptr", FindData, "uint")
        return result
    }

    /**
     * Gets various characteristics of a placeholder file or folder.
     * @remarks
     * Placeholder information includes the following attributes:
     * 
     * | Attribute | Description |
     * |--------|--------|
     * | OnDiskDataSize | The total number of bytes on disk. |
     * | ValidatedDataSize | The total number of bytes that are in sync with the cloud. |
     * | ModifiedDataSize | The total number of bytes that have been overwritten/appended locally, i.e., not in sync with the cloud. |
     * | PropertiesSize | The total number of bytes on disk that is used by all the property blobs. |
     * | PinState | Refer to [CfSetPinState](nf-cfapi-cfsetpinstate.md) for more information. |
     * | InSyncState | Refer to [CfSetInSyncState](nf-cfapi-cfsetinsyncstate.md) for more information. |
     * | FileId | A 64-bit volume wide non-volatile number that uniquely identifies a file or directory. |
     * | SyncRootFileId | The file ID of the sync root directory under which the file whose placeholder information is to be queried resides. |
     * | FileIdentity | An opaque blob supplied by the sync provider to the platform when the placeholder was created. File identity is provided for all sync provider callbacks. |
     * | FileIdentityLength | The length of the file identity in bytes. |
     * @param {HANDLE} FileHandle A handle to the placeholder whose information will be queried. Unlike most cloud files APIs that take a file handle, this one does not modify the file in any way. Therefore, the file handle only requires **READ_ATTRIBUTES** access.
     * @param {Integer} InfoClass Placeholder information. This can be set to either [CF_PLACEHOLDER_STANDARD_INFO](ns-cfapi-cf_placeholder_standard_info.md) or [CF_PLACEHOLDER_BASIC_INFO](ns-cfapi-cf_placeholder_basic_info.md).
     * @param {Pointer} InfoBuffer A pointer to a buffer that will receive information about the placeholder.
     * @param {Integer} InfoBufferLength The length of the *InfoBuffer*, in bytes. If the buffer is not large enough to hold all the information requested, the API will return as much data as it can fit into the buffer, and the call will fail with **HRESULT_FROM_WIN32(ERROR_MORE_DATA)**.
     * @returns {Integer} The number of bytes returned in the *InfoBuffer*.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetplaceholderinfo
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
     * @remarks
     * If the file is not underneath a cloud files sync root, the API will fail. On success, information is returned according to the specific *InfoClass* requested.
     * 
     * The *InfoClass* parameter can be one of the following values from [CF_SYNC_ROOT_INFO_CLASS](ne-cfapi-cf_sync_root_info_class.md):
     * 
     * - CF_SYNC_ROOT_INFO_BASIC
     * - CF_SYNC_ROOT_INFO_STANDARD
     * - CF_SYNC_ROOT_INFO_PROVIDER
     * @param {PWSTR} FilePath A fully qualified path to a file whose sync root information is to be queried.
     * @param {Integer} InfoClass Types of sync root information.
     * @param {Pointer<Void>} InfoBuffer A pointer to a buffer that will receive the sync root information.
     * @param {Integer} InfoBufferLength Length, in bytes, of the *InfoBuffer*.
     * @param {Pointer<Integer>} ReturnedLength Length, in bytes, of the returned sync root information. Refer to [CfRegisterSyncRoot](nf-cfapi-cfregistersyncroot.md) for details about the sync root information.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetsyncrootinfobypath
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
     * @remarks
     * Unlike most placeholder APIs that take a file handle, this one does not modify the file in any way, therefore the *FileHandle* only requires **READ_ATTRIBUTES** access.
     * 
     * If the file is not underneath a cloud files sync root, the API will fail. On success, information is returned according to the specific *InfoClass* requested.
     * @param {HANDLE} FileHandle Handle of the file under the sync root whose information is to be queried.
     * @param {Integer} InfoClass Types of sync root information.
     * @param {Pointer<Void>} InfoBuffer A pointer to a buffer that will receive the sync root information.
     * @param {Integer} InfoBufferLength Length, in bytes, of the *InfoBuffer*.
     * @param {Pointer<Integer>} ReturnedLength The number of bytes returned in the *InfoBuffer*.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetsyncrootinfobyhandle
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
     * @remarks
     * Unlike most placeholder APIs that take a file handle, this one does not modify the file in any way, therefore the file handle only requires READ_ATTRIBUTES access.
     * @param {HANDLE} FileHandle The handle of the placeholder file to be queried.
     * @param {Integer} InfoClass Types of the range of placeholder data.
     * @param {Integer} StartingOffset Offset of the starting point of the range of data.
     * @param {Integer} Length Length of the range of data. A provider can specify `CF_EOF` for *Length* to indicate that range for which information is requested is from *StartingOffset* to end of the file.
     * @param {Pointer} InfoBuffer Pointer to a buffer that will receive the data. The buffer is an array of **CF_FILE_RANGE** structures, which are offset/length pairs, describing the requested ranges.
     * @param {Integer} InfoBufferLength The length of *InfoBuffer* in bytes.
     * @returns {Integer} The length of the returned range of placeholder data in the *InfoBuffer*.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfgetplaceholderrangeinfo
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
     * Gets range information about a placeholder file or folder using ConnectionKey, TransferKey and FileId as identifiers.
     * @remarks
     * While an API to query hydrated file ranges of a placeholder already exists, a new API was needed for improving reliability of the platform.
     * 
     * The existing API, [CfGetPlaceholderRangeInfo](nf-cfapi-cfgetplaceholderrangeinfo.md), requires an opened handle to a file and then triggers a **FSCTL_HSM_CONTROL** using that handle. Providers/Sync Engines normally use this API to assess which portions of the file aren’t hydrated from the context of a **CF_CALLBACK_TYPE_FETCH_DATA** callback invoked by the filter to hydrate the file to satisfy an IO.
     * 
     * A mini filter in the IO stack could issue data scan on the file when the provider/Sync engine tries to open a handle to the file to be passed as a parameter to [CfGetPlaceholderRangeInfo](nf-cfapi-cfgetplaceholderrangeinfo.md). Alternatively, a mini filter could block the **FSCTL_HSM_CONTROL** that **CfGetPlaceholderRangeInfo** triggers internally.
     * 
     * The **cldflt** filter is designed to invoke just one **CF_CALLBACK_TYPE_FETCH_DATA** callback per required file range for hydrating the file. As a result of either of above cases, either the data scan is stuck behind the original **CF_CALLBACK_TYPE_FETCH_DATA** or the **CF_CALLBACK_TYPE_FETCH_DATA** is stuck behind the blocked [FSCTL](/openspecs/windows_protocols/ms-fscc/4dc02779-9d95-43f8-bba4-8d4ce4961458). This causes a deadlock in the hydration path.
     * 
     * Hence, this API is needed. It performs the same functionality as [CfGetPlaceholderRangeInfo](nf-cfapi-cfgetplaceholderrangeinfo.md), but communicates to the filter directly using filter message ports bypassing the intermediate IO stack. Therefore, no intermediate mini filter can either obstruct the **CreateFile** or the **FSCTL_HSM_CONTROL**.
     * 
     * Note that the caller always has the *ConnectionKey* obtained via [CfConnectSyncRoot](nf-cfapi-cfconnectsyncroot.md). It can obtain *TransferKey* via [CfGetTransferKey](nf-cfapi-cfgettransferkey.md) and obtain *FileId* using [GetFileInformationByHandle](/windows/win32/api/fileapi/nf-fileapi-getfileinformationbyhandle). But this approach needs a handle to be opened to the file and hence is no different than using [CfGetPlaceholderRangeInfo](nf-cfapi-cfgetplaceholderrangeinfo.md).
     * 
     * To summarize, when range info is needed from the context of a **CF_CALLBACK_TYPE_FETCH_DATA** callback, this API should be used. In all other cases, including when the provider wants to hydrate the file without being requested by the filter, [CfGetPlaceholderRangeInfo](nf-cfapi-cfgetplaceholderrangeinfo.md) should be used. The platform can’t recognize which API is called in a specific context and hence the onus is on the provider/Sync Engine to do the right thing.
     * @param {CF_CONNECTION_KEY} ConnectionKey An opaque handle created by [CfConnectSyncRoot](nf-cfapi-cfconnectsyncroot.md) for a sync root managed by the sync provider. It is returned also in **CF_CALLBACK_INFO** in the **CF_CALLBACK_TYPE_FETCH_DATA** callback and other callbacks.
     * @param {Integer} TransferKey The opaque handle to the placeholder file for which **CF_CALLBACK_TYPE_FETCH_DATA** callback has been invoked. It is also returned in **CF_CALLBACK_INFO** in the **CF_CALLBACK_TYPE_FETCH_DATA** callback. This can alternatively be obtained by [CfGetTransferKey](nf-cfapi-cfgettransferkey.md) if the API is not being invoked from **CF_CALLBACK_TYPE_FETCH_DATA** Callback.
     * @param {Integer} FileId A 64bit file system-maintained volume-wide unique ID of the placeholder file/directory to be serviced. Like *TransferKey*, this is returned in **CF_CALLBACK_INFO** in the **CF_CALLBACK_TYPE_FETCH_DATA** and other callbacks so that the provider doesn’t have to retrieve it again.
     * @param {Integer} InfoClass Types of the range of placeholder data. The value can be one of the following:
     * 
     * | Value | Description |
     * |--------|--------|
     * | CF_PLACEHOLDER_RANGE_INFO_ONDISK | On-disk data is data that is physical present in the file. This is a super set of other types of ranges. |
     * | CF_PLACEHOLDER_RANGE_INFO_VALIDATED | Validated data is a subset of the on-disk data that is currently in sync with the cloud. |
     * | CF_PLACEHOLDER_RANGEINFO_MODIFIED | Modified data is a subset of the on-disk data that is currently not in sync with the cloud (i.e., either modified or appended.) |
     * @param {Integer} StartingOffset Offset of the starting point of the range of data. *StartingOffset* and *RangeLength* specify a range in the placeholder file whose information as described by the *InfoClass* parameter is requested
     * @param {Integer} RangeLength Length of the range of data. A provider can specify `CF_EOF` for *RangeLength* to indicate that range for which information is requested is from *StartingOffset* to end of the file.
     * @param {Pointer} InfoBuffer Pointer to a buffer that will receive the data. The buffer is an array of **CF_FILE_RANGE** structures, which are offset/length pairs, describing the requested ranges.
     * @param {Integer} InfoBufferSize The length of *InfoBuffer* in bytes.
     * @returns {Integer} Receives the number of bytes returned in *InfoBuffer*.
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
     * @remarks
     * The filter automatically tracks the progress of hydrations, by tracking ranges that are transferred and/or acknowledged in response to **FETCH_DATA** callbacks. However, if a provider spends the bulk of its time downloading content to a temporary location before beginning to **TRANSFER_DATA** to the filter, the filter would otherwise be unaware that these activities are in any way related to the request.
     * 
     * By calling **CfReportProviderProgress** periodically, the sync provider can report progress to the filter, thereby resetting the 60 second timeout period corresponding to the **CF_CALLBACK_TYPE_FETCH_DATA** callback. This will also make the progress appear smoother.
     * @param {CF_CONNECTION_KEY} ConnectionKey A connection key representing a communication channel with the sync filter.
     * @param {Integer} TransferKey An opaque handle to the placeholder.
     * @param {Integer} ProviderProgressTotal The total progress of the sync provider in response to a fetch data callback.
     * @param {Integer} ProviderProgressCompleted The completed progress of the sync provider in response to a fetch data callback.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/cfapi/nf-cfapi-cfreportproviderprogress
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
     * Allows a sync provider to report progress out-of-band. Extends CfReportProviderProgress with additional parameters.
     * @param {CF_CONNECTION_KEY} ConnectionKey A connection key representing a communication channel with the sync filter.
     * @param {Integer} TransferKey An opaque handle to the placeholder.
     * @param {Integer} RequestKey Allows the caller to report progress on a specific operation other than hydration.
     * @param {Integer} ProviderProgressTotal The total progress of the sync provider in response to a fetch data callback.
     * @param {Integer} ProviderProgressCompleted The completed progress of the sync provider in response to a fetch data callback.
     * @param {Integer} TargetSessionId Indicates the session at which this progress information is targeted.
     * @returns {HRESULT} If this function succeeds, it returns `S_OK`. Otherwise, it returns an **HRESULT** error code.
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
