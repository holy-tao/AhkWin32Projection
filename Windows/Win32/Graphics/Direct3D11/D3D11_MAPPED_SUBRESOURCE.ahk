#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides access to subresource data.
 * @remarks
 * 
  * This structure is used in a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-map">ID3D11DeviceContext::Map</a>.
  * 
  * The values in these members tell you how much data you can view:
  * 
  * <ul>
  * <li><b>pData</b> points to row 0 and depth slice 0.</li>
  * <li><b>RowPitch</b> contains the value that the runtime adds to <b>pData</b> to move from row to row,  where each row contains multiple pixels.</li>
  * <li><b>DepthPitch</b> contains the value that the runtime adds to <b>pData</b> to move from depth slice to depth slice,  where each depth slice contains multiple rows.</li>
  * </ul>
  * When <b>RowPitch</b> and <b>DepthPitch</b> are not appropriate for the resource type, the runtime might set their values to 0. So, don't use these values for anything other than iterating over rows and depth. Here are some examples:
  * 
  * <ul>
  * <li>For <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-buffer">Buffer</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture1d">Texture1D</a>, the runtime assigns values  that aren't 0 to <b>RowPitch</b> and <b>DepthPitch</b>. For example, if a <b>Buffer</b> contains 8 bytes, the runtime assigns values to <b>RowPitch</b> and <b>DepthPitch</b> that are greater than or equal to 8.</li>
  * <li>For <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2d">Texture2D</a>, the runtime still assigns a value that isn't 0 to <b>DepthPitch</b>, assuming that the field isn't used.</li>
  * </ul>
  * <div class="alert"><b>Note</b>  The runtime might assign values to <b>RowPitch</b> and <b>DepthPitch</b> that are larger than anticipated because there might be padding between rows and depth.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_mapped_subresource
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_MAPPED_SUBRESOURCE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>void*</b>
     * 
     * Pointer to the data. When <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-map">ID3D11DeviceContext::Map</a> provides the pointer, the runtime ensures that the pointer has a specific alignment, depending on the following feature levels:
     * 
     * <ul>
     * <li>For <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL_10_0</a> and higher, the pointer is aligned to 16 bytes.</li>
     * <li>For lower than <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL_10_0</a>, the pointer is aligned to 4 bytes.</li>
     * </ul>
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The row pitch, or width, or physical size (in bytes) of the data.
     * @type {Integer}
     */
    RowPitch {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The depth pitch, or width, or physical size (in bytes)of the data.
     * @type {Integer}
     */
    DepthPitch {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
