#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_RW_LOCK extends Win32Struct {
    static sizeof => 528

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    SpinLock {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Pointer>}
     */
    RefCount {
        get {
            if(!this.HasProp("__RefCountProxyArray"))
                this.__RefCountProxyArray := Win32FixedArray(this.ptr + 16, 32, Primitive, "ptr")
            return this.__RefCountProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    RefCountEx {
        get {
            if(!this.HasProp("__RefCountExProxyArray"))
                this.__RefCountExProxyArray := Win32FixedArray(this.ptr + 16, 128, Primitive, "uint")
            return this.__RefCountExProxyArray
        }
    }

    /**
     * @type {Pointer}
     */
    RefCountLock {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SharedRefCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BOOLEAN}
     */
    WriterWaiting {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }
}
