#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLSR {
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
    static HLSR_HOME => 0

    /**
     * @type {Integer (Int32)}
     */
    static HLSR_SEARCHPAGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HLSR_HISTORYFOLDER => 2
}
