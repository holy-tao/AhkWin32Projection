#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SchGetExtensionsOptions {
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
    static SCH_EXTENSIONS_OPTIONS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCH_NO_RECORD_HEADER => 1
}
