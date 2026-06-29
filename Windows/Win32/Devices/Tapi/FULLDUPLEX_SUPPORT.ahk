#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FULLDUPLEX_SUPPORT enum is used by applications interacting with legacy TSPs to indicate whether a specified terminal supports full duplex operations. This enum is returned by the ITLegacyWaveSupport::IsFullDuplex method.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-fullduplex_support
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct FULLDUPLEX_SUPPORT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Full duplex supported.
     * @type {Integer (Int32)}
     */
    static FDS_SUPPORTED => 0

    /**
     * Full duplex not supported.
     * @type {Integer (Int32)}
     */
    static FDS_NOTSUPPORTED => 1

    /**
     * The TSP cannot determine whether the device is full duplex.
     * @type {Integer (Int32)}
     */
    static FDS_UNKNOWN => 2
}
