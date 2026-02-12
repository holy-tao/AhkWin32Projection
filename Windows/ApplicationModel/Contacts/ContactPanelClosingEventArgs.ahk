#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactPanelClosingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event information for the [Closing](contactpanel_closing.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpanelclosingeventargs
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactPanelClosingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactPanelClosingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactPanelClosingEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the deferral object for the [Closing](contactpanel_closing.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpanelclosingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IContactPanelClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactPanelClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanelClosingEventArgs := IContactPanelClosingEventArgs(outPtr)
        }

        return this.__IContactPanelClosingEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
