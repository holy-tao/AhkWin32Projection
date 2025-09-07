#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_TEX2D_VPIV.ahk

/**
 * Describes a video processor input view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_input_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The surface format. If zero, the driver uses the DXGI format that was used to create the resource. If you are using feature level 9, the value must be zero.
     * @type {Integer}
     */
    FourCC {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The resource type of the view, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_vpiv_dimension">D3D11_VPIV_DIMENSION</a> enumeration.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D11_TEX2D_VPIV}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D11_TEX2D_VPIV(this.ptr + 8)
            return this.__Texture2D
        }
    }
}
