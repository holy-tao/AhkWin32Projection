#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncH263PictureType extends Win32Enum {

    /**
     * Native name: eAVEncH263PictureType_I
     * @type {Integer (Int32)}
     */
    static I => 0

    /**
     * Native name: eAVEncH263PictureType_P
     * @type {Integer (Int32)}
     */
    static P => 1

    /**
     * Native name: eAVEncH263PictureType_B
     * @type {Integer (Int32)}
     */
    static B => 2
}
