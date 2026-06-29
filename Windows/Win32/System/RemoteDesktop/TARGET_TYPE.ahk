#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether a target belongs to a pool or farm.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-target_type
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct TARGET_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The target type is unknown.
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The target is a virtual machine that belongs to a pool or an RD Session Host server that belongs to a farm.
     * @type {Integer (Int32)}
     */
    static FARM => 1

    /**
     * The target does not belong to a pool or farm.
     * @type {Integer (Int32)}
     */
    static NONFARM => 2
}
