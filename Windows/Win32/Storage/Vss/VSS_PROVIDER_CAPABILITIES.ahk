#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This enumeration is reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ne-vss-vss_provider_capabilities
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_PROVIDER_CAPABILITIES {
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
    static VSS_PRV_CAPABILITY_LEGACY => 1

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PRV_CAPABILITY_COMPLIANT => 2

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PRV_CAPABILITY_LUN_REPOINT => 4

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PRV_CAPABILITY_LUN_RESYNC => 8

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PRV_CAPABILITY_OFFLINE_CREATION => 16

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PRV_CAPABILITY_MULTIPLE_IMPORT => 32

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PRV_CAPABILITY_RECYCLING => 64

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PRV_CAPABILITY_PLEX => 128

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PRV_CAPABILITY_DIFFERENTIAL => 256

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PRV_CAPABILITY_CLUSTERED => 512
}
