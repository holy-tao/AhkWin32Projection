#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ZONE_CONDITION {
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
    static ZoneConditionConventional => 0

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionEmpty => 1

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionImplicitlyOpened => 2

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionExplicitlyOpened => 3

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionClosed => 4

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionReadOnly => 13

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionFull => 14

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionOffline => 15
}
