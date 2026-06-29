#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct REFS_SMR_VOLUME_GC_STATE {
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
    static SmrGcStateInactive => 0

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcStatePaused => 1

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcStateActive => 2

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcStateActiveFullSpeed => 3
}
