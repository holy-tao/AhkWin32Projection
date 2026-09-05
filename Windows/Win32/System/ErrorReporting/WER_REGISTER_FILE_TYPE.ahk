#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_REGISTER_FILE_TYPE extends Win32Enum {

    /**
     * Native name: WerRegFileTypeUserDocument
     * @type {Integer (Int32)}
     */
    static RegFileTypeUserDocument => 1

    /**
     * Native name: WerRegFileTypeOther
     * @type {Integer (Int32)}
     */
    static RegFileTypeOther => 2

    /**
     * Native name: WerRegFileTypeMax
     * @type {Integer (Int32)}
     */
    static RegFileTypeMax => 3
}
