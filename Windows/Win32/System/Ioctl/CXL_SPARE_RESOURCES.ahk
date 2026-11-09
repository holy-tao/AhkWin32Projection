#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_SPARE_RESOURCES extends Win32Enum {

    /**
     * Native name: CxlSpareResources_NoneAvailable
     * @type {Integer (Int32)}
     */
    static NoneAvailable => 0

    /**
     * Native name: CxlSpareResources_OneAvailable
     * @type {Integer (Int32)}
     */
    static OneAvailable => 1

    /**
     * Native name: CxlSpareResources_TwoAvailable
     * @type {Integer (Int32)}
     */
    static TwoAvailable => 2

    /**
     * Native name: CxlSpareResources_ThreeOrMoreAvailable
     * @type {Integer (Int32)}
     */
    static ThreeOrMoreAvailable => 3
}
