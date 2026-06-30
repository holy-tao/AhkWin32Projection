#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 */
class APPLICATION_EVENT_DATA extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbApplicationEventData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    ApplicationId {
        get {
            if(!this.HasProp("__ApplicationId"))
                this.__ApplicationId := Guid(4, this)
            return this.__ApplicationId
        }
    }

    /**
     * @type {Guid}
     */
    EndpointId {
        get {
            if(!this.HasProp("__EndpointId"))
                this.__EndpointId := Guid(20, this)
            return this.__EndpointId
        }
    }

    /**
     * @type {Integer}
     */
    dwEventId {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    cbEventData {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Array<Integer>}
     */
    bEventData {
        get {
            if(!this.HasProp("__bEventDataProxyArray"))
                this.__bEventDataProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__bEventDataProxyArray
        }
    }
}
