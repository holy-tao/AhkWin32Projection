#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class APPX_CAPABILITY_CLASS_TYPE extends Win32Enum {

    /**
     * Native name: APPX_CAPABILITY_CLASS_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: APPX_CAPABILITY_CLASS_GENERAL
     * @type {Integer (Int32)}
     */
    static GENERAL => 1

    /**
     * Native name: APPX_CAPABILITY_CLASS_RESTRICTED
     * @type {Integer (Int32)}
     */
    static RESTRICTED => 2

    /**
     * Native name: APPX_CAPABILITY_CLASS_WINDOWS
     * @type {Integer (Int32)}
     */
    static WINDOWS => 4

    /**
     * Native name: APPX_CAPABILITY_CLASS_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 7

    /**
     * Native name: APPX_CAPABILITY_CLASS_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 8
}
