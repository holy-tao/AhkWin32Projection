#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class DEV_BROADCAST_HANDLE32 extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dbch_size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dbch_devicetype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dbch_reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dbch_handle {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dbch_hdevnotify {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Guid}
     */
    dbch_eventguid {
        get {
            if(!this.HasProp("__dbch_eventguid"))
                this.__dbch_eventguid := Guid(20, this)
            return this.__dbch_eventguid
        }
    }

    /**
     * @type {Integer}
     */
    dbch_nameoffset {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Array<Integer>}
     */
    dbch_data {
        get {
            if(!this.HasProp("__dbch_dataProxyArray"))
                this.__dbch_dataProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__dbch_dataProxyArray
        }
    }
}
