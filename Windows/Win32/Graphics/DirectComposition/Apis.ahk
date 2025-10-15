#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
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
     * Creates a new device object that can be used to create other Microsoft DirectComposition objects.
     * @param {Pointer<IDXGIDevice>} dxgiDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>*</b>
     * 
     * The DXGI device to use to create DirectComposition surface objects.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The identifier of the interface to retrieve.
     * @param {Pointer<Void>} dcompositionDevice Type: <b>void**</b>
     * 
     * Receives an interface pointer to the newly created device object. The pointer is of the type specified by the <i>iid</i> parameter. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-dcompositioncreatedevice
     * @since windows8.0
     */
    static DCompositionCreateDevice(dxgiDevice, iid, dcompositionDevice) {
        result := DllCall("dcomp.dll\DCompositionCreateDevice", "ptr", dxgiDevice, "ptr", iid, "ptr", dcompositionDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new device object that can be used to create other Microsoft DirectComposition objects.
     * @param {Pointer<IUnknown>} renderingDevice An optional pointer to a DirectX device to be used to create DirectComposition surface objects. Must be a pointer to an object implementing the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> interfaces.
     * @param {Pointer<Guid>} iid The identifier of the interface to retrieve. This must be one of __uuidof(IDCompositionDevice) or __uuidof(IDCompositionDesktopDevice).
     * @param {Pointer<Void>} dcompositionDevice Receives an interface pointer to the newly created device object. The pointer is of the type specified by the <i>iid</i> parameter. This parameter must not be NULL.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-dcompositioncreatedevice2
     * @since windows8.1
     */
    static DCompositionCreateDevice2(renderingDevice, iid, dcompositionDevice) {
        result := DllCall("dcomp.dll\DCompositionCreateDevice2", "ptr", renderingDevice, "ptr", iid, "ptr", dcompositionDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new DirectComposition device object, which can be used to create other DirectComposition objects.
     * @param {Pointer<IUnknown>} renderingDevice Type: <b>IUnknown*</b>
     * 
     * An optional pointer to a DirectX device to be used to create DirectComposition surface objects. Must be a pointer to an object implementing the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> interfaces.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The identifier of the interface to retrieve. This must be one of __uuidof(IDCompositionDevice) or __uuidof(IDCompositionDesktopDevice).
     * @param {Pointer<Void>} dcompositionDevice Type: <b>void**</b>
     * 
     * Receives an interface pointer to the newly created device object. The pointer is of the type specified by the <i>iid</i> parameter. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-dcompositioncreatedevice3
     */
    static DCompositionCreateDevice3(renderingDevice, iid, dcompositionDevice) {
        result := DllCall("dcomp.dll\DCompositionCreateDevice3", "ptr", renderingDevice, "ptr", iid, "ptr", dcompositionDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new composition surface object that can be bound to a Microsoft DirectX swap chain or swap buffer and associated with a visual.
     * @param {Integer} desiredAccess Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a>*</b>
     * 
     * Contains the security descriptor for the composition surface object, and specifies whether the handle of the composition surface object is inheritable when a child process is created. If this parameter is NULL, the composition surface object is created with default security attributes  that grant read and write access to the current process,  but do not enable child processes to  inherit the handle.
     * @param {Pointer<HANDLE>} surfaceHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * The handle of the new composition surface object. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-dcompositioncreatesurfacehandle
     * @since windows8.0
     */
    static DCompositionCreateSurfaceHandle(desiredAccess, securityAttributes, surfaceHandle) {
        result := DllCall("dcomp.dll\DCompositionCreateSurfaceHandle", "uint", desiredAccess, "ptr", securityAttributes, "ptr", surfaceHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an Interaction/InputSink to route mouse wheel messages to the given HWND.
     * @param {Pointer<IDCompositionVisual>} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The visual to route messages from.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The HWND to route messages to.
     * @param {BOOL} enable Type: <b>BOOL</b>
     * 
     * Boolean value indicating whether to enable or disable routing.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-dcompositionattachmousewheeltohwnd
     */
    static DCompositionAttachMouseWheelToHwnd(visual, hwnd, enable) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dcomp.dll\DCompositionAttachMouseWheelToHwnd", "ptr", visual, "ptr", hwnd, "ptr", enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an Interaction/InputSink to route mouse button down and any subsequent move and up events to the given HWND.
     * @param {Pointer<IDCompositionVisual>} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The visual to route messages from.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The HWND to route messages to.
     * @param {BOOL} enable Type: <b>BOOL</b>
     * 
     * Boolean value indicating whether to enable or disable routing.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-dcompositionattachmousedragtohwnd
     */
    static DCompositionAttachMouseDragToHwnd(visual, hwnd, enable) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dcomp.dll\DCompositionAttachMouseDragToHwnd", "ptr", visual, "ptr", hwnd, "ptr", enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} frameIdType 
     * @param {Pointer<UInt64>} frameId 
     * @returns {HRESULT} 
     */
    static DCompositionGetFrameId(frameIdType, frameId) {
        result := DllCall("dcomp.dll\DCompositionGetFrameId", "int", frameIdType, "uint*", frameId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} frameId 
     * @param {Pointer<COMPOSITION_FRAME_STATS>} frameStats 
     * @param {Integer} targetIdCount 
     * @param {Pointer<COMPOSITION_TARGET_ID>} targetIds 
     * @param {Pointer<UInt32>} actualTargetIdCount 
     * @returns {HRESULT} 
     */
    static DCompositionGetStatistics(frameId, frameStats, targetIdCount, targetIds, actualTargetIdCount) {
        result := DllCall("dcomp.dll\DCompositionGetStatistics", "uint", frameId, "ptr", frameStats, "uint", targetIdCount, "ptr", targetIds, "uint*", actualTargetIdCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} enable 
     * @returns {HRESULT} 
     */
    static DCompositionBoostCompositorClock(enable) {
        result := DllCall("dcomp.dll\DCompositionBoostCompositorClock", "ptr", enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<HANDLE>} handles 
     * @param {Integer} timeoutInMs 
     * @returns {Integer} 
     */
    static DCompositionWaitForCompositorClock(count, handles, timeoutInMs) {
        result := DllCall("dcomp.dll\DCompositionWaitForCompositorClock", "uint", count, "ptr", handles, "uint", timeoutInMs, "uint")
        return result
    }

;@endregion Methods
}
