#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the header for a handle data stream.
 * @remarks
 * In this context, a data stream is a set of data in a minidump file. This header structure is followed by <b>NumberOfDescriptors</b>
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_descriptor">MINIDUMP_HANDLE_DESCRIPTOR</a> or <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_descriptor_2">MINIDUMP_HANDLE_DESCRIPTOR_2</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_data_stream
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_HANDLE_DATA_STREAM {
    #StructPack 4

    /**
     * The size of the header information for the stream, in bytes. This value is <c>sizeof(MINIDUMP_HANDLE_DATA_STREAM)</c>.
     */
    SizeOfHeader : UInt32

    /**
     * The size of a descriptor in the stream, in bytes. This value is <c>sizeof(MINIDUMP_HANDLE_DESCRIPTOR)</code> or <code>sizeof(MINIDUMP_HANDLE_DESCRIPTOR_2)</c>.
     */
    SizeOfDescriptor : UInt32

    /**
     * The number of descriptors in the stream.
     */
    NumberOfDescriptors : UInt32

    /**
     * Reserved for future use; must be zero.
     */
    Reserved : UInt32

}
