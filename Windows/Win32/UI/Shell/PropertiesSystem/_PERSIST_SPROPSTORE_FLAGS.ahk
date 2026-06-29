#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct _PERSIST_SPROPSTORE_FLAGS {
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
    static FPSPS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static FPSPS_READONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static FPSPS_TREAT_NEW_VALUES_AS_DIRTY => 2
}
