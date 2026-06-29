#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0 {
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
    static MSV1_0_PASSTHRU => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_GUEST_LOGON => 2
}
