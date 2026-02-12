#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISwapChainPanelNative.ahk

/**
 * The ISwapChainPanelNative2 interface (windows.ui.xaml.media.dxinterop.h) provides interoperation between XAML and a DirectX swap chain.
 * @remarks
 * This interface provides the native implementation of the <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainpanel">Windows::UI::XAML::Control::SwapChainPanel</a> Windows
 *     Runtime type. To obtain a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-iswapchainbackgroundpanelnative">ISwapChainPanelNative</a>, 
 *     you must cast a <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.swapchainbackgroundpanel">SwapChainPanel</a> instance 
 *     to <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> or <b>IUnknown</b>, and call <b>QueryInterface</b>.
 * 
 * 
 * ```cpp
 * 
 * Microsoft::WRL::ComPtr<ISwapChainPanelNative2>	m_swapChainNative2;
 * // ...
 * IInspectable* panelInspectable = (IInspectable*) reinterpret_cast<IInspectable*>(swapChainPanel);
 * panelInspectable->QueryInterface(__uuidof(ISwapChainPanelNative2), (void **)&m_swapChainNative2);
 * 	
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-iswapchainpanelnative2
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISwapChainPanelNative2 extends ISwapChainPanelNative{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwapChainPanelNative2
     * @type {Guid}
     */
    static IID => Guid("{d5a2f60c-37b2-44a2-937b-8d8eb9726821}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSwapChainHandle"]

    /**
     * 
     * @param {HANDLE} swapChainHandle 
     * @returns {HRESULT} 
     */
    SetSwapChainHandle(swapChainHandle) {
        swapChainHandle := swapChainHandle is Win32Handle ? NumGet(swapChainHandle, "ptr") : swapChainHandle

        result := ComCall(4, this, "ptr", swapChainHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
