#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_VPCI_PROBED_BARS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
     */
    Value{
        get {
            if(!this.HasProp("__ValueProxyArray"))
                this.__ValueProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "uint")
            return this.__ValueProxyArray
        }
    }
}
