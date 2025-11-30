#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIRTUAL_RESOURCE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_VIRTUAL_CHANNEL_CAPABILITY extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Pointer<PCI_EXPRESS_ENHANCED_CAPABILITY_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<VIRTUAL_CHANNEL_CAPABILITIES1>}
     */
    Capabilities1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<VIRTUAL_CHANNEL_CAPABILITIES2>}
     */
    Capabilities2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<VIRTUAL_CHANNEL_CONTROL>}
     */
    Control {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<VIRTUAL_CHANNEL_STATUS>}
     */
    Status {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Array<VIRTUAL_RESOURCE>}
     */
    Resource{
        get {
            if(!this.HasProp("__ResourceProxyArray"))
                this.__ResourceProxyArray := Win32FixedArray(this.ptr + 40, 8, Primitive, "ptr")
            return this.__ResourceProxyArray
        }
    }
}
