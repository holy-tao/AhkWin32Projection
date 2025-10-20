#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-iswapchainpanelnative
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISwapChainPanelNative extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwapChainPanelNative
     * @type {Guid}
     */
    static IID => Guid("{f92f19d2-3ade-45a6-a20c-f6f1ea90554b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSwapChain"]

    /**
     * 
     * @param {IDXGISwapChain} swapChain 
     * @returns {HRESULT} 
     */
    SetSwapChain(swapChain) {
        result := ComCall(3, this, "ptr", swapChain, "HRESULT")
        return result
    }
}
