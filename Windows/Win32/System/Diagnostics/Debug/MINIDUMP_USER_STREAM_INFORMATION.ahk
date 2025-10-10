#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of user data streams used by the MiniDumpWriteDump function.
 * @remarks
 * 
  * In this context, a data stream refers to a block of data within a minidump file.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_user_stream_information
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_USER_STREAM_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of user streams.
     * @type {Integer}
     */
    UserStreamCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_user_stream">MINIDUMP_USER_STREAM</a> structures.
     * @type {Pointer<MINIDUMP_USER_STREAM>}
     */
    UserStreamArray {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
