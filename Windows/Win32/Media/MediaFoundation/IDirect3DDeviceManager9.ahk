#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Graphics\Direct3D9\IDirect3DDevice9.ahk
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
     * Sets the Direct3D device or notifies the device manager that the Direct3D device was reset.
     * @param {IDirect3DDevice9} pDevice Pointer to the <b>IDirect3DDevice9</b> interface of the Direct3D device.
     * @param {Integer} resetToken Token received in the <i>pResetToken</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-dxva2createdirect3ddevicemanager9">DXVA2CreateDirect3DDeviceManager9</a> function.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid token
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_INVALIDCALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Direct3D device error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirect3ddevicemanager9-resetdevice
     */
    ResetDevice(pDevice, resetToken) {
        result := ComCall(3, this, "ptr", pDevice, "uint", resetToken, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the Direct3D device.
     * @returns {HANDLE} Receives the device handle.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle
     */
    OpenDeviceHandle() {
        phDevice := HANDLE()
        result := ComCall(4, this, "ptr", phDevice, "HRESULT")
        return phDevice
    }

    /**
     * Closes a Direct3D device handle.
     * @param {HANDLE} hDevice Handle to the Direct3D device.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirect3ddevicemanager9-closedevicehandle
     */
    CloseDeviceHandle(hDevice) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(5, this, "ptr", hDevice, "HRESULT")
        return result
    }

    /**
     * Tests whether a Direct3D device handle is valid.
     * @param {HANDLE} hDevice Handle to a Direct3D device. To get a device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle">IDirect3DDeviceManager9::OpenDeviceHandle</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device handle is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is not a Direct3D device handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DXVA2_E_NEW_VIDEO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirect3ddevicemanager9-testdevice
     */
    TestDevice(hDevice) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(6, this, "ptr", hDevice, "HRESULT")
        return result
    }

    /**
     * Gives the caller exclusive access to the Direct3D device.
     * @param {HANDLE} hDevice A handle to the Direct3D device. To get the device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle">IDirect3DDeviceManager9::OpenDeviceHandle</a>.
     * @param {BOOL} fBlock Specifies whether to wait for the device lock. If the device is already locked and this parameter is <b>TRUE</b>, the method blocks until the device is unlocked. Otherwise, if the device is locked and this parmater is <b>FALSE</b>, the method returns immediately with the error code <b>DXVA2_E_VIDEO_DEVICE_LOCKED</b>.
     * @returns {IDirect3DDevice9} Receives a pointer to the device's <b>IDirect3DDevice9</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirect3ddevicemanager9-lockdevice
     */
    LockDevice(hDevice, fBlock) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(7, this, "ptr", hDevice, "ptr*", &ppDevice := 0, "int", fBlock, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * Unlocks the Direct3D device.
     * @param {HANDLE} hDevice Handle to the Direct3D device. To get the device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle">IDirect3DDeviceManager9::OpenDeviceHandle</a>.
     * @param {BOOL} fSaveState If <b>TRUE</b>, the method saves the Direct3D device state in a state block. Internally, the method uses the Direct3D <b>IDirect3DStateBlock9</b> interface to save the device state. The next time you call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-lockdevice">LockDevice</a> with the same device handle, the state block is restored.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device handle is not locked, or is not a valid handle.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirect3ddevicemanager9-unlockdevice
     */
    UnlockDevice(hDevice, fSaveState) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(8, this, "ptr", hDevice, "int", fSaveState, "HRESULT")
        return result
    }

    /**
     * Gets a DirectX Video Acceleration (DXVA) service interface.
     * @param {HANDLE} hDevice A handle to a Direct3D device. To get a device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle">IDirect3DDeviceManager9::OpenDeviceHandle</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the requested interface. The Direct3D device might support the following DXVA service interfaces:
     *           
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoderservice">IDirectXVideoDecoderService</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoprocessorservice">IDirectXVideoProcessorService</a>
     * </li>
     * </ul>
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirect3ddevicemanager9-getvideoservice
     */
    GetVideoService(hDevice, riid) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(9, this, "ptr", hDevice, "ptr", riid, "ptr*", &ppService := 0, "HRESULT")
        return ppService
    }
}
