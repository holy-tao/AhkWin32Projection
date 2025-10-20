#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A debug interface controls debug settings, validates pipeline state and can only be used if the debug layer is turned on.
 * @remarks
 * 
  * This interface is obtained by querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nn-d3d10sdklayers-id3d10debug
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Debug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Debug
     * @type {Guid}
     */
    static IID => Guid("{9b7e4e01-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFeatureMask", "GetFeatureMask", "SetPresentPerRenderOpDelay", "GetPresentPerRenderOpDelay", "SetSwapChain", "GetSwapChain", "Validate"]

    /**
     * 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, "uint", Mask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Milliseconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setpresentperrenderopdelay
     */
    SetPresentPerRenderOpDelay(Milliseconds) {
        result := ComCall(5, this, "uint", Milliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-getpresentperrenderopdelay
     */
    GetPresentPerRenderOpDelay() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @param {IDXGISwapChain} pSwapChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setswapchain
     */
    SetSwapChain(pSwapChain) {
        result := ComCall(7, this, "ptr", pSwapChain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDXGISwapChain>} ppSwapChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-getswapchain
     */
    GetSwapChain(ppSwapChain) {
        result := ComCall(8, this, "ptr*", ppSwapChain, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-validate
     */
    Validate() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
