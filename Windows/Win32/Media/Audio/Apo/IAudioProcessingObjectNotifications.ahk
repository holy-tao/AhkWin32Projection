#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nn-audioengineextensionapo-iaudioprocessingobjectnotifications
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectNotifications extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObjectNotifications
     * @type {Guid}
     */
    static IID => Guid("{56b0c76f-02fd-4b21-a52e-9f8219fc86e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApoNotificationRegistrationInfo", "HandleNotification"]

    /**
     * 
     * @param {Pointer<Pointer<APO_NOTIFICATION_DESCRIPTOR>>} apoNotifications 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectnotifications-getaponotificationregistrationinfo
     */
    GetApoNotificationRegistrationInfo(apoNotifications, count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr*", apoNotifications, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<APO_NOTIFICATION>} apoNotification 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectnotifications-handlenotification
     */
    HandleNotification(apoNotification) {
        ComCall(4, this, "ptr", apoNotification)
    }
}
