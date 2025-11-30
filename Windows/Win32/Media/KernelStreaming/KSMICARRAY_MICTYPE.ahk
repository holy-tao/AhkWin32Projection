#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSMICARRAY_MICTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICTYPE_OMNIDIRECTIONAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICTYPE_SUBCARDIOID => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICTYPE_CARDIOID => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICTYPE_SUPERCARDIOID => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICTYPE_HYPERCARDIOID => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICTYPE_8SHAPED => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICTYPE_VENDORDEFINED => 15
}
