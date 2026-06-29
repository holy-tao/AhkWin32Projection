#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct SET_COMPOSITION_STRING_TYPE {
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
    static SCS_SETSTR => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_CHANGEATTR => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_CHANGECLAUSE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_SETRECONVERTSTRING => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_QUERYRECONVERTSTRING => 131072
}
