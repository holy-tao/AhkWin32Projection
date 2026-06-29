#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_MAP_GPA_RANGE_FLAGS {
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
    static WHvMapGpaRangeFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvMapGpaRangeFlagRead => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvMapGpaRangeFlagWrite => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvMapGpaRangeFlagExecute => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvMapGpaRangeFlagTrackDirtyPages => 8
}
