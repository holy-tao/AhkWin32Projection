#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RAWINPUTDEVICE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_REMOVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_EXCLUDE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_PAGEONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_NOLEGACY => 48

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_INPUTSINK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_CAPTUREMOUSE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_NOHOTKEYS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_APPKEYS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_EXINPUTSINK => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_DEVNOTIFY => 8192
}
