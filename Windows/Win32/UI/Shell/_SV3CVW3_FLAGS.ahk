#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _SV3CVW3_FLAGS {
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
    static SV3CVW3_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SV3CVW3_NONINTERACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SV3CVW3_FORCEVIEWMODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SV3CVW3_FORCEFOLDERFLAGS => 4
}
