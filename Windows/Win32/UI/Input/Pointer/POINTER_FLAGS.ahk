#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_INRANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_INCONTACT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_FIRSTBUTTON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_SECONDBUTTON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_THIRDBUTTON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_FOURTHBUTTON => 128

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_FIFTHBUTTON => 256

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_PRIMARY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_CONFIDENCE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_CANCELED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_DOWN => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_UPDATE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_UP => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_WHEEL => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_HWHEEL => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_CAPTURECHANGED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static POINTER_FLAG_HASTRANSFORM => 4194304
}
