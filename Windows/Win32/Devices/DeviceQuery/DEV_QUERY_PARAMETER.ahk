#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Properties\DEVPROPTYPE.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
class DEV_QUERY_PARAMETER extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {DEVPROPKEY}
     */
    Key {
        get {
            if(!this.HasProp("__Key"))
                this.__Key := DEVPROPKEY(0, this)
            return this.__Key
        }
    }

    /**
     * @type {DEVPROPTYPE}
     */
    Type {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
