#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SET_CACHED_RUNS_STATE_INPUT_BUFFER extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    Enable {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
