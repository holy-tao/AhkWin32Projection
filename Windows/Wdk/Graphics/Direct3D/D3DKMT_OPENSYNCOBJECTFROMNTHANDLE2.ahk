#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_OPENSYNCOBJECTFROMNTHANDLE2 extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    hNtHandle {
        get {
            if(!this.HasProp("__hNtHandle"))
                this.__hNtHandle := HANDLE(0, this)
            return this.__hNtHandle
        }
    }

    /**
     * @type {Integer}
     */
    hDevice {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
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
    hSyncObject {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    class _MonitoredFence extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        FenceValueCPUVirtualAddress {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        FenceValueGPUVirtualAddress {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }

        /**
         * @type {Integer}
         */
        EngineAffinity {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    }

    /**
     * @type {_MonitoredFence}
     */
    MonitoredFence {
        get {
            if(!this.HasProp("__MonitoredFence"))
                this.__MonitoredFence := D3DKMT_OPENSYNCOBJECTFROMNTHANDLE2._MonitoredFence(32, this)
            return this.__MonitoredFence
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 32, 8, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
