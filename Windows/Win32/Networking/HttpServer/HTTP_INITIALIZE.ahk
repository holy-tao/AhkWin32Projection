#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_INITIALIZE {
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
    static HTTP_INITIALIZE_CONFIG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_INITIALIZE_SERVER => 1
}
