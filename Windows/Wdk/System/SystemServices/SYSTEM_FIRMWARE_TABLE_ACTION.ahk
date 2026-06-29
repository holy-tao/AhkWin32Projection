#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SYSTEM_FIRMWARE_TABLE_ACTION {
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
    static SystemFirmwareTable_Enumerate => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemFirmwareTable_Get => 1
}
