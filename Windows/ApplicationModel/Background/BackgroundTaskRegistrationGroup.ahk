#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTaskRegistrationGroup.ahk
#Include .\IBackgroundTaskRegistrationGroupFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\BackgroundTaskRegistrationGroup.ahk
#Include ..\Activation\BackgroundActivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides grouping semantics so that background task registration can be maintained separately.
 * @remarks
 * Developers are encouraged to unregister, and then register, all background tasks used by the application when the app launches. However, in addition to unregistering the app's background tasks, this can also unregister background tasks registered by frameworks used by the app.
 * 
 * Grouped background task registration provides roughly the equivalent of a namespace for background tasks. You can register/unregister background tasks that belong to a group that you define without disturbing the registration of other background tasks on the device.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistrationgroup
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskRegistrationGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTaskRegistrationGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTaskRegistrationGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a **BackgroundTaskRegistrationGroup** with the specified group ID.
     * @remarks
     * To reduce collisions with other group identifiers, consider including your domain name in the group identifier. For example: `"com.contoso.appname.tasks"`. Or use the string form of a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid).
     * @param {HSTRING} id The group ID.
     * @returns {BackgroundTaskRegistrationGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistrationgroup.#ctor
     */
    static Create(id) {
        if (!BackgroundTaskRegistrationGroup.HasProp("__IBackgroundTaskRegistrationGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundTaskRegistrationGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTaskRegistrationGroupFactory.IID)
            BackgroundTaskRegistrationGroup.__IBackgroundTaskRegistrationGroupFactory := IBackgroundTaskRegistrationGroupFactory(factoryPtr)
        }

        return BackgroundTaskRegistrationGroup.__IBackgroundTaskRegistrationGroupFactory.Create(id)
    }

    /**
     * Creates a **BackgroundTaskRegistrationGroup** with the specified group ID and
     * @remarks
     * To reduce collisions with other group identifiers, consider including your domain name in the group ID. For example: `"com.contoso.appname.tasks"`. Or use the string form of a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid).
     * 
     * The friendly name can be useful for debugging purposes if your group IDs are difficult to distinguish.
     * @param {HSTRING} id The group ID.
     * @param {HSTRING} name The friendly name for this group.
     * @returns {BackgroundTaskRegistrationGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistrationgroup.#ctor
     */
    static CreateWithName(id, name) {
        if (!BackgroundTaskRegistrationGroup.HasProp("__IBackgroundTaskRegistrationGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundTaskRegistrationGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTaskRegistrationGroupFactory.IID)
            BackgroundTaskRegistrationGroup.__IBackgroundTaskRegistrationGroupFactory := IBackgroundTaskRegistrationGroupFactory(factoryPtr)
        }

        return BackgroundTaskRegistrationGroup.__IBackgroundTaskRegistrationGroupFactory.CreateWithName(id, name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the group ID.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistrationgroup.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the friendly name of the group.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistrationgroup.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets all of the background tasks that belong to the group.
     * @remarks
     * `Null` is returned if no tasks belong to the group.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistrationgroup.alltasks
     * @type {IMapView<Guid, BackgroundTaskRegistration>} 
     */
    AllTasks {
        get => this.get_AllTasks()
    }

    /**
     * This event is fired when a background task that belongs to a group starts.
     * @remarks
     * Background triggers associated with a group fire this event instead of having a task entry point. For single-process background tasks that don't define an entry point in their background task registration, this event is the entry point. Instead of calling the application's [OnBackgroundActivated](../windows.ui.xaml/application_onbackgroundactivated_431338129.md) method, the event attached to the group is called.
     * @type {TypedEventHandler<BackgroundTaskRegistrationGroup, BackgroundActivatedEventArgs>}
    */
    OnBackgroundActivated {
        get {
            if(!this.HasProp("__OnBackgroundActivated")){
                this.__OnBackgroundActivated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d4f89768-688f-59ec-bf24-c2af6a310fa4}"),
                    BackgroundTaskRegistrationGroup,
                    BackgroundActivatedEventArgs
                )
                this.__OnBackgroundActivatedToken := this.add_BackgroundActivated(this.__OnBackgroundActivated.iface)
            }
            return this.__OnBackgroundActivated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBackgroundActivatedToken")) {
            this.remove_BackgroundActivated(this.__OnBackgroundActivatedToken)
            this.__OnBackgroundActivated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IBackgroundTaskRegistrationGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistrationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistrationGroup := IBackgroundTaskRegistrationGroup(outPtr)
        }

        return this.__IBackgroundTaskRegistrationGroup.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IBackgroundTaskRegistrationGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistrationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistrationGroup := IBackgroundTaskRegistrationGroup(outPtr)
        }

        return this.__IBackgroundTaskRegistrationGroup.get_Name()
    }

    /**
     * 
     * @param {TypedEventHandler<BackgroundTaskRegistrationGroup, BackgroundActivatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BackgroundActivated(handler) {
        if (!this.HasProp("__IBackgroundTaskRegistrationGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistrationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistrationGroup := IBackgroundTaskRegistrationGroup(outPtr)
        }

        return this.__IBackgroundTaskRegistrationGroup.add_BackgroundActivated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BackgroundActivated(token) {
        if (!this.HasProp("__IBackgroundTaskRegistrationGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistrationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistrationGroup := IBackgroundTaskRegistrationGroup(outPtr)
        }

        return this.__IBackgroundTaskRegistrationGroup.remove_BackgroundActivated(token)
    }

    /**
     * 
     * @returns {IMapView<Guid, BackgroundTaskRegistration>} 
     */
    get_AllTasks() {
        if (!this.HasProp("__IBackgroundTaskRegistrationGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistrationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistrationGroup := IBackgroundTaskRegistrationGroup(outPtr)
        }

        return this.__IBackgroundTaskRegistrationGroup.get_AllTasks()
    }

;@endregion Instance Methods
}
