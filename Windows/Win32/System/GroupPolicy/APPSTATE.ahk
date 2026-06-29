#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct APPSTATE {
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
    static ABSENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static ASSIGNED => 1

    /**
     * @type {Integer (Int32)}
     */
    static PUBLISHED => 2
}
