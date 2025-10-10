#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_SERIALIZED_ROOT_SIGNATURE_DESC.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_LOCAL_SERIALIZED_ROOT_SIGNATURE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {D3D12_SERIALIZED_ROOT_SIGNATURE_DESC}
     */
    Desc{
        get {
            if(!this.HasProp("__Desc"))
                this.__Desc := D3D12_SERIALIZED_ROOT_SIGNATURE_DESC(this.ptr + 0)
            return this.__Desc
        }
    }
}
