#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The optional, application-implemented IWMDMNotification interface allows applications and service providers to receive notifications when either devices or memory storages (such as RAM cards) are connected or disconnected from the computer.Note  This method will be called only for registered Plug and Play devices. Other device arrivals or departures will not cause this interface to be called. This interface GUID is not properly defined in mssachlp.lib; therefore, you must
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmnotification
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMNotification
     * @type {Guid}
     */
    static IID => Guid("{3f5e95c0-0f43-4ed4-93d2-c89a45d59b81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WMDMMessage"]

    /**
     * The WMDMMessage method is a callback method implemented by a client, and called by Windows Media Device Manager when a Plug and Play compliant device or storage medium is connected or removed.
     * @param {Integer} dwMessageType A <b>DWORD</b> specifying the message type.
     * 
     * The possible values for the event types are the following:
     * 
     * <table>
     * <tr>
     * <th>Message type
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_MSG_DEVICE_ARRIVAL</td>
     * <td>A device has been connected.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MSG_DEVICE_REMOVAL</td>
     * <td>A device has been removed.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MSG_MEDIA_ARRIVAL</td>
     * <td>A storage medium has been inserted in a connected device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MSG_MEDIA_REMOVAL</td>
     * <td>A storage medium has been removed from a connected device.</td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszCanonicalName Pointer to a wide-character, null-terminated string specifying the canonical name of the device for which this event is generated. The application does not release this value.
     * @returns {HRESULT} The return value is an <b>HRESULT</b> in which application can return results of its processing of the message. The return value is ignored by WMDM.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmnotification-wmdmmessage
     */
    WMDMMessage(dwMessageType, pwszCanonicalName) {
        pwszCanonicalName := pwszCanonicalName is String ? StrPtr(pwszCanonicalName) : pwszCanonicalName

        result := ComCall(3, this, "uint", dwMessageType, "ptr", pwszCanonicalName, "HRESULT")
        return result
    }
}
