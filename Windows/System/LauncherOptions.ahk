#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILauncherOptions2.ahk
#Include .\ILauncherOptions.ahk
#Include .\ILauncherOptions3.ahk
#Include .\ILauncherOptions4.ahk
#Include .\ILauncherViewOptions.ahk
#Include ..\..\Guid.ahk

/**
 * Specifies the options used to launch the default app for a file or URI.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * In some cases, when you call [Launcher](launcher.md) static methods to launch an app associated with a file type or URI protocol, you must specify exactly which app you want to be launched by passing a **LauncherOptions** parameter with the [TargetApplicationPackageFamilyName](launcheroptions_targetapplicationpackagefamilyname.md) property set to the package family name for the app package containing that app.
 * 
 * Two such cases are as follows:
 * 
 * 1. You want to launch an app with a URI and pass extra input data to the launched app, using [Launcher.LaunchUriAsync(Uri, LauncherOptions, ValueSet)](launcher_launchuriasync_569877360.md).
 * 1. You want to launch an app with a URI and wait for the app to send output data back to your app, using any overload of [Launcher.LaunchUriForResultsAsync](launcher_launchuriforresultsasync_148601521.md).
 * 
 * In these cases, both the calling app and launched app need to agree on how to interpret the extra data passed from one app to the other. The calling app cannot launch any app that happens to be the default for that URI protocol. In other cases, the **TargetApplicationPackageFamilyName** property is optional.
 * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class LauncherOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILauncherOptions2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILauncherOptions2.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The package family name of the target package that should be used to launch a file or URI. This property is optional in some cases. See **Remarks**.
     * @remarks
     * An application's PackageFamilyName can be obtained via the [PackageID class](/en-us/uwp/api/Windows.ApplicationModel.PackageId#Windows_ApplicationModel_PackageId_FamilyName)
     * 
     * A PackageFamilyName can vary depending on how an application has been published, but it will generally follow the form of `[package name]_[publisher_id]`. For example, an unpublished app has a family name similar to `c04742a8-1c87-41c1-b951-cc6e6f353400_g3nsfcgfwzqga`
     * 
     * In some cases, when you call [Launcher](launcher.md) static methods to launch an app associated with a file type or URI protocol, you must specify exactly which app you want to be launched by passing a [LauncherOptions](launcheroptions.md) parameter with the **TargetApplicationPackageFamilyName** property set to the package family name for the app package containing that app.
     * 
     * Two such cases are as follows:
     * 
     * 1. You want to launch an app with a URI and pass extra input data to the launched app, using [Launcher.LaunchUriAsync(Uri, LauncherOptions, ValueSet)](launcher_launchuriasync_569877360.md).
     * 1. You want to launch an app with a URI and wait for the app to send output data back to your app, using any overload of [Launcher.LaunchUriForResultsAsync](launcher_launchuriforresultsasync_148601521.md).
     * 
     * In these cases, both the calling app and launched app need to agree on how to interpret the extra data passed from one app to the other. The calling app cannot launch any app that happens to be the default for that URI protocol.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.targetapplicationpackagefamilyname
     * @type {HSTRING} 
     */
    TargetApplicationPackageFamilyName {
        get => this.get_TargetApplicationPackageFamilyName()
        set => this.put_TargetApplicationPackageFamilyName(value)
    }

    /**
     * Enables an app to access files that are related to the file used to activate the app.
     * @remarks
     * Access to files is carefully controlled to protect users from malicious apps. This property gives an application that is activated for a particular file access to other files of the same type. For example, if a photo app is activated for a picture, this property returns the other pictures in the same folder. However, only file types that are declared in the capabilities section of the manifest file will be accessible. For example, only if an app declares the **Pictures Library** capability in the app manifest will it be possible to access picture files when the app is launched with **kind:pictures**.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.neighboringfilesquery
     * @type {StorageFileQueryResult} 
     */
    NeighboringFilesQuery {
        get => this.get_NeighboringFilesQuery()
        set => this.put_NeighboringFilesQuery(value)
    }

    /**
     * Gets or sets a value that indicates whether the system should display a warning that the file or URI is potentially unsafe when starting the app associated with a file or URI.
     * @remarks
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.treatasuntrusted
     * @type {Boolean} 
     */
    TreatAsUntrusted {
        get => this.get_TreatAsUntrusted()
        set => this.put_TreatAsUntrusted(value)
    }

    /**
     * Gets or sets a value that indicates whether to display the **Open With** dialog whenever the association launching API is called.
     * @remarks
     * You should use the **Open With** dialog box when the user may want to select an app other than the default for a particular file. For example if your app allows the user to launch an image file, the default handler will likely be a viewer app. In some cases the user may want to edit the image instead of viewing it. Use the **Open With** option along with an alternative command in the AppBar or in a context menu to let the user bring up the **Open With** dialog and select the editor app in these types of scenarios.
     * 
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.displayapplicationpicker
     * @type {Boolean} 
     */
    DisplayApplicationPicker {
        get => this.get_DisplayApplicationPicker()
        set => this.put_DisplayApplicationPicker(value)
    }

    /**
     * Gets the user interface (UI) options when starting a default app.
     * @remarks
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.ui
     * @type {LauncherUIOptions} 
     */
    UI {
        get => this.get_UI()
    }

    /**
     * Gets or sets a value that represents the package family name of the app in the Store that the user should install if no app exists to handle the file type or URI.
     * @remarks
     * In some cases the user may not have an app installed to handle the file that you are launching. By default, Windows will handle these cases by providing the user with a link to search for an appropriate app on the store. Use **LauncherOptions.PreferredApplicationDisplayName** in conjunction with **LauncherOptions.preferredApplicationPackageFamilyName** to provide the user with an app in the Microsoft Store that they can acquire to handle the file. The display name that you use should correspond to the display name of the app in the Microsoft Store.
     * 
     * You must set both of these preferred application properties to recommend an app. Setting one without the other will result in a failure.
     * 
     * > [!NOTE]
     * > You cannot set the preferred application properties and the fallback URI at the same time, since only one fallback may be used. The Launcher API will fail if both fallbacks are set.
     * 
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.preferredapplicationpackagefamilyname
     * @type {HSTRING} 
     */
    PreferredApplicationPackageFamilyName {
        get => this.get_PreferredApplicationPackageFamilyName()
        set => this.put_PreferredApplicationPackageFamilyName(value)
    }

    /**
     * Gets or sets a value that represents the display name of the app in the store that the user should install if no app exists to handle the file type or URI.
     * @remarks
     * In some cases the user may not have an app installed to handle the file that you are launching. By default, Windows will handle these cases by providing the user with a link to search for an appropriate app on the store. Use **LauncherOptions.PreferredApplicationDisplayName** in conjunction with **LauncherOptions.preferredApplicationPackageFamilyName** to provide the user with an app in the Windows Store that they can acquire to handle the file. The display name that you use should correspond to the display name of the app in the Windows Store.
     * 
     * You must set both of these preferred application properties to recommend an app. Setting one without the other will result in a failure.
     * 
     * > [!NOTE]
     * > You cannot set the preferred application properties and the fallback URI at the same time, since only one fallback may be used. The Launcher API will fail if both fallbacks are set.
     * 
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.preferredapplicationdisplayname
     * @type {HSTRING} 
     */
    PreferredApplicationDisplayName {
        get => this.get_PreferredApplicationDisplayName()
        set => this.put_PreferredApplicationDisplayName(value)
    }

    /**
     * Gets or sets a value that represents a URI that the user should be taken to in the browser if no app exists to handle the file type or URI.
     * @remarks
     * You can only set the fallback URI property with http:// or https:// URI. If this property is set and there is no app installed to handle the file or URI being launched, the user's default browser is launched automatically and navigated to the specified URI. The user will not see an **Open With** dialog asking to choose an option in this case. You should only use the fallback URI when directing the user to the Microsoft Store is not appropriate, such as the case when the file or URI is only supported by a desktop app that is not listed on the Store. In all cases where there is an app on the Microsoft Store that supports the file or URI that you are launching, you should use the [PreferredApplicationPackageFamilyName](launcheroptions_preferredapplicationpackagefamilyname.md) and [PreferredApplicationDisplayName](launcheroptions_preferredapplicationdisplayname.md) to recommend that app to the user.
     * 
     * You cannot set the preferred application properties and the fallback URI at the same time, since only one fallback may be used. The Launcher API will fail if both fallbacks are set.
     * 
     * > **Windows 8.1**
     * > In Windows 8.1 only, this property also accepts Microsoft Store URIs. These URIs can be used as an alternative to the [PreferredApplicationPackageFamilyName](launcheroptions_preferredapplicationpackagefamilyname.md) and [PreferredApplicationDisplayName](launcheroptions_preferredapplicationdisplayname.md) properties to send the user to a specific app in the Store without popping an **Open With** dialog. This functionality is not supported on Windows Phone 8.1 or converged Windows 10 apps, and its use is not recommended.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.fallbackuri
     * @type {Uri} 
     */
    FallbackUri {
        get => this.get_FallbackUri()
        set => this.put_FallbackUri(value)
    }

    /**
     * Gets or sets the content type that is associated with a URI that represents a file on the network.
     * @remarks
     * ContentType may only be specified when launching a URI using [Launcher.LaunchUriAsync(Uri, LauncherOptions)](launcher_launchuriasync_68890748.md).
     * 
     * The **ContentType** property allows your app to specify a URI along with a content type. You can use this to associate a URI pointing to a resource on the network with a file type, instead of a URI scheme name. Windows will attempt to use the file type computed from the content type to select the app to launch. The default file handler is then passed the URI instead of a file path. So for example if you have an http:// URI pointing to a .docx file, clicking on it would normally open the browser and begin a file download. By using the **ContentType** property you can skip the intermediate step and have the default file handler launch immediately. The file handler can then directly access the file on the network using the path embedded in the URI.
     * 
     * If the handler is unable to work directly on the URI, a copy of the file will be downloaded on their behalf.
     * 
     * Because **ContentType** allows you to directly launch a file handler the same security checks that apply to file launching apply to URI launches with this option specified. See [Launch the default app for a file](/windows/uwp/launch-resume/launch-the-default-app-for-a-file) for more details on those security checks. 
     * 
     * > [!NOTE]
     * > This functionality only works if the default file handler supports being passed a URI to a file on the network. The default file handler must also be able to authenticate with the file's server. Because of these limitations you should only use the **ContentType** property if you have thoroughly tested the end to end scenario between your app and the app's that you expect to handle the files being launched
     * 
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
        set => this.put_ContentType(value)
    }

    /**
     * Indicates whether to ignore handlers that can handle http(s) schemes (such as browsers). Instead, launch will fall back to the default browser.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.ignoreappurihandlers
     * @type {Boolean} 
     */
    IgnoreAppUriHandlers {
        get => this.get_IgnoreAppUriHandlers()
        set => this.put_IgnoreAppUriHandlers(value)
    }

    /**
     * Gets or sets whether to limit the picker for the launcher to the current app and its associated URI handlers.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.limitpickertocurrentappandappurihandlers
     * @type {Boolean} 
     */
    LimitPickerToCurrentAppAndAppUriHandlers {
        get => this.get_LimitPickerToCurrentAppAndAppUriHandlers()
        set => this.put_LimitPickerToCurrentAppAndAppUriHandlers(value)
    }

    /**
     * Launch a target app and have the currently running source app remain on the screen by sharing the space equally with the target app or by taking up more or less space than the target app.
     * @remarks
     * Source apps that call [LaunchUriAsync](launcher_launchuriasync_53691900.md) or [LaunchFileAsync](launcher_launchfileasync_1480137410.md) can request that they remain on screen after a URI or file launch. By default, Windows will attempt to share all available space equally between the source app and the target app that handles the URI or file. Source apps can use the DesiredRemainingView property to indicate to the system that they prefer their app window to take up more or less of the available space. DesiredRemainingView can also be used to indicate that the source app does not need to remain on screen after the file or URI launch and can be completely replaced by the target app. This property only specifies the preferred window size of the calling app. It doesn't specify the behavior of other apps that may happen to also be on screen at the same time.
     * 
     * 
     * 
     * > [!NOTE]
     * > Windows takes into account multiple different factors when determining the source app's final window size, for example, the preference of the source app, the number of apps on screen, the screen orientation, and so on. By setting DesiredRemainingView, you aren't guaranteed a specific windowing behavior for the source app.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > This property is only implemented on Desktop devices.
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcheroptions.desiredremainingview
     * @type {Integer} 
     */
    DesiredRemainingView {
        get => this.get_DesiredRemainingView()
        set => this.put_DesiredRemainingView(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the launcher options object.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.LauncherOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetApplicationPackageFamilyName() {
        if (!this.HasProp("__ILauncherOptions2")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions2 := ILauncherOptions2(outPtr)
        }

        return this.__ILauncherOptions2.get_TargetApplicationPackageFamilyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetApplicationPackageFamilyName(value) {
        if (!this.HasProp("__ILauncherOptions2")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions2 := ILauncherOptions2(outPtr)
        }

        return this.__ILauncherOptions2.put_TargetApplicationPackageFamilyName(value)
    }

    /**
     * 
     * @returns {StorageFileQueryResult} 
     */
    get_NeighboringFilesQuery() {
        if (!this.HasProp("__ILauncherOptions2")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions2 := ILauncherOptions2(outPtr)
        }

        return this.__ILauncherOptions2.get_NeighboringFilesQuery()
    }

    /**
     * 
     * @param {StorageFileQueryResult} value 
     * @returns {HRESULT} 
     */
    put_NeighboringFilesQuery(value) {
        if (!this.HasProp("__ILauncherOptions2")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions2 := ILauncherOptions2(outPtr)
        }

        return this.__ILauncherOptions2.put_NeighboringFilesQuery(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TreatAsUntrusted() {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.get_TreatAsUntrusted()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TreatAsUntrusted(value) {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.put_TreatAsUntrusted(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisplayApplicationPicker() {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.get_DisplayApplicationPicker()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DisplayApplicationPicker(value) {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.put_DisplayApplicationPicker(value)
    }

    /**
     * 
     * @returns {LauncherUIOptions} 
     */
    get_UI() {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.get_UI()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PreferredApplicationPackageFamilyName() {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.get_PreferredApplicationPackageFamilyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PreferredApplicationPackageFamilyName(value) {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.put_PreferredApplicationPackageFamilyName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PreferredApplicationDisplayName() {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.get_PreferredApplicationDisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PreferredApplicationDisplayName(value) {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.put_PreferredApplicationDisplayName(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FallbackUri() {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.get_FallbackUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_FallbackUri(value) {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.put_FallbackUri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.get_ContentType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentType(value) {
        if (!this.HasProp("__ILauncherOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions := ILauncherOptions(outPtr)
        }

        return this.__ILauncherOptions.put_ContentType(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IgnoreAppUriHandlers() {
        if (!this.HasProp("__ILauncherOptions3")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions3 := ILauncherOptions3(outPtr)
        }

        return this.__ILauncherOptions3.get_IgnoreAppUriHandlers()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IgnoreAppUriHandlers(value) {
        if (!this.HasProp("__ILauncherOptions3")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions3 := ILauncherOptions3(outPtr)
        }

        return this.__ILauncherOptions3.put_IgnoreAppUriHandlers(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LimitPickerToCurrentAppAndAppUriHandlers() {
        if (!this.HasProp("__ILauncherOptions4")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions4 := ILauncherOptions4(outPtr)
        }

        return this.__ILauncherOptions4.get_LimitPickerToCurrentAppAndAppUriHandlers()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_LimitPickerToCurrentAppAndAppUriHandlers(value) {
        if (!this.HasProp("__ILauncherOptions4")) {
            if ((queryResult := this.QueryInterface(ILauncherOptions4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherOptions4 := ILauncherOptions4(outPtr)
        }

        return this.__ILauncherOptions4.put_LimitPickerToCurrentAppAndAppUriHandlers(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredRemainingView() {
        if (!this.HasProp("__ILauncherViewOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherViewOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherViewOptions := ILauncherViewOptions(outPtr)
        }

        return this.__ILauncherViewOptions.get_DesiredRemainingView()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredRemainingView(value) {
        if (!this.HasProp("__ILauncherViewOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherViewOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherViewOptions := ILauncherViewOptions(outPtr)
        }

        return this.__ILauncherViewOptions.put_DesiredRemainingView(value)
    }

;@endregion Instance Methods
}
