#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
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
     * Closes a Microsoft Direct3D device handle.
     * @param {HANDLE} hDevice A handle to the Direct3D device.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgidevicemanager-closedevicehandle
     */
    CloseDeviceHandle(hDevice) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(3, this, "ptr", hDevice, "HRESULT")
        return result
    }

    /**
     * Queries the Microsoft Direct3D device for an interface.
     * @param {HANDLE} hDevice A handle to the Direct3D device. To get the device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle">IMFDXGIDeviceManager::OpenDeviceHandle</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the requested interface. The Direct3D device supports the following interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>. To get a pointer to the Direct3D11 device, use <b>IID_ID3D11Device</b> as the <i>riid</i>.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodevice">ID3D11VideoDevice</a>. To get a pointer to the Direct3D11 video device, use <b>IID_ID3D11VideoDevice</b> as the <i>riid</i>.</li>
     * </ul>
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgidevicemanager-getvideoservice
     */
    GetVideoService(hDevice, riid) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(4, this, "ptr", hDevice, "ptr", riid, "ptr*", &ppService := 0, "HRESULT")
        return ppService
    }

    /**
     * Gives the caller exclusive access to the Microsoft Direct3D device.
     * @param {HANDLE} hDevice A handle to the Direct3D device. To get the device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle">IMFDXGIDeviceManager::OpenDeviceHandle</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the requested interface. The Direct3D device will support the following interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videocontext">ID3D11VideoContext</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodevice">ID3D11VideoDevice</a>
     * </li>
     * </ul>
     * @param {BOOL} fBlock Specifies whether to wait for the device lock. If the device is already locked and this parameter is <b>TRUE</b>, the method blocks until the device is unlocked. Otherwise, if the device is locked and this parameter is <b>FALSE</b>, the method returns immediately with the error code <b>DXVA2_E_VIDEO_DEVICE_LOCKED</b>.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgidevicemanager-lockdevice
     */
    LockDevice(hDevice, riid, fBlock) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(5, this, "ptr", hDevice, "ptr", riid, "ptr*", &ppUnkDevice := 0, "int", fBlock, "HRESULT")
        return ppUnkDevice
    }

    /**
     * Gets a handle to the Microsoft Direct3D device.
     * @returns {HANDLE} Receives the device handle.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle
     */
    OpenDeviceHandle() {
        phDevice := HANDLE()
        result := ComCall(6, this, "ptr", phDevice, "HRESULT")
        return phDevice
    }

    /**
     * Sets the Microsoft Direct3D device or notifies the device manager that the Direct3D device was reset.
     * @param {IUnknown} pUnkDevice A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the DXGI device.
     * @param {Integer} resetToken The token that was received in the <i>pResetToken</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager">MFCreateDXGIDeviceManager</a> function.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice
     */
    ResetDevice(pUnkDevice, resetToken) {
        result := ComCall(7, this, "ptr", pUnkDevice, "uint", resetToken, "HRESULT")
        return result
    }

    /**
     * Tests whether a Microsoft Direct3D device handle is valid.
     * @param {HANDLE} hDevice A handle to the Direct3D device. To get the device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle">IMFDXGIDeviceManager::OpenDeviceHandle</a>.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
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
     * <dt><b>MF_E_DXGI_NEW_VIDEO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device handle is invalid. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgidevicemanager-testdevice
     */
    TestDevice(hDevice) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(8, this, "ptr", hDevice, "HRESULT")
        return result
    }

    /**
     * Unlocks the Microsoft Direct3D device.
     * @param {HANDLE} hDevice A handle to the Direct3D device. To get the device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle">IMFDXGIDeviceManager::OpenDeviceHandle</a>.
     * @param {BOOL} fSaveState Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgidevicemanager-unlockdevice
     */
    UnlockDevice(hDevice, fSaveState) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := ComCall(9, this, "ptr", hDevice, "int", fSaveState, "HRESULT")
        return result
    }
}
