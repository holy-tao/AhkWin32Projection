#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class SE_IMAGE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SeImageTypeElamDriver => 0

    /**
     * @type {Integer (Int32)}
     */
    static SeImageTypeDriver => 1

    /**
     * @type {Integer (Int32)}
     */
    static SeImageTypePlatformSecureFile => 2

    /**
     * @type {Integer (Int32)}
     */
    static SeImageTypeDynamicCodeFile => 3

    /**
     * @type {Integer (Int32)}
     */
    static SeImageTypeMax => 4
}
