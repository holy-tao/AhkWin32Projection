#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextServicesManager.ahk
#Include .\ICoreTextServicesManagerStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreTextServicesManager.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * The entry point to all services provided by the Windows core text APIs and the text input server. This object is associated with an application's UI thread (the thread that [CoreWindow](../windows.ui.core/corewindow.md) runs on).
 * @remarks
 * To obtain an object of this type, call [CoreTextServicesManager.GetForCurrentView](coretextservicesmanager_getforcurrentview_1363600702.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextservicesmanager
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextServicesManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextServicesManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextServicesManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the [CoreTextServicesManager](coretextservicesmanager.md) object for the currently active view.
     * @returns {CoreTextServicesManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextservicesmanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!CoreTextServicesManager.HasProp("__ICoreTextServicesManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.Core.CoreTextServicesManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreTextServicesManagerStatics.IID)
            CoreTextServicesManager.__ICoreTextServicesManagerStatics := ICoreTextServicesManagerStatics(factoryPtr)
        }

        return CoreTextServicesManager.__ICoreTextServicesManagerStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a [Language](../windows.globalization/language.md) object representing the current input language.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextservicesmanager.inputlanguage
     * @type {Language} 
     */
    InputLanguage {
        get => this.get_InputLanguage()
    }

    /**
     * Occurs when the current input language has changed.
     * @type {TypedEventHandler<CoreTextServicesManager, IInspectable>}
    */
    OnInputLanguageChanged {
        get {
            if(!this.HasProp("__OnInputLanguageChanged")){
                this.__OnInputLanguageChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{112fb01d-260a-51c6-9198-5db3e6e9ef3d}"),
                    CoreTextServicesManager,
                    IInspectable
                )
                this.__OnInputLanguageChangedToken := this.add_InputLanguageChanged(this.__OnInputLanguageChanged.iface)
            }
            return this.__OnInputLanguageChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInputLanguageChangedToken")) {
            this.remove_InputLanguageChanged(this.__OnInputLanguageChangedToken)
            this.__OnInputLanguageChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Language} 
     */
    get_InputLanguage() {
        if (!this.HasProp("__ICoreTextServicesManager")) {
            if ((queryResult := this.QueryInterface(ICoreTextServicesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextServicesManager := ICoreTextServicesManager(outPtr)
        }

        return this.__ICoreTextServicesManager.get_InputLanguage()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextServicesManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InputLanguageChanged(handler) {
        if (!this.HasProp("__ICoreTextServicesManager")) {
            if ((queryResult := this.QueryInterface(ICoreTextServicesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextServicesManager := ICoreTextServicesManager(outPtr)
        }

        return this.__ICoreTextServicesManager.add_InputLanguageChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_InputLanguageChanged(cookie) {
        if (!this.HasProp("__ICoreTextServicesManager")) {
            if ((queryResult := this.QueryInterface(ICoreTextServicesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextServicesManager := ICoreTextServicesManager(outPtr)
        }

        return this.__ICoreTextServicesManager.remove_InputLanguageChanged(cookie)
    }

    /**
     * Creates a context object used by a text input control to communicate with the text input server. Each text input control must create its own context object.
     * @returns {CoreTextEditContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextservicesmanager.createeditcontext
     */
    CreateEditContext() {
        if (!this.HasProp("__ICoreTextServicesManager")) {
            if ((queryResult := this.QueryInterface(ICoreTextServicesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextServicesManager := ICoreTextServicesManager(outPtr)
        }

        return this.__ICoreTextServicesManager.CreateEditContext()
    }

;@endregion Instance Methods
}
