#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct INF_STYLE {
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
    static INF_STYLE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INF_STYLE_OLDNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INF_STYLE_WIN4 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INF_STYLE_CACHE_ENABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INF_STYLE_CACHE_DISABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INF_STYLE_CACHE_IGNORE => 64
}
