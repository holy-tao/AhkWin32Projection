#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowJobActivatedEventArgs.ahk
#Include ..\..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\..\ApplicationModel\Activation\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables a print support workflow UI extension app to handle the activation parameters for the app.
 * @remarks
 * To create a print support workflow UI extension, your app must declare a [uap4:Extension](/uwp/schemas/appxpackage/uapmanifestschema/element-uap4-extension) element with the category **windows.printSupportJobUI** in its package manifest. When the app is activated, the `OnActivated` method receives a [PrintWorkflowJobActivatedEventArgs](printworkflowjobactivatedeventargs.md) object that provides access to information about the print support workflow UI session. The [Session](printworkflowjobactivatedeventargs_session.md) property of that object returns a [PrintWorkflowJobUISession](printworkflowjobuisession.md) object.
 * 
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobactivatedeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowJobActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowJobActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowJobActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current session of the print support workflow UI.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobactivatedeventargs.session
     * @type {PrintWorkflowJobUISession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Gets the reason that this app was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before this activation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the user that the app was activated for.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobactivatedeventargs.user
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
     * @returns {PrintWorkflowJobUISession} 
     */
    get_Session() {
        if (!this.HasProp("__IPrintWorkflowJobActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobActivatedEventArgs := IPrintWorkflowJobActivatedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobActivatedEventArgs.get_Session()
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
