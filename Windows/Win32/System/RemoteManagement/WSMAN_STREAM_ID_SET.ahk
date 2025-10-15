#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Lists all the streams that are used for either input or output for the shell and commands.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_stream_id_set
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_STREAM_ID_SET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Defines the number of stream IDs in <b>streamIDs</b>.
     * @type {Integer}
     */
    streamIDsCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies an array of stream IDs.
     * @type {Pointer<PWSTR>}
     */
    streamIDs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
