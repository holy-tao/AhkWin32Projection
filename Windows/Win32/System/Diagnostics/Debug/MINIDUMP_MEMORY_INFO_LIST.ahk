#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a list of memory regions.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_info_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_MEMORY_INFO_LIST {
    #StructPack 8

    /**
     * The size of the header data for the stream, in bytes. This is generally <c>sizeof(MINIDUMP_MEMORY_INFO_LIST)</c>.
     */
    SizeOfHeader : UInt32

    /**
     * The size of each entry following the header, in bytes. This is generally <c>sizeof(MINIDUMP_MEMORY_INFO)</c>.
     */
    SizeOfEntry : UInt32

    /**
     * The number of entries in the stream. These are generally  <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_memory_info">MINIDUMP_MEMORY_INFO</a> structures. The entries follow the header.
     */
    NumberOfEntries : Int64

}
