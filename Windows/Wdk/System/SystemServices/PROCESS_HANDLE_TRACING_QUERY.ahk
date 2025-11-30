#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk
#Include ..\..\..\Win32\System\WindowsProgramming\CLIENT_ID.ahk
#Include .\PROCESS_HANDLE_TRACING_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_HANDLE_TRACING_QUERY extends Win32Struct
{
    static sizeof => 24

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
     * @type {Integer}
     */
    TotalTraces {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<PROCESS_HANDLE_TRACING_ENTRY>}
     */
    HandleTrace{
        get {
            if(!this.HasProp("__HandleTraceProxyArray"))
                this.__HandleTraceProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "ptr")
            return this.__HandleTraceProxyArray
        }
    }
}
