#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class FD_FLAGS extends Win32Enum {

    /**
     * Native name: FD_CLSID
     * @type {Integer (Int32)}
     */
    static CLSID => 1

    /**
     * Native name: FD_SIZEPOINT
     * @type {Integer (Int32)}
     */
    static SIZEPOINT => 2

    /**
     * Native name: FD_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static ATTRIBUTES => 4

    /**
     * Native name: FD_CREATETIME
     * @type {Integer (Int32)}
     */
    static CREATETIME => 8

    /**
     * Native name: FD_ACCESSTIME
     * @type {Integer (Int32)}
     */
    static ACCESSTIME => 16

    /**
     * Native name: FD_WRITESTIME
     * @type {Integer (Int32)}
     */
    static WRITESTIME => 32

    /**
     * Native name: FD_FILESIZE
     * @type {Integer (Int32)}
     */
    static FILESIZE => 64

    /**
     * Native name: FD_PROGRESSUI
     * @type {Integer (Int32)}
     */
    static PROGRESSUI => 16384

    /**
     * Native name: FD_LINKUI
     * @type {Integer (Int32)}
     */
    static LINKUI => 32768

    /**
     * Native name: FD_UNICODE
     * @type {Integer (Int32)}
     */
    static UNICODE => -2147483648
}
