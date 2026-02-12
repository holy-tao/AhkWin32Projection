#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides interoperation between XAML and a DirectX swap chain.
 * @remarks
 * This interface provides the native implementation of the <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainbackgroundpanel">Windows::UI::XAML::Control::SwapChainBackgroundPanel</a> Windows Runtime type. To obtain a pointer to <b>ISwapChainBackgroundPanelNative</b>, you must cast a <b>SwapChainBackgroundPanel</b> instance to <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> or <b>IUnknown</b>, and call <b>QueryInterface</b>.
 * 
 * 
 * ```cpp
 * 
 * Microsoft::WRL::ComPtr<ISwapChainBackgroundPanelNative>	m_swapChainNative;
 * // ...
 * IInspectable* panelInspectable = (IInspectable*) reinterpret_cast<IInspectable*>(swapChainPanel);
 * panelInspectable->QueryInterface(__uuidof(ISwapChainBackgroundPanelNative), (void **)&m_swapChainNative);
 * 	
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-iswapchainbackgroundpanelnative
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISwapChainBackgroundPanel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwapChainBackgroundPanel
     * @type {Guid}
     */
    static IID => Guid("{1c59db48-8233-4c0c-bcf5-02a5fb35ae00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
