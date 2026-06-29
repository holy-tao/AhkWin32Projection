#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_TILE_HUBTYPE {
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
    static PM_TILE_HUBTYPE_MUSIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_HUBTYPE_MOSETTINGS => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_HUBTYPE_GAMES => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_HUBTYPE_APPLIST => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_HUBTYPE_STARTMENU => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_HUBTYPE_LOCKSCREEN => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_HUBTYPE_KIDZONE => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_HUBTYPE_CACHED => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static PM_TILE_HUBTYPE_INVALID => 67108865
}
