#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallOriginManagerStatics2.ahk
#Include .\IPhoneCallOriginManagerStatics.ahk
#Include .\IPhoneCallOriginManagerStatics3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Controls which application is responsible for determining the origin of incoming calls and sets the [PhoneCallOrigin](phonecallorigin.md) information.
  * 
  * > [!NOTE]
  * > This class is deprecated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecalloriginmanager
 * @namespace Windows.ApplicationModel.Calls.Provider
 * @version WindowsRuntime 1.4
 */
class PhoneCallOriginManager extends IInspectable {
;@region Static Properties
    /**
     * Checks to see if the current application is set as the default call origin application.
     * @remarks
     * A user can have multiple phone call origin applications installed on a phone. However, only one of the applications can be the default application and respond to incoming calls. This method determines whether the current application is the active phone call origin application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecalloriginmanager.iscurrentappactivecalloriginapp
     * @type {Boolean} 
     */
    static IsCurrentAppActiveCallOriginApp {
        get => PhoneCallOriginManager.get_IsCurrentAppActiveCallOriginApp()
    }

    /**
     * Returns true if PhoneCallOriginManager APIs are supported and false if they are not supported. See remarks for exception.
     * @remarks
     * Exception: SetCallOrigin API is supported and not affected by this API
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecalloriginmanager.issupported
     * @type {Boolean} 
     */
    static IsSupported {
        get => PhoneCallOriginManager.get_IsSupported()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Calls a dialog to set the current app as the default phone origin app.
     * @remarks
     * In order to use this API, your application needs to be registered as a phone call origin provider. If the application is not appropriately registered, this API will throw an exception. See [Windows.ApplicationModel.Calls.Provider](windows_applicationmodel_calls_provider.md) for more information about how to register as a phone call origin provider.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecalloriginmanager.requestsetasactivecalloriginappasync
     */
    static RequestSetAsActiveCallOriginAppAsync() {
        if (!PhoneCallOriginManager.HasProp("__IPhoneCallOriginManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.Provider.PhoneCallOriginManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallOriginManagerStatics2.IID)
            PhoneCallOriginManager.__IPhoneCallOriginManagerStatics2 := IPhoneCallOriginManagerStatics2(factoryPtr)
        }

        return PhoneCallOriginManager.__IPhoneCallOriginManagerStatics2.RequestSetAsActiveCallOriginAppAsync()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsCurrentAppActiveCallOriginApp() {
        if (!PhoneCallOriginManager.HasProp("__IPhoneCallOriginManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.Provider.PhoneCallOriginManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallOriginManagerStatics.IID)
            PhoneCallOriginManager.__IPhoneCallOriginManagerStatics := IPhoneCallOriginManagerStatics(factoryPtr)
        }

        return PhoneCallOriginManager.__IPhoneCallOriginManagerStatics.get_IsCurrentAppActiveCallOriginApp()
    }

    /**
     * Opens the interface that enables the user to select the call origin application.
     * @remarks
     * A user can have multiple phone call origin applications installed on a phone. However, only one of the applications can be the default application and respond to incoming calls. Calling this method opens the user interface to let the user select which phone call origin application is used.
     * 
     * An app must meet certain requirements in order to be show in the list of possible applications for managing call origin.
     * + The application must include `<mobile:Extension Category="windows.phoneCallOriginProvider"/>` in the app manifest.
     * + The application much register the trigger [PhoneCallOriginDataRequestTriggerDetails](../windows.applicationmodel.calls.background/phonecallorigindatarequesttriggerdetails.md).
     * 
     * 
     * To successfully build a package to deploy a custom app, your app needs to have **mobile** as a value for the **IgnorableNamespaces** attribute of the **Package**. Here is a sample **Package** element for a custom app.
     * 
     * ```
     * <Package
     *  xmlns="http://schemas.microsoft.com/appx/manifest/foundation/windows10"
     *  xmlns:mp="http://schemas.microsoft.com/appx/2014/phone/manifest"
     *  xmlns:uap="http://schemas.microsoft.com/appx/manifest/uap/windows10"
     *  xmlns:mobile="http://schemas.microsoft.com/appx/manifest/mobile/windows10"
     *  IgnorableNamespaces="uap mp mobile"
     *  >
     * ```
     * 
     * 
     * 
     * The following example shows how to pull up the phone call origins application UI so the user can select the appropriate app.
     * 
     * 
     * 
     * [!code-csharp[SelectOriginApp](../windows.applicationmodel.calls.provider/code/CallProvider/cs/Scenario1.xaml.cs#SnippetSelectOriginApp)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecalloriginmanager.showphonecalloriginsettingsui
     */
    static ShowPhoneCallOriginSettingsUI() {
        if (!PhoneCallOriginManager.HasProp("__IPhoneCallOriginManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.Provider.PhoneCallOriginManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallOriginManagerStatics.IID)
            PhoneCallOriginManager.__IPhoneCallOriginManagerStatics := IPhoneCallOriginManagerStatics(factoryPtr)
        }

        return PhoneCallOriginManager.__IPhoneCallOriginManagerStatics.ShowPhoneCallOriginSettingsUI()
    }

    /**
     * Sets the call origin when a phone call comes in.
     * @remarks
     * Before attempting to call this method, make sure of the following.
     * + You declare the **PhoneCall** capability in your app manifest file as follows: `<uap:Capability Name="phoneCall" />`
     * + Your application has a background task that binds the [PhoneCallOriginDataRequestTriggerDetails](../windows.applicationmodel.calls.background/phonecallorigindatarequesttriggerdetails.md) trigger.
     * + Your application can make phone calls (under Settings -> Privacy -> Phone calls).
     * 
     * 
     * If any of these are not true, SetCallOrigin will return an access denied error.
     * 
     * This method should be invoked in the background when the application is triggered by the [PhoneCallOriginDataRequestTriggerDetails](../windows.applicationmodel.calls.background/phonecallorigindatarequesttriggerdetails.md).
     * 
     * The following example shows how to set the location of the origin in response to a trigger.
     * 
     * 
     * 
     * [!code-csharp[ShowCallLocation](../windows.applicationmodel.calls.provider/code/CallProvider/cs/Scenario1.xaml.cs#SnippetShowCallLocation)]
     * @param {Guid} requestId The unique identifier for this phone call. This is retrieved from the *targetId* of the [PhoneCallOriginDataRequestTriggerDetails](../windows.applicationmodel.calls.background/phonecallorigindatarequesttriggerdetails.md)
     * @param {PhoneCallOrigin} callOrigin The call information for the incoming call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.provider.phonecalloriginmanager.setcallorigin
     */
    static SetCallOrigin(requestId, callOrigin) {
        if (!PhoneCallOriginManager.HasProp("__IPhoneCallOriginManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.Provider.PhoneCallOriginManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallOriginManagerStatics.IID)
            PhoneCallOriginManager.__IPhoneCallOriginManagerStatics := IPhoneCallOriginManagerStatics(factoryPtr)
        }

        return PhoneCallOriginManager.__IPhoneCallOriginManagerStatics.SetCallOrigin(requestId, callOrigin)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsSupported() {
        if (!PhoneCallOriginManager.HasProp("__IPhoneCallOriginManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.Provider.PhoneCallOriginManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallOriginManagerStatics3.IID)
            PhoneCallOriginManager.__IPhoneCallOriginManagerStatics3 := IPhoneCallOriginManagerStatics3(factoryPtr)
        }

        return PhoneCallOriginManager.__IPhoneCallOriginManagerStatics3.get_IsSupported()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
