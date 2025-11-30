#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class QueryCategoryType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static QCT_PROVIDER => 0

    /**
     * @type {Integer (Int32)}
     */
    static QCT_LAYERED => 1
}
