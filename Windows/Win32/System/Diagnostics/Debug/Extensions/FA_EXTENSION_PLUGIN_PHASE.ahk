#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class FA_EXTENSION_PLUGIN_PHASE extends Win32Enum {

    /**
     * Native name: FA_PLUGIN_INITIALIZATION
     * @type {Integer (Int32)}
     */
    static INITIALIZATION => 1

    /**
     * Native name: FA_PLUGIN_STACK_ANALYSIS
     * @type {Integer (Int32)}
     */
    static STACK_ANALYSIS => 2

    /**
     * Native name: FA_PLUGIN_PRE_BUCKETING
     * @type {Integer (Int32)}
     */
    static PRE_BUCKETING => 4

    /**
     * Native name: FA_PLUGIN_POST_BUCKETING
     * @type {Integer (Int32)}
     */
    static POST_BUCKETING => 8
}
