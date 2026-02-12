#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives notification messages when an app is triggered through a toast from the action center.
 * @see https://learn.microsoft.com/windows/win32/api//content/notificationactivationcallback/nn-notificationactivationcallback-inotificationactivationcallback
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
     * @remarks
     * In order for your app to respond to toasts in the action center, you need to override this method in your app. You also will need to create a shortcut on the start menu. For more information about how to respond to activation notifications, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/win32_tile_badge_notif/respond-to-toast-activations">Respond to toast activations</a>.
     * 
     * If your application uses non-interactive toasts, you can respond to those without using <i>invokedArgs</i> or <i>data</i>.
     * 
     * If you return a failure code, the activation will fail and the user can try again to activate your app.
     * @param {PWSTR} appUserModelId The unique identifier representing your app to the notification platform.
     * @param {PWSTR} invokedArgs Arguments from the invoked button. <b>NULL</b> if the toast indicates the default activation and no launch arguments were specified in the XML payload.
     * @param {Pointer<NOTIFICATION_USER_INPUT_DATA>} data The data from the input elements available on the notification toast.
     * @param {Integer} count The number of <i>data</i> elements.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/notificationactivationcallback/nf-notificationactivationcallback-inotificationactivationcallback-activate
     */
    Activate(appUserModelId, invokedArgs, data, count) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        invokedArgs := invokedArgs is String ? StrPtr(invokedArgs) : invokedArgs

        result := ComCall(3, this, "ptr", appUserModelId, "ptr", invokedArgs, "ptr", data, "uint", count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
