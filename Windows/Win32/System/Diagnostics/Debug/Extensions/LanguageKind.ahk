#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct LanguageKind {
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
    static LanguageUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static LanguageC => 1

    /**
     * @type {Integer (Int32)}
     */
    static LanguageCPP => 2

    /**
     * @type {Integer (Int32)}
     */
    static LanguageAssembly => 3

    /**
     * @type {Integer (Int32)}
     */
    static LanguageRust => 4
}
