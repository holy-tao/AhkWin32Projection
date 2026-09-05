#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSMICARRAY_MICTYPE extends Win32Enum {

    /**
     * Native name: KSMICARRAY_MICTYPE_OMNIDIRECTIONAL
     * @type {Integer (Int32)}
     */
    static OMNIDIRECTIONAL => 0

    /**
     * Native name: KSMICARRAY_MICTYPE_SUBCARDIOID
     * @type {Integer (Int32)}
     */
    static SUBCARDIOID => 1

    /**
     * Native name: KSMICARRAY_MICTYPE_CARDIOID
     * @type {Integer (Int32)}
     */
    static CARDIOID => 2

    /**
     * Native name: KSMICARRAY_MICTYPE_SUPERCARDIOID
     * @type {Integer (Int32)}
     */
    static SUPERCARDIOID => 3

    /**
     * Native name: KSMICARRAY_MICTYPE_HYPERCARDIOID
     * @type {Integer (Int32)}
     */
    static HYPERCARDIOID => 4

    /**
     * Native name: KSMICARRAY_MICTYPE_8SHAPED
     * @type {Integer (Int32)}
     */
    static 8SHAPED => 5

    /**
     * Native name: KSMICARRAY_MICTYPE_VENDORDEFINED
     * @type {Integer (Int32)}
     */
    static VENDORDEFINED => 15
}
