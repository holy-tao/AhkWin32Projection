#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 */
class CONTENT_MISSING_EVENT_DATA extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbContentMissingEventData {
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
    ContentId {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
