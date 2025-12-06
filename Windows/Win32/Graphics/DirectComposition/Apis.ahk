#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class DirectComposition {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static COMPOSITIONOBJECT_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMPOSITIONOBJECT_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCOMPOSITION_MAX_WAITFORCOMPOSITORCLOCK_OBJECTS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static COMPOSITION_STATS_MAX_TARGETS => 256
;@endregion Constants

;@region Methods
    /**
     * Creates a new device object that can be used to create other Microsoft DirectComposition objects. (DCompositionCreateDevice)
     * @remarks
     * A  device object serves as the factory for all other DirectComposition objects. It also controls transactional composition through the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-commit">IDCompositionDevice::Commit</a> method.
     * 
     * The DXGI device specified by <i>dxgiDevice</i> is used to create all DirectComposition surface objects. In particular, the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> method returns an interface pointer to a DXGI surface that belongs to the device specified by the <i>dxgiDevice</i> parameter.
     * 
     * 
     * 
     * When creating the DXGI device, developers must specify the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE BGRA_SUPPORT</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_BGRA_SUPPORT</a> flag for Direct2D interoperability with Microsoft Direct3D resources.
     * 
     * The <i>iid</i> parameter must be <c>__uuidof(IDCompositionDevice)</c>, and the <i>dcompositionDevice</i> parameter receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface.
     * @param {IDXGIDevice} dxgiDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>*</b>
     * 
     * The DXGI device to use to create DirectComposition surface objects.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The identifier of the interface to retrieve.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * Receives an interface pointer to the newly created device object. The pointer is of the type specified by the <i>iid</i> parameter. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositioncreatedevice
     * @since windows8.0
     */
    static DCompositionCreateDevice(dxgiDevice, iid) {
        result := DllCall("dcomp.dll\DCompositionCreateDevice", "ptr", dxgiDevice, "ptr", iid, "ptr*", &dcompositionDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dcompositionDevice
    }

    /**
     * Creates a new device object that can be used to create other Microsoft DirectComposition objects. (DCompositionCreateDevice2)
     * @remarks
     * A device object serves as the factory for all other DirectComposition objects. It also controls transactional composition through the IDCompositionDevice2::Commit method.
     * 
     * 
     * 
     * The <i>renderingDevice</i> parameter may point to a <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dx-graphics-dxgi">DXGI</a>, Direct3D, Direct2D device object, or it may be NULL. This parameter affects the behavior of the IDCompositionDevice2::CreateSurface, IDCompositionDevice2::CreateVirtualSurface and IDCompositionSurface::BeginDraw methods.
     * 
     * 
     * 
     * If the <i>renderingDevice</i> parameter is NULL then the returned DirectComposition device cannot directly create DirectComposition surface objects. In particular, IDCompositionDevice2::CreateSurface and IDCompositionDevice2::CreateVirtualSurface methods return E_INVALIDARG, regardless of the supplied parameters. However, such a DirectComposition device object can still be used to indirectly create surfaces if the application creates a surface factory object via the IDCompositionDevice2::CreateSurfaceFactory method.
     * 
     * 
     * 
     * If the <i>renderingDevice</i> parameter points to a DXGI device, that device is used to allocate all video memory needed by the IDCompositionDevice2::CreateSurface and IDCompositionDevice2::CreateVirtualSurface methods. Moreover, the IDCompositionSurface::BeginDraw method returns an interface pointer to a DXGI surface that belongs to that same DXGI device.
     * 
     * 
     * 
     * If the <i>renderingDevice</i> parameter points to a Direct2D device object, DirectComposition extracts from it the underlying DXGI device object and uses it as if that DXGI device object had been passed in as the <i>renderingDevice</i> parameter. However, passing in a Direct2D object further causes IDCompositionSurface::BeginDraw to accept __uuidof(ID2D1DeviceContext) for its <i>iid</i> parameter for any objects created with the IDCompositionDevice2::CreateSurface or IDCompositionDevice2::CreateVirtualSurface methods. In that case, the Direct2D device context object returned by IDCompositionSurface::BeginDraw will belong to the same Direct2D device passed as the <i>renderingDevice</i> parameter.
     * 
     * 
     * 
     * If the <i>iid</i> parameter is __uuidof(IDCompositionDevice), then the dcompositionDevice parameter receives a pointer to a Version 1 IDCompositionDevice interface, but the underlying object is a Version 2 desktop device object. The application can later obtain a pointer to either the IDCompositionDevice2 or IDCompositionDesktopDevice interfaces by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on that device. Similarly, all DirectComposition objects created from such a device are Version 2 objects under the covers. For example, the IDCompositionDevice::CreateVisual method will return an IDCompositionVisual interface to the created visual, but the application can obtain a pointer to the IDCompositionVisual2 interface via the QueryInterface method. This behavior allows an application written to the DirectComposition V1 API to incrementally adopt DirectComposition V2 features by changing the device creation method from DCompositionCreateDevice to DCompositionCreateDevice2, while still requesting the IDCompositionDevice2 interface. This allows the rest of the code to remain unchanged, while allowing the application to use QueryInterface in just the places where new functionality is needed.
     * @param {IUnknown} renderingDevice An optional pointer to a DirectX device to be used to create DirectComposition surface objects. Must be a pointer to an object implementing the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> interfaces.
     * @param {Pointer<Guid>} iid The identifier of the interface to retrieve. This must be one of __uuidof(IDCompositionDevice) or __uuidof(IDCompositionDesktopDevice).
     * @returns {Pointer<Pointer<Void>>} Receives an interface pointer to the newly created device object. The pointer is of the type specified by the <i>iid</i> parameter. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositioncreatedevice2
     * @since windows8.1
     */
    static DCompositionCreateDevice2(renderingDevice, iid) {
        result := DllCall("dcomp.dll\DCompositionCreateDevice2", "ptr", renderingDevice, "ptr", iid, "ptr*", &dcompositionDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dcompositionDevice
    }

    /**
     * Creates a new DirectComposition device object, which can be used to create other DirectComposition objects.
     * @param {IUnknown} renderingDevice Type: <b>IUnknown*</b>
     * 
     * An optional pointer to a DirectX device to be used to create DirectComposition surface objects. Must be a pointer to an object implementing the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> interfaces.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The identifier of the interface to retrieve. This must be one of __uuidof(IDCompositionDevice) or __uuidof(IDCompositionDesktopDevice).
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * Receives an interface pointer to the newly created device object. The pointer is of the type specified by the <i>iid</i> parameter. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositioncreatedevice3
     */
    static DCompositionCreateDevice3(renderingDevice, iid) {
        result := DllCall("dcomp.dll\DCompositionCreateDevice3", "ptr", renderingDevice, "ptr", iid, "ptr*", &dcompositionDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dcompositionDevice
    }

    /**
     * Creates a new composition surface object that can be bound to a Microsoft DirectX swap chain or swap buffer and associated with a visual.
     * @param {Integer} desiredAccess Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a>*</b>
     * 
     * Contains the security descriptor for the composition surface object, and specifies whether the handle of the composition surface object is inheritable when a child process is created. If this parameter is NULL, the composition surface object is created with default security attributes  that grant read and write access to the current process,  but do not enable child processes to  inherit the handle.
     * @returns {HANDLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * The handle of the new composition surface object. This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositioncreatesurfacehandle
     * @since windows8.0
     */
    static DCompositionCreateSurfaceHandle(desiredAccess, securityAttributes) {
        surfaceHandle := HANDLE()
        result := DllCall("dcomp.dll\DCompositionCreateSurfaceHandle", "uint", desiredAccess, "ptr", securityAttributes, "ptr", surfaceHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return surfaceHandle
    }

    /**
     * Creates an Interaction/InputSink to route mouse wheel messages to the given HWND.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The visual to route messages from.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The HWND to route messages to.
     * @param {BOOL} enable Type: <b>BOOL</b>
     * 
     * Boolean value indicating whether to enable or disable routing.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositionattachmousewheeltohwnd
     */
    static DCompositionAttachMouseWheelToHwnd(visual, hwnd, enable) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dcomp.dll\DCompositionAttachMouseWheelToHwnd", "ptr", visual, "ptr", hwnd, "int", enable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an Interaction/InputSink to route mouse button down and any subsequent move and up events to the given HWND.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The visual to route messages from.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The HWND to route messages to.
     * @param {BOOL} enable Type: <b>BOOL</b>
     * 
     * Boolean value indicating whether to enable or disable routing.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositionattachmousedragtohwnd
     */
    static DCompositionAttachMouseDragToHwnd(visual, hwnd, enable) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dcomp.dll\DCompositionAttachMouseDragToHwnd", "ptr", visual, "ptr", hwnd, "int", enable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the identifier of the most recent compositor frame of the specified type.
     * @param {Integer} frameIdType Type: **[COMPOSITION_FRAME_ID_TYPE](../dcomptypes/ne-dcomptypes-composition_frame_id_type.md)**
     * 
     * The type of the compositor frame.
     * @returns {Integer} Type: **COMPOSITION_FRAME_ID\***
     * 
     * The identifer of the most recent compositor frame of the specified type.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositiongetframeid
     */
    static DCompositionGetFrameId(frameIdType) {
        result := DllCall("dcomp.dll\DCompositionGetFrameId", "int", frameIdType, "uint*", &frameId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return frameId
    }

    /**
     * Gets basic information about the composition frame and a list of render target ID's that are part of the frame.
     * @param {Integer} frameId Type: **COMPOSITION_FRAME_ID**
     * 
     * The identifier of the composition frame about which to get information.
     * @param {Pointer<COMPOSITION_FRAME_STATS>} frameStats Type: **[COMPOSITION_FRAME_STATS](../dcomptypes/ns-dcomptypes-composition_frame_stats.md)\***
     * 
     * A struct that contains information about the composition frame.
     * @param {Integer} targetIdCount Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The number of render targets about which to get information.
     * @param {Pointer<COMPOSITION_TARGET_ID>} targetIds Type: **[COMPOSITION_TARGET_ID](../dcomptypes/ns-dcomptypes-composition_target_id.md)\***
     * 
     * The identifiers of the render targets about which to get information.
     * @returns {Integer} Type: **[UINT](/windows/win32/WinProg/windows-data-types)\***
     * 
     * The actual number of render targets.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositiongetstatistics
     */
    static DCompositionGetStatistics(frameId, frameStats, targetIdCount, targetIds) {
        result := DllCall("dcomp.dll\DCompositionGetStatistics", "uint", frameId, "ptr", frameStats, "uint", targetIdCount, "ptr", targetIds, "uint*", &actualTargetIdCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return actualTargetIdCount
    }

    /**
     * 
     * @param {Integer} frameId 
     * @param {Pointer<COMPOSITION_TARGET_ID>} targetId 
     * @param {Pointer<COMPOSITION_TARGET_STATS>} targetStats 
     * @returns {HRESULT} 
     */
    static DCompositionGetTargetStatistics(frameId, targetId, targetStats) {
        result := DllCall("dcomp.dll\DCompositionGetTargetStatistics", "uint", frameId, "ptr", targetId, "ptr", targetStats, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests that the system dynamically switch to a higher refresh rate to enhance latency-sensitive content.
     * @param {BOOL} enable Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` to request that the system dynamically switch to a higher refresh rate; otherwise, `FALSE`.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositionboostcompositorclock
     */
    static DCompositionBoostCompositorClock(enable) {
        result := DllCall("dcomp.dll\DCompositionBoostCompositorClock", "int", enable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Halts a thread until the next signal from the compositor clock occurs.
     * @param {Integer} count Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The number of _`handles`_.
     * @param {Pointer<HANDLE>} handles Type: **[HANDLE](/windows/win32/winprog/windows-data-types)\***
     * 
     * Handles to events for which the compositor clock should send signals.
     * @param {Integer} timeoutInMs Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * Amount of time in milliseconds to wait before the operation times out.
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-dcompositionwaitforcompositorclock
     */
    static DCompositionWaitForCompositorClock(count, handles, timeoutInMs) {
        result := DllCall("dcomp.dll\DCompositionWaitForCompositorClock", "uint", count, "ptr", handles, "uint", timeoutInMs, "uint")
        return result
    }

;@endregion Methods
}
