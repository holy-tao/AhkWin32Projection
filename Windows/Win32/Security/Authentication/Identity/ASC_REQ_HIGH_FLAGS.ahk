#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct ASC_REQ_HIGH_FLAGS {
    value : Int64

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt64)}
     */
    static ASC_REQ_MESSAGES => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static ASC_REQ_EXPLICIT_SESSION => 68719476736
}
