#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactMatchReason.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details about why search results matched the query parameters.
 * @remarks
 * Call [ContactReader.GetMatchingPropertiesWithMatchReason](contactreader_getmatchingpropertieswithmatchreason_951039830.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmatchreason
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactMatchReason extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactMatchReason

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactMatchReason.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the contact field type that matched the search, such as name, phone number, email address and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmatchreason.field
     * @type {Integer} 
     */
    Field {
        get => this.get_Field()
    }

    /**
     * Gets a list of matching [TextSegment](../windows.data.text/textsegment.md) objects which tells you what to highlight in your view as the result of a contact search.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmatchreason.segments
     * @type {IVectorView<TextSegment>} 
     */
    Segments {
        get => this.get_Segments()
    }

    /**
     * Gets the matching text result from a contact search.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmatchreason.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Field() {
        if (!this.HasProp("__IContactMatchReason")) {
            if ((queryResult := this.QueryInterface(IContactMatchReason.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactMatchReason := IContactMatchReason(outPtr)
        }

        return this.__IContactMatchReason.get_Field()
    }

    /**
     * 
     * @returns {IVectorView<TextSegment>} 
     */
    get_Segments() {
        if (!this.HasProp("__IContactMatchReason")) {
            if ((queryResult := this.QueryInterface(IContactMatchReason.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactMatchReason := IContactMatchReason(outPtr)
        }

        return this.__IContactMatchReason.get_Segments()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IContactMatchReason")) {
            if ((queryResult := this.QueryInterface(IContactMatchReason.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactMatchReason := IContactMatchReason(outPtr)
        }

        return this.__IContactMatchReason.get_Text()
    }

;@endregion Instance Methods
}
