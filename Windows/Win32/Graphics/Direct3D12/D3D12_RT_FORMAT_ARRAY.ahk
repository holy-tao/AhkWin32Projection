#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Wraps an array of render target formats.
 * @remarks
 * This structure is primarily intended to be used when creating pipeline state stream descriptions that contain multiple contiguous render target format descriptions.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_rt_format_array
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RT_FORMAT_ARRAY extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Specifies a fixed-size array of DXGI_FORMAT values that define the format of up to 8 render targets.
     * @type {Array<Int32>}
     */
    RTFormats{
        get {
            if(!this.HasProp("__RTFormatsProxyArray"))
                this.__RTFormatsProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "int")
            return this.__RTFormatsProxyArray
        }
    }

    /**
     * Specifies the number of render target formats stored in the array.
     * @type {Integer}
     */
    NumRenderTargets {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
