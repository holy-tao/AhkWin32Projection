#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.LibraryLoader
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global FIND_RESOURCE_DIRECTORY_TYPES := 256

/**
 * @type {Integer (UInt32)}
 */
export global FIND_RESOURCE_DIRECTORY_NAMES := 512

/**
 * @type {Integer (UInt32)}
 */
export global FIND_RESOURCE_DIRECTORY_LANGUAGES := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_ENUM_LN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_ENUM_MUI := 2

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_ENUM_MUI_SYSTEM := 4

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_ENUM_VALIDATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_ENUM_MODULE_EXACT := 16

/**
 * @type {Integer (UInt32)}
 */
export global SUPPORT_LANG_NUMBER := 32

/**
 * @type {Integer (UInt32)}
 */
export global GET_MODULE_HANDLE_EX_FLAG_PIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global CURRENT_IMPORT_REDIRECTION_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOAD_LIBRARY_OS_INTEGRITY_CONTINUITY := 32768
;@endregion Constants
