#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.AssessmentTool
 */
export default struct WINSAT_OEM_CUSTOMIZATION_STATE {
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
    static WINSAT_OEM_DATA_VALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINSAT_OEM_DATA_NON_SYS_CONFIG_MATCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINSAT_OEM_DATA_INVALID => 2

    /**
     * @type {Integer (Int32)}
     */
    static WINSAT_OEM_NO_DATA_SUPPLIED => 3
}
