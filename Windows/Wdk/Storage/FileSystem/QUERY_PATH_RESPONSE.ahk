#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class QUERY_PATH_RESPONSE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    LengthAccepted {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
