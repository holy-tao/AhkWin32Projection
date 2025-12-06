#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class Dxgi {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MAX_SWAP_CHAIN_BUFFERS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_DEBUG_BINARY_VERSION => 1

    /**
     * @type {Guid}
     */
    static DXGI_DEBUG_ALL => Guid("{e48ae283-da80-490b-87e6-43e9a9cfda08}")

    /**
     * @type {Guid}
     */
    static DXGI_DEBUG_DX => Guid("{35cdd7fc-13b2-421d-a5d7-7e4451287d64}")

    /**
     * @type {Guid}
     */
    static DXGI_DEBUG_DXGI => Guid("{25cddaa4-b1c6-47e1-ac3e-98875b5a2e2a}")

    /**
     * @type {Guid}
     */
    static DXGI_DEBUG_APP => Guid("{06cd6e01-4219-4ebd-8709-27ed23360c62}")

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_INFO_QUEUE_MESSAGE_ID_STRING_FROM_APPLICATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_INVALID_CALL => -2005270527

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_NOT_FOUND => -2005270526

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_MORE_DATA => -2005270525

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_UNSUPPORTED => -2005270524

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_DEVICE_REMOVED => -2005270523

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_DEVICE_HUNG => -2005270522

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_DEVICE_RESET => -2005270521

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_WAS_STILL_DRAWING => -2005270518

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_FRAME_STATISTICS_DISJOINT => -2005270517

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE => -2005270516

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_DRIVER_INTERNAL_ERROR => -2005270496

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_NONEXCLUSIVE => -2005270495

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_NOT_CURRENTLY_AVAILABLE => -2005270494

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_REMOTE_CLIENT_DISCONNECTED => -2005270493

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_REMOTE_OUTOFMEMORY => -2005270492

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_ACCESS_LOST => -2005270490

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_WAIT_TIMEOUT => -2005270489

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_SESSION_DISCONNECTED => -2005270488

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_RESTRICT_TO_OUTPUT_STALE => -2005270487

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_CANNOT_PROTECT_CONTENT => -2005270486

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_ACCESS_DENIED => -2005270485

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_NAME_ALREADY_EXISTS => -2005270484

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_SDK_COMPONENT_MISSING => -2005270483

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_NOT_CURRENT => -2005270482

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_HW_PROTECTION_OUTOFMEMORY => -2005270480

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_DYNAMIC_CODE_POLICY_VIOLATION => -2005270479

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_NON_COMPOSITED_UI => -2005270478

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_MODE_CHANGE_IN_PROGRESS => -2005270491

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_CACHE_CORRUPT => -2005270477

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_CACHE_FULL => -2005270476

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_CACHE_HASH_COLLISION => -2005270475

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_ALREADY_EXISTS => -2005270474

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_MPO_UNPINNED => -2005270428

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_ERROR_SETDISPLAYMODE_REQUIRED => -2005270427
;@endregion Constants

