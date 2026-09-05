#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncChromaEncodeMode extends Win32Enum {

    /**
     * Native name: eAVEncChromaEncodeMode_420
     * @type {Integer (Int32)}
     */
    static 420 => 0

    /**
     * Native name: eAVEncChromaEncodeMode_444
     * @type {Integer (Int32)}
     */
    static 444 => 1

    /**
     * Native name: eAVEncChromaEncodeMode_444_v2
     * @type {Integer (Int32)}
     */
    static 444_v2 => 2
}
