#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HSE_TRACE_INFO extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fTraceRequest{
        get {
            if(!this.HasProp("__fTraceRequest"))
                this.__fTraceRequest := BOOL(this.ptr + 0)
            return this.__fTraceRequest
        }
    }

    /**
     * @type {Array<Byte>}
     */
    TraceContextId{
        get {
            if(!this.HasProp("__TraceContextIdProxyArray"))
                this.__TraceContextIdProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__TraceContextIdProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
