#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a stream produced by the stream buffer engine.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/ns-sbe-sbe2_stream_desc
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct SBE2_STREAM_DESC {
    #StructPack 4

    /**
     * The version number of the stream. Currently the following value is defined.
     * 
     * <a id="SBE2_STREAM_DESC_VERSION"></a>
     * <a id="sbe2_stream_desc_version"></a>
     */
    Version : UInt32

    /**
     * The identifier of the stream.
     */
    StreamId : UInt32

    /**
     * Specifies whether the steam is the default for the current media type. If the value is nonzero, the stream is the default. If the value is zero, the stream is not the default.
     */
    Default : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

}
