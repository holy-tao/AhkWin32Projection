#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_ANY := 127

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_VERSION := 469762048

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_ADOPT := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global MI_CHAR_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_CLASS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_METHOD := 2

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_PROPERTY := 4

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_PARAMETER := 8

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_ASSOCIATION := 16

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_INDICATION := 32

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_REFERENCE := 64

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_ENABLEOVERRIDE := 128

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_DISABLEOVERRIDE := 256

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_RESTRICTED := 512

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_TOSUBCLASS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_TRANSLATABLE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_KEY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_IN := 8192

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_OUT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_REQUIRED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_STATIC := 65536

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_ABSTRACT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_TERMINAL := 262144

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_EXPENSIVE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_STREAM := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_READONLY := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_EXTENDED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_NOT_MODIFIED := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_NULL := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global MI_FLAG_BORROW := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global MI_MODULE_FLAG_STANDARD_QUALIFIERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MI_MODULE_FLAG_DESCRIPTIONS := 2

/**
 * @type {Integer (UInt32)}
 */
export global MI_MODULE_FLAG_VALUES := 4

/**
 * @type {Integer (UInt32)}
 */
export global MI_MODULE_FLAG_MAPPING_STRINGS := 8

/**
 * @type {Integer (UInt32)}
 */
export global MI_MODULE_FLAG_BOOLEANS := 16

/**
 * @type {Integer (UInt32)}
 */
export global MI_MODULE_FLAG_CPLUSPLUS := 32

/**
 * @type {Integer (UInt32)}
 */
export global MI_MODULE_FLAG_LOCALIZED := 64

/**
 * @type {Integer (UInt32)}
 */
export global MI_MODULE_FLAG_FILTER_SUPPORT := 128

/**
 * @type {Integer (UInt32)}
 */
export global MI_MAX_LOCALE_SIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global MI_WRITEMESSAGE_CHANNEL_WARNING := 0

/**
 * @type {Integer (UInt32)}
 */
export global MI_WRITEMESSAGE_CHANNEL_VERBOSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MI_WRITEMESSAGE_CHANNEL_DEBUG := 2

/**
 * @type {Integer (UInt32)}
 */
export global MI_CALL_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_MANUAL_ACK_RESULTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_NO_RTTI := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_BASIC_RTTI := 2

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_STANDARD_RTTI := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_FULL_RTTI := 4

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_DEFAULT_RTTI := 0

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_LOCALIZED_QUALIFIERS := 8

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_EXPENSIVE_PROPERTIES := 64

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_POLYMORPHISM_SHALLOW := 128

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_POLYMORPHISM_DEEP_BASE_PROPS_ONLY := 384

/**
 * @type {Integer (UInt32)}
 */
export global MI_OPERATIONFLAGS_REPORT_OPERATION_STARTED := 512

/**
 * @type {String}
 */
export global MI_SUBSCRIBE_BOOKMARK_OLDEST := "MI_SUBSCRIBE_BOOKMARK_OLDEST"

/**
 * @type {String}
 */
export global MI_SUBSCRIBE_BOOKMARK_NEWEST := "MI_SUBSCRIBE_BOOKMARK_NEWEST"

/**
 * @type {Integer (UInt32)}
 */
export global MI_SERIALIZER_FLAGS_CLASS_DEEP := 1

/**
 * @type {Integer (UInt32)}
 */
export global MI_SERIALIZER_FLAGS_INSTANCE_WITH_CLASS := 1

/**
 * @type {Integer (UInt32)}
 */
export global WBEMS_DISPID_DERIVATION := 23

/**
 * @type {Integer (UInt32)}
 */
export global WBEMS_DISPID_OBJECT_READY := 1

/**
 * @type {Integer (UInt32)}
 */
export global WBEMS_DISPID_COMPLETED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WBEMS_DISPID_PROGRESS := 3

/**
 * @type {Integer (UInt32)}
 */
export global WBEMS_DISPID_OBJECT_PUT := 4

/**
 * @type {Integer (UInt32)}
 */
export global WBEMS_DISPID_CONNECTION_READY := 5

/**
 * @type {Integer (Int32)}
 */
export global WBEM_NO_WAIT := 0

/**
 * @type {Integer (Int32)}
 */
export global WBEM_INFINITE := -1
;@endregion Constants
