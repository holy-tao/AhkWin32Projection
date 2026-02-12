#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\IContactActionEntity.ahk
#Include ..\..\..\Guid.ahk

/**
 * A subtype of [ActionEntity](actionentity.md) that represents a contact.
 * @remarks
 * Create an instance of this class by calling [ActionEntityFactory.CreateContactEntity](actionentityfactory_createcontactentity_997019062.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.contactactionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ContactActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object representing a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.contactactionentity.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        if (!this.HasProp("__IContactActionEntity")) {
            if ((queryResult := this.QueryInterface(IContactActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactActionEntity := IContactActionEntity(outPtr)
        }

        return this.__IContactActionEntity.get_Contact()
    }

;@endregion Instance Methods
}
