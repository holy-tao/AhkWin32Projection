#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct OBJECT_PROPERTIES_FLAGS {
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
    static OPF_OBJECTISLINK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPF_NOFILLDEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPF_SHOWHELP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OPF_DISABLECONVERT => 8
}
