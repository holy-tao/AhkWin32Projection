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
     * Called when a user interacts with a toast in the action center.
     * @param {PWSTR} appUserModelId The unique identifier representing your app to the notification platform.
     * @param {PWSTR} invokedArgs Arguments from the invoked button. <b>NULL</b> if the toast indicates the default activation and no launch arguments were specified in the XML payload.
     * @param {Pointer<NOTIFICATION_USER_INPUT_DATA>} data The data from the input elements available on the notification toast.
     * @param {Integer} count The number of <i>data</i> elements.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//notificationactivationcallback/nf-notificationactivationcallback-inotificationactivationcallback-activate
     */
    Activate(appUserModelId, invokedArgs, data, count) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        invokedArgs := invokedArgs is String ? StrPtr(invokedArgs) : invokedArgs

        result := ComCall(3, this, "ptr", appUserModelId, "ptr", invokedArgs, "ptr", data, "uint", count, "HRESULT")
        return result
    }
}
