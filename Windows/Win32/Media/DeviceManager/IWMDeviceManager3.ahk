#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDeviceManager2.ahk

/**
 * The IWMDeviceManager3 interface extends the IWMDeviceManager2 interface by providing a method that sets the device enumeration preferences.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdevicemanager3
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
     * The SetDeviceEnumPreference method sets the device enumeration preferences.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdevicemanager3-setdeviceenumpreference
     */
    SetDeviceEnumPreference(dwEnumPref) {
        result := ComCall(9, this, "uint", dwEnumPref, "HRESULT")
        return result
    }
}
