#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\DXGI_SWAP_CHAIN_DESC2.ahk
#Include .\DXGI_SWAP_CHAIN_FULLSCREEN_DESC.ahk
#Include .\IDXGIFactory7.ahk
#Include .\IDXGIOutput.ahk
#Include .\IDXGISwapChain5.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class IDXGIFactory8 extends IDXGIFactory7 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory8
     * @type {Guid}
     */
    static IID => Guid("{693c45c1-39a7-4c1f-bdd3-d9a3229b8321}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSwapChainForHwnd1", "CreateSwapChainForCoreWindow1", "CreateSwapChainForComposition1"]

    /**
     * @param {IUnknown} pDevice 
     * @param {HWND} _hWnd 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC2>} pDesc 
     * @param {Pointer<DXGI_SWAP_CHAIN_FULLSCREEN_DESC>} pFullscreenDesc 
     * @param {IDXGIOutput} pRestrictToOutput 
     * @returns {IDXGISwapChain5} 
     */
    CreateSwapChainForHwnd1(pDevice, _hWnd, pDesc, pFullscreenDesc, pRestrictToOutput) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(32, this, "ptr", pDevice, "ptr", _hWnd, "ptr", pDesc, "ptr", pFullscreenDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain5(ppSwapChain)
    }

    /**
     * @param {IUnknown} pDevice 
     * @param {IUnknown} pWindow 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC2>} pDesc 
     * @param {IDXGIOutput} pRestrictToOutput 
     * @returns {IDXGISwapChain5} 
     */
    CreateSwapChainForCoreWindow1(pDevice, pWindow, pDesc, pRestrictToOutput) {
        result := ComCall(33, this, "ptr", pDevice, "ptr", pWindow, "ptr", pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain5(ppSwapChain)
    }

    /**
     * @param {IUnknown} pDevice 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC2>} pDesc 
     * @param {IDXGIOutput} pRestrictToOutput 
     * @returns {IDXGISwapChain5} 
     */
    CreateSwapChainForComposition1(pDevice, pDesc, pRestrictToOutput) {
        result := ComCall(34, this, "ptr", pDevice, "ptr", pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain5(ppSwapChain)
    }
}
