#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the callback mode for the CIM extensions for WriteError and PromptUser functions.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_callbackmode
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_CallbackMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Report the details to the client, but the provider will receive a preconfigured response.  The provider does not wait for the client to receive the request before continuing.
     * @type {Integer (Int32)}
     */
    static MI_CALLBACKMODE_REPORT => 0

    /**
     * Query the  client to determine whether  the provider should continue.
     * @type {Integer (Int32)}
     */
    static MI_CALLBACKMODE_INQUIRE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MI_CALLBACKMODE_IGNORE => 2
}
