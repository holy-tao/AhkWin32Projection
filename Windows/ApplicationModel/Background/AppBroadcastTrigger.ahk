#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include .\IAppBroadcastTrigger.ahk
#Include .\IAppBroadcastTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an event that triggers a background task to run when an application starts gameplay broadcasting.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this class.  
 * 
 * The background task must be declared in the manifest before the registration can be successful.
 * An instance of this class is passed to the background task in its [Run](ibackgroundtask_run_2017283929.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class AppBroadcastTrigger extends IInspectable {
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
     * Constructs an AppBroadcastTrigger with the name of the provider that will be doing the gameplay broadcasting.
     * @param {HSTRING} providerKey The name of the provider that is broadcasting gameplay.
     * @returns {AppBroadcastTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttrigger.#ctor
     */
    static CreateAppBroadcastTrigger(providerKey) {
        if (!AppBroadcastTrigger.HasProp("__IAppBroadcastTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.AppBroadcastTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBroadcastTriggerFactory.IID)
            AppBroadcastTrigger.__IAppBroadcastTriggerFactory := IAppBroadcastTriggerFactory(factoryPtr)
        }

        return AppBroadcastTrigger.__IAppBroadcastTriggerFactory.CreateAppBroadcastTrigger(providerKey)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Provides information about the application that is broadcasting gameplay.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttrigger.providerinfo
     * @type {AppBroadcastTriggerProviderInfo} 
     */
    ProviderInfo {
        get => this.get_ProviderInfo()
        set => this.put_ProviderInfo(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {AppBroadcastTriggerProviderInfo} value 
     * @returns {HRESULT} 
     */
    put_ProviderInfo(value) {
        if (!this.HasProp("__IAppBroadcastTrigger")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTrigger := IAppBroadcastTrigger(outPtr)
        }

        return this.__IAppBroadcastTrigger.put_ProviderInfo(value)
    }

    /**
     * 
     * @returns {AppBroadcastTriggerProviderInfo} 
     */
    get_ProviderInfo() {
        if (!this.HasProp("__IAppBroadcastTrigger")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTrigger := IAppBroadcastTrigger(outPtr)
        }

        return this.__IAppBroadcastTrigger.get_ProviderInfo()
    }

;@endregion Instance Methods
}
