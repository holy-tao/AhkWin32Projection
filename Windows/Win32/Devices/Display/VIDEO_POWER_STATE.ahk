#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_POWER_STATE {
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
    static VideoPowerUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerStandBy => 2

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerSuspend => 3

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerOff => 4

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerHibernate => 5

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerShutdown => 6

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerMaximum => 7
}
