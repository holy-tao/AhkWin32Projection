#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk
#Include .\D3DDDI_SYNCHRONIZATIONOBJECT_TYPE.ahk
#Include ..\..\..\Win32\Foundation\BOOL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_SYNCHRONIZATIONOBJECTINFO2 extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {D3DDDI_SYNCHRONIZATIONOBJECT_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    class _SynchronizationMutex extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {BOOL}
         */
        InitialState {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    }

    class _Semaphore extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        MaxCount {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        InitialCount {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    }

    class _Fence extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        FenceValue {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    class _CPUNotification extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {HANDLE}
         */
        Event {
            get {
                if(!this.HasProp("__Event"))
                    this.__Event := HANDLE(0, this)
                return this.__Event
            }
        }
    }

    class _MonitoredFence extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        InitialFenceValue {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Pointer<Void>}
         */
        FenceValueCPUVirtualAddress {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }

        /**
         * @type {Integer}
         */
        FenceValueGPUVirtualAddress {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }

        /**
         * @type {Integer}
         */
        EngineAffinity {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }

        /**
         * @type {Integer}
         */
        Padding {
            get => NumGet(this, 28, "uint")
            set => NumPut("uint", value, this, 28)
        }
    }

    class _PeriodicMonitoredFence extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        hAdapter {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        VidPnTargetId {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }

        /**
         * @type {Integer}
         */
        Time {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }

        /**
         * @type {Pointer<Void>}
         */
        FenceValueCPUVirtualAddress {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }

        /**
         * @type {Integer}
         */
        FenceValueGPUVirtualAddress {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }

        /**
         * @type {Integer}
         */
        EngineAffinity {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }

        /**
         * @type {Integer}
         */
        Padding {
            get => NumGet(this, 36, "uint")
            set => NumPut("uint", value, this, 36)
        }
    }

    /**
     * @type {_SynchronizationMutex}
     */
    SynchronizationMutex {
        get {
            if(!this.HasProp("__SynchronizationMutex"))
                this.__SynchronizationMutex := D3DDDI_SYNCHRONIZATIONOBJECTINFO2._SynchronizationMutex(16, this)
            return this.__SynchronizationMutex
        }
    }

    /**
     * @type {_Semaphore}
     */
    Semaphore {
        get {
            if(!this.HasProp("__Semaphore"))
                this.__Semaphore := D3DDDI_SYNCHRONIZATIONOBJECTINFO2._Semaphore(16, this)
            return this.__Semaphore
        }
    }

    /**
     * @type {_Fence}
     */
    Fence {
        get {
            if(!this.HasProp("__Fence"))
                this.__Fence := D3DDDI_SYNCHRONIZATIONOBJECTINFO2._Fence(16, this)
            return this.__Fence
        }
    }

    /**
     * @type {_CPUNotification}
     */
    CPUNotification {
        get {
            if(!this.HasProp("__CPUNotification"))
                this.__CPUNotification := D3DDDI_SYNCHRONIZATIONOBJECTINFO2._CPUNotification(16, this)
            return this.__CPUNotification
        }
    }

    /**
     * @type {_MonitoredFence}
     */
    MonitoredFence {
        get {
            if(!this.HasProp("__MonitoredFence"))
                this.__MonitoredFence := D3DDDI_SYNCHRONIZATIONOBJECTINFO2._MonitoredFence(16, this)
            return this.__MonitoredFence
        }
    }

    /**
     * @type {_PeriodicMonitoredFence}
     */
    PeriodicMonitoredFence {
        get {
            if(!this.HasProp("__PeriodicMonitoredFence"))
                this.__PeriodicMonitoredFence := D3DDDI_SYNCHRONIZATIONOBJECTINFO2._PeriodicMonitoredFence(16, this)
            return this.__PeriodicMonitoredFence
        }
    }

    /**
     * @type {_Reserved}
     */
    Reserved {
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := D3DDDI_SYNCHRONIZATIONOBJECTINFO2._Reserved(16, this)
            return this.__Reserved
        }
    }

    /**
     * @type {Integer}
     */
    SharedHandle {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
