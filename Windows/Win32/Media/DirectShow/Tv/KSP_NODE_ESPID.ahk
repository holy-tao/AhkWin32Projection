#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSP_NODE.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSP_NODE_ESPID extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    Property {
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSP_NODE(0, this)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    EsPid {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
