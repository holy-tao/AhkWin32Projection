#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_TEX2D_ARRAY_VPOV.ahk

/**
 * Describes a video processor output view.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_video_processor_output_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_OUTPUT_VIEW_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The resource type of the view, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_vpov_dimension">D3D11_VPOV_DIMENSION</a> enumeration.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Texture2D {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3D11_TEX2D_ARRAY_VPOV}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D11_TEX2D_ARRAY_VPOV(this.ptr + 8)
            return this.__Texture2DArray
        }
    }
}
