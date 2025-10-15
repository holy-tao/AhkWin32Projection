#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DTRANSFORMCAPS.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3DLIGHTINGCAPS.ahk
#Include .\D3DPRIMCAPS.ahk
#Include .\D3DDEVICEDESC.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DFINDDEVICERESULT extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {D3DDEVICEDESC}
     */
    ddHwDesc{
        get {
            if(!this.HasProp("__ddHwDesc"))
                this.__ddHwDesc := D3DDEVICEDESC(this.ptr + 16)
            return this.__ddHwDesc
        }
    }

    /**
     * @type {D3DDEVICEDESC}
     */
    ddSwDesc{
        get {
            if(!this.HasProp("__ddSwDesc"))
                this.__ddSwDesc := D3DDEVICEDESC(this.ptr + 272)
            return this.__ddSwDesc
        }
    }
}
