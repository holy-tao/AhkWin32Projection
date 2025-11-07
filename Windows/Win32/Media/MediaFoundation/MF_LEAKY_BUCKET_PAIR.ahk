#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the buffering requirements of a file.
 * @remarks
 * 
 * This structure describes the buffering requirements for content encoded at the bit rate specified in the <b>dwBitrate</b>. The <b>msBufferWindow</b> member indicates how much data should be buffered before starting playback. The size of the buffer in bytes is <b>msBufferWinow</b>×<b>dwBitrate</b> / 8000.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ns-mfidl-mf_leaky_bucket_pair
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_LEAKY_BUCKET_PAIR extends Win32Struct
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
