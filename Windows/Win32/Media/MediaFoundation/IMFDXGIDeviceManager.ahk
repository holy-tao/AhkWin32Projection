#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables two threads to share the same Microsoft Direct3D 11 device.
 * @remarks
 * 
  * This interface is exposed by the Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager. To create the DXGI Device Manager, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager">MFCreateDXGIDeviceManager</a> function.
  * 
  * When you create an <b>IMFDXGIDeviceManager</b> with <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager">MFCreateDXGIDeviceManager</a>, a Direct3D 11 device is not associated with the device manager. To associate a Direct3D 11 device with the device manager, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a>, passing in the pointer to the Direct3D 11 device. To create a Direct3D 11 device, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>. The device should be created with the <b>D3D11_CREATE_DEVICE_VIDEO_SUPPORT</b> device creation flag which is defined in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_FLAG</a> enumeration.
  * 
  * For Microsoft Direct3D 9 devices, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirect3ddevicemanager9">IDirect3DDeviceManager9</a> interface.
  * 
  * Windows Store apps must use <b>IMFDXGIDeviceManager</b> and <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-11-video-apis">Direct3D 11 Video APIs</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfdxgidevicemanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDXGIDeviceManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDXGIDeviceManager
     * @type {Guid}
     */
    static IID => Guid("{eb533d5d-2db6-40f8-97a9-494692014f07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CloseDeviceHandle", "GetVideoService", "LockDevice", "OpenDeviceHandle", "ResetDevice", "TestDevice", "UnlockDevice"]

    /**
     * 
     * @param {HANDLE} hDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-closedevicehandle
     */
    CloseDeviceHandle(hDevice) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(3, this, "ptr", hDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-getvideoservice
     */
    GetVideoService(hDevice, riid, ppService) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(4, this, "ptr", hDevice, "ptr", riid, "ptr*", ppService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnkDevice 
     * @param {BOOL} fBlock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-lockdevice
     */
    LockDevice(hDevice, riid, ppUnkDevice, fBlock) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(5, this, "ptr", hDevice, "ptr", riid, "ptr*", ppUnkDevice, "int", fBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle
     */
    OpenDeviceHandle(phDevice) {
        result := ComCall(6, this, "ptr", phDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkDevice 
     * @param {Integer} resetToken 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice
     */
    ResetDevice(pUnkDevice, resetToken) {
        result := ComCall(7, this, "ptr", pUnkDevice, "uint", resetToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-testdevice
     */
    TestDevice(hDevice) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(8, this, "ptr", hDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @param {BOOL} fSaveState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-unlockdevice
     */
    UnlockDevice(hDevice, fSaveState) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(9, this, "ptr", hDevice, "int", fSaveState, "HRESULT")
        return result
    }
}
