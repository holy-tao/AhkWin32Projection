#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Restore
 */
export default struct RESTOREPOINTINFO_EVENT_TYPE {
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
    static BEGIN_NESTED_SYSTEM_CHANGE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static BEGIN_SYSTEM_CHANGE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static END_NESTED_SYSTEM_CHANGE => 103

    /**
     * @type {Integer (UInt32)}
     */
    static END_SYSTEM_CHANGE => 101
}
