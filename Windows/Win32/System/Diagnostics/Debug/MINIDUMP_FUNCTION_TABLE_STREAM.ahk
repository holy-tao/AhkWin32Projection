#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the header for the function table stream.
 * @remarks
 * In this context, a data stream is a set of data in a minidump file. This header structure is followed by <b>NumberOfDescriptors</b> function tables. For each function table there is a 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_function_table_descriptor">MINIDUMP_FUNCTION_TABLE_DESCRIPTOR</a> structure, then the raw system descriptor for the table, then the raw system function entry data. If necessary, alignment padding is placed between tables to properly align the initial structures.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_function_table_stream
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_FUNCTION_TABLE_STREAM {
    #StructPack 4

    /**
     * The size of header information for the stream, in bytes. This value is <c>sizeof(MINIDUMP_FUNCTION_TABLE_STREAM)</c>.
     */
    SizeOfHeader : UInt32

    /**
     * The size of a descriptor in the stream, in bytes. This value is <c>sizeof(MINIDUMP_FUNCTION_TABLE_DESCRIPTOR)</c>.
     */
    SizeOfDescriptor : UInt32

    /**
     * The size of a raw system descriptor in the stream, in bytes. This value depends on the particular platform and system version on which the minidump was generated.
     */
    SizeOfNativeDescriptor : UInt32

    /**
     * The size of a raw system function table entry, in bytes. This value depends on the particular platform and system version on which the minidump was generated.
     */
    SizeOfFunctionEntry : UInt32

    /**
     * The number of descriptors in the stream.
     */
    NumberOfDescriptors : UInt32

    /**
     * The size of alignment padding that follows the header, in bytes.
     */
    SizeOfAlignPad : UInt32

}
