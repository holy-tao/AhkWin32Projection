#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Gdi\HMONITOR.ahk
#Include .\IDirect3DDevice9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3D9 interface to create Microsoft Direct3D objects and set up the environment. This interface includes methods for enumerating and retrieving capabilities of the device.
 * @remarks
 * 
  * The <b>IDirect3D9</b> interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-direct3dcreate9">Direct3DCreate9</a> function.
  * 
  * The LPDIRECT3D9 and PDIRECT3D9 types are defined as pointers to the <b>IDirect3D9</b> interface.
  *     
  *             
  * 
  * 
  * ```
  * typedef struct IDirect3D9 *LPDIRECT3D9, *PDIRECT3D9;
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3d9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3D9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3D9
     * @type {Guid}
     */
    static IID => Guid("{81bdcbca-64d4-426d-ae8d-ad0147f4275c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterSoftwareDevice", "GetAdapterCount", "GetAdapterIdentifier", "GetAdapterModeCount", "EnumAdapterModes", "GetAdapterDisplayMode", "CheckDeviceType", "CheckDeviceFormat", "CheckDeviceMultiSampleType", "CheckDepthStencilMatch", "CheckDeviceFormatConversion", "GetDeviceCaps", "GetAdapterMonitor", "CreateDevice"]

    /**
     * 
     * @param {Pointer<Void>} pInitializeFunction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-registersoftwaredevice
     */
    RegisterSoftwareDevice(pInitializeFunction) {
        pInitializeFunctionMarshal := pInitializeFunction is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pInitializeFunctionMarshal, pInitializeFunction, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadaptercount
     */
    GetAdapterCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} Flags 
     * @param {Pointer<D3DADAPTER_IDENTIFIER9>} pIdentifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadapteridentifier
     */
    GetAdapterIdentifier(Adapter, Flags, pIdentifier) {
        result := ComCall(5, this, "uint", Adapter, "uint", Flags, "ptr", pIdentifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} Format 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadaptermodecount
     */
    GetAdapterModeCount(Adapter, Format) {
        result := ComCall(6, this, "uint", Adapter, "uint", Format, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} Format 
     * @param {Integer} Mode 
     * @param {Pointer<D3DDISPLAYMODE>} pMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-enumadaptermodes
     */
    EnumAdapterModes(Adapter, Format, Mode, pMode) {
        result := ComCall(7, this, "uint", Adapter, "uint", Format, "uint", Mode, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Pointer<D3DDISPLAYMODE>} pMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadapterdisplaymode
     */
    GetAdapterDisplayMode(Adapter, pMode) {
        result := ComCall(8, this, "uint", Adapter, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DevType 
     * @param {Integer} AdapterFormat 
     * @param {Integer} BackBufferFormat 
     * @param {BOOL} bWindowed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdevicetype
     */
    CheckDeviceType(Adapter, DevType, AdapterFormat, BackBufferFormat, bWindowed) {
        result := ComCall(9, this, "uint", Adapter, "int", DevType, "uint", AdapterFormat, "uint", BackBufferFormat, "int", bWindowed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Integer} AdapterFormat 
     * @param {Integer} Usage 
     * @param {Integer} RType 
     * @param {Integer} CheckFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformat
     */
    CheckDeviceFormat(Adapter, DeviceType, AdapterFormat, Usage, RType, CheckFormat) {
        result := ComCall(10, this, "uint", Adapter, "int", DeviceType, "uint", AdapterFormat, "uint", Usage, "int", RType, "uint", CheckFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Integer} SurfaceFormat 
     * @param {BOOL} Windowed 
     * @param {Integer} MultiSampleType 
     * @param {Pointer<Integer>} pQualityLevels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype
     */
    CheckDeviceMultiSampleType(Adapter, DeviceType, SurfaceFormat, Windowed, MultiSampleType, pQualityLevels) {
        pQualityLevelsMarshal := pQualityLevels is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", Adapter, "int", DeviceType, "uint", SurfaceFormat, "int", Windowed, "int", MultiSampleType, pQualityLevelsMarshal, pQualityLevels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Integer} AdapterFormat 
     * @param {Integer} RenderTargetFormat 
     * @param {Integer} DepthStencilFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdepthstencilmatch
     */
    CheckDepthStencilMatch(Adapter, DeviceType, AdapterFormat, RenderTargetFormat, DepthStencilFormat) {
        result := ComCall(12, this, "uint", Adapter, "int", DeviceType, "uint", AdapterFormat, "uint", RenderTargetFormat, "uint", DepthStencilFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Integer} SourceFormat 
     * @param {Integer} TargetFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformatconversion
     */
    CheckDeviceFormatConversion(Adapter, DeviceType, SourceFormat, TargetFormat) {
        result := ComCall(13, this, "uint", Adapter, "int", DeviceType, "uint", SourceFormat, "uint", TargetFormat, "HRESULT")
        return result
    }

    /**
     * The GetDeviceCaps function retrieves device-specific information for the specified device.
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Pointer<D3DCAPS9>} pCaps 
     * @returns {HRESULT} The return value specifies the value of the desired item.
     * 
     * When <i>nIndex</i> is BITSPIXEL and the device has 15bpp or 16bpp, the return value is 16.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdevicecaps
     */
    GetDeviceCaps(Adapter, DeviceType, pCaps) {
        result := ComCall(14, this, "uint", Adapter, "int", DeviceType, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @returns {HMONITOR} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadaptermonitor
     */
    GetAdapterMonitor(Adapter) {
        result := ComCall(15, this, "uint", Adapter, "ptr")
        return HMONITOR({Value: result}, True)
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {HWND} hFocusWindow 
     * @param {Integer} BehaviorFlags 
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters 
     * @returns {IDirect3DDevice9} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-createdevice
     */
    CreateDevice(Adapter, DeviceType, hFocusWindow, BehaviorFlags, pPresentationParameters) {
        hFocusWindow := hFocusWindow is Win32Handle ? NumGet(hFocusWindow, "ptr") : hFocusWindow

        result := ComCall(16, this, "uint", Adapter, "int", DeviceType, "ptr", hFocusWindow, "uint", BehaviorFlags, "ptr", pPresentationParameters, "ptr*", &ppReturnedDeviceInterface := 0, "HRESULT")
        return IDirect3DDevice9(ppReturnedDeviceInterface)
    }
}
