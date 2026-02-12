#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownNotificationBindingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the binding templates available for adaptive notifications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownnotificationbindings
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class KnownNotificationBindings extends IInspectable {
;@region Static Properties
    /**
     * Gets the string representation of the ToastGeneric binding.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.knownnotificationbindings.toastgeneric
     * @type {HSTRING} 
     */
    static ToastGeneric {
        get => KnownNotificationBindings.get_ToastGeneric()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ToastGeneric() {
        if (!KnownNotificationBindings.HasProp("__IKnownNotificationBindingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.KnownNotificationBindings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownNotificationBindingsStatics.IID)
            KnownNotificationBindings.__IKnownNotificationBindingsStatics := IKnownNotificationBindingsStatics(factoryPtr)
        }

        return KnownNotificationBindings.__IKnownNotificationBindingsStatics.get_ToastGeneric()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
