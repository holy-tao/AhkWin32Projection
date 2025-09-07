#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Diagnostics\Etw\EVENT_TRACE_HEADER.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA2TraceVideoProcessBltData extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {EVENT_TRACE_HEADER}
     */
    wmiHeader{
        get {
            if(!this.HasProp("__wmiHeader"))
                this.__wmiHeader := EVENT_TRACE_HEADER(this.ptr + 0)
            return this.__wmiHeader
        }
    }

    /**
     * @type {Integer}
     */
    pObject {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    pRenderTarget {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    TargetFrameTime {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {RECT}
     */
    TargetRect{
        get {
            if(!this.HasProp("__TargetRect"))
                this.__TargetRect := RECT(this.ptr + 64)
            return this.__TargetRect
        }
    }

    /**
     * @type {Integer}
     */
    Enter {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }
}
