#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_PORT_NUMBER_RANGE structure describes the range of port numbers used by the IWMReaderNetworkConfig interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_port_number_range
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_PORT_NUMBER_RANGE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * <b>WORD</b> containing the lowest port number.
     * @type {Integer}
     */
    wPortBegin {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * <b>WORD</b> containing the highest port number.
     * @type {Integer}
     */
    wPortEnd {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
