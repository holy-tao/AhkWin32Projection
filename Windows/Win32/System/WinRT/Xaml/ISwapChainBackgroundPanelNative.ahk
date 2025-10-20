#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-iswapchainbackgroundpanelnative
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISwapChainBackgroundPanelNative extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwapChainBackgroundPanelNative
     * @type {Guid}
     */
    static IID => Guid("{43bebd4e-add5-4035-8f85-5608d08e9dc9}")

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
