#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMMPID_RPV_ENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RPV_BEFORE__ => 16383

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RPV_DONT_DELIVER => 16384

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RPV_NO_NAME_COLLISIONS => 16385

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RPV_AFTER__ => 16386
}
