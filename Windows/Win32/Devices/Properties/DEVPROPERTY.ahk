#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DEVPROPCOMPKEY.ahk

/**
 * @namespace Windows.Win32.Devices.Properties
 * @version v4.0.30319
 */
class DEVPROPERTY extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {DEVPROPCOMPKEY}
     */
    CompKey{
        get {
            if(!this.HasProp("__CompKey"))
                this.__CompKey := DEVPROPCOMPKEY(this.ptr + 0)
            return this.__CompKey
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
