#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectNotifications extends IUnknown{
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
     * 
     * @param {Pointer<APO_NOTIFICATION_DESCRIPTOR>} apoNotifications 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetApoNotificationRegistrationInfo(apoNotifications, count) {
        result := ComCall(3, this, "ptr", apoNotifications, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<APO_NOTIFICATION>} apoNotification 
     * @returns {String} Nothing - always returns an empty string
     */
    HandleNotification(apoNotification) {
        ComCall(4, this, "ptr", apoNotification)
        return result
    }
}
