#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The optional, application-implemented IWMDMNotification interface allows applications and service providers to receive notifications when either devices or memory storages (such as RAM cards) are connected or disconnected from the computer.Note  This method will be called only for registered Plug and Play devices. Other device arrivals or departures will not cause this interface to be called. This interface GUID is not properly defined in mssachlp.lib; therefore, you must
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmnotification
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMNotification extends IUnknown {
    /**
     * The interface identifier for IWMDMNotification
     * @type {Guid}
     */
    static IID := Guid("{3f5e95c0-0f43-4ed4-93d2-c89a45d59b81}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        WMDMMessage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The WMDMMessage method is a callback method implemented by a client, and called by Windows Media Device Manager when a Plug and Play compliant device or storage medium is connected or removed.
     * @remarks
     * To learn how an application subscribes to receive notifications through this method, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/enabling-notifications">Enabling Notifications</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmnotification-wmdmmessage
     */
    WMDMMessage(dwMessageType, pwszCanonicalName) {
        pwszCanonicalName := pwszCanonicalName is String ? StrPtr(pwszCanonicalName) : pwszCanonicalName

        result := ComCall(3, this, "uint", dwMessageType, "ptr", pwszCanonicalName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDMNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WMDMMessage := CallbackCreate(GetMethod(implObj, "WMDMMessage"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WMDMMessage)
    }
}
