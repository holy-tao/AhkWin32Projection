#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains statistics about the progress of the ASF multiplexer.
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfmultiplexer-getstatistics">IMFASFMultiplexer::GetStatistics</a> to retrieve this structure.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ns-wmcontainer-asf_mux_statistics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ASF_MUX_STATISTICS {
    #StructPack 4

    /**
     * Number of frames written by the ASF multiplexer.
     */
    cFramesWritten : UInt32

    /**
     * Number of frames dropped by the ASF multiplexer.
     */
    cFramesDropped : UInt32

}
