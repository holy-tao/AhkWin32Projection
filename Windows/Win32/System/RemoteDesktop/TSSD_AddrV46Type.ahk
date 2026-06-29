#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the IP address type.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssd_addrv46type
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct TSSD_AddrV46Type {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The IP address is not valid.
     * @type {Integer (Int32)}
     */
    static TSSD_ADDR_UNDEFINED => 0

    /**
     * The address is in IPv4 format.
     * @type {Integer (Int32)}
     */
    static TSSD_ADDR_IPv4 => 4

    /**
     * The address is in IPv6 format.
     * @type {Integer (Int32)}
     */
    static TSSD_ADDR_IPv6 => 6
}
