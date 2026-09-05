#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FAST_IO_POSSIBLE extends Win32Enum {

    /**
     * Native name: FastIoIsNotPossible
     * @type {Integer (Int32)}
     */
    static IsNotPossible => 0

    /**
     * Native name: FastIoIsPossible
     * @type {Integer (Int32)}
     */
    static IsPossible => 1

    /**
     * Native name: FastIoIsQuestionable
     * @type {Integer (Int32)}
     */
    static IsQuestionable => 2
}