;@region Methods
    /**
     * Creates a DXGI 1.0 factory that you can use to generate other DXGI objects.
     * @remarks
     * Use a DXGI factory to generate objects that <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">enumerate adapters</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">create swap chains</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-makewindowassociation">associate a window</a> with the alt+enter key sequence for toggling to and from the fullscreen display mode.
     * 
     * If the <b>CreateDXGIFactory</b> function succeeds, the reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a> interface is incremented. To avoid a memory leak, when you finish using the interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IDXGIFactory::Release</a> method to release the interface.
     * 
     * <div class="alert"><b>Note</b>  Do not mix the use of DXGI 1.0 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a>) and DXGI 1.1 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a>) in an application. Use <b>IDXGIFactory</b> or <b>IDXGIFactory1</b>, but not both in an application.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  <b>CreateDXGIFactory</b> fails if your app's <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function calls it. For more info about how DXGI responds from <b>DllMain</b>, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/d3d10-graphics-programming-guide-dxgi">DXGI Responses from DLLMain</a>.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  Starting with Windows 8, all DXGI factories (regardless if they were created with <b>CreateDXGIFactory</b> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory1">CreateDXGIFactory1</a>) enumerate adapters identically. The enumeration order of adapters, which you retrieve with <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory::EnumAdapters</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory1-enumadapters1">IDXGIFactory1::EnumAdapters1</a>, is as follows: <ul>
     * <li>Adapter with the output on which the desktop primary is displayed. This adapter corresponds with an index of zero.</li>
     * <li>Adapters with outputs.</li>
     * <li>Adapters without outputs.</li>
     * </ul>
     * </div>
     * <div> </div>
     * The <b>CreateDXGIFactory</b> function does not exist for Windows Store apps. Instead, Windows Store apps use the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory1">CreateDXGIFactory1</a> function.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a> object referenced by the <i>ppFactory</i> parameter.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-createdxgifactory
     */
    static CreateDXGIFactory(riid) {
        result := DllCall("dxgi.dll\CreateDXGIFactory", "ptr", riid, "ptr*", &ppFactory := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppFactory
    }

    /**
     * Creates a DXGI 1.1 factory that you can use to generate other DXGI objects.
     * @remarks
     * Use a DXGI 1.1 factory to generate objects that <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">enumerate adapters</a>, 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">create swap chains</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-makewindowassociation">associate a window</a> with 
     *       the alt+enter key sequence for toggling to and from the full-screen display mode.  
     * 
     * If the <b>CreateDXGIFactory1</b> function succeeds, the reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a> interface is incremented. To avoid a memory leak, when you finish using the interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IDXGIFactory1::Release</a> method to release the interface.
     * 
     * This entry point is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
     *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
     * 
     * <div class="alert"><b>Note</b>  Do not mix the use of DXGI 1.0 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a>) and DXGI 1.1 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a>) in an application. Use <b>IDXGIFactory</b> or <b>IDXGIFactory1</b>, but not both in an application.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  <b>CreateDXGIFactory1</b> fails if your app's <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function calls it. For more info about how DXGI responds from <b>DllMain</b>, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/d3d10-graphics-programming-guide-dxgi">DXGI Responses from DLLMain</a>.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  Starting with Windows 8, all DXGI factories (regardless if they were created with <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory">CreateDXGIFactory</a> or <b>CreateDXGIFactory1</b>) enumerate adapters identically. The enumeration order of adapters, which you retrieve with <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory::EnumAdapters</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory1-enumadapters1">IDXGIFactory1::EnumAdapters1</a>, is as follows: <ul>
     * <li>Adapter with the output on which the desktop primary is displayed. This adapter corresponds with an index of zero.</li>
     * <li>Adapters with outputs.</li>
     * <li>Adapters without outputs.</li>
     * </ul>
     * </div>
     * <div> </div>
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a> object referenced by 
     *           the <i>ppFactory</i> parameter.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-createdxgifactory1
     * @since windows6.1
     */
    static CreateDXGIFactory1(riid) {
        result := DllCall("dxgi.dll\CreateDXGIFactory1", "ptr", riid, "ptr*", &ppFactory := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppFactory
    }

    /**
     * Creates a DXGI 1.3 factory that you can use to generate other DXGI objects.
     * @remarks
     * This function accepts a flag indicating whether DXGIDebug.dll is loaded. The function otherwise behaves identically to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory1">CreateDXGIFactory1</a>.
     * @param {Integer} Flags Type: <b>UINT</b>
     * 
     * Valid values include the <b>DXGI_CREATE_FACTORY_DEBUG (0x01)</b> flag, and zero.
     * 
     * <div class="alert"><b>Note</b>  This flag will be set by the D3D runtime if:<ul>
     * <li>The system creates an implicit factory during device creation.</li>
     * <li>The D3D11_CREATE_DEVICE_DEBUG flag is specified during device creation, for example using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a> (or the swapchain method, or the Direct3D 10 equivalents).</li>
     * </ul>
     * </div>
     * <div> </div>
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgifactory2">IDXGIFactory2</a> object referenced by 
     *           the <i>ppFactory</i> parameter.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgifactory2">IDXGIFactory2</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-createdxgifactory2
     * @since windows8.1
     */
    static CreateDXGIFactory2(Flags, riid) {
        result := DllCall("dxgi.dll\CreateDXGIFactory2", "uint", Flags, "ptr", riid, "ptr*", &ppFactory := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppFactory
    }

    /**
     * Retrieves an interface that Windows Store apps use for debugging the Microsoft DirectX Graphics Infrastructure (DXGI).
     * @remarks
     * The <b>DXGIGetDebugInterface1</b> function returns  <b>E_NOINTERFACE</b> on systems without the Windows Software Development Kit (SDK) installed, because it's a development-time aid.
     * @param {Integer} Flags Not used.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) of the requested interface type, which can be the identifier for the <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nn-dxgidebug-idxgidebug">IDXGIDebug</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nn-dxgidebug-idxgidebug1">IDXGIDebug1</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nn-dxgidebug-idxgiinfoqueue">IDXGIInfoQueue</a> interfaces.
     * @returns {Pointer<Pointer<Void>>} A pointer to a buffer that receives a pointer to the debugging interface.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-dxgigetdebuginterface1
     * @since windows8.1
     */
    static DXGIGetDebugInterface1(Flags, riid) {
        result := DllCall("dxgi.dll\DXGIGetDebugInterface1", "uint", Flags, "ptr", riid, "ptr*", &pDebug := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDebug
    }

    /**
     * Allows a process to indicate that it's resilient to any of its graphics devices being removed.
     * @remarks
     * This function is graphics API-agnostic, meaning that apps running on other APIs, such as OpenGL and Vulkan, would also apply.
     * 
     * This function should be called once per process and before any device creation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful; an error code otherwise. If this function is called after device creation, it returns <b>DXGI_ERROR_INVALID_CALL</b>. If this is not the first time that this function is called, it returns <b>DXGI_ERROR_ALREADY_EXISTS</b>. For a full list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-dxgideclareadapterremovalsupport
     * @since windows10.0.17134
     */
    static DXGIDeclareAdapterRemovalSupport() {
        result := DllCall("dxgi.dll\DXGIDeclareAdapterRemovalSupport", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disables v-blank virtualization for the process. This virtualization is used by the dynamic refresh rate (DRR) feature by default for all swap chains to maintain a steady virtualized present rate and v-blank cadence from [IDXGIOutput::WaitForVBlank](/windows/win32/api/dxgi/nf-dxgi-idxgioutput-waitforvblank). By disabling virtualization, these APIs will see the changing refresh rate.
     * @remarks
     * By default, a DXGI swap chain is unable to observe the changing refresh rate that's caused by the dynamic refresh rate (DRR) feature (see the blog post [Dynamic refresh rate&mdash;Get the best of both worlds](https://devblogs.microsoft.com/directx/dynamic-refresh-rate/)). Instead, a swap chain is virtualized to always see a fraction of the refresh rate&mdash;60Hz if the DRR mode is 120Hz. **DXGIDisableVBlankVirtualization** disables that virtualization for the entire process. Your application will then see v-blank timings change as the system boosts between 60Hz and 120Hz, and frames will arrive at the corresponding times for each rate, with present statistics reflecting those changes. 
     * 
     * You should call **DXGIDisableVBlankVirtualization** once per process, before creating any swap chains or calling [IDXGIOutput::WaitForVBlank](/windows/win32/api/dxgi/nf-dxgi-idxgioutput-waitforvblank). It can't be disabled for the lifetime of the process, so any changes in v-blank timing or statistics from DRR boosting will remain observable to the process.
     * 
     * You can find more information on how Dynamic Refresh Rate works in the [Compositor clock](/windows/win32/directcomp/compositor-clock/compositor-clock) topic.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * Returns **S_OK** if successful; an error code otherwise. For a full list of error codes, see [**DXGI_ERROR**](/windows/win32/direct3ddxgi/dxgi-error).
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-dxgidisablevblankvirtualization
     */
    static DXGIDisableVBlankVirtualization() {
        result := DllCall("dxgi.dll\DXGIDisableVBlankVirtualization", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
