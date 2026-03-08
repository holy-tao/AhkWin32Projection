#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implemented by clients to register for and receive common audio-related notifications for APO endpoint and system effect notifications.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
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
     * Called by the system to allow clients to register to receive notification callbacks for APO endpoint and system effect notifications.
     * @remarks
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Pointer<Pointer<APO_NOTIFICATION_DESCRIPTOR>>} apoNotifications Output parameter that returns a pointer to an array of [APO_NOTIFICATION_DESCRIPTOR](ns-audioengineextensionapo-apo_notification_descriptor.md) specifying the set of APO changes for which notifications are requested.
     * @param {Pointer<Integer>} count Output parameter specifying the number of items returned in *apoNotifications*.
     * @returns {HRESULT} An HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectnotifications-getaponotificationregistrationinfo
     */
    GetApoNotificationRegistrationInfo(apoNotifications, count) {
        apoNotificationsMarshal := apoNotifications is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, apoNotificationsMarshal, apoNotifications, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * Called by the system to notify clients of changes to APO endpoints or system effects.
     * @remarks
     * Specify the set of APO changes for which this method is called by implementing [IAudioProcessingObjectNotifications::GetApoNotificationRegistrationInfo](nf-audioengineextensionapo-iaudioprocessingobjectnotifications-getaponotificationregistrationinfo.md).
     * 
     * 
     * This method will be called after [LockForProcess](/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectconfiguration-lockforprocess) is called and will stop being called before [UnlockForProcess](/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectconfiguration-unlockforprocess). If there are any notifications in flight, they might get executed during or after **UnlockForProcess**. The APO must handle synchronization in this case.
     * 
     * > [!NOTE]
     * > APOs must query each property once to get its initial value because **HandleNotification** method is only invoked when any of the properties have changed. The exceptions to this are the initial audio endpoint volume when the APO registers for APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME and the value of PKEY_AudioEndpoint_Disable_SysFx if the APO registers for APO_NOTIFICATION_TYPE_ENDPOINT_PROPERTY_CHANGE
     * 
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Pointer<APO_NOTIFICATION>} apoNotification An [APO_NOTIFICATION](ns-audioengineextensionapo-apo_notification.md) representing the APO change associated with the notification.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectnotifications-handlenotification
     */
    HandleNotification(apoNotification) {
        ComCall(4, this, "ptr", apoNotification)
    }
}
