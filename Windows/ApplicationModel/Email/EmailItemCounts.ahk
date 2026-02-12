#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailItemCounts.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the counts for various email message attributes such as flagged, important, unread, and so on.
 * @remarks
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailitemcounts
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailItemCounts extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailItemCounts

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailItemCounts.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of flagged email messages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailitemcounts.flagged
     * @type {Integer} 
     */
    Flagged {
        get => this.get_Flagged()
    }

    /**
     * Gets the number of important email messages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailitemcounts.important
     * @type {Integer} 
     */
    Important {
        get => this.get_Important()
    }

    /**
     * Gets the total number of email messages
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailitemcounts.total
     * @type {Integer} 
     */
    Total {
        get => this.get_Total()
    }

    /**
     * Gets the number of unread email messages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailitemcounts.unread
     * @type {Integer} 
     */
    Unread {
        get => this.get_Unread()
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
    get_Flagged() {
        if (!this.HasProp("__IEmailItemCounts")) {
            if ((queryResult := this.QueryInterface(IEmailItemCounts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailItemCounts := IEmailItemCounts(outPtr)
        }

        return this.__IEmailItemCounts.get_Flagged()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Important() {
        if (!this.HasProp("__IEmailItemCounts")) {
            if ((queryResult := this.QueryInterface(IEmailItemCounts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailItemCounts := IEmailItemCounts(outPtr)
        }

        return this.__IEmailItemCounts.get_Important()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Total() {
        if (!this.HasProp("__IEmailItemCounts")) {
            if ((queryResult := this.QueryInterface(IEmailItemCounts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailItemCounts := IEmailItemCounts(outPtr)
        }

        return this.__IEmailItemCounts.get_Total()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unread() {
        if (!this.HasProp("__IEmailItemCounts")) {
            if ((queryResult := this.QueryInterface(IEmailItemCounts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailItemCounts := IEmailItemCounts(outPtr)
        }

        return this.__IEmailItemCounts.get_Unread()
    }

;@endregion Instance Methods
}
