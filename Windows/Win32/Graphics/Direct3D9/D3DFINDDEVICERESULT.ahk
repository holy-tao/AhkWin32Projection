#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDEVICEDESC.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3DPRIMCAPS.ahk
#Include .\D3DTRANSFORMCAPS.ahk
#Include .\D3DLIGHTINGCAPS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DFINDDEVICERESULT extends Win32Struct {
    static sizeof => 524

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(4, this)
            return this.__guid
        }
    }

    /**
     * @type {D3DDEVICEDESC}
     */
    ddHwDesc {
        get {
            if(!this.HasProp("__ddHwDesc"))
                this.__ddHwDesc := D3DDEVICEDESC(20, this)
            return this.__ddHwDesc
        }
    }

    /**
     * @type {D3DDEVICEDESC}
     */
    ddSwDesc {
        get {
            if(!this.HasProp("__ddSwDesc"))
                this.__ddSwDesc := D3DDEVICEDESC(272, this)
            return this.__ddSwDesc
        }
    }
}
