#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags for updating a placeholder file or directory.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_update_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_UPDATE_FLAGS{

    /**
     * No update flags.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_NONE => 0

    /**
     * The update will fail if the <b>CF_UPDATE_FLAG_MARK_IN_SYNC</b> attribute is not currently set on the placeholder.  This is to prevent a race between syncing changes from the cloud down to a local placeholder and the placeholder’s data stream getting locally modified.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_VERIFY_IN_SYNC => 1

    /**
     * The platform marks the placeholder as in-sync upon a successful update placeholder operation.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_MARK_IN_SYNC => 2

    /**
     * Applicable to files only. When specified, the platform dehydrates the file after updating the placeholder successfully. The caller must acquire an exclusive handle when specifying this flag or data corruptions can occur. Note that the platform does not validate the exclusiveness of the handle.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_DEHYDRATE => 4

    /**
     * Applicable to directories only. When specified, it marks the updated placeholder directory partially populated such that any future access to it will result in a FETCH_PLACEHOLDERS callback sent to the sync provider.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_ENABLE_ON_DEMAND_POPULATION => 8

    /**
     * Applicable to directories only. When specified, it marks the updated placeholder directory fully populated such that any future access to it will be handled by the platform without any callbacks to the sync provider.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_DISABLE_ON_DEMAND_POPULATION => 16

    /**
     * When specified, <i>FileIdentity</i> and <i>FileIdentityLength</i> in <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfupdateplaceholder">CfUpdatePlaceholder</a> are ignored and the platform will remove the existing file identity blob on the placeholder upon a successful update call.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_REMOVE_FILE_IDENTITY => 32

    /**
     * The platform marks the placeholder as not in-sync upon a successful update placeholder operation.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_CLEAR_IN_SYNC => 64

    /**
     * <b>Note</b>  This value is new for Windows 10, version 1803.
     * 
     * The platform removes all existing extrinsic properties on the placeholder.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_REMOVE_PROPERTY => 128

    /**
     * <b>Note</b>  This value is new for Windows 10, version 1803.
     * 
     * The platform passes <b>CF_FS_METADATA</b> to the file system without any filtering; otherwise, the platform skips setting any fields whose value is 0.
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_PASSTHROUGH_FS_METADATA => 256

    /**
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_ALWAYS_FULL => 512

    /**
     * @type {Integer (Int32)}
     */
    static CF_UPDATE_FLAG_ALLOW_PARTIAL => 1024
}
