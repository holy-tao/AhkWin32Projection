#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk
#Include ..\..\..\Win32\System\WindowsProgramming\CLIENT_ID.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_HANDLE_TRACING_ENTRY extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    Handle{
        get {
            if(!this.HasProp("__Handle"))
                this.__Handle := HANDLE(0, this)
            return this.__Handle
        }
    }

    /**
     * @type {CLIENT_ID}
     */
    ClientId{
        get {
            if(!this.HasProp("__ClientId"))
                this.__ClientId := CLIENT_ID(8, this)
            return this.__ClientId
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Void>}
     */
    Stacks{
        get {
            if(!this.HasProp("__StacksProxyArray"))
                this.__StacksProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "ptr")
            return this.__StacksProxyArray
        }
    }
}
