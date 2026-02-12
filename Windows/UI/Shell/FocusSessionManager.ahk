#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFocusSessionManager.ahk
#Include .\IFocusSessionManagerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\FocusSessionManager.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides APIs that allow apps to manage the state of the Focus Session feature of Windows.
 * @remarks
 * Get an instance of **FocusSessionManager** by calling [GetDefault](focussessionmanager_getdefault_846721868.md).
 * 
 * **FocusSessionManager** provides a programmatic way to read and manipulate the state of Focus, which is a feature intended to reduce distractions in Windows.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussessionmanager
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class FocusSessionManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFocusSessionManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFocusSessionManager.IID

    /**
     * Gets a value indicating whether focus session APIs are supported on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussessionmanager.issupported
     * @type {Boolean} 
     */
    static IsSupported {
        get => FocusSessionManager.get_IsSupported()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default instance of the [FocusSessionManager](focussessionmanager.md) class.
     * @returns {FocusSessionManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussessionmanager.getdefault
     */
    static GetDefault() {
        if (!FocusSessionManager.HasProp("__IFocusSessionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.FocusSessionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusSessionManagerStatics.IID)
            FocusSessionManager.__IFocusSessionManagerStatics := IFocusSessionManagerStatics(factoryPtr)
        }

        return FocusSessionManager.__IFocusSessionManagerStatics.GetDefault()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsSupported() {
        if (!FocusSessionManager.HasProp("__IFocusSessionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.FocusSessionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusSessionManagerStatics.IID)
            FocusSessionManager.__IFocusSessionManagerStatics := IFocusSessionManagerStatics(factoryPtr)
        }

        return FocusSessionManager.__IFocusSessionManagerStatics.get_IsSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating if a focus session is active on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussessionmanager.isfocusactive
     * @type {Boolean} 
     */
    IsFocusActive {
        get => this.get_IsFocusActive()
    }

    /**
     * Raised when the focus session status of the device changes.
     * @type {TypedEventHandler<FocusSessionManager, IInspectable>}
    */
    OnIsFocusActiveChanged {
        get {
            if(!this.HasProp("__OnIsFocusActiveChanged")){
                this.__OnIsFocusActiveChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{88ebdc98-220d-59cd-9cef-a34a27c36f98}"),
                    FocusSessionManager,
                    IInspectable
                )
                this.__OnIsFocusActiveChangedToken := this.add_IsFocusActiveChanged(this.__OnIsFocusActiveChanged.iface)
            }
            return this.__OnIsFocusActiveChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsFocusActiveChangedToken")) {
            this.remove_IsFocusActiveChanged(this.__OnIsFocusActiveChangedToken)
            this.__OnIsFocusActiveChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFocusActive() {
        if (!this.HasProp("__IFocusSessionManager")) {
            if ((queryResult := this.QueryInterface(IFocusSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSessionManager := IFocusSessionManager(outPtr)
        }

        return this.__IFocusSessionManager.get_IsFocusActive()
    }

    /**
     * Gets a [FocusSession](focussession.md) object representing the focus session with the specified [Id](focussession_id.md).
     * @param {HSTRING} id The unique identifier for a focus session.
     * @returns {FocusSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussessionmanager.getsession
     */
    GetSession(id) {
        if (!this.HasProp("__IFocusSessionManager")) {
            if ((queryResult := this.QueryInterface(IFocusSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSessionManager := IFocusSessionManager(outPtr)
        }

        return this.__IFocusSessionManager.GetSession(id)
    }

    /**
     * Attempts to start a focus session that is active until explicitly cancelled.
     * 
     * > [!IMPORTANT]
     * > The **FocusSessionManager.TryStartFocusSession** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @returns {FocusSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussessionmanager.trystartfocussession
     */
    TryStartFocusSession() {
        if (!this.HasProp("__IFocusSessionManager")) {
            if ((queryResult := this.QueryInterface(IFocusSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSessionManager := IFocusSessionManager(outPtr)
        }

        return this.__IFocusSessionManager.TryStartFocusSession()
    }

    /**
     * Attempts to start a focus session with no fixed end time.
     * 
     * > [!IMPORTANT]
     * > The **FocusSessionManager.TryStartFocusSession** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @param {DateTime} endTime 
     * @returns {FocusSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussessionmanager.trystartfocussession
     */
    TryStartFocusSession2(endTime) {
        if (!this.HasProp("__IFocusSessionManager")) {
            if ((queryResult := this.QueryInterface(IFocusSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSessionManager := IFocusSessionManager(outPtr)
        }

        return this.__IFocusSessionManager.TryStartFocusSession2(endTime)
    }

    /**
     * Ends all currently active focus sessions and turns Focus off.
     * 
     * > [!IMPORTANT]
     * > The **FocusSessionManager.DeactivateFocus** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussessionmanager.deactivatefocus
     */
    DeactivateFocus() {
        if (!this.HasProp("__IFocusSessionManager")) {
            if ((queryResult := this.QueryInterface(IFocusSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSessionManager := IFocusSessionManager(outPtr)
        }

        return this.__IFocusSessionManager.DeactivateFocus()
    }

    /**
     * 
     * @param {TypedEventHandler<FocusSessionManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsFocusActiveChanged(handler) {
        if (!this.HasProp("__IFocusSessionManager")) {
            if ((queryResult := this.QueryInterface(IFocusSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSessionManager := IFocusSessionManager(outPtr)
        }

        return this.__IFocusSessionManager.add_IsFocusActiveChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsFocusActiveChanged(token) {
        if (!this.HasProp("__IFocusSessionManager")) {
            if ((queryResult := this.QueryInterface(IFocusSessionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSessionManager := IFocusSessionManager(outPtr)
        }

        return this.__IFocusSessionManager.remove_IsFocusActiveChanged(token)
    }

;@endregion Instance Methods
}
