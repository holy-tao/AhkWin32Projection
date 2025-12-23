#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMMPID_CPV_ENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_CPV_BEFORE__ => 32767

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_CP_START => 32768

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_CPV_AFTER__ => 32769
}
