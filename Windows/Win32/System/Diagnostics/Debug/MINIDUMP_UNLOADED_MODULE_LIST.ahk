#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a list of unloaded modules.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_unloaded_module_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_UNLOADED_MODULE_LIST {
    #StructPack 4

    /**
     * The size of the header data for the stream, in bytes. This is generally <c>sizeof(MINIDUMP_UNLOADED_MODULE_LIST)</c>.
     */
    SizeOfHeader : UInt32

    /**
     * The size of each entry following the header, in bytes. This is generally <c>sizeof(MINIDUMP_UNLOADED_MODULE)</c>.
     */
    SizeOfEntry : UInt32

    /**
     * The number of entries in the stream. These are generally <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_unloaded_module">MINIDUMP_UNLOADED_MODULE</a> structures. The entries follow the header.
     */
    NumberOfEntries : UInt32

}
