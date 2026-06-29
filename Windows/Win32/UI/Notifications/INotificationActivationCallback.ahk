#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\NOTIFICATION_USER_INPUT_DATA.ahk" { NOTIFICATION_USER_INPUT_DATA }

/**
 * Receives notification messages when an app is triggered through a toast from the action center.
 * @see https://learn.microsoft.com/windows/win32/api/notificationactivationcallback/nn-notificationactivationcallback-inotificationactivationcallback
 * @namespace Windows.Win32.UI.Notifications
 */
export default struct INotificationActivationCallback extends IUnknown {
    /**
     * The interface identifier for INotificationActivationCallback
     * @type {Guid}
     */
    static IID := Guid("{53e31837-6600-4a81-9395-75cffe746f94}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INotificationActivationCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Activate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INotificationActivationCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/notificationactivationcallback/nf-notificationactivationcallback-inotificationactivationcallback-activate
     */
    Activate(appUserModelId, invokedArgs, data, count) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        invokedArgs := invokedArgs is String ? StrPtr(invokedArgs) : invokedArgs

        result := ComCall(3, this, "ptr", appUserModelId, "ptr", invokedArgs, NOTIFICATION_USER_INPUT_DATA.Ptr, data, "uint", count, "HRESULT")
        return result
    }

    Query(iid) {
        if (INotificationActivationCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Activate)
    }
}
