#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_Comp_Flags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BDACOMP_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDACOMP_EXCLUDE_TS_FROM_TR => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDACOMP_INCLUDE_LOCATOR_IN_TR => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDACOMP_INCLUDE_COMPONENTS_IN_TR => 4
}
