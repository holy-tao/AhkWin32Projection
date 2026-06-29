#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_DFS_BASE := 6

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_STATES := 15

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_STATE_OK := 1

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_STATE_INCONSISTENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_STATE_OFFLINE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_STATE_ONLINE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_STATE_RESYNCHRONIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_STATE_STANDBY := 32

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_STATE_FORCE_SYNC := 64

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_FLAVORS := 768

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_FLAVOR_UNUSED1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_FLAVOR_STANDALONE := 256

/**
 * @type {Integer (UInt32)}
 */
export global DFS_VOLUME_FLAVOR_AD_BLOB := 512

/**
 * @type {Integer (UInt32)}
 */
export global DFS_STORAGE_FLAVOR_UNUSED2 := 768

/**
 * @type {Integer (UInt32)}
 */
export global DFS_STORAGE_STATES := 15

/**
 * @type {Integer (UInt32)}
 */
export global DFS_STORAGE_STATE_OFFLINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DFS_STORAGE_STATE_ONLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DFS_STORAGE_STATE_ACTIVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DFS_PROPERTY_FLAG_INSITE_REFERRALS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DFS_PROPERTY_FLAG_ROOT_SCALABILITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DFS_PROPERTY_FLAG_SITE_COSTING := 4

/**
 * @type {Integer (UInt32)}
 */
export global DFS_PROPERTY_FLAG_TARGET_FAILBACK := 8

/**
 * @type {Integer (UInt32)}
 */
export global DFS_PROPERTY_FLAG_CLUSTER_ENABLED := 16

/**
 * @type {Integer (UInt32)}
 */
export global DFS_PROPERTY_FLAG_ABDE := 32

/**
 * @type {Integer (UInt32)}
 */
export global DFS_ADD_VOLUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global DFS_RESTORE_VOLUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global NET_DFS_SETDC_FLAGS := 0

/**
 * @type {Integer (UInt32)}
 */
export global NET_DFS_SETDC_TIMEOUT := 1

/**
 * @type {Integer (UInt32)}
 */
export global NET_DFS_SETDC_INITPKT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DFS_SITE_PRIMARY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DFS_MOVE_FLAG_REPLACE_IF_EXISTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DFS_FORCE_REMOVE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_DFS_GET_PKT_ENTRY_STATE := 401340
;@endregion Constants
