#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_READER_STATISTICS structure describes the performance of a reading operation.
 * @remarks
 * You must set the <b>cbSize</b> member manually before using this structure. It should always be set to sizeof(<b>WM_READER_STATISTICS</b>).
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_reader_statistics
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_READER_STATISTICS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The size of the <b>WM_READER_STATISTICS</b> structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>DWORD</b> containing the bandwidth, in bits per second.
     * @type {Integer}
     */
    dwBandwidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Count of packets received.
     * @type {Integer}
     */
    cPacketsReceived {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Count of lost packets which were recovered. This value is only relevant during network playback.
     * @type {Integer}
     */
    cPacketsRecovered {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Count of lost packets which were not recovered. This value is only relevant during network playback.
     * @type {Integer}
     */
    cPacketsLost {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <b>WORD</b> containing the quality, which is the percentage of total packets that were received.
     * @type {Integer}
     */
    wQuality {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
