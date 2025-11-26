#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The tracing device interface sets shader tracking information, which enables accurate logging and playback of shader execution.
 * @remarks
 * 
 * To get this interface, turn on the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a> and use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nn-d3d11sdklayers-id3d11tracingdevice
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11TracingDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11TracingDevice
     * @type {Guid}
     */
    static IID => Guid("{1911c771-1587-413e-a7e0-fb26c3de0268}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetShaderTrackingOptionsByType", "SetShaderTrackingOptions"]

    /**
     * Sets the reference rasterizer's default race-condition tracking options for the specified resource types.
     * @param {Integer} ResourceTypeFlags A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_resource_type">D3D11_SHADER_TRACKING_RESOURCE_TYPE</a>-typed value that specifies the type of resource to track.
     * @param {Integer} Options A combination of <a href="https://docs.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_options">D3D11_SHADER_TRACKING_OPTIONS</a>-typed flags that are combined by using a bitwise <b>OR</b> operation. The resulting value identifies tracking options. If a flag is present, the tracking option that the flag represents is set to "on," otherwise the tracking option is set to "off."
     * @returns {HRESULT} This method returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11tracingdevice-setshadertrackingoptionsbytype
     */
    SetShaderTrackingOptionsByType(ResourceTypeFlags, Options) {
        result := ComCall(3, this, "uint", ResourceTypeFlags, "uint", Options, "HRESULT")
        return result
    }

    /**
     * Sets the reference rasterizer's race-condition tracking options for a specific shader.
     * @param {IUnknown} pShader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a shader.
     * @param {Integer} Options A combination of <a href="https://docs.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_options">D3D11_SHADER_TRACKING_OPTIONS</a>-typed flags that are combined by using a bitwise <b>OR</b> operation. The resulting value identifies tracking options. If a flag is present, the tracking option that the flag represents is set to "on"; otherwise the tracking option is set to "off."
     * @returns {HRESULT} This method returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11tracingdevice-setshadertrackingoptions
     */
    SetShaderTrackingOptions(pShader, Options) {
        result := ComCall(4, this, "ptr", pShader, "uint", Options, "HRESULT")
        return result
    }
}
