#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DeviceStreamState {
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
    static DeviceStreamState_Stop => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStreamState_Pause => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStreamState_Run => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStreamState_Disabled => 3
}
