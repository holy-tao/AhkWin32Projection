#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Diagnostics\Etw\EVENT_TRACE_HEADER.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class DXVA2Trace_VideoProcessDevCreatedData extends Win32Struct {
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
    pD3DDevice {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Guid}
     */
    DeviceGuid {
        get {
            if(!this.HasProp("__DeviceGuid"))
                this.__DeviceGuid := Guid(64, this)
            return this.__DeviceGuid
        }
    }

    /**
     * @type {Integer}
     */
    RTFourCC {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {BOOL}
     */
    Enter {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }
}
