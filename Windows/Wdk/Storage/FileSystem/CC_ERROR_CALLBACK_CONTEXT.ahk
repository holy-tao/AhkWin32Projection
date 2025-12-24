#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class CC_ERROR_CALLBACK_CONTEXT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NodeByteSize {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {NTSTATUS}
     */
    ErrorCode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
