#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STREAMS_QUERY_ID_OUTPUT_BUFFER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    StreamId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
