#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMDMEnumDevice.ahk" { IWMDMEnumDevice }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMDeviceManager interface is the top level Windows Media Device Manager interface for applications.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdevicemanager
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDeviceManager extends IUnknown {
    /**
     * The interface identifier for IWMDeviceManager
     * @type {Guid}
     */
    static IID := Guid("{1dcb3a00-33ed-11d3-8470-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDeviceManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRevision    : IntPtr
        GetDeviceCount : IntPtr
        EnumDevices    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDeviceManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetRevision method retrieves the version number of Windows Media Device Manager currently in use.
     * @returns {Integer} Pointer to a <b>DWORD</b> specifying the Windows Media Device Manager version number. Windows Media Device Manager 10 returns 0x00080000.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager-getrevision
     */
    GetRevision() {
        result := ComCall(3, this, "uint*", &pdwRevision := 0, "HRESULT")
        return pdwRevision
    }

    /**
     * The GetDeviceCount method retrieves the number of portable devices that are currently connected to the computer.
     * @returns {Integer} Pointer to a <b>DWORD</b> specifying the count of known devices.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager-getdevicecount
     */
    GetDeviceCount() {
        result := ComCall(4, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * The EnumDevices method retrieves a pointer to the IWMDMEnumDevice interface that can be used to enumerate portable devices connected to the computer.
     * @remarks
     * This method returns devices based on earlier versions of Windows Media Device Manager. To get all devices, including newer devices (such as MTP devices), call <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdevicemanager2-enumdevices2">IWMDMDeviceManager2::EnumDevices2</a>.
     * @returns {IWMDMEnumDevice} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmenumdevice">IWMDMEnumDevice</a> interface used to enumerate devices. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager-enumdevices
     */
    EnumDevices() {
        result := ComCall(5, this, "ptr*", &ppEnumDevice := 0, "HRESULT")
        return IWMDMEnumDevice(ppEnumDevice)
    }

    Query(iid) {
        if (IWMDeviceManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRevision := CallbackCreate(GetMethod(implObj, "GetRevision"), flags, 2)
        this.vtbl.GetDeviceCount := CallbackCreate(GetMethod(implObj, "GetDeviceCount"), flags, 2)
        this.vtbl.EnumDevices := CallbackCreate(GetMethod(implObj, "EnumDevices"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRevision)
        CallbackFree(this.vtbl.GetDeviceCount)
        CallbackFree(this.vtbl.EnumDevices)
    }
}
