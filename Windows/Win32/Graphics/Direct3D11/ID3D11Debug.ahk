#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A debug interface controls debug settings, validates pipeline state and can only be used if the debug layer is turned on.
 * @remarks
 * 
  * This interface is obtained by querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
  *           
  * 
  * For more information about the debug layer, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">Debug Layer</a>.
  *           
  * 
  * <b>Windows Phone 8:
  *         </b> This API is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nn-d3d11sdklayers-id3d11debug
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Debug extends IUnknown{
    /**
     * The interface identifier for ID3D11Debug
     * @type {Guid}
     */
    static IID => Guid("{79cf2233-7536-4948-9d36-1e4692dc5760}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, "uint", Mask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFeatureMask() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Milliseconds 
     * @returns {HRESULT} 
     */
    SetPresentPerRenderOpDelay(Milliseconds) {
        result := ComCall(5, this, "uint", Milliseconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPresentPerRenderOpDelay() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<IDXGISwapChain>} pSwapChain 
     * @returns {HRESULT} 
     */
    SetSwapChain(pSwapChain) {
        result := ComCall(7, this, "ptr", pSwapChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDXGISwapChain>} ppSwapChain 
     * @returns {HRESULT} 
     */
    GetSwapChain(ppSwapChain) {
        result := ComCall(8, this, "ptr", ppSwapChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DeviceContext>} pContext 
     * @returns {HRESULT} 
     */
    ValidateContext(pContext) {
        result := ComCall(9, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(10, this, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DeviceContext>} pContext 
     * @returns {HRESULT} 
     */
    ValidateContextForDispatch(pContext) {
        result := ComCall(11, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
