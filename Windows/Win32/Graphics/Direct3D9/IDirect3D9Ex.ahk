#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DDevice9Ex.ahk
#Include .\IDirect3D9.ahk

/**
 * Applications use the methods of the IDirect3D9Ex interface (which inherits from IDirect3D9) to create Microsoft Direct3D 9Ex objects and set up the environment.
 * @remarks
 * 
 * The <b>IDirect3D9Ex</b> interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-direct3dcreate9ex">Direct3DCreate9Ex</a> function.
 * 
 * The <b>LPDIRECT3D9EX</b> and <b>PDIRECT3D9EX</b> types are defined as pointers to the <b>IDirect3D9Ex</b> interface:
 * 
 * 
 * 
 * ```
 * 
 * typedef struct IDirect3D9Ex *LPDIRECT3D9EX, *PDIRECT3D9EX;
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9/nn-d3d9-idirect3d9ex
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3D9Ex extends IDirect3D9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3D9Ex
     * @type {Guid}
     */
    static IID => Guid("{02177241-69fc-400c-8ff1-93a44df6861d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdapterModeCountEx", "EnumAdapterModesEx", "GetAdapterDisplayModeEx", "CreateDeviceEx", "GetAdapterLUID"]

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Pointer<D3DDISPLAYMODEFILTER>} pFilter 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9ex-getadaptermodecountex
     */
    GetAdapterModeCountEx(Adapter, pFilter) {
        result := ComCall(17, this, "uint", Adapter, "ptr", pFilter, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Pointer<D3DDISPLAYMODEFILTER>} pFilter 
     * @param {Integer} Mode 
     * @param {Pointer<D3DDISPLAYMODEEX>} pMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9ex-enumadaptermodesex
     */
    EnumAdapterModesEx(Adapter, pFilter, Mode, pMode) {
        result := ComCall(18, this, "uint", Adapter, "ptr", pFilter, "uint", Mode, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Pointer<D3DDISPLAYMODEEX>} pMode 
     * @param {Pointer<Integer>} pRotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9ex-getadapterdisplaymodeex
     */
    GetAdapterDisplayModeEx(Adapter, pMode, pRotation) {
        pRotationMarshal := pRotation is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "uint", Adapter, "ptr", pMode, pRotationMarshal, pRotation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {HWND} hFocusWindow 
     * @param {Integer} BehaviorFlags 
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters 
     * @param {Pointer<D3DDISPLAYMODEEX>} pFullscreenDisplayMode 
     * @returns {IDirect3DDevice9Ex} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9ex-createdeviceex
     */
    CreateDeviceEx(Adapter, DeviceType, hFocusWindow, BehaviorFlags, pPresentationParameters, pFullscreenDisplayMode) {
        hFocusWindow := hFocusWindow is Win32Handle ? NumGet(hFocusWindow, "ptr") : hFocusWindow

        result := ComCall(20, this, "uint", Adapter, "int", DeviceType, "ptr", hFocusWindow, "uint", BehaviorFlags, "ptr", pPresentationParameters, "ptr", pFullscreenDisplayMode, "ptr*", &ppReturnedDeviceInterface := 0, "HRESULT")
        return IDirect3DDevice9Ex(ppReturnedDeviceInterface)
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Pointer<LUID>} pLUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9ex-getadapterluid
     */
    GetAdapterLUID(Adapter, pLUID) {
        result := ComCall(21, this, "uint", Adapter, "ptr", pLUID, "HRESULT")
        return result
    }
}
