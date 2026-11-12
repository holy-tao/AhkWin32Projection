#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\SystemInformation\GROUP_AFFINITY.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SHARED_COMPUTE_UNIT_RELATIONSHIP extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ComputeUnitCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 8, 14, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    GroupCount {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {GROUP_AFFINITY}
     */
    GroupMasks {
        get {
            if(!this.HasProp("__GroupMasksProxyArray"))
                this.__GroupMasksProxyArray := Win32FixedArray(this.ptr + 24, 1, GROUP_AFFINITY, "")
            return this.__GroupMasksProxyArray
        }
    }
}
