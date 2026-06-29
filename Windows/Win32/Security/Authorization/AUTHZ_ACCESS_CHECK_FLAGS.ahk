#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_ACCESS_CHECK_FLAGS {
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
    static AUTHZ_ACCESS_CHECK_NO_DEEP_COPY_SD => 1
}
