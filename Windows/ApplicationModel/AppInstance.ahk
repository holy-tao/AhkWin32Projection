#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppInstance.ahk
#Include .\IAppInstanceStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Represents an instance of an app.
 * @remarks
 * The system maintains a store of app instances. Apps can use this for redirection of an app when it attempts to activate.
 * 
 * When an app process is created in the `Main` method of the app, it can choose to continue to activate the current instance, or to redirect the activation to an existing instance.
 * 
 * The shell can provide a preferred instance for redirection. The app is encouraged to redirect to that instance. The choice of whether to redirect remains with the app.
 * 
 * The [AppInstance](AppInstance.md) class is intended to be used in the `Main` method of the app. If this class is used later, the property values may be `null`, and the methods may fail.
 * 
 * Before any instances can be returned, they must be registered with [FindOrRegisterInstanceForKey](appinstance_findorregisterinstanceforkey_1124409949.md).
 * 
 * This class can only be used from an app that has opted in to multi-instancing. Specify the **SupportsMultipleInstances** attribute on the [Application](/uwp/schemas/appxpackage/uapmanifestschema/element-application) element in the package manifest for the app.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstance
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class AppInstance extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppInstance

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppInstance.IID

    /**
     * A shell can recommend an instance of an app to which an application activation is redirected.
     * @remarks
     * If the shell provides a preference, the app can redirect activation to that instance. 
     * The app can ignore the preference. 
     * 
     * > [!NOTE]
     * > Currently, the shell does not set a non-null value for **RecommendedInstance**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstance.recommendedinstance
     * @type {AppInstance} 
     */
    static RecommendedInstance {
        get => AppInstance.get_RecommendedInstance()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AppInstance} 
     */
    static get_RecommendedInstance() {
        if (!AppInstance.HasProp("__IAppInstanceStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppInstance")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInstanceStatics.IID)
            AppInstance.__IAppInstanceStatics := IAppInstanceStatics(factoryPtr)
        }

        return AppInstance.__IAppInstanceStatics.get_RecommendedInstance()
    }

    /**
     * Gets the current [IActivatedEventArgs](/uwp/api/windows.applicationmodel.activation.iactivatedeventargs), the same that would normally be passed in to the _OnActivated_ method of the app.
     * @remarks
     * This method gets the same arguments that would be passed in to the _OnActivated_ method of the app.
     * 
     * This method allows the app to access its arguments much earlier, in its `Main` method, which is the first app method to be called.
     * 
     * > [!NOTE]
     * > For packaged apps, this method only returns arguments on its first call. Subsequent calls return `null`.
     * @returns {IActivatedEventArgs} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstance.getactivatedeventargs
     */
    static GetActivatedEventArgs() {
        if (!AppInstance.HasProp("__IAppInstanceStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppInstance")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInstanceStatics.IID)
            AppInstance.__IAppInstanceStatics := IAppInstanceStatics(factoryPtr)
        }

        return AppInstance.__IAppInstanceStatics.GetActivatedEventArgs()
    }

    /**
     * Registers an app instance with the platform, or finds an existing instance if another instance has already registered this key.
     * @remarks
     * After an app has registered with the platform, it is returned when other instances query for app instances.
     * 
     * An app instance can register multiple times with different keys.
     * The system cache maintains one row per instance, therefore, the key is overwritten.
     * @param {HSTRING} key A non-empty string as a key for the instance.
     * @returns {AppInstance} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstance.findorregisterinstanceforkey
     */
    static FindOrRegisterInstanceForKey(key) {
        if (!AppInstance.HasProp("__IAppInstanceStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppInstance")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInstanceStatics.IID)
            AppInstance.__IAppInstanceStatics := IAppInstanceStatics(factoryPtr)
        }

        return AppInstance.__IAppInstanceStatics.FindOrRegisterInstanceForKey(key)
    }

    /**
     * Updates the system cache so that the current instance is no longer available for activation redirection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstance.unregister
     */
    static Unregister() {
        if (!AppInstance.HasProp("__IAppInstanceStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppInstance")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInstanceStatics.IID)
            AppInstance.__IAppInstanceStatics := IAppInstanceStatics(factoryPtr)
        }

        return AppInstance.__IAppInstanceStatics.Unregister()
    }

    /**
     * Gets the registered instances of the current app.
     * @remarks
     * To register an instance, see [FindOrRegisterInstanceForKey](appinstance_findorregisterinstanceforkey_1124409949.md).
     * @returns {IVector<AppInstance>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstance.getinstances
     */
    static GetInstances() {
        if (!AppInstance.HasProp("__IAppInstanceStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppInstance")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInstanceStatics.IID)
            AppInstance.__IAppInstanceStatics := IAppInstanceStatics(factoryPtr)
        }

        return AppInstance.__IAppInstanceStatics.GetInstances()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The key for the current instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstance.key
     * @type {HSTRING} 
     */
    Key {
        get => this.get_Key()
    }

    /**
     * Whether the current instance of the app is the registered instance of the app for the specific key that this instance has defined.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstance.iscurrentinstance
     * @type {Boolean} 
     */
    IsCurrentInstance {
        get => this.get_IsCurrentInstance()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Key() {
        if (!this.HasProp("__IAppInstance")) {
            if ((queryResult := this.QueryInterface(IAppInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstance := IAppInstance(outPtr)
        }

        return this.__IAppInstance.get_Key()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCurrentInstance() {
        if (!this.HasProp("__IAppInstance")) {
            if ((queryResult := this.QueryInterface(IAppInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstance := IAppInstance(outPtr)
        }

        return this.__IAppInstance.get_IsCurrentInstance()
    }

    /**
     * Redirects activation of the current app instance to the specified instance.
     * @remarks
     * Redirection is a terminal operation.
     * After redirecting, the app can call only [CoreApplication.Exit](../windows.applicationmodel.core/coreapplication_exit_1158854104.md). 
     * After the redirection, the app is closed. 
     * 
     * An app indicates whether it supports multiple instances in its manifest.
     * The splash screen is not shown until the app decides whether to redirect during main. 
     * If the app fails to decide within a time-out period, it is closed.
     * 
     * There is a potential race condition if an app identifies an instance for redirection, but that instance dies before it can be activated. 
     * In this case, this activation fails.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstance.redirectactivationto
     */
    RedirectActivationTo() {
        if (!this.HasProp("__IAppInstance")) {
            if ((queryResult := this.QueryInterface(IAppInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstance := IAppInstance(outPtr)
        }

        return this.__IAppInstance.RedirectActivationTo()
    }

;@endregion Instance Methods
}
