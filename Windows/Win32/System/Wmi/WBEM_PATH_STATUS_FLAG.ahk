#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_PATH_STATUS_FLAG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_ANON_LOCAL_MACHINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_HAS_MACHINE_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_IS_CLASS_REF => 4

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_IS_INST_REF => 8

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_HAS_SUBSCOPES => 16

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_IS_COMPOUND => 32

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_HAS_V2_REF_PATHS => 64

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_HAS_IMPLIED_KEY => 128

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_CONTAINS_SINGLETON => 256

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_V1_COMPLIANT => 512

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_V2_COMPLIANT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_CIM_COMPLIANT => 2048

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_IS_SINGLETON => 4096

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_IS_PARENT => 8192

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_SERVER_NAMESPACE_ONLY => 16384

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_NATIVE_PATH => 32768

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_WMI_PATH => 65536

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_INFO_PATH_HAD_SERVER => 131072
}
