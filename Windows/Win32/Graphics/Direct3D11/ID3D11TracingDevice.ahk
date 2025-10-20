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
     * 
     * @param {Integer} ResourceTypeFlags 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetShaderTrackingOptionsByType(ResourceTypeFlags, Options) {
        result := ComCall(3, this, "uint", ResourceTypeFlags, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pShader 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetShaderTrackingOptions(pShader, Options) {
        result := ComCall(4, this, "ptr", pShader, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
