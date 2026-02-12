#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppDiagnosticInfo.ahk
#Include .\IAppDiagnosticInfo2.ahk
#Include .\IAppDiagnosticInfo3.ahk
#Include .\IAppDiagnosticInfoStatics2.ahk
#Include .\IAppDiagnosticInfoStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Contains APIs for getting a basic set of diagnostic information for all running apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppDiagnosticInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppDiagnosticInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppDiagnosticInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an [AppDiagnosticInfoWatcher](appdiagnosticinfowatcher.md) that monitors information about the execution state of an app, and provides notifications when its state changes.
     * @returns {AppDiagnosticInfoWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.createwatcher
     */
    static CreateWatcher() {
        if (!AppDiagnosticInfo.HasProp("__IAppDiagnosticInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.AppDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppDiagnosticInfoStatics2.IID)
            AppDiagnosticInfo.__IAppDiagnosticInfoStatics2 := IAppDiagnosticInfoStatics2(factoryPtr)
        }

        return AppDiagnosticInfo.__IAppDiagnosticInfoStatics2.CreateWatcher()
    }

    /**
     * Asynchronously requests access to diagnostic information.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!AppDiagnosticInfo.HasProp("__IAppDiagnosticInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.AppDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppDiagnosticInfoStatics2.IID)
            AppDiagnosticInfo.__IAppDiagnosticInfoStatics2 := IAppDiagnosticInfoStatics2(factoryPtr)
        }

        return AppDiagnosticInfo.__IAppDiagnosticInfoStatics2.RequestAccessAsync()
    }

    /**
     * Gets a collection of [AppDiagnosticInfo](appdiagnosticinfo.md) objects for all instances of the specified app package.
     * @remarks
     * If you call this method for the current app package, there is no capability check. Calling the method for any other package requires user consent, which defaults to denied. Users can provide consent in Windows Settings. An app can request consent programmatically by calling [AppDiagnosticInfo.RequestAccessAsync](appdiagnosticinfo_requestaccessasync_380675631.md).
     * @param {HSTRING} packageFamilyName The identifier of the app package for which to get the [AppDiagnosticInfo](appdiagnosticinfo.md).
     * @returns {IAsyncOperation<IVector<AppDiagnosticInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.requestinfoforpackageasync
     */
    static RequestInfoForPackageAsync(packageFamilyName) {
        if (!AppDiagnosticInfo.HasProp("__IAppDiagnosticInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.AppDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppDiagnosticInfoStatics2.IID)
            AppDiagnosticInfo.__IAppDiagnosticInfoStatics2 := IAppDiagnosticInfoStatics2(factoryPtr)
        }

        return AppDiagnosticInfo.__IAppDiagnosticInfoStatics2.RequestInfoForPackageAsync(packageFamilyName)
    }

    /**
     * Gets a collection of [AppDiagnosticInfo](appdiagnosticinfo.md) objects for all instances of the specified app.
     * @remarks
     * Calling this method will result in a capability check and a user prompt to authorize this action.
     * @returns {IAsyncOperation<IVector<AppDiagnosticInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.requestinfoforappasync
     */
    static RequestInfoForAppAsync() {
        if (!AppDiagnosticInfo.HasProp("__IAppDiagnosticInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.AppDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppDiagnosticInfoStatics2.IID)
            AppDiagnosticInfo.__IAppDiagnosticInfoStatics2 := IAppDiagnosticInfoStatics2(factoryPtr)
        }

        return AppDiagnosticInfo.__IAppDiagnosticInfoStatics2.RequestInfoForAppAsync()
    }

    /**
     * Gets a collection of [AppDiagnosticInfo](appdiagnosticinfo.md) objects for all running instances of this app.
     * @remarks
     * When an app calls this method, it is calling about itself and there is no capability check.
     * @param {HSTRING} appUserModelId 
     * @returns {IAsyncOperation<IVector<AppDiagnosticInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.requestinfoforappasync
     */
    static RequestInfoForAppUserModelId(appUserModelId) {
        if (!AppDiagnosticInfo.HasProp("__IAppDiagnosticInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.AppDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppDiagnosticInfoStatics2.IID)
            AppDiagnosticInfo.__IAppDiagnosticInfoStatics2 := IAppDiagnosticInfoStatics2(factoryPtr)
        }

        return AppDiagnosticInfo.__IAppDiagnosticInfoStatics2.RequestInfoForAppUserModelId(appUserModelId)
    }

    /**
     * Gets a collection of [AppDiagnosticInfo](appdiagnosticinfo.md) objects for all running apps that have a package family name.
     * @remarks
     * This method must be called from a UI thread the first time it is used by an application.
     * @returns {IAsyncOperation<IVector<AppDiagnosticInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.requestinfoasync
     */
    static RequestInfoAsync() {
        if (!AppDiagnosticInfo.HasProp("__IAppDiagnosticInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.AppDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppDiagnosticInfoStatics.IID)
            AppDiagnosticInfo.__IAppDiagnosticInfoStatics := IAppDiagnosticInfoStatics(factoryPtr)
        }

        return AppDiagnosticInfo.__IAppDiagnosticInfoStatics.RequestInfoAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Provides info about the app's package family name and package-relative app name.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.appinfo
     * @type {AppInfo} 
     */
    AppInfo {
        get => this.get_AppInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_AppInfo() {
        if (!this.HasProp("__IAppDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfo := IAppDiagnosticInfo(outPtr)
        }

        return this.__IAppDiagnosticInfo.get_AppInfo()
    }

    /**
     * Gets diagnostic information such as memory usage over time, energy use over time, and so on, for each resource group in the app.
     * @returns {IVector<AppResourceGroupInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.getresourcegroups
     */
    GetResourceGroups() {
        if (!this.HasProp("__IAppDiagnosticInfo2")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfo2 := IAppDiagnosticInfo2(outPtr)
        }

        return this.__IAppDiagnosticInfo2.GetResourceGroups()
    }

    /**
     * Creates a **ResourceGroupInfoWatcher** that monitors the execution state of an app or task, and provides notifications when its state changes.
     * @returns {AppResourceGroupInfoWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.createresourcegroupwatcher
     */
    CreateResourceGroupWatcher() {
        if (!this.HasProp("__IAppDiagnosticInfo2")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfo2 := IAppDiagnosticInfo2(outPtr)
        }

        return this.__IAppDiagnosticInfo2.CreateResourceGroupWatcher()
    }

    /**
     * Launches the app associated with the diagnostic info.
     * @remarks
     * The target app will be launched as if the user had tapped its entry in the app-list or its primary tile in the Start menu. The system will invoke the app’s [OnLaunched](/uwp/api/windows.ui.xaml.application.onlaunched#Windows_UI_Xaml_Application_OnLaunched_Windows_ApplicationModel_Activation_LaunchActivatedEventArgs_) callback, passing in [ActivationKind.Launch](/uwp/api/windows.applicationmodel.activation.activationkind) and an [IActivatedEventArgs](/uwp/api/windows.applicationmodel.activation.iactivatedeventargs) of type [LaunchActivatedEventArgs](/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs).
     * @returns {IAsyncOperation<AppActivationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfo.launchasync
     */
    LaunchAsync() {
        if (!this.HasProp("__IAppDiagnosticInfo3")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfo3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfo3 := IAppDiagnosticInfo3(outPtr)
        }

        return this.__IAppDiagnosticInfo3.LaunchAsync()
    }

;@endregion Instance Methods
}
