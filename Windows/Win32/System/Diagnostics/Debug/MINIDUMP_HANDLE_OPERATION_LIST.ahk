#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a list of handle operations.
 * @remarks
 * For a definition of the <b>AVRF_HANDLE_OPERATION</b> structure, see the Avrfsdk.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_operation_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_HANDLE_OPERATION_LIST {
    #StructPack 4

    /**
     * The size of the header data for the stream, in bytes. This is generally <c>sizeof(MINIDUMP_HANDLE_OPERATION_LIST)</c>.
     */
    SizeOfHeader : UInt32

    /**
     * The size of each entry following the header, in bytes. This is generally <c>sizeof(AVRF_HANDLE_OPERATION)</c>.
     */
    SizeOfEntry : UInt32

    /**
     * The number of entries in the stream.  These are generally <b>AVRF_HANDLE_OPERATION</b> structures. The entries follow the header.
     */
    NumberOfEntries : UInt32

    /**
     * This member is reserved for future use.
     */
    Reserved : UInt32

}
