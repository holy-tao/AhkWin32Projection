#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
class PROPENUMTYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static PET_DISCRETEVALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PET_RANGEDVALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PET_DEFAULTVALUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PET_ENDRANGE => 3
}
