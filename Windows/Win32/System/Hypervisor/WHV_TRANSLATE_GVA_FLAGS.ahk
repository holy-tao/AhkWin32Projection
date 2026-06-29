#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_TRANSLATE_GVA_FLAGS {
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
    static WHvTranslateGvaFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagValidateRead => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagValidateWrite => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagValidateExecute => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagPrivilegeExempt => 8

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagSetPageTableBits => 16

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagEnforceSmap => 256

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagOverrideSmap => 512
}
