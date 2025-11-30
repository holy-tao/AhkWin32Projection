#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FD_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FD_CLSID => 1

    /**
     * @type {Integer (Int32)}
     */
    static FD_SIZEPOINT => 2

    /**
     * @type {Integer (Int32)}
     */
    static FD_ATTRIBUTES => 4

    /**
     * @type {Integer (Int32)}
     */
    static FD_CREATETIME => 8

    /**
     * @type {Integer (Int32)}
     */
    static FD_ACCESSTIME => 16

    /**
     * @type {Integer (Int32)}
     */
    static FD_WRITESTIME => 32

    /**
     * @type {Integer (Int32)}
     */
    static FD_FILESIZE => 64

    /**
     * @type {Integer (Int32)}
     */
    static FD_PROGRESSUI => 16384

    /**
     * @type {Integer (Int32)}
     */
    static FD_LINKUI => 32768

    /**
     * @type {Integer (Int32)}
     */
    static FD_UNICODE => -2147483648
}
