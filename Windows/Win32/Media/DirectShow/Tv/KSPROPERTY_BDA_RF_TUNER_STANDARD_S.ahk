#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSP_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSPROPERTY_BDA_RF_TUNER_STANDARD_S extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSP_NODE(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    SignalType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    SignalStandard {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
