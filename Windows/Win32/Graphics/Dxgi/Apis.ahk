#Requires AutoHotkey v2.0.0 64-bit

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
     * @type {String}
     */
    static DXGI_DEBUG_ALL => "{e48ae283-da80-490b-87e6-43e9a9cfda08}"

    /**
     * @type {String}
     */
    static DXGI_DEBUG_DX => "{35cdd7fc-13b2-421d-a5d7-7e4451287d64}"

    /**
     * @type {String}
     */
    static DXGI_DEBUG_DXGI => "{25cddaa4-b1c6-47e1-ac3e-98875b5a2e2a}"

    /**
     * @type {String}
     */
    static DXGI_DEBUG_APP => "{06cd6e01-4219-4ebd-8709-27ed23360c62}"

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
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a> object referenced by the <i>ppFactory</i> parameter.
     * @param {Pointer<Void>} ppFactory Type: <b>void**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a> object.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the following <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-createdxgifactory
     */
    static CreateDXGIFactory(riid, ppFactory) {
        result := DllCall("dxgi.dll\CreateDXGIFactory", "ptr", riid, "ptr", ppFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a DXGI 1.1 factory that you can use to generate other DXGI objects.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a> object referenced by 
     *           the <i>ppFactory</i> parameter.
     * @param {Pointer<Void>} ppFactory Type: <b>void**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a> object.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-createdxgifactory1
     * @since windows6.1
     */
    static CreateDXGIFactory1(riid, ppFactory) {
        result := DllCall("dxgi.dll\CreateDXGIFactory1", "ptr", riid, "ptr", ppFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a DXGI 1.3 factory that you can use to generate other DXGI objects.
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
     * @param {Pointer<Void>} ppFactory Type: <b>void**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgifactory2">IDXGIFactory2</a> object.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-createdxgifactory2
     * @since windows8.1
     */
    static CreateDXGIFactory2(Flags, riid, ppFactory) {
        result := DllCall("dxgi.dll\CreateDXGIFactory2", "uint", Flags, "ptr", riid, "ptr", ppFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves an interface that Windows Store apps use for debugging the Microsoft DirectX Graphics Infrastructure (DXGI).
     * @param {Integer} Flags Not used.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) of the requested interface type, which can be the identifier for the <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nn-dxgidebug-idxgidebug">IDXGIDebug</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nn-dxgidebug-idxgidebug1">IDXGIDebug1</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nn-dxgidebug-idxgiinfoqueue">IDXGIInfoQueue</a> interfaces.
     * @param {Pointer<Void>} pDebug A pointer to a buffer that receives a pointer to the debugging interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-dxgigetdebuginterface1
     * @since windows8.1
     */
    static DXGIGetDebugInterface1(Flags, riid, pDebug) {
        result := DllCall("dxgi.dll\DXGIGetDebugInterface1", "uint", Flags, "ptr", riid, "ptr", pDebug, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allows a process to indicate that it's resilient to any of its graphics devices being removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful; an error code otherwise. If this function is called after device creation, it returns <b>DXGI_ERROR_INVALID_CALL</b>. If this is not the first time that this function is called, it returns <b>DXGI_ERROR_ALREADY_EXISTS</b>. For a full list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/nf-dxgi1_6-dxgideclareadapterremovalsupport
     * @since windows10.0.17134
     */
    static DXGIDeclareAdapterRemovalSupport() {
        result := DllCall("dxgi.dll\DXGIDeclareAdapterRemovalSupport", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    static DXGIDisableVBlankVirtualization() {
        result := DllCall("dxgi.dll\DXGIDisableVBlankVirtualization", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
