#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class APPLICATION_EVENT_DATA extends Win32Struct
{
    static sizeof => 29

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cbApplicationEventData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ApplicationId {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    EndpointId {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwEventId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    cbEventData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    bEventData{
        get {
            if(!this.HasProp("__bEventDataProxyArray"))
                this.__bEventDataProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__bEventDataProxyArray
        }
    }
}
