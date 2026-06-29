#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_PIN_STATE.ahk" { CF_PIN_STATE }
#Import ".\CF_IN_SYNC_STATE.ahk" { CF_IN_SYNC_STATE }

/**
 * Standard placeholder information.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_placeholder_standard_info
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_PLACEHOLDER_STANDARD_INFO {
    #StructPack 8

    /**
     * Total number of bytes on disk.
     */
    OnDiskDataSize : Int64

    /**
     * Total number of bytes that are in sync with the cloud.
     */
    ValidatedDataSize : Int64

    /**
     * Total number of bytes that have been overwritten/appended locally and are not in sync with the cloud.
     */
    ModifiedDataSize : Int64

    /**
     * Total number of bytes on disk that are used by all the property blobs.
     */
    PropertiesSize : Int64

    /**
     * The [CF_PIN_STATE](ne-cfapi-cf_pin_state.md) of the placeholder. See [CfSetPinState](nf-cfapi-cfsetpinstate.md) for more details.
     */
    PinState : CF_PIN_STATE

    /**
     * The [CF_IN_SYNC_STATE](ne-cfapi-cf_in_sync_state.md) of the placeholder. see [CfSetInSyncState](nf-cfapi-cfsetinsyncstate.md) for more details.
     */
    InSyncState : CF_IN_SYNC_STATE

    /**
     * A 64-bit volume wide non-volatile number that uniquely identifies a file or directory.
     */
    FileId : Int64

    /**
     * The file ID of the sync root directory that contains the file whose placeholder information is to be queried.
     */
    SyncRootFileId : Int64

    /**
     * Length, in bytes, of the *FileIdentity*.
     */
    FileIdentityLength : UInt32

    /**
     * An opaque blob supplied by the sync provider to the platform when the placeholder was created. File identity is provided for all sync provider callbacks.
     */
    FileIdentity : Int8[1]

}
