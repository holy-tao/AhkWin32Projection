#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactChangeReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a way to monitor and react to changes to contacts.
 * @remarks
 * Call the [GetChangeReader](contactchangetracker_getchangereader_1364424875.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangereader
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactChangeReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactChangeReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactChangeReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Call this method to indicate that you have processed and accepted all changes and you don't want the system to show them to you again.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangereader.acceptchanges
     */
    AcceptChanges() {
        if (!this.HasProp("__IContactChangeReader")) {
            if ((queryResult := this.QueryInterface(IContactChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChangeReader := IContactChangeReader(outPtr)
        }

        return this.__IContactChangeReader.AcceptChanges()
    }

    /**
     * Call this method to indicate that you have processed and accepted up through the specified change.
     * @param {ContactChange} lastChangeToAccept The last change that you want to system to track as accepted by your app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangereader.acceptchangesthrough
     */
    AcceptChangesThrough(lastChangeToAccept) {
        if (!this.HasProp("__IContactChangeReader")) {
            if ((queryResult := this.QueryInterface(IContactChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChangeReader := IContactChangeReader(outPtr)
        }

        return this.__IContactChangeReader.AcceptChangesThrough(lastChangeToAccept)
    }

    /**
     * Asynchronously gets a list of [ContactChange](contactchange.md) objects.
     * @returns {IAsyncOperation<IVectorView<ContactChange>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactchangereader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IContactChangeReader")) {
            if ((queryResult := this.QueryInterface(IContactChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactChangeReader := IContactChangeReader(outPtr)
        }

        return this.__IContactChangeReader.ReadBatchAsync()
    }

;@endregion Instance Methods
}
