#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct SW_DEVICE_LIFETIME {
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
    static SWDeviceLifetimeHandle => 0

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceLifetimeParentPresent => 1

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceLifetimeMax => 2
}
