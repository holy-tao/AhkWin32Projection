#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FAST_IO_POSSIBLE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FastIoIsNotPossible => 0

    /**
     * @type {Integer (Int32)}
     */
    static FastIoIsPossible => 1

    /**
     * @type {Integer (Int32)}
     */
    static FastIoIsQuestionable => 2
}
