#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables two threads to share the same Direct3D 9 device, and provides access to the DirectX Video Acceleration (DXVA) features of the device.
 * @remarks
 * 
  * This interface is exposed by the <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-device-manager">Direct3D Device Manager</a>. To create the Direct3D device manager, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-dxva2createdirect3ddevicemanager9">DXVA2CreateDirect3DDeviceManager9</a>.
  * 
  * To get this interface from the <a href="https://docs.microsoft.com/windows/desktop/medfound/enhanced-video-renderer">Enhanced Video Renderer</a> (EVR), call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a>. The service GUID is <b>MR_VIDEO_ACCELERATION_SERVICE</b>. For the DirectShow EVR filter, call <b>GetService</b> on the filter's pins.
  * 
  * The Direct3D Device Manager supports Direct3D 9 devices only. It does not support DXGI devices.
  * 
  * Windows Store apps must use <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> and <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-11-video-apis">Direct3D 11 Video APIs</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nn-dxva2api-idirect3ddevicemanager9
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirect3DDeviceManager9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DDeviceManager9
     * @type {Guid}
     */
    static IID => Guid("{a0cade0f-06d5-4cf4-a1c7-f3cdd725aa75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResetDevice", "OpenDeviceHandle", "CloseDeviceHandle", "TestDevice", "LockDevice", "UnlockDevice", "GetVideoService"]

    /**
     * 
     * @param {IDirect3DDevice9} pDevice 
     * @param {Integer} resetToken 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-resetdevice
     */
    ResetDevice(pDevice, resetToken) {
        result := ComCall(3, this, "ptr", pDevice, "uint", resetToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle
     */
    OpenDeviceHandle(phDevice) {
        result := ComCall(4, this, "ptr", phDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-closedevicehandle
     */
    CloseDeviceHandle(hDevice) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(5, this, "ptr", hDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-testdevice
     */
    TestDevice(hDevice) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(6, this, "ptr", hDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @param {Pointer<IDirect3DDevice9>} ppDevice 
     * @param {BOOL} fBlock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-lockdevice
     */
    LockDevice(hDevice, ppDevice, fBlock) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(7, this, "ptr", hDevice, "ptr*", ppDevice, "int", fBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @param {BOOL} fSaveState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-unlockdevice
     */
    UnlockDevice(hDevice, fSaveState) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(8, this, "ptr", hDevice, "int", fSaveState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-getvideoservice
     */
    GetVideoService(hDevice, riid, ppService) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        ppServiceMarshal := ppService is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", hDevice, "ptr", riid, ppServiceMarshal, ppService, "HRESULT")
        return result
    }
}
