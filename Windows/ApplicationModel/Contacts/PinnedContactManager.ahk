#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPinnedContactManager.ahk
#Include .\IPinnedContactManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a service that source apps can call to pin and unpin contacts to and from the taskbar or **Start** menu.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class PinnedContactManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPinnedContactManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPinnedContactManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default instance of a [PinnedContactManager](pinnedcontactmanager.md).
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * @remarks
     * This method must be called from the main UI thread.
     * @returns {PinnedContactManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.getdefault
     */
    static GetDefault() {
        if (!PinnedContactManager.HasProp("__IPinnedContactManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.PinnedContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPinnedContactManagerStatics.IID)
            PinnedContactManager.__IPinnedContactManagerStatics := IPinnedContactManagerStatics(factoryPtr)
        }

        return PinnedContactManager.__IPinnedContactManagerStatics.GetDefault()
    }

    /**
     * Gets a [PinnedContactManager](pinnedcontactmanager.md) for the specified user.
     * @remarks
     * This method must be called from the main UI thread.
     * @param {User} user_ The user account to use to get the [PinnedContactManager](pinnedcontactmanager.md).
     * @returns {PinnedContactManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.getforuser
     */
    static GetForUser(user_) {
        if (!PinnedContactManager.HasProp("__IPinnedContactManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.PinnedContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPinnedContactManagerStatics.IID)
            PinnedContactManager.__IPinnedContactManagerStatics := IPinnedContactManagerStatics(factoryPtr)
        }

        return PinnedContactManager.__IPinnedContactManagerStatics.GetForUser(user_)
    }

    /**
     * Indicates whether the Windows UI supports contact pinning.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.issupported
     */
    static IsSupported() {
        if (!PinnedContactManager.HasProp("__IPinnedContactManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.PinnedContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPinnedContactManagerStatics.IID)
            PinnedContactManager.__IPinnedContactManagerStatics := IPinnedContactManagerStatics(factoryPtr)
        }

        return PinnedContactManager.__IPinnedContactManagerStatics.IsSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [User](./windows.system/user.md) associated with the [PinnedContactManager](pinnedcontactmanager.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.user
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
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IPinnedContactManager")) {
            if ((queryResult := this.QueryInterface(IPinnedContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinnedContactManager := IPinnedContactManager(outPtr)
        }

        return this.__IPinnedContactManager.get_User()
    }

    /**
     * Indicates whether the specified location in the Windows UI supports contact pinning.
     * @remarks
     * This property can be useful if your app handles the [Window.SizeChanged](./windows.ui.xaml/window_sizechanged.md) event. That event is raised when the view changes between monitors. In the [WindowSizeChanged](./windows.ui.xaml/windowsizechangedeventhandler.md) event handler, your could use this property to determine whether the new monitor supports pinning.
     * @param {Integer} surface A [pinnedContactSurface](pinnedcontactsurface.md) value that specifies a pinning location in the Windows UI. This property determines whether pinning is supported in that location.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.ispinsurfacesupported
     */
    IsPinSurfaceSupported(surface) {
        if (!this.HasProp("__IPinnedContactManager")) {
            if ((queryResult := this.QueryInterface(IPinnedContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinnedContactManager := IPinnedContactManager(outPtr)
        }

        return this.__IPinnedContactManager.IsPinSurfaceSupported(surface)
    }

    /**
     * Indicates whether the specified contact is pinned to the specified location in the Windows user interface.
     * @param {Contact} contact_ A contact of interest. This property indicates whether that contact is pinned or not pinned.
     * @param {Integer} surface A [pinnedContactSurface](pinnedcontactsurface.md) value that specifies the location in the UI that you'd like to check for pinned contacts.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.iscontactpinned
     */
    IsContactPinned(contact_, surface) {
        if (!this.HasProp("__IPinnedContactManager")) {
            if ((queryResult := this.QueryInterface(IPinnedContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinnedContactManager := IPinnedContactManager(outPtr)
        }

        return this.__IPinnedContactManager.IsContactPinned(contact_, surface)
    }

    /**
     * Pins a contact to the taskbar or **Start** menu.
     * @remarks
     * This method must be called from the main UI thread.
     * @param {Contact} contact_ The contact to pin to the taskbar or **Start** menu.
     * @param {Integer} surface A [pinnedContactSurface](pinnedcontactsurface.md) value that specifies where in the Windows UI you would like to pin the contact.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.requestpincontactasync
     */
    RequestPinContactAsync(contact_, surface) {
        if (!this.HasProp("__IPinnedContactManager")) {
            if ((queryResult := this.QueryInterface(IPinnedContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinnedContactManager := IPinnedContactManager(outPtr)
        }

        return this.__IPinnedContactManager.RequestPinContactAsync(contact_, surface)
    }

    /**
     * Pins a collection of contacts to the taskbar or **Start** menu.
     * @remarks
     * This method must be called from the main UI thread.
     * @param {IIterable<Contact>} contacts The collection of contacts to pin to the taskbar or **Start** menu.
     * @param {Integer} surface A [pinnedContactSurface](pinnedcontactsurface.md) value that specifies where in the Windows UI you would like to pin the contacts.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.requestpincontactsasync
     */
    RequestPinContactsAsync(contacts, surface) {
        if (!this.HasProp("__IPinnedContactManager")) {
            if ((queryResult := this.QueryInterface(IPinnedContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinnedContactManager := IPinnedContactManager(outPtr)
        }

        return this.__IPinnedContactManager.RequestPinContactsAsync(contacts, surface)
    }

    /**
     * Unpins a contact from the taskbar or **Start** menu.
     * @remarks
     * This method must be called from the main UI thread.
     * @param {Contact} contact_ The contact to unpin from the taskbar or **Start** menu.
     * @param {Integer} surface A [pinnedContactSurface](pinnedcontactsurface.md) value that specifies from which area in the Windows UI you would like to unpin the contact.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.requestunpincontactasync
     */
    RequestUnpinContactAsync(contact_, surface) {
        if (!this.HasProp("__IPinnedContactManager")) {
            if ((queryResult := this.QueryInterface(IPinnedContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinnedContactManager := IPinnedContactManager(outPtr)
        }

        return this.__IPinnedContactManager.RequestUnpinContactAsync(contact_, surface)
    }

    /**
     * Indicates to Windows when activity that is related to a pinned contact occurs.
     * @remarks
     * Activity could be any interesting event related to a contact that occurs in your app. For example, if your app receives a message or mail for a contact, your app could call the SignalContactActivity to report that event.
     * Windows indicates this reported activity to the user. Windows does not indicate anything to the user if the contact is not pinned. If you call this method for a contact that is not pinned, no error will occur.  
     * 
     * Your app can call this method from a background thread.
     * @param {Contact} contact_ The contact that is exhibits activity.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.signalcontactactivity
     */
    SignalContactActivity(contact_) {
        if (!this.HasProp("__IPinnedContactManager")) {
            if ((queryResult := this.QueryInterface(IPinnedContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinnedContactManager := IPinnedContactManager(outPtr)
        }

        return this.__IPinnedContactManager.SignalContactActivity(contact_)
    }

    /**
     * Gets the ID's of all contacts that are pinned to the taskbar or **Start** menu.
     * @remarks
     * This method raises an **AccessDeniedException** if you have not enabled the *contactPanel* capability in your app manifest.
     * 
     * This method can be called from a background thread.
     * @returns {IAsyncOperation<PinnedContactIdsQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactmanager.getpinnedcontactidsasync
     */
    GetPinnedContactIdsAsync() {
        if (!this.HasProp("__IPinnedContactManager")) {
            if ((queryResult := this.QueryInterface(IPinnedContactManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinnedContactManager := IPinnedContactManager(outPtr)
        }

        return this.__IPinnedContactManager.GetPinnedContactIdsAsync()
    }

;@endregion Instance Methods
}
