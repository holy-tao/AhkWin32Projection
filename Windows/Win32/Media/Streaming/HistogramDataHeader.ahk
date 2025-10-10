#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HistogramDataHeader structure describes the blob format for the MF_CAPTURE_METADATA_HISTOGRAM attribute.
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-histogramdataheader
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class HistogramDataHeader extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Size in bytes of this header + all following histogram data.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Mask of the color channel for the histogram data.
     * @type {Integer}
     */
    ChannelMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 1 if linear, 0 if nonlinear.
     * @type {Integer}
     */
    Linear {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
