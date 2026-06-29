#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.TpmBaseServices
 */
export default struct TBS_COMMAND_LOCALITY {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_LOCALITY_ZERO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_LOCALITY_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_LOCALITY_TWO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_LOCALITY_THREE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_LOCALITY_FOUR => 4
}
