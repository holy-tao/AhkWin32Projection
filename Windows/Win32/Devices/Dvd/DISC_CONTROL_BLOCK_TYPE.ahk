#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DISC_CONTROL_BLOCK_TYPE {
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
    static FormattingDiscControlBlock => 1178878720

    /**
     * @type {Integer (Int32)}
     */
    static WriteInhibitDiscControlBlock => 1464091392

    /**
     * @type {Integer (Int32)}
     */
    static SessionInfoDiscControlBlock => 1396982528

    /**
     * @type {Integer (Int32)}
     */
    static DiscControlBlockList => -1
}
