#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistics about the progress of the ASF multiplexer.
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfmultiplexer-getstatistics">IMFASFMultiplexer::GetStatistics</a> to retrieve this structure.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ns-wmcontainer-asf_mux_statistics
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ASF_MUX_STATISTICS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Number of frames written by the ASF multiplexer.
     * @type {Integer}
     */
    cFramesWritten {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of frames dropped by the ASF multiplexer.
     * @type {Integer}
     */
    cFramesDropped {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
