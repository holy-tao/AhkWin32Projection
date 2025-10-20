#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives notification messages when an app is triggered through a toast from the action center.
 * @see https://docs.microsoft.com/windows/win32/api//notificationactivationcallback/nn-notificationactivationcallback-inotificationactivationcallback
 * @namespace Windows.Win32.UI.Notifications
 * @version v4.0.30319
 */
class INotificationActivationCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotificationActivationCallback
     * @type {Guid}
     */
    static IID => Guid("{53e31837-6600-4a81-9395-75cffe746f94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate"]

    /**
     * 
     * @param {PWSTR} appUserModelId 
     * @param {PWSTR} invokedArgs 
     * @param {Pointer<NOTIFICATION_USER_INPUT_DATA>} data 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/notificationactivationcallback/nf-notificationactivationcallback-inotificationactivationcallback-activate
     */
    Activate(appUserModelId, invokedArgs, data, count) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        invokedArgs := invokedArgs is String ? StrPtr(invokedArgs) : invokedArgs

        result := ComCall(3, this, "ptr", appUserModelId, "ptr", invokedArgs, "ptr", data, "uint", count, "HRESULT")
        return result
    }
}
