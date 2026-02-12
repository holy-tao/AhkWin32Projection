#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Core\CoreIndependentInputSource.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-iswapchainpanelnative
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISwapChainPanel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwapChainPanel
     * @type {Guid}
     */
    static IID => Guid("{c589644f-eba8-427a-b75a-9f1f93a11ae9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CompositionScaleX", "get_CompositionScaleY", "add_CompositionScaleChanged", "remove_CompositionScaleChanged", "CreateCoreIndependentInputSource"]

    /**
     * @type {Float} 
     */
    CompositionScaleX {
        get => this.get_CompositionScaleX()
    }

    /**
     * @type {Float} 
     */
    CompositionScaleY {
        get => this.get_CompositionScaleY()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompositionScaleX() {
        result := ComCall(6, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompositionScaleY() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<SwapChainPanel, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionScaleChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CompositionScaleChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} deviceTypes 
     * @returns {CoreIndependentInputSource} 
     */
    CreateCoreIndependentInputSource(deviceTypes) {
        result := ComCall(10, this, "uint", deviceTypes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreIndependentInputSource(result_)
    }
}
