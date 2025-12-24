#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class LOCK_OPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IoReadAccess => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoWriteAccess => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoModifyAccess => 2
}
