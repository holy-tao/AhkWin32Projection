#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDServiceProvider2.ahk

/**
 * The IMDServiceProvider3 interface extends the IMDServiceProvider2 interface by providing a method for setting the device enumeration preferences.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdserviceprovider3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDServiceProvider3 extends IMDServiceProvider2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDServiceProvider3
     * @type {Guid}
     */
    static IID => Guid("{4ed13ef3-a971-4d19-9f51-0e1826b2da57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDeviceEnumPreference"]

    /**
     * The SetDeviceEnumPreference method sets the device enumeration preferences.
     * @param {Integer} dwEnumPref Contains a bitwise <b>OR</b> combination of one or more of the following bit values that specify enumeration preference. Each set bit enables the corresponding extended behavior, whereas the absence of that bit disables the extended behavior and specifies the default, backward-compatible enumeration behavior. The possible values for <i>dwEnumPref</i> are provided in the following table.
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
     * <td>By default, for devices containing multiple storage media, each of these storages enumerates as a separate pseudo-device. However, when this bit is set, storages are not visible as devices, and only devices are visible as devices.</td>
     * </tr>
     * <tr>
     * <td>ALLOW_OUTOFBAND_NOTIFICATION</td>
     * <td>By default, the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmnotification">IWMDMNotification</a> callback mechanism provides applications with device arrival and removal events. When this bit is set, the service provider is free to notify the application by a separate mechanism, such as by using a window message. This behavior is in addition to the Windows Media Device Manager notifications. This flag does not suppress Windows Media Device Manager notifications.</td>
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
     * The <i>dwEnumPref</i> parameter contains an unsupported bit value.
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
     * The method was called after an enumeration operation. It must be called before the enumeration operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdserviceprovider3-setdeviceenumpreference
     */
    SetDeviceEnumPreference(dwEnumPref) {
        result := ComCall(6, this, "uint", dwEnumPref, "HRESULT")
        return result
    }
}
