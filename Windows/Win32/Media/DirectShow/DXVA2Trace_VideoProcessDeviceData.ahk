#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Diagnostics\Etw\EVENT_TRACE_HEADER.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class DXVA2Trace_VideoProcessDeviceData extends Win32Struct {
    static sizeof => 64

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
     * @type {BOOL}
     */
    Enter {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
