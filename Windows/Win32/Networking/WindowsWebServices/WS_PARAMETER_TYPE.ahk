#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The different parameter types.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_parameter_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_PARAMETER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not an array type.
     * @type {Integer (Int32)}
     */
    static WS_PARAMETER_TYPE_NORMAL => 0

    /**
     * An array type.
     * @type {Integer (Int32)}
     */
    static WS_PARAMETER_TYPE_ARRAY => 1

    /**
     * The array count.
     * @type {Integer (Int32)}
     */
    static WS_PARAMETER_TYPE_ARRAY_COUNT => 2

    /**
     * Parameter is a WSDL message element.
     * @type {Integer (Int32)}
     */
    static WS_PARAMETER_TYPE_MESSAGES => 3
}
