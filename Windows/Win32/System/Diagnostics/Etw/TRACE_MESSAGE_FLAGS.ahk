#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_MESSAGE_FLAGS {
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
    static TRACE_MESSAGE_COMPONENTID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_GUID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_SEQUENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_SYSTEMINFO => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_TIMESTAMP => 8
}
