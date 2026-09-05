#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
class SCE_LOG_ERR_LEVEL extends Win32Enum {

    /**
     * Native name: SCE_LOG_LEVEL_ALWAYS
     * @type {Integer (Int32)}
     */
    static ALWAYS => 0

    /**
     * Native name: SCE_LOG_LEVEL_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 1

    /**
     * Native name: SCE_LOG_LEVEL_DETAIL
     * @type {Integer (Int32)}
     */
    static DETAIL => 2

    /**
     * Native name: SCE_LOG_LEVEL_DEBUG
     * @type {Integer (Int32)}
     */
    static DEBUG => 3
}
