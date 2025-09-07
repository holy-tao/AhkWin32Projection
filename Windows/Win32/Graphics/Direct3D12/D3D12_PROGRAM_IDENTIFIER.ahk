#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PROGRAM_IDENTIFIER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Array<UInt64>}
     */
    OpaqueData{
        get {
            if(!this.HasProp("__OpaqueDataProxyArray"))
                this.__OpaqueDataProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "uint")
            return this.__OpaqueDataProxyArray
        }
    }
}
