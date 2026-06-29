#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class BDA_EVENT_DATA extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lResult {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulEventID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    uuidEventType {
        get {
            if(!this.HasProp("__uuidEventType"))
                this.__uuidEventType := Guid(8, this)
            return this.__uuidEventType
        }
    }

    /**
     * @type {Integer}
     */
    ulEventDataLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    argbEventData {
        get {
            if(!this.HasProp("__argbEventDataProxyArray"))
                this.__argbEventDataProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__argbEventDataProxyArray
        }
    }
}
