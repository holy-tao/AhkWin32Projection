#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization.UI
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global SI_EDIT_PERMS := 0

/**
 * @type {Integer (Int32)}
 */
export global SI_EDIT_OWNER := 1

/**
 * @type {Integer (Int32)}
 */
export global SI_CONTAINER := 4

/**
 * @type {Integer (Int32)}
 */
export global SI_READONLY := 8

/**
 * @type {Integer (Int32)}
 */
export global SI_RESET := 32

/**
 * @type {Integer (Int32)}
 */
export global SI_OWNER_READONLY := 64

/**
 * @type {Integer (Int32)}
 */
export global SI_OWNER_RECURSE := 256

/**
 * @type {Integer (Int32)}
 */
export global SI_NO_ACL_PROTECT := 512

/**
 * @type {Integer (Int32)}
 */
export global SI_NO_TREE_APPLY := 1024

/**
 * @type {Integer (Int32)}
 */
export global SI_PAGE_TITLE := 2048

/**
 * @type {Integer (Int32)}
 */
export global SI_SERVER_IS_DC := 4096

/**
 * @type {Integer (Int32)}
 */
export global SI_RESET_DACL_TREE := 16384

/**
 * @type {Integer (Int32)}
 */
export global SI_RESET_SACL_TREE := 32768

/**
 * @type {Integer (Int32)}
 */
export global SI_OBJECT_GUID := 65536

/**
 * @type {Integer (Int32)}
 */
export global SI_ACCESS_SPECIFIC := 65536

/**
 * @type {Integer (Int32)}
 */
export global SI_ACCESS_GENERAL := 131072

/**
 * @type {Integer (Int32)}
 */
export global SI_ACCESS_CONTAINER := 262144

/**
 * @type {Integer (Int32)}
 */
export global SI_ACCESS_PROPERTY := 524288

/**
 * @type {Integer (Int32)}
 */
export global DOBJ_RES_CONT := 1

/**
 * @type {Integer (Int32)}
 */
export global DOBJ_RES_ROOT := 2

/**
 * @type {Integer (Int32)}
 */
export global DOBJ_VOL_NTACLS := 4

/**
 * @type {Integer (Int32)}
 */
export global DOBJ_COND_NTACLS := 8

/**
 * @type {Integer (Int32)}
 */
export global DOBJ_RIBBON_LAUNCH := 16

/**
 * @type {String}
 */
export global CFSTR_ACLUI_SID_INFO_LIST := "CFSTR_ACLUI_SID_INFO_LIST"

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_OBJECT_ID_OBJECT_SD := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_OBJECT_ID_SHARE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_OBJECT_ID_CENTRAL_POLICY := 3

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE := 4
;@endregion Constants
