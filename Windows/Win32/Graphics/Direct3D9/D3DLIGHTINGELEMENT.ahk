#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Direct3D\D3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DLIGHTINGELEMENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {D3DVECTOR}
     */
    dvPosition{
        get {
            if(!this.HasProp("__dvPosition"))
                this.__dvPosition := D3DVECTOR(this.ptr + 0)
            return this.__dvPosition
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    dvNormal{
        get {
            if(!this.HasProp("__dvNormal"))
                this.__dvNormal := D3DVECTOR(this.ptr + 16)
            return this.__dvNormal
        }
    }
}
