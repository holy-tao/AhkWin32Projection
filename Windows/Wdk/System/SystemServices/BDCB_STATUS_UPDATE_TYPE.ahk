#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class BDCB_STATUS_UPDATE_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static BdCbStatusPrepareForDependencyLoad => 0

    /**
     * @type {Integer (Int32)}
     */
    static BdCbStatusPrepareForDriverLoad => 1

    /**
     * @type {Integer (Int32)}
     */
    static BdCbStatusPrepareForUnload => 2
}
