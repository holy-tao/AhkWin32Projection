#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWindowsMediaLibrarySharingDeviceProperties.ahk" { IWindowsMediaLibrarySharingDeviceProperties }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WindowsMediaLibrarySharingDeviceAuthorizationStatus.ahk" { WindowsMediaLibrarySharingDeviceAuthorizationStatus }

/**
 * The IWindowsMediaLibrarySharingDevice interface defines methods that provide access to an individual media device on the home network.
 * @remarks
 * To obtain an <b>IWindowsMediaLibrarySharingDevice</b> interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-getdevice">GetDevice</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-get_item">get_Item</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevices">IWindowsMediaLibrarySharingDevices</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevice
 * @namespace Windows.Win32.Media.LibrarySharingServices
 */
export default struct IWindowsMediaLibrarySharingDevice extends IDispatch {
    /**
     * The interface identifier for IWindowsMediaLibrarySharingDevice
     * @type {Guid}
     */
    static IID := Guid("{3dccc293-4fd9-4191-a25b-8e57c5d27bd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsMediaLibrarySharingDevice interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DeviceID      : IntPtr
        get_Authorization : IntPtr
        put_Authorization : IntPtr
        get_Properties    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsMediaLibrarySharingDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    DeviceID {
        get => this.get_DeviceID()
    }

    /**
     * @type {WindowsMediaLibrarySharingDeviceAuthorizationStatus} 
     */
    Authorization {
        get => this.get_Authorization()
        set => this.put_Authorization(value)
    }

    /**
     * @type {IWindowsMediaLibrarySharingDeviceProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * The get_DeviceID method retrieves the device ID.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the device ID.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-get_deviceid
     */
    get_DeviceID() {
        deviceID := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, deviceID, "HRESULT")
        return deviceID
    }

    /**
     * The get_Authorization method retrieves a value that indicates whether the device is authorized to have access to the current user's media library.
     * @returns {WindowsMediaLibrarySharingDeviceAuthorizationStatus} A pointer to a variable that receives an element of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/ne-wmlss-windowsmedialibrarysharingdeviceauthorizationstatus">WindowsMediaLibrarySharingDeviceAuthorizationStatus</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-get_authorization
     */
    get_Authorization() {
        result := ComCall(8, this, "int*", &authorization := 0, "HRESULT")
        return authorization
    }

    /**
     * The put_Authorization method authorizes or unauthorizes the device to have access to the current user's media library.
     * @param {WindowsMediaLibrarySharingDeviceAuthorizationStatus} authorization An element of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/ne-wmlss-windowsmedialibrarysharingdeviceauthorizationstatus">WindowsMediaLibrarySharingDeviceAuthorizationStatus</a> enumeration that specifies whether the device is authorized (<b>DEVICE_AUTHORIZATION_ALLOWED</b>) or unauthorized (<b>DEVICE_AUTHORIZATION_DENIED</b>) to have access to the current user's media library.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-put_authorization
     */
    put_Authorization(authorization) {
        result := ComCall(9, this, WindowsMediaLibrarySharingDeviceAuthorizationStatus, authorization, "HRESULT")
        return result
    }

    /**
     * The get_Properties method retrieves an IWindowsMediaLibrarySharingDeviceProperties interface that represents the collection of all properties for the device.
     * @returns {IWindowsMediaLibrarySharingDeviceProperties} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperties">IWindowsMediaLibrarySharingDeviceProperties</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-get_properties
     */
    get_Properties() {
        result := ComCall(10, this, "ptr*", &deviceProperties := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDeviceProperties(deviceProperties)
    }

    Query(iid) {
        if (IWindowsMediaLibrarySharingDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DeviceID := CallbackCreate(GetMethod(implObj, "get_DeviceID"), flags, 2)
        this.vtbl.get_Authorization := CallbackCreate(GetMethod(implObj, "get_Authorization"), flags, 2)
        this.vtbl.put_Authorization := CallbackCreate(GetMethod(implObj, "put_Authorization"), flags, 2)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DeviceID)
        CallbackFree(this.vtbl.get_Authorization)
        CallbackFree(this.vtbl.put_Authorization)
        CallbackFree(this.vtbl.get_Properties)
    }
}
