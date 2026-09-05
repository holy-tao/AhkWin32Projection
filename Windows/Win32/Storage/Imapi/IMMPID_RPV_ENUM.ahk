#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMMPID_RPV_ENUM extends Win32Enum {

    /**
     * Native name: IMMPID_RPV_BEFORE__
     * @type {Integer (Int32)}
     */
    static BEFORE__ => 16383

    /**
     * Native name: IMMPID_RPV_DONT_DELIVER
     * @type {Integer (Int32)}
     */
    static DONT_DELIVER => 16384

    /**
     * Native name: IMMPID_RPV_NO_NAME_COLLISIONS
     * @type {Integer (Int32)}
     */
    static NO_NAME_COLLISIONS => 16385

    /**
     * Native name: IMMPID_RPV_AFTER__
     * @type {Integer (Int32)}
     */
    static AFTER__ => 16386
}
