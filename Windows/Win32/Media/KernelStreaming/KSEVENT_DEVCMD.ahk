#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSEVENT_DEVCMD {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_EXTDEV_COMMAND_NOTIFY_INTERIM_READY => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_EXTDEV_COMMAND_CONTROL_INTERIM_READY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_EXTDEV_COMMAND_BUSRESET => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_EXTDEV_TIMECODE_UPDATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_EXTDEV_OPERATION_MODE_UPDATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_EXTDEV_TRANSPORT_STATE_UPDATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_EXTDEV_NOTIFY_REMOVAL => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_EXTDEV_NOTIFY_MEDIUM_CHANGE => 7
}
