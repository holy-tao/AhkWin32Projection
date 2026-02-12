#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IFileActivatedEventArgsWithNeighboringFiles.ahk
#Include .\IFileActivatedEventArgsWithCallerPackageFamilyName.ahk
#Include .\IApplicationViewActivatedEventArgs.ahk
#Include .\IViewSwitcherProvider.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is activated because it is the app associated with a file.
  * 
  * > **JavaScript**
  * > This type appears as [WebUIFileActivatedEventArgs](../windows.ui.webui/webuifileactivatedeventargs.md).
 * @remarks
 * This object is accessed when you implement an event handler to respond to [Activated](../windows.applicationmodel.core/coreapplicationview_activated.md) events when [ActivationKind](activationkind.md) is **File**.
 * 
 * UWP app using C++, C#, or Visual Basic typically implement activation points by overriding methods of the [Application](../windows.ui.xaml/application.md) object. The default template app.xaml code-behind files always include an override for [OnLaunched](../windows.ui.xaml/application_onlaunched_859642554.md), but defining overrides for other activation points such as [OnFileActivated](../windows.ui.xaml/application_onfileactivated_2046716329.md) is up to your app code.
 * 
 * All [Application](../windows.ui.xaml/application.md) overrides involved in an activation scenario should call [Window.Activate](../windows.ui.xaml/window_activate_1797342875.md) in their implementations.
 * 
 * Note that when your app is activated for the file contract you must access the data using the [StorageFile](../windows.storage/storagefile.md) objects passed to your app through the [Files](fileactivatedeventargs_files.md) property. You should not attempt to access the path of the file since your app may not have permission to the file’s location.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class FileActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the files for which the app was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.files
     * @type {IVectorView<IStorageItem>} 
     */
    Files {
        get => this.get_Files()
    }

    /**
     * Gets the action associated with the activated file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.verb
     * @type {HSTRING} 
     */
    Verb {
        get => this.get_Verb()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the neighboring files of the files for which the app was activated.
     * @remarks
     * Apps that activate to handle file associations get an object that represents the invoked file only. This can be a problem for media gallery apps in which users expect to navigate to neighboring files. Use the NeighboringFilesQuery property to get the collection of the files in the surrounding *view*, which is the collection that the invoked file was selected from.
     * 
     * Your apps need to declare a library capability to get items of the corresponding type. To get pictures in the NeighboringFilesQuery, you need the Pictures library capability, and to get music files, you need the Music library capability.
     * 
     * The NeighboringFilesQuery property is available only when a single file is invoked. If the size of the [Files](fileactivatedeventargs_files.md) collection is more than 1, the value of NeighboringFilesQuery is **null**. Also, the query is not always available for all invocations, so you can use it only if present.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.neighboringfilesquery
     * @type {StorageFileQueryResult} 
     */
    NeighboringFilesQuery {
        get => this.get_NeighboringFilesQuery()
    }

    /**
     * The package family name of the app that launched your app.
     * @remarks
     * If the caller is an unpackaged app (such as an unpackaged desktop app), *CallerPackageFamilyName* will be empty, that is `""`.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.callerpackagefamilyname
     * @type {HSTRING} 
     */
    CallerPackageFamilyName {
        get => this.get_CallerPackageFamilyName()
    }

    /**
     * Gets the identifier for the currently shown app view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.currentlyshownapplicationviewid
     * @type {Integer} 
     */
    CurrentlyShownApplicationViewId {
        get => this.get_CurrentlyShownApplicationViewId()
    }

    /**
     * Provides the object that allows you to set the view for the application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.viewswitcher
     * @type {ActivationViewSwitcher} 
     */
    ViewSwitcher {
        get => this.get_ViewSwitcher()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<IStorageItem>} 
     */
    get_Files() {
        if (!this.HasProp("__IFileActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IFileActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileActivatedEventArgs := IFileActivatedEventArgs(outPtr)
        }

        return this.__IFileActivatedEventArgs.get_Files()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Verb() {
        if (!this.HasProp("__IFileActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IFileActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileActivatedEventArgs := IFileActivatedEventArgs(outPtr)
        }

        return this.__IFileActivatedEventArgs.get_Verb()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreviousExecutionState() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_PreviousExecutionState()
    }

    /**
     * 
     * @returns {SplashScreen} 
     */
    get_SplashScreen() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_SplashScreen()
    }

    /**
     * 
     * @returns {StorageFileQueryResult} 
     */
    get_NeighboringFilesQuery() {
        if (!this.HasProp("__IFileActivatedEventArgsWithNeighboringFiles")) {
            if ((queryResult := this.QueryInterface(IFileActivatedEventArgsWithNeighboringFiles.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileActivatedEventArgsWithNeighboringFiles := IFileActivatedEventArgsWithNeighboringFiles(outPtr)
        }

        return this.__IFileActivatedEventArgsWithNeighboringFiles.get_NeighboringFilesQuery()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallerPackageFamilyName() {
        if (!this.HasProp("__IFileActivatedEventArgsWithCallerPackageFamilyName")) {
            if ((queryResult := this.QueryInterface(IFileActivatedEventArgsWithCallerPackageFamilyName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileActivatedEventArgsWithCallerPackageFamilyName := IFileActivatedEventArgsWithCallerPackageFamilyName(outPtr)
        }

        return this.__IFileActivatedEventArgsWithCallerPackageFamilyName.get_CallerPackageFamilyName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentlyShownApplicationViewId() {
        if (!this.HasProp("__IApplicationViewActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IApplicationViewActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewActivatedEventArgs := IApplicationViewActivatedEventArgs(outPtr)
        }

        return this.__IApplicationViewActivatedEventArgs.get_CurrentlyShownApplicationViewId()
    }

    /**
     * 
     * @returns {ActivationViewSwitcher} 
     */
    get_ViewSwitcher() {
        if (!this.HasProp("__IViewSwitcherProvider")) {
            if ((queryResult := this.QueryInterface(IViewSwitcherProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewSwitcherProvider := IViewSwitcherProvider(outPtr)
        }

        return this.__IViewSwitcherProvider.get_ViewSwitcher()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IActivatedEventArgsWithUser")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgsWithUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgsWithUser := IActivatedEventArgsWithUser(outPtr)
        }

        return this.__IActivatedEventArgsWithUser.get_User()
    }

;@endregion Instance Methods
}
