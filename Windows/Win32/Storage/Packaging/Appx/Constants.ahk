#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FULL_NAME_MIN_LENGTH := 30

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FULL_NAME_MAX_LENGTH := 127

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FAMILY_NAME_MIN_LENGTH := 17

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FAMILY_NAME_MAX_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_GRAPH_MAX_SIZE := 641

/**
 * @type {Integer (UInt32)}
 */
export global APPLICATION_USER_MODEL_ID_MIN_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global APPLICATION_USER_MODEL_ID_MAX_LENGTH := 130

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PROPERTY_FRAMEWORK := 1

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PROPERTY_RESOURCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PROPERTY_BUNDLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PROPERTY_OPTIONAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_HEAD := 16

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_DIRECT := 32

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_RESOURCE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_BUNDLE := 128

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_INFORMATION_BASIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_INFORMATION_FULL := 256

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PROPERTY_DEVELOPMENT_MODE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_OPTIONAL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PROPERTY_IS_IN_RELATED_SET := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_IS_IN_RELATED_SET := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PROPERTY_STATIC := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_STATIC := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PROPERTY_DYNAMIC := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_DYNAMIC := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PROPERTY_HOSTRUNTIME := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_HOSTRUNTIME := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FILTER_ALL_LOADED := 0

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_DEPENDENCY_RANK_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_ARCHITECTURE_MIN_LENGTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_ARCHITECTURE_MAX_LENGTH := 7

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_VERSION_MIN_LENGTH := 7

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_VERSION_MAX_LENGTH := 23

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_NAME_MIN_LENGTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_NAME_MAX_LENGTH := 50

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PUBLISHER_MIN_LENGTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PUBLISHER_MAX_LENGTH := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PUBLISHERID_MIN_LENGTH := 13

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_PUBLISHERID_MAX_LENGTH := 13

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_RESOURCEID_MIN_LENGTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_RESOURCEID_MAX_LENGTH := 30

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_MIN_DEPENDENCIES := 0

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_MAX_DEPENDENCIES := 128

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FAMILY_MIN_RESOURCE_PACKAGES := 0

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_FAMILY_MAX_RESOURCE_PACKAGES := 512

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_GRAPH_MIN_SIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_APPLICATIONS_MIN_COUNT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_APPLICATIONS_MAX_COUNT := 100

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_RELATIVE_APPLICATION_ID_MIN_LENGTH := 2

/**
 * @type {Integer (UInt32)}
 */
export global PACKAGE_RELATIVE_APPLICATION_ID_MAX_LENGTH := 65
;@endregion Constants
