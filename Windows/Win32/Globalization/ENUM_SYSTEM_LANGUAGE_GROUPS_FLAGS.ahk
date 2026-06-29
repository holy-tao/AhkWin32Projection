#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS {
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
    static LGRPID_INSTALLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LGRPID_SUPPORTED => 2
}
