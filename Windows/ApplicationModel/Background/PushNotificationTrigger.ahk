#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include .\IPushNotificationTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object that invokes a background work item on the app in response to the receipt of a [raw notification](../windows.networking.pushnotifications/rawnotification.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.pushnotificationtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class PushNotificationTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Invokes a background work item on a specified app in response to the receipt of a [raw notification](../windows.networking.pushnotifications/rawnotification.md).
     * @param {HSTRING} applicationId The package-relative application identifier (PRAID) of the app. The specified app must be in the same package as the calling app. For more info on the PRAID, see the **Id** attribute of the [Application](/uwp/schemas/appxpackage/appxmanifestschema/element-application#attributes-and-elements) element.
     * 
     * If you are hosting background task(s) in an out-of-process COM server, separate from your main application, then pass as the argument for `applicationId` the PRAID of the application that defines the `windows.backgroundTask` extension in its own package manifest.
     * @returns {PushNotificationTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.pushnotificationtrigger.#ctor
     */
    static Create(applicationId) {
        if (!PushNotificationTrigger.HasProp("__IPushNotificationTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.PushNotificationTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPushNotificationTriggerFactory.IID)
            PushNotificationTrigger.__IPushNotificationTriggerFactory := IPushNotificationTriggerFactory(factoryPtr)
        }

        return PushNotificationTrigger.__IPushNotificationTriggerFactory.Create(applicationId)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Invokes a background work item on the app in response to the receipt of a [raw notification](../windows.networking.pushnotifications/rawnotification.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.PushNotificationTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
