#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactChangeTracker.ahk
#Include .\IContactChangeTracker2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for monitoring changes to [Contact](contact.md) objects in the [ContactStore](contactstore.md).
 * @remarks
 * Use [ContactStore.ChangeTracker](contactstore_changetracker.md) or [ContactList.ChangeTracker](contactlist_changetracker.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangetracker
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactChangeTracker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactChangeTracker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactChangeTracker.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Boolean value that indicates whether change tracking is active.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangetracker.istracking
     * @type {Boolean} 
     */
    IsTracking {
        get => this.get_IsTracking()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Call this method to enable change tracking.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangetracker.enable
     */
    Enable() {
        if (!this.HasProp("__IContactChangeTracker")) {
            if ((queryResult := this.QueryInterface(IContactChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChangeTracker := IContactChangeTracker(outPtr)
        }

        return this.__IContactChangeTracker.Enable()
    }

    /**
     * Gets a [ContactChangeReader](contactchangereader.md) that can be used to process changes.
     * @returns {ContactChangeReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangetracker.getchangereader
     */
    GetChangeReader() {
        if (!this.HasProp("__IContactChangeTracker")) {
            if ((queryResult := this.QueryInterface(IContactChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChangeTracker := IContactChangeTracker(outPtr)
        }

        return this.__IContactChangeTracker.GetChangeReader()
    }

    /**
     * Call this method to reset the change tracker if your app receives [ContactChangeType.ChangeTrackingLost](contactchangetype.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangetracker.reset
     */
    Reset() {
        if (!this.HasProp("__IContactChangeTracker")) {
            if ((queryResult := this.QueryInterface(IContactChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChangeTracker := IContactChangeTracker(outPtr)
        }

        return this.__IContactChangeTracker.Reset()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTracking() {
        if (!this.HasProp("__IContactChangeTracker2")) {
            if ((queryResult := this.QueryInterface(IContactChangeTracker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChangeTracker2 := IContactChangeTracker2(outPtr)
        }

        return this.__IContactChangeTracker2.get_IsTracking()
    }

;@endregion Instance Methods
}
