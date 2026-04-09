#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU2 extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ObjectCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ObjectHandleArray {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BroadcastContextCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Integer>}
     */
    BroadcastContextArray {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    FenceValue {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {HANDLE}
     */
    CpuEventHandle {
        get {
            if(!this.HasProp("__CpuEventHandle"))
                this.__CpuEventHandle := HANDLE(40, this)
            return this.__CpuEventHandle
        }
    }

    /**
     * @type {Pointer<Integer>}
     */
    MonitoredFenceValueArray {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 40, 8, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
