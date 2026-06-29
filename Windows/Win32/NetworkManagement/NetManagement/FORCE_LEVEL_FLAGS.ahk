#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct FORCE_LEVEL_FLAGS {
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
    static USE_NOFORCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USE_FORCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USE_LOTS_OF_FORCE => 2
}
