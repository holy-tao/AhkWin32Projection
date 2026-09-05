#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_DEVCMD extends Win32Enum {

    /**
     * Native name: KSEVENT_EXTDEV_COMMAND_NOTIFY_INTERIM_READY
     * @type {Integer (Int32)}
     */
    static EXTDEV_COMMAND_NOTIFY_INTERIM_READY => 0

    /**
     * Native name: KSEVENT_EXTDEV_COMMAND_CONTROL_INTERIM_READY
     * @type {Integer (Int32)}
     */
    static EXTDEV_COMMAND_CONTROL_INTERIM_READY => 1

    /**
     * Native name: KSEVENT_EXTDEV_COMMAND_BUSRESET
     * @type {Integer (Int32)}
     */
    static EXTDEV_COMMAND_BUSRESET => 2

    /**
     * Native name: KSEVENT_EXTDEV_TIMECODE_UPDATE
     * @type {Integer (Int32)}
     */
    static EXTDEV_TIMECODE_UPDATE => 3

    /**
     * Native name: KSEVENT_EXTDEV_OPERATION_MODE_UPDATE
     * @type {Integer (Int32)}
     */
    static EXTDEV_OPERATION_MODE_UPDATE => 4

    /**
     * Native name: KSEVENT_EXTDEV_TRANSPORT_STATE_UPDATE
     * @type {Integer (Int32)}
     */
    static EXTDEV_TRANSPORT_STATE_UPDATE => 5

    /**
     * Native name: KSEVENT_EXTDEV_NOTIFY_REMOVAL
     * @type {Integer (Int32)}
     */
    static EXTDEV_NOTIFY_REMOVAL => 6

    /**
     * Native name: KSEVENT_EXTDEV_NOTIFY_MEDIUM_CHANGE
     * @type {Integer (Int32)}
     */
    static EXTDEV_NOTIFY_MEDIUM_CHANGE => 7
}
