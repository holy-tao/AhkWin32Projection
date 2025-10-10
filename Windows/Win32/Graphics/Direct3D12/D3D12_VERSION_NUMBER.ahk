#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_VERSION_NUMBER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt16>}
     */
    VersionParts{
        get {
            if(!this.HasProp("__VersionPartsProxyArray"))
                this.__VersionPartsProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "ushort")
            return this.__VersionPartsProxyArray
        }
    }
}
