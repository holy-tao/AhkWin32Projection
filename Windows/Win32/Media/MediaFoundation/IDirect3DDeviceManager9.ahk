#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Graphics\Direct3D9\IDirect3DDevice9.ahk" { IDirect3DDevice9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables two threads to share the same Direct3D 9 device, and provides access to the DirectX Video Acceleration (DXVA) features of the device.
 * @remarks
 * This interface is exposed by the <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-device-manager">Direct3D Device Manager</a>. To create the Direct3D device manager, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-dxva2createdirect3ddevicemanager9">DXVA2CreateDirect3DDeviceManager9</a>.
 * 
 * To get this interface from the <a href="https://docs.microsoft.com/windows/desktop/medfound/enhanced-video-renderer">Enhanced Video Renderer</a> (EVR), call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a>. The service GUID is <b>MR_VIDEO_ACCELERATION_SERVICE</b>. For the DirectShow EVR filter, call <b>GetService</b> on the filter's pins.
 * 
 * The Direct3D Device Manager supports Direct3D 9 devices only. It does not support DXGI devices.
 * 
 * Windows Store apps must use <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> and <a href="https://docs.microsoft.com/windows/desktop/medfound/direct3d-11-video-apis">Direct3D 11 Video APIs</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nn-dxva2api-idirect3ddevicemanager9
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDirect3DDeviceManager9 extends IUnknown {
    /**
     * The interface identifier for IDirect3DDeviceManager9
     * @type {Guid}
     */
    static IID := Guid("{a0cade0f-06d5-4cf4-a1c7-f3cdd725aa75}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DDeviceManager9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ResetDevice       : IntPtr
        OpenDeviceHandle  : IntPtr
        CloseDeviceHandle : IntPtr
        TestDevice        : IntPtr
        LockDevice        : IntPtr
        UnlockDevice      : IntPtr
        GetVideoService   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DDeviceManager9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the Direct3D device or notifies the device manager that the Direct3D device was reset.
     * @remarks
     * When you first create the Direct3D device manager, call this method with a pointer to the Direct3D device. The device manager does not create the device; the caller must provide the device pointer initially.
     * 
     * Also call this method if the Direct3D device becomes lost and you need to reset the device or create a new device. This occurs if <b>IDirect3DDevice9::TestCooperativeLevel</b> returns D3DERR_DEVICELOST or D3DERR_DEVICENOTRESET. For more information about lost devices, see the Direct3D documentation.
     * 
     * The <i>resetToken</i> parameter ensures that only the component which originally created the device manager can invalidate the current device.
     * 
     * If this method succeeds, all open device handles become invalid.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-resetdevice
     */
    ResetDevice(pDevice, resetToken) {
        result := ComCall(3, this, "ptr", pDevice, "uint", resetToken, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the Direct3D device.
     * @remarks
     * To get the Direct3D device's <b>IDirect3DDevice9</b> pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-lockdevice">IDirect3DDeviceManager9::LockDevice</a> with the handle returned in <i>phDevice</i>. Close the device handle when you are done using it, by calling <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-closedevicehandle">IDirect3DDeviceManager9::CloseDeviceHandle</a>.
     * 
     * To test whether a device handle is still valid, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-testdevice">IDirect3DDeviceManager9::TestDevice</a>.
     * @returns {HANDLE} Receives the device handle.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle
     */
    OpenDeviceHandle() {
        phDevice := HANDLE.Owned()
        result := ComCall(4, this, HANDLE.Ptr, phDevice, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-closedevicehandle
     */
    CloseDeviceHandle(hDevice) {
        result := ComCall(5, this, HANDLE, hDevice, "HRESULT")
        return result
    }

    /**
     * Tests whether a Direct3D device handle is valid.
     * @remarks
     * If the method returns DXVA2_E_NEW_VIDEO_DEVICE, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-closedevicehandle">IDirect3DDeviceManager9::CloseDeviceHandle</a> to close the handle and then call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle">OpenDeviceHandle</a> again to get a new handle. The <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-resetdevice">IDirect3DDeviceManager9::ResetDevice</a> method invalidates all open device handles.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-testdevice
     */
    TestDevice(hDevice) {
        result := ComCall(6, this, HANDLE, hDevice, "HRESULT")
        return result
    }

    /**
     * Gives the caller exclusive access to the Direct3D device.
     * @remarks
     * When you are done using the Direct3D device, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-unlockdevice">IDirect3DDeviceManager9::UnlockDevice</a> to unlock to the device.
     *       
     * 
     * If the method returns <b>DXVA2_E_NEW_VIDEO_DEVICE</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-closedevicehandle">IDirect3DDeviceManager9::CloseDeviceHandle</a> to close the handle and then call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle">OpenDeviceHandle</a> again to get a new handle. The <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-resetdevice">IDirect3DDeviceManager9::ResetDevice</a> method invalidates all open device handles.
     *       
     * 
     * If <i>fBlock</i> is <b>TRUE</b>, this method can potentially deadlock. For example, it will deadlock if a thread calls <b>LockDevice</b> and then waits on another thread that calls <b>LockDevice</b>. It will also deadlock if a thread calls <b>LockDevice</b> twice without calling <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-unlockdevice">UnlockDevice</a> in between.
     * @param {HANDLE} hDevice A handle to the Direct3D device. To get the device handle, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle">IDirect3DDeviceManager9::OpenDeviceHandle</a>.
     * @param {BOOL} fBlock Specifies whether to wait for the device lock. If the device is already locked and this parameter is <b>TRUE</b>, the method blocks until the device is unlocked. Otherwise, if the device is locked and this parameter is <b>FALSE</b>, the method returns immediately with the error code <b>DXVA2_E_VIDEO_DEVICE_LOCKED</b>.
     * @returns {IDirect3DDevice9} Receives a pointer to the device's <b>IDirect3DDevice9</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-lockdevice
     */
    LockDevice(hDevice, fBlock) {
        result := ComCall(7, this, HANDLE, hDevice, "ptr*", &ppDevice := 0, BOOL, fBlock, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-unlockdevice
     */
    UnlockDevice(hDevice, fSaveState) {
        result := ComCall(8, this, HANDLE, hDevice, BOOL, fSaveState, "HRESULT")
        return result
    }

    /**
     * Gets a DirectX Video Acceleration (DXVA) service interface.
     * @remarks
     * If the method returns <b>DXVA2_E_NEW_VIDEO_DEVICE</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-closedevicehandle">IDirect3DDeviceManager9::CloseDeviceHandle</a> to close the handle and then call <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-opendevicehandle">OpenDeviceHandle</a> again to get a new handle. The <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-resetdevice">IDirect3DDeviceManager9::ResetDevice</a> method invalidates all open device handles.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-getvideoservice
     */
    GetVideoService(hDevice, riid) {
        result := ComCall(9, this, HANDLE, hDevice, Guid.Ptr, riid, "ptr*", &ppService := 0, "HRESULT")
        return ppService
    }

    Query(iid) {
        if (IDirect3DDeviceManager9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResetDevice := CallbackCreate(GetMethod(implObj, "ResetDevice"), flags, 3)
        this.vtbl.OpenDeviceHandle := CallbackCreate(GetMethod(implObj, "OpenDeviceHandle"), flags, 2)
        this.vtbl.CloseDeviceHandle := CallbackCreate(GetMethod(implObj, "CloseDeviceHandle"), flags, 2)
        this.vtbl.TestDevice := CallbackCreate(GetMethod(implObj, "TestDevice"), flags, 2)
        this.vtbl.LockDevice := CallbackCreate(GetMethod(implObj, "LockDevice"), flags, 4)
        this.vtbl.UnlockDevice := CallbackCreate(GetMethod(implObj, "UnlockDevice"), flags, 3)
        this.vtbl.GetVideoService := CallbackCreate(GetMethod(implObj, "GetVideoService"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResetDevice)
        CallbackFree(this.vtbl.OpenDeviceHandle)
        CallbackFree(this.vtbl.CloseDeviceHandle)
        CallbackFree(this.vtbl.TestDevice)
        CallbackFree(this.vtbl.LockDevice)
        CallbackFree(this.vtbl.UnlockDevice)
        CallbackFree(this.vtbl.GetVideoService)
    }
}
