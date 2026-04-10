#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncChromaEncodeMode extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncChromaEncodeMode_420 => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncChromaEncodeMode_444 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncChromaEncodeMode_444_v2 => 2
}
