#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCW_REGISTRATION_FLAGS {
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
    static PcwRegistrationNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static PcwRegistrationSiloNeutral => 1
}
