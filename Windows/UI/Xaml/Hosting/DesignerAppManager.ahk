#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDesignerAppManager.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IDesignerAppManagerFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\DesignerAppManager.ahk
#Include .\DesignerAppExitedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Manages an application in a XAML design surface that runs in a regular UWP context, compared to the legacy designer which uses the [XamlUIPresenter](/uwp/api/Windows.UI.Xaml.Hosting.XamlUIPresenter) and runs in a Win32 process. The process is required to specify the NoUIEntryPoints-DesignModeV2 [DisplayName](/uwp/schemas/appxpackage/uapmanifestschema/element-displayname) property in the .APPX in order to be activated successfully in this mode. The launched application will not show up in the TaskBar or TaskView switcher.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappmanager
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class DesignerAppManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDesignerAppManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDesignerAppManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the DesignerAppManager class.
     * @param {HSTRING} appUserModelId The identifier for the app user model.
     * @returns {DesignerAppManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappmanager.#ctor
     */
    static Create(appUserModelId) {
        if (!DesignerAppManager.HasProp("__IDesignerAppManagerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.DesignerAppManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDesignerAppManagerFactory.IID)
            DesignerAppManager.__IDesignerAppManagerFactory := IDesignerAppManagerFactory(factoryPtr)
        }

        return DesignerAppManager.__IDesignerAppManagerFactory.Create(appUserModelId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the identifier for the app user model.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappmanager.appusermodelid
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * Occurs when the app in the designer has exited.
     * @type {TypedEventHandler<DesignerAppManager, DesignerAppExitedEventArgs>}
    */
    OnDesignerAppExited {
        get {
            if(!this.HasProp("__OnDesignerAppExited")){
                this.__OnDesignerAppExited := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3772ce98-9ba0-504b-8a0d-36b7f816a1c2}"),
                    DesignerAppManager,
                    DesignerAppExitedEventArgs
                )
                this.__OnDesignerAppExitedToken := this.add_DesignerAppExited(this.__OnDesignerAppExited.iface)
            }
            return this.__OnDesignerAppExited
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDesignerAppExitedToken")) {
            this.remove_DesignerAppExited(this.__OnDesignerAppExitedToken)
            this.__OnDesignerAppExited.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        if (!this.HasProp("__IDesignerAppManager")) {
            if ((queryResult := this.QueryInterface(IDesignerAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppManager := IDesignerAppManager(outPtr)
        }

        return this.__IDesignerAppManager.get_AppUserModelId()
    }

    /**
     * 
     * @param {TypedEventHandler<DesignerAppManager, DesignerAppExitedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DesignerAppExited(handler) {
        if (!this.HasProp("__IDesignerAppManager")) {
            if ((queryResult := this.QueryInterface(IDesignerAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppManager := IDesignerAppManager(outPtr)
        }

        return this.__IDesignerAppManager.add_DesignerAppExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DesignerAppExited(token) {
        if (!this.HasProp("__IDesignerAppManager")) {
            if ((queryResult := this.QueryInterface(IDesignerAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppManager := IDesignerAppManager(outPtr)
        }

        return this.__IDesignerAppManager.remove_DesignerAppExited(token)
    }

    /**
     * Creates a new DesignerAppView.
     * @param {Integer} initialViewState The initial state of the view.
     * @param {SIZE} initialViewSize The initial size of the view.
     * @returns {IAsyncOperation<DesignerAppView>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappmanager.createnewviewasync
     */
    CreateNewViewAsync(initialViewState, initialViewSize) {
        if (!this.HasProp("__IDesignerAppManager")) {
            if ((queryResult := this.QueryInterface(IDesignerAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppManager := IDesignerAppManager(outPtr)
        }

        return this.__IDesignerAppManager.CreateNewViewAsync(initialViewState, initialViewSize)
    }

    /**
     * Loads the specified object into the app.
     * @param {HSTRING} dllName The name of the DLL.
     * @param {Guid} classId The identifier for the class.
     * @param {HSTRING} initializationData Data to initialize the object.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappmanager.loadobjectintoappasync
     */
    LoadObjectIntoAppAsync(dllName, classId, initializationData) {
        if (!this.HasProp("__IDesignerAppManager")) {
            if ((queryResult := this.QueryInterface(IDesignerAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppManager := IDesignerAppManager(outPtr)
        }

        return this.__IDesignerAppManager.LoadObjectIntoAppAsync(dllName, classId, initializationData)
    }

    /**
     * Closes the app manager. This will close the process activated by the DesignerAppManager and wait for the process to terminate. It's possible that this method could block for an indefinite amount of time if the process is hung. The DesignerAppExited event **won't** be fired when manually closed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappmanager.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
