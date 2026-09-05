#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Pointer
 */
class POINTER_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: POINTER_FLAG_NONE
     * @type {Integer (UInt32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: POINTER_FLAG_NEW
     * @type {Integer (UInt32)}
     */
    static FLAG_NEW => 1

    /**
     * Native name: POINTER_FLAG_INRANGE
     * @type {Integer (UInt32)}
     */
    static FLAG_INRANGE => 2

    /**
     * Native name: POINTER_FLAG_INCONTACT
     * @type {Integer (UInt32)}
     */
    static FLAG_INCONTACT => 4

    /**
     * Native name: POINTER_FLAG_FIRSTBUTTON
     * @type {Integer (UInt32)}
     */
    static FLAG_FIRSTBUTTON => 16

    /**
     * Native name: POINTER_FLAG_SECONDBUTTON
     * @type {Integer (UInt32)}
     */
    static FLAG_SECONDBUTTON => 32

    /**
     * Native name: POINTER_FLAG_THIRDBUTTON
     * @type {Integer (UInt32)}
     */
    static FLAG_THIRDBUTTON => 64

    /**
     * Native name: POINTER_FLAG_FOURTHBUTTON
     * @type {Integer (UInt32)}
     */
    static FLAG_FOURTHBUTTON => 128

    /**
     * Native name: POINTER_FLAG_FIFTHBUTTON
     * @type {Integer (UInt32)}
     */
    static FLAG_FIFTHBUTTON => 256

    /**
     * Native name: POINTER_FLAG_PRIMARY
     * @type {Integer (UInt32)}
     */
    static FLAG_PRIMARY => 8192

    /**
     * Native name: POINTER_FLAG_CONFIDENCE
     * @type {Integer (UInt32)}
     */
    static FLAG_CONFIDENCE => 16384

    /**
     * Native name: POINTER_FLAG_CANCELED
     * @type {Integer (UInt32)}
     */
    static FLAG_CANCELED => 32768

    /**
     * Native name: POINTER_FLAG_DOWN
     * @type {Integer (UInt32)}
     */
    static FLAG_DOWN => 65536

    /**
     * Native name: POINTER_FLAG_UPDATE
     * @type {Integer (UInt32)}
     */
    static FLAG_UPDATE => 131072

    /**
     * Native name: POINTER_FLAG_UP
     * @type {Integer (UInt32)}
     */
    static FLAG_UP => 262144

    /**
     * Native name: POINTER_FLAG_WHEEL
     * @type {Integer (UInt32)}
     */
    static FLAG_WHEEL => 524288

    /**
     * Native name: POINTER_FLAG_HWHEEL
     * @type {Integer (UInt32)}
     */
    static FLAG_HWHEEL => 1048576

    /**
     * Native name: POINTER_FLAG_CAPTURECHANGED
     * @type {Integer (UInt32)}
     */
    static FLAG_CAPTURECHANGED => 2097152

    /**
     * Native name: POINTER_FLAG_HASTRANSFORM
     * @type {Integer (UInt32)}
     */
    static FLAG_HASTRANSFORM => 4194304
}
