#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains HDCP status flags. This enumeration is used in the DXVA_COPPStatusHDCPKeyData structure.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_statushdcpflags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct COPP_StatusHDCPFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The device is an HDCP repeater.
     * @type {Integer (Int32)}
     */
    static COPP_HDCPRepeater => 1

    /**
     * Reserved. Must be zero.
     * @type {Integer (Int32)}
     */
    static COPP_HDCPFlagsReserved => -2
}
