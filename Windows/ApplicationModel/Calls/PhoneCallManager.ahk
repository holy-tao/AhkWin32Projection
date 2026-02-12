#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallManagerStatics2.ahk
#Include .\IPhoneCallManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to query the call status and launch phone calls.
 * @remarks
 * Most of the methods of this API can be used even if your application is not responsible for placing phone calls. You can do this if you want to determine the status of phone calls.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallmanager
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallManager extends IInspectable {
;@region Static Properties
    /**
     * Gets a value that indicates whether an active call is in progress on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallmanager.iscallactive
     * @type {Boolean} 
     */
    static IsCallActive {
        get => PhoneCallManager.get_IsCallActive()
    }

    /**
     * Gets a value that indicates if a call is incoming on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallmanager.iscallincoming
     * @type {Boolean} 
     */
    static IsCallIncoming {
        get => PhoneCallManager.get_IsCallIncoming()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_CallStateChanged(handler) {
        if (!PhoneCallManager.HasProp("__IPhoneCallManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallManagerStatics2.IID)
            PhoneCallManager.__IPhoneCallManagerStatics2 := IPhoneCallManagerStatics2(factoryPtr)
        }

        return PhoneCallManager.__IPhoneCallManagerStatics2.add_CallStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_CallStateChanged(token) {
        if (!PhoneCallManager.HasProp("__IPhoneCallManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallManagerStatics2.IID)
            PhoneCallManager.__IPhoneCallManagerStatics2 := IPhoneCallManagerStatics2(factoryPtr)
        }

        return PhoneCallManager.__IPhoneCallManagerStatics2.remove_CallStateChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsCallActive() {
        if (!PhoneCallManager.HasProp("__IPhoneCallManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallManagerStatics2.IID)
            PhoneCallManager.__IPhoneCallManagerStatics2 := IPhoneCallManagerStatics2(factoryPtr)
        }

        return PhoneCallManager.__IPhoneCallManagerStatics2.get_IsCallActive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsCallIncoming() {
        if (!PhoneCallManager.HasProp("__IPhoneCallManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallManagerStatics2.IID)
            PhoneCallManager.__IPhoneCallManagerStatics2 := IPhoneCallManagerStatics2(factoryPtr)
        }

        return PhoneCallManager.__IPhoneCallManagerStatics2.get_IsCallIncoming()
    }

    /**
     * Launches the call settings UI.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallmanager.showphonecallsettingsui
     */
    static ShowPhoneCallSettingsUI() {
        if (!PhoneCallManager.HasProp("__IPhoneCallManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallManagerStatics2.IID)
            PhoneCallManager.__IPhoneCallManagerStatics2 := IPhoneCallManagerStatics2(factoryPtr)
        }

        return PhoneCallManager.__IPhoneCallManagerStatics2.ShowPhoneCallSettingsUI()
    }

    /**
     * Retrieves a [PhoneCallStore](phonecallstore.md).
     * @remarks
     * In order to use this method, you need to have the **phoneCall** capability in your app manifest file.
     * 
     * ```
     * <uap:Capability Name="phoneCall" />
     * ```
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > If your application uses the **phoneCall** capability, you must request a waiver if you want to publish your application in China. Contact your premier support representative if you need the waiver.
     * @returns {IAsyncOperation<PhoneCallStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallmanager.requeststoreasync
     */
    static RequestStoreAsync() {
        if (!PhoneCallManager.HasProp("__IPhoneCallManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallManagerStatics2.IID)
            PhoneCallManager.__IPhoneCallManagerStatics2 := IPhoneCallManagerStatics2(factoryPtr)
        }

        return PhoneCallManager.__IPhoneCallManagerStatics2.RequestStoreAsync()
    }

    /**
     * Launches the built-in phone call UI with the specified phone number and display name.
     * @param {HSTRING} phoneNumber A phone number.
     * @param {HSTRING} displayName A display name.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallmanager.showphonecallui
     */
    static ShowPhoneCallUI(phoneNumber, displayName) {
        if (!PhoneCallManager.HasProp("__IPhoneCallManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallManagerStatics.IID)
            PhoneCallManager.__IPhoneCallManagerStatics := IPhoneCallManagerStatics(factoryPtr)
        }

        return PhoneCallManager.__IPhoneCallManagerStatics.ShowPhoneCallUI(phoneNumber, displayName)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
