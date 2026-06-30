#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSP_NODE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_CAMERACONTROL_NODE_S2 extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    NodeProperty {
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSP_NODE(0, this)
            return this.__NodeProperty
        }
    }

    /**
     * @type {Integer}
     */
    Value1 {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Value2 {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
