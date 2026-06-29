#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct HTTP_ADDREQ_FLAG {
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
    static HTTP_ADDREQ_FLAG_ADD => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_ADDREQ_FLAG_ADD_IF_NEW => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_ADDREQ_FLAG_COALESCE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_ADDREQ_FLAG_REPLACE => 2147483648
}
