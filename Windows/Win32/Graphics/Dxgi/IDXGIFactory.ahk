#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIAdapter.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\IDXGISwapChain.ahk
#Include .\IDXGIObject.ahk

/**
 * An IDXGIFactory interface implements methods for generating DXGI objects (which handle full screen transitions).
 * @remarks
 * Create a factory by calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory">CreateDXGIFactory</a>.
 *         
 * 
 * Because you can create a Direct3D device without creating a swap chain, you might need to retrieve the factory that is used to create the device in order to create a swap chain.
 *           You can request the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> interface from the Direct3D device and then use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-getparent">IDXGIObject::GetParent</a> method to locate
 *           the factory.  The following code shows how.
 *         
 * 
 * 
 * ```
 * IDXGIDevice * pDXGIDevice = nullptr;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice), (void **)&pDXGIDevice);
 * 
 * IDXGIAdapter * pDXGIAdapter = nullptr;
 * hr = pDXGIDevice->GetAdapter( &pDXGIAdapter );
 * 
 * IDXGIFactory * pIDXGIFactory = nullptr;
 * pDXGIAdapter->GetParent(__uuidof(IDXGIFactory), (void **)&pIDXGIFactory);
 * ```
 * 
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nn-dxgi-idxgifactory
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactory extends IDXGIObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory
     * @type {Guid}
     */
    static IID => Guid("{7b7166ec-21c7-44ae-b21a-c9ae321ae369}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumAdapters", "MakeWindowAssociation", "GetWindowAssociation", "CreateSwapChain", "CreateSoftwareAdapter"]

    /**
     * Enumerates the adapters (video cards).
     * @remarks
     * When you create a factory, the factory enumerates the set of adapters that are available in the system. Therefore, if you change the adapters in a system, you must destroy 
     *       and recreate the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a> object. The number of adapters in a system changes when you add or remove a display card, or dock or undock a laptop. 
     * 
     * When the <b>EnumAdapters</b> method succeeds and fills the <i>ppAdapter</i> parameter with the address of the pointer to the adapter interface, <b>EnumAdapters</b> increments the adapter interface's reference count. When you finish using the 
     *       adapter interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method to decrement the reference count before you destroy the pointer.
     * 
     * <b>EnumAdapters</b> first returns the adapter with the output on which the desktop primary is displayed. This adapter corresponds with an index of zero. <b>EnumAdapters</b> next returns other adapters with outputs. <b>EnumAdapters</b> finally returns adapters without outputs.
     * @param {Integer} Adapter_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the adapter to enumerate.
     * @returns {Pointer<IDXGIAdapter>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> interface at the position specified by the <i>Adapter</i> parameter.  This parameter must not be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgifactory-enumadapters
     */
    EnumAdapters(Adapter_) {
        result := ComCall(7, this, "uint", Adapter_, "ptr*", &ppAdapter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAdapter
    }

    /**
     * Allows DXGI to monitor an application's message queue for the alt-enter key sequence (which causes the application to switch from windowed to full screen or vice versa).
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * The combination of <i>WindowHandle</i> and <i>Flags</i> informs DXGI to stop monitoring window messages for the previously-associated window.
     * 
     * If the application switches to full-screen mode, DXGI will choose a full-screen resolution to be the smallest supported resolution that is larger or the same size as the current back buffer size.
     * 
     * Applications can make some changes to make the transition from windowed to full screen more efficient. For example, on a WM_SIZE message, the application should release any outstanding swap-chain back buffers, call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-resizebuffers">IDXGISwapChain::ResizeBuffers</a>, then re-acquire the back buffers from the swap chain(s). This gives the swap chain(s) an opportunity to resize the back buffers, and/or recreate them to enable full-screen flipping operation. If the application does not perform this sequence, DXGI will still make the full-screen/windowed transition, but may be forced to use a stretch operation (since the back buffers may not be the correct size), which may be less efficient. Even if a stretch is not required, presentation may not be optimal because the back buffers might not be directly interchangeable with the front buffer. Thus, a call to <b>ResizeBuffers</b> on WM_SIZE is always recommended, since WM_SIZE is always sent during a fullscreen transition.
     * 
     * While windowed, the application can, if it chooses, restrict the size of its window's client area to sizes to which it is comfortable rendering. A fully flexible application would make no such restriction, but UI elements or other design considerations can, of course, make this flexibility untenable. If the application further chooses to restrict its window's client area to just those that match supported full-screen resolutions, the application can field WM_SIZING, then check against <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-findclosestmatchingmode">IDXGIOutput::FindClosestMatchingMode</a>. If a matching mode is found, allow the resize. (The IDXGIOutput can be retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getcontainingoutput">IDXGISwapChain::GetContainingOutput</a>. Absent subsequent changes to desktop topology, this will be the same output that will be chosen when alt-enter is fielded and fullscreen mode is begun for that swap chain.)
     * 
     * Applications that want to handle mode changes or Alt+Enter themselves should call <b>MakeWindowAssociation</b> with the DXGI_MWA_NO_WINDOW_CHANGES flag after swap chain creation. The <i>WindowHandle</i> argument, if non-<b>NULL</b>, specifies that the application message queues will not be handled by the DXGI runtime for all swap chains of a particular target <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>.  Calling <b>MakeWindowAssociation</b> with the DXGI_MWA_NO_WINDOW_CHANGES flag after swapchain creation ensures that DXGI will not interfere with application's handling of window mode changes or Alt+Enter.
     * 
     * You must call the **MakeWindowAssociation** method on the factory object associated with the target HWND swap chain(s). You can guarantee that by calling the [IDXGIObject::GetParent](/windows/win32/api/dxgi/nf-dxgi-idxgiobject-getparent) method on the swap chain(s) to locate the factory. Here's a code example of doing that.
     * 
     * ```cppwinrt
     * void MakeWindowAssociationWithLocatedFactory(
     *     winrt::com_ptr<IDXGISwapChain> const& swapChain,
     *     HWND hWnd,
     *     UINT flags)
     * {
     *     winrt::com_ptr<IDXGIFactory1> factory;
     *     factory.capture(swapChain, &IDXGISwapChain::GetParent);
     *     factory->MakeWindowAssociation(hWnd, flags);
     * }
     * ```
     * 
     * <h3><a id="Notes_for_Windows_Store_apps"></a><a id="notes_for_windows_store_apps"></a><a id="NOTES_FOR_WINDOWS_STORE_APPS"></a>Notes for Windows Store apps</h3>
     * If a Windows Store app calls <b>MakeWindowAssociation</b>, it fails with <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.
     * 
     * A Microsoft Win32 application can use <b>MakeWindowAssociation</b> to control full-screen transitions through the Alt+Enter key combination and print screen behavior for full screen.  For Windows Store apps, because DXGI can't perform full-screen transitions, a Windows Store app has no way to control full-screen transitions.
     * @param {HWND} WindowHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the window that is to be monitored. This parameter can be <b>NULL</b>; but only if *Flags* is also 0.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_INVALID_CALL</a> if <i>WindowHandle</i> is invalid, or E_OUTOFMEMORY.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgifactory-makewindowassociation
     */
    MakeWindowAssociation(WindowHandle, Flags) {
        WindowHandle := WindowHandle is Win32Handle ? NumGet(WindowHandle, "ptr") : WindowHandle

        result := ComCall(8, this, "ptr", WindowHandle, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Get the window through which the user controls the transition to and from full screen.
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * @returns {HWND} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>*</b>
     * 
     * A pointer to a window handle.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgifactory-getwindowassociation
     */
    GetWindowAssociation() {
        pWindowHandle := HWND()
        result := ComCall(9, this, "ptr", pWindowHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pWindowHandle
    }

    /**
     * Creates a swap chain.
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * If you attempt to create a swap chain in full-screen mode, and full-screen mode is unavailable, the swap chain will be created in windowed mode and DXGI_STATUS_OCCLUDED will be returned.
     * 
     * If the buffer width or the buffer height is zero, the sizes will be inferred from the output window size in the swap-chain description.
     * 
     * Because the target output can't be chosen explicitly when the swap chain is created, we recommend not to create a full-screen swap chain. This can reduce presentation performance if the swap chain size and the output window size do not match. Here are two ways to ensure that the sizes match:
     * 
     * <ul>
     * <li>Create a windowed swap chain and then set it full-screen using <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-setfullscreenstate">IDXGISwapChain::SetFullscreenState</a>.</li>
     * <li>Save a pointer to the swap chain immediately after creation, and use it to get the output window size during a WM_SIZE event. Then resize the swap chain buffers (with <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-resizebuffers">IDXGISwapChain::ResizeBuffers</a>) during the transition from windowed to full-screen.</li>
     * </ul>
     * If the swap chain is in full-screen mode, before you release it you must use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-setfullscreenstate">SetFullscreenState</a> to switch it to windowed mode. For more information about releasing a swap chain, see the "Destroying a Swap Chain" section of <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/d3d10-graphics-programming-guide-dxgi">DXGI Overview</a>.
     * 
     * After the runtime renders the initial frame in full screen, the runtime might unexpectedly exit full screen during a call to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>. To work around this issue, we recommend that you execute the following code right after you call <b>CreateSwapChain</b> to create a full-screen swap chain (<b>Windowed</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a> set to <b>FALSE</b>).
     * 
     * 
     * 
     * ```
     * 
     * // Detect if newly created full-screen swap chain isn't actually full screen.
     * IDXGIOutput* pTarget; BOOL bFullscreen;
     * if (SUCCEEDED(pSwapChain->GetFullscreenState(&bFullscreen, &pTarget)))
     * {
     *    pTarget->Release();
     * }
     * else
     *    bFullscreen = FALSE;
     * // If not full screen, enable full screen again.
     * if (!bFullscreen)
     * {
     *    ShowWindow(hWnd, SW_MINIMIZE);
     *    ShowWindow(hWnd, SW_RESTORE);
     *    pSwapChain->SetFullscreenState(TRUE, NULL);
     * }
     * 
     * ```
     * 
     * 
     * You can specify <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG</a> values in the swap-chain description that <i>pDesc</i> points to. These values allow you to use features like flip-model presentation and content protection by using pre-Windows 8 APIs.
     * 
     * However, to use stereo presentation and to change resize behavior for the flip model, applications must use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a> method. Otherwise, the back-buffer contents implicitly scale to fit the presentation target size; that is, you can't turn off scaling.
     * 
     * <h3><a id="Notes_for_Windows_Store_apps"></a><a id="notes_for_windows_store_apps"></a><a id="NOTES_FOR_WINDOWS_STORE_APPS"></a>Notes for Windows Store apps</h3>
     * If a Windows Store app calls <b>CreateSwapChain</b> with full screen specified, <b>CreateSwapChain</b> fails.
     * 
     * Windows Store apps call the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a> method to create a swap chain.
     * 
     * For info about how to choose a format for the swap chain's back buffer, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/converting-data-color-space">Converting data for the color space</a>.
     * @param {IUnknown} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a>) . This parameter cannot be <b>NULL</b>.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>*</b>
     * 
     * A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a> structure for the swap-chain description. This parameter cannot be <b>NULL</b>.
     * @returns {Pointer<IDXGISwapChain>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a> interface for the swap chain that <b>CreateSwapChain</b> creates.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgifactory-createswapchain
     */
    CreateSwapChain(pDevice, pDesc) {
        result := ComCall(10, this, "ptr", pDevice, "ptr", pDesc, "ptr*", &ppSwapChain := 0, "int")
        return ppSwapChain
    }

    /**
     * Create an adapter interface that represents a software adapter.
     * @remarks
     * A software adapter is a DLL that implements the entirety of a device driver interface, plus emulation, if necessary, of kernel-mode graphics components for Windows. Details on implementing a software adapter can be found in the Windows Vista Driver Development Kit. This is a very complex development task, and is not recommended for general readers.
     * 
     * Calling this method will increment the module's reference count by one. The reference count can be decremented by calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a>.
     * 
     * The typical calling scenario is to call <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, pass the handle to <b>CreateSoftwareAdapter</b>, then immediately call <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-freelibrary">FreeLibrary</a> on the DLL and forget the DLL's <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a>. Since the software adapter calls <b>FreeLibrary</b> when it is destroyed, the lifetime of the DLL will now be owned by the adapter, and the application is free of any further consideration of its lifetime.
     * @param {HMODULE} Module Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
     * 
     * Handle to the software adapter's dll. HMODULE can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>.
     * @returns {Pointer<IDXGIAdapter>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>**</b>
     * 
     * Address of a pointer to an adapter (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>).
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgifactory-createsoftwareadapter
     */
    CreateSoftwareAdapter(Module) {
        Module := Module is Win32Handle ? NumGet(Module, "ptr") : Module

        result := ComCall(11, this, "ptr", Module, "ptr*", &ppAdapter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAdapter
    }
}
