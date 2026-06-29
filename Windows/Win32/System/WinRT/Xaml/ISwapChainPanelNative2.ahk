#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISwapChainPanelNative.ahk" { ISwapChainPanelNative }

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
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-iswapchainpanelnative2
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct ISwapChainPanelNative2 extends ISwapChainPanelNative {
    /**
     * The interface identifier for ISwapChainPanelNative2
     * @type {Guid}
     */
    static IID := Guid("{d5a2f60c-37b2-44a2-937b-8d8eb9726821}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISwapChainPanelNative2 interfaces
    */
    struct Vtbl extends ISwapChainPanelNative.Vtbl {
        SetSwapChainHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISwapChainPanelNative2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HANDLE} swapChainHandle 
     * @returns {HRESULT} 
     */
    SetSwapChainHandle(swapChainHandle) {
        result := ComCall(4, this, HANDLE, swapChainHandle, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISwapChainPanelNative2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSwapChainHandle := CallbackCreate(GetMethod(implObj, "SetSwapChainHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSwapChainHandle)
    }
}
