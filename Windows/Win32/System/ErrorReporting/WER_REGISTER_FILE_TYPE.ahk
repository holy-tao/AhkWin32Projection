#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_REGISTER_FILE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WerRegFileTypeUserDocument => 1

    /**
     * @type {Integer (Int32)}
     */
    static WerRegFileTypeOther => 2

    /**
     * @type {Integer (Int32)}
     */
    static WerRegFileTypeMax => 3
}
