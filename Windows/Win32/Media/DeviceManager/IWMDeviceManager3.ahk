#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDeviceManager2.ahk

/**
 * The IWMDeviceManager3 interface extends the IWMDeviceManager2 interface by providing a method that sets the device enumeration preferences.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdevicemanager3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDeviceManager3 extends IWMDeviceManager2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDeviceManager3
     * @type {Guid}
     */
    static IID => Guid("{af185c41-100d-46ed-be2e-9ce8c44594ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDeviceEnumPreference"]

    /**
     * The SetDeviceEnumPreference method sets the device enumeration preferences. (IWMDeviceManager3.SetDeviceEnumPreference)
     * @remarks
     * This method provides clients the ability to override the default device enumeration behavior of Windows Media Device Manager. In order to override the default behavior, the client application must call this method immediately after creating the device manager object by querying for the <b>IWMDMDeviceManager3</b>  interface from Media Device Manager. The call must be made before any enumeration occurs, either explicitly or implicitly as a result of another operation.
     * 
     * After a preference flag is set, it cannot be changed for the lifetime of the application (not just the lifetime of the Windows Media Device Manager object). Attempting to change a preference flag will result in an error. Calling this method again with the same flag settings does not return an error, and also does have any effect on enumeration.
     * 
     * The service provider may not honor the DO_NOT_VIRTUALIZE_STORAGES_AS_DEVICES flag. A more robust way to determine if storages are hosted by the same device is to call <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice2-getcanonicalname">IWMDMDevice2::GetCanonicalName</a>. Storages from the same device will return identical values, except for the final digit after the last "$" character.
     * @param {Integer} dwEnumPref Specifies a bitwise <b>OR</b> combination of one or more of the following bit values that specify enumeration preference. Each set bit enables the corresponding extended behavior, whereas the absence of that bit disables the extended behavior and specifies the default, backward-compatible enumeration behavior. The possible values for <i>fuPrefs</i> are provided in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>DO_NOT_VIRTUALIZE_STORAGES_AS_DEVICES</td>
     * <td>By default, for devices containing multiple storage media (for example, multiple flash memory cards), each of these storages enumerates as a separate pseudo-device. However, when this flag is set, storages are not visible as devices, and only devices are visible as devices. See Remarks for more information.</td>
     * </tr>
     * <tr>
     * <td>ALLOW_OUTOFBAND_NOTIFICATION</td>
     * <td>When this flag is set, the service provider can send device arrival and removal by an additional mechanism, such as by using a window message, as well as the default mechanism of calling any application-implemented <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmnotification">IWMDMNotification</a> interfaces.</td>
     * </tr>
     * </table>
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
     * The <i>fuPrefs</i> parameter specifies an unsupported bit value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_CALL_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was called after an enumeration operation; it must be called before the enumeration operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager3-setdeviceenumpreference
     */
    SetDeviceEnumPreference(dwEnumPref) {
        result := ComCall(9, this, "uint", dwEnumPref, "HRESULT")
        return result
    }
}
