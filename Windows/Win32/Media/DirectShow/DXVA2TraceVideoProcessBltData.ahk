#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Diagnostics\Etw\EVENT_TRACE_HEADER.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class DXVA2TraceVideoProcessBltData extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {EVENT_TRACE_HEADER}
     */
    wmiHeader {
        get {
            if(!this.HasProp("__wmiHeader"))
                this.__wmiHeader := EVENT_TRACE_HEADER(0, this)
            return this.__wmiHeader
        }
    }

    /**
     * @type {Integer}
     */
    pObject {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    pRenderTarget {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    TargetFrameTime {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {RECT}
     */
    TargetRect {
        get {
            if(!this.HasProp("__TargetRect"))
                this.__TargetRect := RECT(72, this)
            return this.__TargetRect
        }
    }

    /**
     * @type {BOOL}
     */
    Enter {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }
}
