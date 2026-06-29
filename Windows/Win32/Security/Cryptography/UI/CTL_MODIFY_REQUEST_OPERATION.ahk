#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CTL_MODIFY_REQUEST_OPERATION {
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
    static CTL_MODIFY_REQUEST_ADD_TRUSTED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_MODIFY_REQUEST_ADD_NOT_TRUSTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_MODIFY_REQUEST_REMOVE => 2
}
