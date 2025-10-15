#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VOLUME_SET_GPT_ATTRIBUTES_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    GptAttributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    RevertOnClose{
        get {
            if(!this.HasProp("__RevertOnClose"))
                this.__RevertOnClose := BOOLEAN(this.ptr + 8)
            return this.__RevertOnClose
        }
    }

    /**
     * @type {BOOLEAN}
     */
    ApplyToAllConnectedVolumes{
        get {
            if(!this.HasProp("__ApplyToAllConnectedVolumes"))
                this.__ApplyToAllConnectedVolumes := BOOLEAN(this.ptr + 9)
            return this.__ApplyToAllConnectedVolumes
        }
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
