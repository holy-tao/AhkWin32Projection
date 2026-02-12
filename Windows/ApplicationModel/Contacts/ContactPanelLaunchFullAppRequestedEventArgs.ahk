#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactPanelLaunchFullAppRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event information for the [LaunchFullAppRequested](contactpanel_launchfullapprequested.md) event.
 * @remarks
 * First, check to see the [Handled](contactpanellaunchfullapprequestedeventargs_handled.md) property is `false`. Then, set the [Handled](contactpanellaunchfullapprequestedeventargs_handled.md) property to `true`, and start your app. Depending on what sort of experience you want to provide your users, consider closing the Contact Panel because they’ll be interacting directly with the full version of your app.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpanellaunchfullapprequestedeventargs
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactPanelLaunchFullAppRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactPanelLaunchFullAppRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactPanelLaunchFullAppRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the [LaunchFullAppRequested](contactpanel_launchfullapprequested.md) event has been handled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpanellaunchfullapprequestedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IContactPanelLaunchFullAppRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactPanelLaunchFullAppRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanelLaunchFullAppRequestedEventArgs := IContactPanelLaunchFullAppRequestedEventArgs(outPtr)
        }

        return this.__IContactPanelLaunchFullAppRequestedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IContactPanelLaunchFullAppRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactPanelLaunchFullAppRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanelLaunchFullAppRequestedEventArgs := IContactPanelLaunchFullAppRequestedEventArgs(outPtr)
        }

        return this.__IContactPanelLaunchFullAppRequestedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
