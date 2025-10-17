#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDR64_POINTER_REPEAT_FLAGS.ahk
#Include .\NDR64_REPEAT_FORMAT.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR64_FIXED_REPEAT_FORMAT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {NDR64_REPEAT_FORMAT}
     */
    RepeatFormat{
        get {
            if(!this.HasProp("__RepeatFormat"))
                this.__RepeatFormat := NDR64_REPEAT_FORMAT(0, this)
            return this.__RepeatFormat
        }
    }

    /**
     * @type {Integer}
     */
    Iterations {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
