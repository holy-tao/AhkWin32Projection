#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains HDCP status flags. This enumeration is used in the DXVA_COPPStatusHDCPKeyData structure.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_statushdcpflags
 * @namespace Windows.Win32.Media.DirectShow
 */
class COPP_StatusHDCPFlags extends Win32Enum {

    /**
     * The device is an HDCP repeater.
     * Native name: COPP_HDCPRepeater
     * @type {Integer (Int32)}
     */
    static Repeater => 1

    /**
     * Reserved. Must be zero.
     * Native name: COPP_HDCPFlagsReserved
     * @type {Integer (Int32)}
     */
    static Reserved => -2
}
