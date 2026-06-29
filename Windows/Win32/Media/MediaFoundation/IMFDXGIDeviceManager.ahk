#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables two threads to share the same Microsoft Direct3D 11 device.
 * @remarks
 * This interface is exposed by the Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager. To create the DXGI Device Manager, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager">MFCreateDXGIDeviceManager</a> function.
 * 
 * When you create an <b>IMFDXGIDeviceManager</b> with <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager">MFCreateDXGIDeviceManager</a>, a Direct3D 11 device is not associated with the device manager. To associate a Direct3D 11 device with the device manager, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a>, passing in the pointer to the Direct3D 11 device. To create a Direct3D 11 device, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>. The device should be created with the <b>D3D11_CREATE_DEVICE_VIDEO_SUPPORT</b> device creation flag which is defined in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_FLAG</a> enumeration.
 * 
 * For Microsoft Direct3D 9 devices, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirect3ddevicemanager9">IDirect3DDeviceManager9</a> interface.
 * 
 * Windows Store apps must use <b>IMFDXGIDeviceManager</b> and <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-11-video-apis">Direct3D 11 Video APIs</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfdxgidevicemanager
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFDXGIDeviceManager extends IUnknown {
    /**
     * The interface identifier for IMFDXGIDeviceManager
     * @type {Guid}
     */
    static IID := Guid("{eb533d5d-2db6-40f8-97a9-494692014f07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFDXGIDeviceManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CloseDeviceHandle : IntPtr
        GetVideoService   : IntPtr
        LockDevice        : IntPtr
        OpenDeviceHandle  : IntPtr
        ResetDevice       : IntPtr
        TestDevice        : IntPtr
        UnlockDevice      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFDXGIDeviceManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Closes a Microsoft Direct3D device handle.
     * @remarks
     * Call this method to release a device handle that was retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle">IMFDXGIDeviceManager::OpenDeviceHandle</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-closedevicehandle
     */
    CloseDeviceHandle(hDevice) {
        result := ComCall(3, this, HANDLE, hDevice, "HRESULT")
        return result
    }

    /**
     * Queries the Microsoft Direct3D device for an interface.
     * @remarks
     * If the method returns <b>MF_E_DXGI_NEW_VIDEO_DEVICE</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-closedevicehandle">IMFDXGIDeviceManager::CloseDeviceHandle</a> to close the handle and then call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle">OpenDeviceHandle</a> again to get a new handle. The  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a> method invalidates all open device handles.
     * 
     * For more info see, <a href="https://docs.microsoft.com/windows/desktop/medfound/supporting-direct3d-11-video-decoding-in-media-foundation">Supporting Direct3D 11 Video Decoding in Media Foundation</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-getvideoservice
     */
    GetVideoService(hDevice, riid) {
        result := ComCall(4, this, HANDLE, hDevice, Guid.Ptr, riid, "ptr*", &ppService := 0, "HRESULT")
        return ppService
    }

    /**
     * Gives the caller exclusive access to the Microsoft Direct3D device.
     * @remarks
     * When you are done using the Direct3D device, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-unlockdevice">IMFDXGIDeviceManager::UnlockDevice</a> to unlock the device.
     * 
     * If the method returns <b>MF_E_DXGI_NEW_VIDEO_DEVICE</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-closedevicehandle">IMFDXGIDeviceManager::CloseDeviceHandle</a> to close the handle and then call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle">OpenDeviceHandle</a> again to get a new handle. The  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a> method invalidates all open device handles.
     * 
     * If <i>fBlock</i> is <b>TRUE</b>, this method can potentially deadlock. For example, it will deadlock if a thread calls <b>LockDevice</b> and then waits on another thread that calls <b>LockDevice</b>. It will also deadlock if a thread calls <b>LockDevice</b> twice without calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-unlockdevice">UnlockDevice</a> in between.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-lockdevice
     */
    LockDevice(hDevice, riid, fBlock) {
        result := ComCall(5, this, HANDLE, hDevice, Guid.Ptr, riid, "ptr*", &ppUnkDevice := 0, BOOL, fBlock, "HRESULT")
        return ppUnkDevice
    }

    /**
     * Gets a handle to the Microsoft Direct3D device.
     * @returns {HANDLE} Receives the device handle.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle
     */
    OpenDeviceHandle() {
        phDevice := HANDLE.Owned()
        result := ComCall(6, this, HANDLE.Ptr, phDevice, "HRESULT")
        return phDevice
    }

    /**
     * Sets the Microsoft Direct3D device or notifies the device manager that the Direct3D device was reset.
     * @remarks
     * When you first create the DXGI Device Manager, call this method with a pointer to the Direct3D device. (The device manager does not create the device; the caller must provide the device pointer initially.) Also call this method if the Direct3D device becomes lost and you need to reset the device or create a new device. 
     * 
     * The <i>resetToken</i> parameter ensures that only the component that originally created the device manager can invalidate the current device.
     * 
     * If this method succeeds, all open device handles become invalid.
     * 
     * To create a Microsoft Direct3D 11 device, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>. 
     * 
     * The device should be created with the <b>D3D11_CREATE_DEVICE_VIDEO_SUPPORT</b> device creation flag which is defined in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_FLAG</a> enumeration.
     * 
     * It is recommended that you use multi-thread protection on the device context to prevent deadlock issues that can sometimes happen when you call<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-getdecoderbuffer"> ID3D11VideoContext::GetDecoderBuffer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-releasedecoderbuffer">ID3D11VideoContext::ReleaseDecoderBuffer</a>. To set multi-thread protection, first call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> to get an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10multithread">ID3D10Multithread</a> pointer. Then call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10multithread-setmultithreadprotected">ID3D10Multithread::SetMultithreadProtected</a>, passing in <b>true</b> for <i>bMTProtect</i>.
     * @param {IUnknown} pUnkDevice A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the DXGI device.
     * @param {Integer} resetToken The token that was received in the <i>pResetToken</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager">MFCreateDXGIDeviceManager</a> function.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice
     */
    ResetDevice(pUnkDevice, resetToken) {
        result := ComCall(7, this, "ptr", pUnkDevice, "uint", resetToken, "HRESULT")
        return result
    }

    /**
     * Tests whether a Microsoft Direct3D device handle is valid.
     * @remarks
     * If the method returns <b>MF_E_DXGI_NEW_VIDEO_DEVICE</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-closedevicehandle">IMFDXGIDeviceManager::CloseDeviceHandle</a> to close the handle and then call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle">OpenDeviceHandle</a> again to get a new handle. The  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a> method invalidates all open device handles.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-testdevice
     */
    TestDevice(hDevice) {
        result := ComCall(8, this, HANDLE, hDevice, "HRESULT")
        return result
    }

    /**
     * Unlocks the Microsoft Direct3D device.
     * @remarks
     * Call this method to release the device after calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-lockdevice">IMFDXGIDeviceManager::LockDevice</a>.
     * @param {HANDLE} hDevice A handle to the Direct3D device. To get the device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle">IMFDXGIDeviceManager::OpenDeviceHandle</a>.
     * @param {BOOL} fSaveState Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-unlockdevice
     */
    UnlockDevice(hDevice, fSaveState) {
        result := ComCall(9, this, HANDLE, hDevice, BOOL, fSaveState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFDXGIDeviceManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CloseDeviceHandle := CallbackCreate(GetMethod(implObj, "CloseDeviceHandle"), flags, 2)
        this.vtbl.GetVideoService := CallbackCreate(GetMethod(implObj, "GetVideoService"), flags, 4)
        this.vtbl.LockDevice := CallbackCreate(GetMethod(implObj, "LockDevice"), flags, 5)
        this.vtbl.OpenDeviceHandle := CallbackCreate(GetMethod(implObj, "OpenDeviceHandle"), flags, 2)
        this.vtbl.ResetDevice := CallbackCreate(GetMethod(implObj, "ResetDevice"), flags, 3)
        this.vtbl.TestDevice := CallbackCreate(GetMethod(implObj, "TestDevice"), flags, 2)
        this.vtbl.UnlockDevice := CallbackCreate(GetMethod(implObj, "UnlockDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CloseDeviceHandle)
        CallbackFree(this.vtbl.GetVideoService)
        CallbackFree(this.vtbl.LockDevice)
        CallbackFree(this.vtbl.OpenDeviceHandle)
        CallbackFree(this.vtbl.ResetDevice)
        CallbackFree(this.vtbl.TestDevice)
        CallbackFree(this.vtbl.UnlockDevice)
    }
}
