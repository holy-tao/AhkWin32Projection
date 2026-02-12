#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\Activation\IFileActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IApplicationViewActivatedEventArgs.ahk
#Include .\IActivatedEventArgsDeferral.ahk
#Include ..\..\ApplicationModel\Activation\IFileActivatedEventArgsWithNeighboringFiles.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is activated because it is the app associated with a file.
 * @remarks
 * This object is accessed when you implement an event handler for the [WinJS.Application.Onactivated](/previous-versions/windows/apps/br212679(v=win.10)) or the [Windows.UI.WebUI.WebUIApplication.activated](webuiapplication_activated.md) events when [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **file**. Note that when your app is activated for the file contract you must access the data using the [StorageFile](../windows.storage/storagefile.md) objects passed to your app through the Files property. You should not attempt to access the path of the file since your app may not have permission to the file’s location.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUIFileActivatedEventArgs extends IInspectable {
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs.files
     * @type {IVectorView<IStorageItem>} 
     */
    Files {
        get => this.get_Files()
    }

    /**
     * Gets the action associated with the activated file.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs.verb
     * @type {HSTRING} 
     */
    Verb {
        get => this.get_Verb()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the identifier for the currently shown app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs.currentlyshownapplicationviewid
     * @type {Integer} 
     */
    CurrentlyShownApplicationViewId {
        get => this.get_CurrentlyShownApplicationViewId()
    }

    /**
     * Gets the app activation operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs.activatedoperation
     * @type {ActivatedOperation} 
     */
    ActivatedOperation {
        get => this.get_ActivatedOperation()
    }

    /**
     * Gets the neighboring files of the files for which the app was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs.neighboringfilesquery
     * @type {StorageFileQueryResult} 
     */
    NeighboringFilesQuery {
        get => this.get_NeighboringFilesQuery()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileactivatedeventargs.user
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
     * @returns {ActivatedOperation} 
     */
    get_ActivatedOperation() {
        if (!this.HasProp("__IActivatedEventArgsDeferral")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgsDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgsDeferral := IActivatedEventArgsDeferral(outPtr)
        }

        return this.__IActivatedEventArgsDeferral.get_ActivatedOperation()
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
