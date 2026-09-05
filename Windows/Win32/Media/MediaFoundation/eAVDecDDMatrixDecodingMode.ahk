#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecDDMatrixDecodingMode extends Win32Enum {

    /**
     * Native name: eAVDecDDMatrixDecodingMode_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Native name: eAVDecDDMatrixDecodingMode_ON
     * @type {Integer (Int32)}
     */
    static ON => 1

    /**
     * Native name: eAVDecDDMatrixDecodingMode_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 2
}
