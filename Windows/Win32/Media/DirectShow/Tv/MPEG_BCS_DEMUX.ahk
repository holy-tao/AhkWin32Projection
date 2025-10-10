#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MPEG_BCS_DEMUX structure identifies the filter graph that is providing the MPEG-2 data stream.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ns-mpeg2structs-mpeg_bcs_demux
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_BCS_DEMUX extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the filter graph instance.
     * @type {Integer}
     */
    AVMGraphId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
