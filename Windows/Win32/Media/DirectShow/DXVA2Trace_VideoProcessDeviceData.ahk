#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Diagnostics\Etw\EVENT_TRACE_HEADER.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA2Trace_VideoProcessDeviceData extends Win32Struct
{
    static sizeof => 56

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
     * @type {BOOL}
     */
    Enter{
        get {
            if(!this.HasProp("__Enter"))
                this.__Enter := BOOL(this.ptr + 48)
            return this.__Enter
        }
    }
}
