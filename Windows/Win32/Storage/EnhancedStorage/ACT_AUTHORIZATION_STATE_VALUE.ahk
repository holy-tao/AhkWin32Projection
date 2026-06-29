#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
export default struct ACT_AUTHORIZATION_STATE_VALUE {
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
    static ACT_UNAUTHORIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACT_AUTHORIZED => 1
}
