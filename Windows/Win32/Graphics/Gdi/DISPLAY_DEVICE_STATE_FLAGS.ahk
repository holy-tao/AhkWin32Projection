#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class DISPLAY_DEVICE_STATE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DISPLAY_DEVICE_ATTACHED_TO_DESKTOP
     * @type {Integer (UInt32)}
     */
    static ATTACHED_TO_DESKTOP => 1

    /**
     * Native name: DISPLAY_DEVICE_MULTI_DRIVER
     * @type {Integer (UInt32)}
     */
    static MULTI_DRIVER => 2

    /**
     * Native name: DISPLAY_DEVICE_PRIMARY_DEVICE
     * @type {Integer (UInt32)}
     */
    static PRIMARY_DEVICE => 4

    /**
     * Native name: DISPLAY_DEVICE_MIRRORING_DRIVER
     * @type {Integer (UInt32)}
     */
    static MIRRORING_DRIVER => 8

    /**
     * Native name: DISPLAY_DEVICE_VGA_COMPATIBLE
     * @type {Integer (UInt32)}
     */
    static VGA_COMPATIBLE => 16

    /**
     * Native name: DISPLAY_DEVICE_REMOVABLE
     * @type {Integer (UInt32)}
     */
    static REMOVABLE => 32

    /**
     * Native name: DISPLAY_DEVICE_ACC_DRIVER
     * @type {Integer (UInt32)}
     */
    static ACC_DRIVER => 64

    /**
     * Native name: DISPLAY_DEVICE_MODESPRUNED
     * @type {Integer (UInt32)}
     */
    static MODESPRUNED => 134217728

    /**
     * Native name: DISPLAY_DEVICE_RDPUDD
     * @type {Integer (UInt32)}
     */
    static RDPUDD => 16777216

    /**
     * Native name: DISPLAY_DEVICE_REMOTE
     * @type {Integer (UInt32)}
     */
    static REMOTE => 67108864

    /**
     * Native name: DISPLAY_DEVICE_DISCONNECT
     * @type {Integer (UInt32)}
     */
    static DISCONNECT => 33554432

    /**
     * Native name: DISPLAY_DEVICE_TS_COMPATIBLE
     * @type {Integer (UInt32)}
     */
    static TS_COMPATIBLE => 2097152

    /**
     * Native name: DISPLAY_DEVICE_UNSAFE_MODES_ON
     * @type {Integer (UInt32)}
     */
    static UNSAFE_MODES_ON => 524288

    /**
     * Native name: DISPLAY_DEVICE_ACTIVE
     * @type {Integer (UInt32)}
     */
    static ACTIVE => 1

    /**
     * Native name: DISPLAY_DEVICE_ATTACHED
     * @type {Integer (UInt32)}
     */
    static ATTACHED => 2
}
