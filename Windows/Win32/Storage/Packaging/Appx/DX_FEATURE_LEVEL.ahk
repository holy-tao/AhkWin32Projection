#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class DX_FEATURE_LEVEL extends Win32Enum {

    /**
     * Native name: DX_FEATURE_LEVEL_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Native name: DX_FEATURE_LEVEL_9
     * @type {Integer (Int32)}
     */
    static 9 => 1

    /**
     * Native name: DX_FEATURE_LEVEL_10
     * @type {Integer (Int32)}
     */
    static 10 => 2

    /**
     * Native name: DX_FEATURE_LEVEL_11
     * @type {Integer (Int32)}
     */
    static 11 => 3
}
