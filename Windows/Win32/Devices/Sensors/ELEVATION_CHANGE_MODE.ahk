#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct ELEVATION_CHANGE_MODE {
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
    static ElevationChangeMode_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ElevationChangeMode_Elevator => 1

    /**
     * @type {Integer (Int32)}
     */
    static ElevationChangeMode_Stepping => 2

    /**
     * @type {Integer (Int32)}
     */
    static ElevationChangeMode_Max => 3

    /**
     * @type {Integer (Int32)}
     */
    static ElevationChangeMode_Force_Dword => -1
}
