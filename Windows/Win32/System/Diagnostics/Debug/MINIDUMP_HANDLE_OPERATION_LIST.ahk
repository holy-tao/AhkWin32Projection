#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of handle operations.
 * @remarks
 * 
  * For a definition of the <b>AVRF_HANDLE_OPERATION</b> structure, see the Avrfsdk.h header file.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_handle_operation_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_HANDLE_OPERATION_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size of the header data for the stream, in bytes. This is generally <c>sizeof(MINIDUMP_HANDLE_OPERATION_LIST)</c>.
     * @type {Integer}
     */
    SizeOfHeader {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of each entry following the header, in bytes. This is generally <c>sizeof(AVRF_HANDLE_OPERATION)</c>.
     * @type {Integer}
     */
    SizeOfEntry {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of entries in the stream.  These are generally <b>AVRF_HANDLE_OPERATION</b> structures. The entries follow the header.
     * @type {Integer}
     */
    NumberOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This member is reserved for future use.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
