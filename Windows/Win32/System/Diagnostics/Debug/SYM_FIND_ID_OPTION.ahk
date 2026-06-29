#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct SYM_FIND_ID_OPTION {
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
    static SSRVOPT_DWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_DWORDPTR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_GUIDPTR => 8
}
