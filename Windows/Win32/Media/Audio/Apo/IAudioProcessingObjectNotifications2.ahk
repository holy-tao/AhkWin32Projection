#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioProcessingObjectNotifications.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nn-audioengineextensionapo-iaudioprocessingobjectnotifications2
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectNotifications2 extends IAudioProcessingObjectNotifications{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObjectNotifications2
     * @type {Guid}
     */
    static IID => Guid("{ca2cfbde-a9d6-4eb0-bc95-c4d026b380f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApoNotificationRegistrationInfo2"]

    /**
     * 
     * @param {Integer} maxApoNotificationTypeSupported 
     * @param {Pointer<Pointer<APO_NOTIFICATION_DESCRIPTOR>>} apoNotifications 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectnotifications2-getaponotificationregistrationinfo2
     */
    GetApoNotificationRegistrationInfo2(maxApoNotificationTypeSupported, apoNotifications, count) {
        apoNotificationsMarshal := apoNotifications is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", maxApoNotificationTypeSupported, apoNotificationsMarshal, apoNotifications, countMarshal, count, "HRESULT")
        return result
    }
}
