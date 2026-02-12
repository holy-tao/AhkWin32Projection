#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPinnedContactIdsQueryResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the results of a query that lists the IDs all contacts pinned to the taskbar or Start menu.
 * @remarks
 * You can use a PinnedContactIdsQueryResult to enumerate through the IDs of pinned contacts.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactidsqueryresult
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class PinnedContactIdsQueryResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPinnedContactIdsQueryResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPinnedContactIdsQueryResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of contact IDs that are pinned to the taskbar or **Start** menu.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.pinnedcontactidsqueryresult.contactids
     * @type {IVector<HSTRING>} 
     */
    ContactIds {
        get => this.get_ContactIds()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ContactIds() {
        if (!this.HasProp("__IPinnedContactIdsQueryResult")) {
            if ((queryResult := this.QueryInterface(IPinnedContactIdsQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinnedContactIdsQueryResult := IPinnedContactIdsQueryResult(outPtr)
        }

        return this.__IPinnedContactIdsQueryResult.get_ContactIds()
    }

;@endregion Instance Methods
}
