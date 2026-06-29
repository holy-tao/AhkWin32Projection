#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct PROXIMITY_TYPE {
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
    static ProximityType_ObjectProximity => 0

    /**
     * @type {Integer (Int32)}
     */
    static ProximityType_HumanProximity => 1

    /**
     * @type {Integer (Int32)}
     */
    static ProximityType_Force_Dword => -1
}
