#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains HDCP status flags. This enumeration is used in the DXVA_COPPStatusHDCPKeyData structure.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_statushdcpflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COPP_StatusHDCPFlags{

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
