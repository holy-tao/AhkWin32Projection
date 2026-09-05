#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
class DML_IS_INFINITY_MODE extends Win32Enum {

    /**
     * Native name: DML_IS_INFINITY_MODE_EITHER
     * @type {Integer (Int32)}
     */
    static EITHER => 0

    /**
     * Native name: DML_IS_INFINITY_MODE_POSITIVE
     * @type {Integer (Int32)}
     */
    static POSITIVE => 1

    /**
     * Native name: DML_IS_INFINITY_MODE_NEGATIVE
     * @type {Integer (Int32)}
     */
    static NEGATIVE => 2
}
