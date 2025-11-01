#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_create_flags
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_CREATE_FLAGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Required {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Advisory {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
