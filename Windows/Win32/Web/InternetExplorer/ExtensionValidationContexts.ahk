#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ExtensionValidationContexts {
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
    static ExtensionValidationContextNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExtensionValidationContextDynamic => 1

    /**
     * @type {Integer (Int32)}
     */
    static ExtensionValidationContextParsed => 2
}
