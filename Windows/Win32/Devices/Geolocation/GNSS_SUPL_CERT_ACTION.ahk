#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_SUPL_CERT_ACTION {
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
    static GNSS_Supl_Cert_Inject => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Supl_Cert_Delete => 2

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Supl_Cert_Purge => 3
}
