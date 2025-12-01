#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_LEAKY_BUCKET_PAIR structure describes the buffering requirements for a VBR file. This structure is used with the ASFLeakyBucketPairs attribute.
 * @remarks
 * The <b>ASFLeakyBucketPairs</b> attribute gives a list of bit rates and corresponding buffer windows. For each bit rate, the <b>msBufferWindow</b> member indicates how much content the reader object will buffer before it begins playback. The size of the buffer in bytes equals <b>msBufferWindow</b> x <b>dwBitrate</b> / 8000.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_leaky_bucket_pair
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_LEAKY_BUCKET_PAIR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Bit rate, in bits per second.
     * @type {Integer}
     */
    dwBitrate {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the buffer window, in milliseconds.
     * @type {Integer}
     */
    msBufferWindow {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
