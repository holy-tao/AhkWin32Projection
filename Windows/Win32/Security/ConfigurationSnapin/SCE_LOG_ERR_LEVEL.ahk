#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class SCE_LOG_ERR_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCE_LOG_LEVEL_ALWAYS => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCE_LOG_LEVEL_ERROR => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCE_LOG_LEVEL_DETAIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCE_LOG_LEVEL_DEBUG => 3
}
