#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WM_PORT_NUMBER_RANGE structure describes the range of port numbers used by the IWMReaderNetworkConfig interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_port_number_range
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_PORT_NUMBER_RANGE {
    #StructPack 2

    /**
     * <b>WORD</b> containing the lowest port number.
     */
    wPortBegin : UInt16

    /**
     * <b>WORD</b> containing the highest port number.
     */
    wPortEnd : UInt16

}
