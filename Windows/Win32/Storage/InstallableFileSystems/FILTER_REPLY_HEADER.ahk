#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 * @version v4.0.30319
 */
class FILTER_REPLY_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MessageId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
