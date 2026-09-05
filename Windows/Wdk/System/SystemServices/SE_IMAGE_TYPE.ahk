#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class SE_IMAGE_TYPE extends Win32Enum {

    /**
     * Native name: SeImageTypeElamDriver
     * @type {Integer (Int32)}
     */
    static ElamDriver => 0

    /**
     * Native name: SeImageTypeDriver
     * @type {Integer (Int32)}
     */
    static Driver => 1

    /**
     * Native name: SeImageTypePlatformSecureFile
     * @type {Integer (Int32)}
     */
    static PlatformSecureFile => 2

    /**
     * Native name: SeImageTypeDynamicCodeFile
     * @type {Integer (Int32)}
     */
    static DynamicCodeFile => 3

    /**
     * Native name: SeImageTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
