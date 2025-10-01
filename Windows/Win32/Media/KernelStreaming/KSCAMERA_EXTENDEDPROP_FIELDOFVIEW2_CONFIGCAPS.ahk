#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_EXTENDEDPROP_FIELDOFVIEW2_CONFIGCAPS extends Win32Struct
{
    static sizeof => 728

    static packingSize => 4

    /**
     * @type {Integer}
     */
    DefaultDiagonalFieldOfViewInDegrees {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DiscreteFoVStopsCount {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<UInt16>}
     */
    DiscreteFoVStops{
        get {
            if(!this.HasProp("__DiscreteFoVStopsProxyArray"))
                this.__DiscreteFoVStopsProxyArray := Win32FixedArray(this.ptr + 4, 360, Primitive, "ushort")
            return this.__DiscreteFoVStopsProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 724, "uint")
        set => NumPut("uint", value, this, 724)
    }
}
