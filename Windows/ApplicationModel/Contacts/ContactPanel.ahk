#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactPanel.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ContactPanel.ahk
#Include .\ContactPanelLaunchFullAppRequestedEventArgs.ahk
#Include .\ContactPanelClosingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Contact Panel that appears when users click a contact that is pinned to the taskbar.
 * @remarks
 * The Contact Panel appears when users click a contact that is pinned to the taskbar.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpanel
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactPanel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactPanel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the color of the Contact Panel header.
     * @remarks
     * [Color](./windows.ui/color.md) takes effect only when the app is the active tab. If you don’t set this property, the system chooses the color.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpanel.headercolor
     * @type {IReference<Color>} 
     */
    HeaderColor {
        get => this.get_HeaderColor()
        set => this.put_HeaderColor(value)
    }

    /**
     * Occurs when the user clicks the **Launch Full App** button in the Contact Panel.
     * @remarks
     * Handle this event to provide your users with a smoother experience. For example, your app could handle this event to ensure that the full app continues playing a video that users start in the Contact Panel, or open a message that users started reading in the Contact Panel.
     * 
     * If you don’t handle this event, or if you handle this event, but you don’t set the [Handled](contactpanellaunchfullapprequestedeventargs_handled.md) property of the [ContactPanelLaunchFullAppRequestedEventArgs](contactpanellaunchfullapprequestedeventargs.md) property to true, your app starts in it’s default state.
     * @type {TypedEventHandler<ContactPanel, ContactPanelLaunchFullAppRequestedEventArgs>}
    */
    OnLaunchFullAppRequested {
        get {
            if(!this.HasProp("__OnLaunchFullAppRequested")){
                this.__OnLaunchFullAppRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c4030df2-ad34-5575-a369-5616577878eb}"),
                    ContactPanel,
                    ContactPanelLaunchFullAppRequestedEventArgs
                )
                this.__OnLaunchFullAppRequestedToken := this.add_LaunchFullAppRequested(this.__OnLaunchFullAppRequested.iface)
            }
            return this.__OnLaunchFullAppRequested
        }
    }

    /**
     * Occurs when the Contact Panel is closing.
     * @type {TypedEventHandler<ContactPanel, ContactPanelClosingEventArgs>}
    */
    OnClosing {
        get {
            if(!this.HasProp("__OnClosing")){
                this.__OnClosing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4357954b-bce6-5456-a511-fe8904e8090b}"),
                    ContactPanel,
                    ContactPanelClosingEventArgs
                )
                this.__OnClosingToken := this.add_Closing(this.__OnClosing.iface)
            }
            return this.__OnClosing
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLaunchFullAppRequestedToken")) {
            this.remove_LaunchFullAppRequested(this.__OnLaunchFullAppRequestedToken)
            this.__OnLaunchFullAppRequested.iface.Dispose()
        }

        if(this.HasProp("__OnClosingToken")) {
            this.remove_Closing(this.__OnClosingToken)
            this.__OnClosing.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Closes the Contact Panel.
     * @remarks
     * This method must be called from the main UI thread.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpanel.closepanel
     */
    ClosePanel() {
        if (!this.HasProp("__IContactPanel")) {
            if ((queryResult := this.QueryInterface(IContactPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanel := IContactPanel(outPtr)
        }

        return this.__IContactPanel.ClosePanel()
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_HeaderColor() {
        if (!this.HasProp("__IContactPanel")) {
            if ((queryResult := this.QueryInterface(IContactPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanel := IContactPanel(outPtr)
        }

        return this.__IContactPanel.get_HeaderColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_HeaderColor(value) {
        if (!this.HasProp("__IContactPanel")) {
            if ((queryResult := this.QueryInterface(IContactPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanel := IContactPanel(outPtr)
        }

        return this.__IContactPanel.put_HeaderColor(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ContactPanel, ContactPanelLaunchFullAppRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LaunchFullAppRequested(handler) {
        if (!this.HasProp("__IContactPanel")) {
            if ((queryResult := this.QueryInterface(IContactPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanel := IContactPanel(outPtr)
        }

        return this.__IContactPanel.add_LaunchFullAppRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LaunchFullAppRequested(token) {
        if (!this.HasProp("__IContactPanel")) {
            if ((queryResult := this.QueryInterface(IContactPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanel := IContactPanel(outPtr)
        }

        return this.__IContactPanel.remove_LaunchFullAppRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ContactPanel, ContactPanelClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closing(handler) {
        if (!this.HasProp("__IContactPanel")) {
            if ((queryResult := this.QueryInterface(IContactPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanel := IContactPanel(outPtr)
        }

        return this.__IContactPanel.add_Closing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closing(token) {
        if (!this.HasProp("__IContactPanel")) {
            if ((queryResult := this.QueryInterface(IContactPanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanel := IContactPanel(outPtr)
        }

        return this.__IContactPanel.remove_Closing(token)
    }

;@endregion Instance Methods
}
