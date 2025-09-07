#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags for updating a placeholder file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_update_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_UPDATE_FLAGS{

    /**
     * `0x00000000`
 * 
 * No update flags.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_NONE => 0

    /**
     * `0x00000001`
 * 
 * The update will fail if the **CF_UPDATE_FLAG_MARK_IN_SYNC** attribute is not currently set on the placeholder.  This is to prevent a race between syncing changes from the cloud down to a local placeholder and the placeholder’s data stream getting locally modified.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_VERIFY_IN_SYNC => 1

    /**
     * `0x00000002`
 * 
 * The platform marks the placeholder as in-sync upon a successful update placeholder operation.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_MARK_IN_SYNC => 2

    /**
     * `0x00000004`
 * 
 * Applicable to files only. When specified, the platform dehydrates the file after updating the placeholder successfully. The caller must acquire an exclusive handle when specifying this flag or data corruptions can occur. Note that the platform does not validate the exclusiveness of the handle.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_DEHYDRATE => 4

    /**
     * `0x00000008`
 * 
 * Applicable to directories only. When specified, it marks the updated placeholder directory partially populated such that any future access to it will result in a FETCH_PLACEHOLDERS callback sent to the sync provider.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_ENABLE_ON_DEMAND_POPULATION => 8

    /**
     * `0x00000010`
 * 
 * Applicable to directories only. When specified, it marks the updated placeholder directory fully populated such that any future access to it will be handled by the platform without any callbacks to the sync provider.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_DISABLE_ON_DEMAND_POPULATION => 16

    /**
     * `0x00000020`
 * 
 * When specified, _FileIdentity_ and _FileIdentityLength_ in [CfUpdatePlaceholder](/windows/win32/api/cfapi/nf-cfapi-cfupdateplaceholder) are ignored and the platform will remove the existing file identity blob on the placeholder upon a successful update call.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_REMOVE_FILE_IDENTITY => 32

    /**
     * `0x00000040`
 * 
 * The platform marks the placeholder as not in-sync upon a successful update placeholder operation.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_CLEAR_IN_SYNC => 64

    /**
     * `0x00000080`
 * 
 * The platform removes all existing extrinsic properties on the placeholder.
 * 
 * > [!NOTE]
 * > This value is available in Windows 10, version 1803 and later.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_REMOVE_PROPERTY => 128

    /**
     * `0x00000100`
 * 
 * The platform passes **CF_FS_METADATA** to the file system without any filtering; otherwise, the platform skips setting any fields whose value is 0.
 * 
 * > [!NOTE]
 * > This value is available in Windows 10, version 1803 and later.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_PASSTHROUGH_FS_METADATA => 256

    /**
     * `0x00000200`
 * 
 * `CF_UPDATE_FLAG_ALWAYS_FULL` is effective on placeholder files only. When specified, the placeholder to be updated is marked always full. Once hydrated, any attempt to dehydrate such a placeholder file will fail with error code `ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED`.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_ALWAYS_FULL => 512

    /**
     * `0x00000400`
 * 
 * `CF_UPDATE_FLAG_ALLOW_PARTIAL` is effective on placeholder files only. When specified, the always full state on a placeholder file, if present, is cleared thus allowing it to be dehydrated again. It is invalid to specify this flag along with `CF_UPDATE_FLAG_ALWAYS_FULL` and error code `ERROR_CLOUD_FILE_INVALID_REQUEST` will be returned as a result.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_ALLOW_PARTIAL => 1024
}
