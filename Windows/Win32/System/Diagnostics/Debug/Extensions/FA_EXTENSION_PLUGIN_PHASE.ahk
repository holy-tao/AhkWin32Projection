#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class FA_EXTENSION_PLUGIN_PHASE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FA_PLUGIN_INITIALIZATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static FA_PLUGIN_STACK_ANALYSIS => 2

    /**
     * @type {Integer (Int32)}
     */
    static FA_PLUGIN_PRE_BUCKETING => 4

    /**
     * @type {Integer (Int32)}
     */
    static FA_PLUGIN_POST_BUCKETING => 8
}
