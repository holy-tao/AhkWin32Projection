#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSP_NODE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VIDEOPROCAMP_NODE_S extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    NodeProperty{
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSP_NODE(0, this)
            return this.__NodeProperty
        }
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
