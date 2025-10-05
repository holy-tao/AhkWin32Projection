#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_OPACITY_MICROMAP_ARRAY_POSTBUILD_INFO_TOOLS_VISUALIZATION_DESC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DecodedSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
