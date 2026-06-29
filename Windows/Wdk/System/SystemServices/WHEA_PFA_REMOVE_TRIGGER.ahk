#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PFA_REMOVE_TRIGGER {
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
    static WheaPfaRemoveErrorThreshold => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaPfaRemoveTimeout => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaPfaRemoveCapacity => 3
}
