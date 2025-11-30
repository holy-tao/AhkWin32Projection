#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.EnterpriseData
 * @version v4.0.30319
 */
class SRPHOSTING_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SRPHOSTING_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SRPHOSTING_TYPE_WINHTTP => 1

    /**
     * @type {Integer (Int32)}
     */
    static SRPHOSTING_TYPE_WININET => 2
}
