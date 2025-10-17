#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 * @version v4.0.30319
 */
class DEV_QUERY_PARAMETER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {DEVPROPKEY}
     */
    Key{
        get {
            if(!this.HasProp("__Key"))
                this.__Key := DEVPROPKEY(0, this)
            return this.__Key
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
