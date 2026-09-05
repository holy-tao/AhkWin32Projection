#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMMPID_CPV_ENUM extends Win32Enum {

    /**
     * Native name: IMMPID_CPV_BEFORE__
     * @type {Integer (Int32)}
     */
    static BEFORE__ => 32767

    /**
     * Native name: IMMPID_CP_START
     * @type {Integer (Int32)}
     */
    static CP_START => 32768

    /**
     * Native name: IMMPID_CPV_AFTER__
     * @type {Integer (Int32)}
     */
    static AFTER__ => 32769
}
