#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class ReplacesCorHdrNumericDefines{

    /**
     * @type {Integer (Int32)}
     */
    static COMIMAGE_FLAGS_ILONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMIMAGE_FLAGS_32BITREQUIRED => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMIMAGE_FLAGS_IL_LIBRARY => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMIMAGE_FLAGS_STRONGNAMESIGNED => 8

    /**
     * @type {Integer (Int32)}
     */
    static COMIMAGE_FLAGS_NATIVE_ENTRYPOINT => 16

    /**
     * @type {Integer (Int32)}
     */
    static COMIMAGE_FLAGS_TRACKDEBUGDATA => 65536

    /**
     * @type {Integer (Int32)}
     */
    static COMIMAGE_FLAGS_32BITPREFERRED => 131072

    /**
     * @type {Integer (Int32)}
     */
    static COR_VERSION_MAJOR_V2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_VERSION_MAJOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_VERSION_MINOR => 5

    /**
     * @type {Integer (Int32)}
     */
    static COR_DELETED_NAME_LENGTH => 8

    /**
     * @type {Integer (Int32)}
     */
    static COR_VTABLEGAP_NAME_LENGTH => 8

    /**
     * @type {Integer (Int32)}
     */
    static NATIVE_TYPE_MAX_CB => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_ILMETHOD_SECT_SMALL_MAX_DATASIZE => 255

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_COR_MIH_METHODRVA => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_COR_MIH_EHRVA => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_COR_MIH_BASICBLOCK => 8

    /**
     * @type {Integer (Int32)}
     */
    static COR_VTABLE_32BIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_VTABLE_64BIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_VTABLE_FROM_UNMANAGED => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_VTABLE_FROM_UNMANAGED_RETAIN_APPDOMAIN => 8

    /**
     * @type {Integer (Int32)}
     */
    static COR_VTABLE_CALL_MOST_DERIVED => 16

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_COR_EATJ_THUNK_SIZE => 32

    /**
     * @type {Integer (Int32)}
     */
    static MAX_CLASS_NAME => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MAX_PACKAGE_NAME => 1024
}
