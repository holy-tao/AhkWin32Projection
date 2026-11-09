#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DXGI_ADAPTER_FLAG4.ahk
#Include .\DXGI_COMPUTE_PREEMPTION_GRANULARITY.ahk
#Include .\DXGI_GRAPHICS_PREEMPTION_GRANULARITY.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_ADAPTER_DESC4 extends Win32Struct {
    static sizeof => 320

    static packingSize => 8

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 0, 127, "UTF-16")
        set => StrPut(value, this.ptr + 0, 127, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    VendorId {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * @type {Integer}
     */
    SubSysId {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * @type {Pointer}
     */
    DedicatedVideoMemory {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer}
     */
    DedicatedSystemMemory {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer}
     */
    SharedSystemMemory {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {LUID}
     */
    AdapterLuid {
        get {
            if(!this.HasProp("__AdapterLuid"))
                this.__AdapterLuid := LUID(296, this)
            return this.__AdapterLuid
        }
    }

    /**
     * @type {DXGI_ADAPTER_FLAG4}
     */
    Flags {
        get => NumGet(this, 304, "int")
        set => NumPut("int", value, this, 304)
    }

    /**
     * @type {DXGI_GRAPHICS_PREEMPTION_GRANULARITY}
     */
    GraphicsPreemptionGranularity {
        get => NumGet(this, 308, "int")
        set => NumPut("int", value, this, 308)
    }

    /**
     * @type {DXGI_COMPUTE_PREEMPTION_GRANULARITY}
     */
    ComputePreemptionGranularity {
        get => NumGet(this, 312, "int")
        set => NumPut("int", value, this, 312)
    }
}
