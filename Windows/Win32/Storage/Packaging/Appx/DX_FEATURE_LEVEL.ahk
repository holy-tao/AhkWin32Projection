#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class DX_FEATURE_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DX_FEATURE_LEVEL_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DX_FEATURE_LEVEL_9 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DX_FEATURE_LEVEL_10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DX_FEATURE_LEVEL_11 => 3
}
