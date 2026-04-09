#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PROCESS_HANDLE_TRACING_ENTRY extends Win32Struct {
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    Handle {
        get {
            if(!this.HasProp("__Handle"))
                this.__Handle := HANDLE(0, this)
            return this.__Handle
        }
    }

    /**
     * @type {Pointer}
     */
    ClientId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Pointer<Void>>}
     */
    Stacks {
        get {
            if(!this.HasProp("__StacksProxyArray"))
                this.__StacksProxyArray := Win32FixedArray(this.ptr + 24, 16, Primitive, "ptr")
            return this.__StacksProxyArray
        }
    }
}
