#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcbufferpointer
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct RdcBufferPointer {
    #StructPack 8

    /**
     * Size, in bytes, of the buffer.
     */
    m_Size : UInt32

    /**
     * For input buffers, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdccomparator-process">IRdcComparator::Process</a> 
     *       and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdcgenerator-process">IRdcGenerator::Process</a> will store here how 
     *       much (if any) of the buffer was used during processing.
     */
    m_Used : UInt32

    /**
     * Pointer to the buffer.
     */
    m_Data : IntPtr

}
