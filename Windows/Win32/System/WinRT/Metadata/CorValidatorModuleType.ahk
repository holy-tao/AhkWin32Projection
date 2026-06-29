#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorValidatorModuleType {
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
    static ValidatorModuleTypeInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeMin => 1

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypePE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeObj => 2

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeEnc => 3

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeIncr => 4

    /**
     * @type {Integer (Int32)}
     */
    static ValidatorModuleTypeMax => 4
}
