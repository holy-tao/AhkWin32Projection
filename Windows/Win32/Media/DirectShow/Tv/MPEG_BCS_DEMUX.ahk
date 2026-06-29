#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPEG_BCS_DEMUX structure identifies the filter graph that is providing the MPEG-2 data stream.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_bcs_demux
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_BCS_DEMUX {
    #StructPack 4

    /**
     * Specifies the filter graph instance.
     */
    AVMGraphId : UInt32

}
