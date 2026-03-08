#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * The ISwapChainPanelNative interface (windows.ui.xaml.media.dxinterop.h) provides interoperation between XAML and a DirectX swap chain.
 * @remarks
 * This interface provides the native implementation of the <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainpanel">Windows::UI::XAML::Control::SwapChainPanel</a> Windows Runtime type. To obtain a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-iswapchainbackgroundpanelnative">ISwapChainPanelNative</a>, you must cast a <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainbackgroundpanel">SwapChainPanel</a> instance to <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> or <b>IUnknown</b>, and call <b>QueryInterface</b>.
 * 
 * 
 * ```cpp
 * 
 * Microsoft::WRL::ComPtr<ISwapChainPanelNative>	m_swapChainNative;
 * // ...
 * IInspectable* panelInspectable = (IInspectable*) reinterpret_cast<IInspectable*>(swapChainPanel);
 * panelInspectable->QueryInterface(__uuidof(ISwapChainPanelNative), (void **)&m_swapChainNative);
 * 	
 * ```
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
