#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes a stream produced by the stream buffer engine.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/ns-sbe-sbe2_stream_desc
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class SBE2_STREAM_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The version number of the stream. Currently the following value is defined.
     * 
     * <a id="SBE2_STREAM_DESC_VERSION"></a>
     * <a id="sbe2_stream_desc_version"></a>
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The identifier of the stream.
     * @type {Integer}
     */
    StreamId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies whether the steam is the default for the current media type. If the value is nonzero, the stream is the default. If the value is zero, the stream is not the default.
     * @type {Integer}
     */
    Default {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
