#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWindowsMediaLibrarySharingDeviceProperties.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWindowsMediaLibrarySharingDevice interface defines methods that provide access to an individual media device on the home network.
 * @remarks
 * 
 * To obtain an <b>IWindowsMediaLibrarySharingDevice</b> interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-getdevice">GetDevice</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-get_item">get_Item</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevices">IWindowsMediaLibrarySharingDevices</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmlss/nn-wmlss-iwindowsmedialibrarysharingdevice
 * @namespace Windows.Win32.Media.LibrarySharingServices
 * @version v4.0.30319
 */
class IWindowsMediaLibrarySharingDevice extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsMediaLibrarySharingDevice
     * @type {Guid}
     */
    static IID => Guid("{3dccc293-4fd9-4191-a25b-8e57c5d27bd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceID", "get_Authorization", "put_Authorization", "get_Properties"]

    /**
     * @type {BSTR} 
     */
    DeviceID {
        get => this.get_DeviceID()
    }

    /**
     * @type {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-get_deviceid
     */
    get_DeviceID() {
        deviceID := BSTR()
        result := ComCall(7, this, "ptr", deviceID, "HRESULT")
        return deviceID
    }

    /**
     * The get_Authorization method retrieves a value that indicates whether the device is authorized to have access to the current user's media library.
     * @returns {Integer} A pointer to a variable that receives an element of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/ne-wmlss-windowsmedialibrarysharingdeviceauthorizationstatus">WindowsMediaLibrarySharingDeviceAuthorizationStatus</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-get_authorization
     */
    get_Authorization() {
        result := ComCall(8, this, "int*", &authorization := 0, "HRESULT")
        return authorization
    }

    /**
     * The put_Authorization method authorizes or unauthorizes the device to have access to the current user's media library.
     * @param {Integer} authorization An element of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/ne-wmlss-windowsmedialibrarysharingdeviceauthorizationstatus">WindowsMediaLibrarySharingDeviceAuthorizationStatus</a> enumeration that specifies whether the device is authorized (<b>DEVICE_AUTHORIZATION_ALLOWED</b>) or unauthorized (<b>DEVICE_AUTHORIZATION_DENIED</b>) to have access to the current user's media library.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-put_authorization
     */
    put_Authorization(authorization) {
        result := ComCall(9, this, "int", authorization, "HRESULT")
        return result
    }

    /**
     * The get_Properties method retrieves an IWindowsMediaLibrarySharingDeviceProperties interface that represents the collection of all properties for the device.
     * @returns {IWindowsMediaLibrarySharingDeviceProperties} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperties">IWindowsMediaLibrarySharingDeviceProperties</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-get_properties
     */
    get_Properties() {
        result := ComCall(10, this, "ptr*", &deviceProperties := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDeviceProperties(deviceProperties)
    }
}
