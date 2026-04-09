#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDI_SYNCHRONIZATIONOBJECT_TYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_SYNCHRONIZATIONOBJECTINFO extends Win32Struct {
    static sizeof => 68

    static packingSize => 4

    /**
     * @type {D3DDDI_SYNCHRONIZATIONOBJECT_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
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

    /**
     * @type {_SynchronizationMutex}
     */
    SynchronizationMutex {
        get {
            if(!this.HasProp("__SynchronizationMutex"))
                this.__SynchronizationMutex := D3DDDI_SYNCHRONIZATIONOBJECTINFO._SynchronizationMutex(4, this)
            return this.__SynchronizationMutex
        }
    }

    /**
     * @type {_Semaphore}
     */
    Semaphore {
        get {
            if(!this.HasProp("__Semaphore"))
                this.__Semaphore := D3DDDI_SYNCHRONIZATIONOBJECTINFO._Semaphore(4, this)
            return this.__Semaphore
        }
    }

    /**
     * @type {_Reserved}
     */
    Reserved {
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := D3DDDI_SYNCHRONIZATIONOBJECTINFO._Reserved(4, this)
            return this.__Reserved
        }
    }
}
