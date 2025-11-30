#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_CAPABILITY_CLASS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_GENERAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_RESTRICTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_WINDOWS => 4

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_ALL => 7

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_CUSTOM => 8
}
