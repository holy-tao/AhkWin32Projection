#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxCreateFolderResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a [TryCreateFolderAsync](emailmailbox_trycreatefolderasync_142768409.md) operation.
 * @remarks
 * An instance of this class is returned to the [TryCreateFolderAsync](emailmailbox_trycreatefolderasync_142768409.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcreatefolderresult
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxCreateFolderResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxCreateFolderResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxCreateFolderResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of a [TryCreateFolderAsync](emailmailbox_trycreatefolderasync_142768409.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcreatefolderresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Get the newly created folder after a [TryCreateFolderAsync](emailmailbox_trycreatefolderasync_142768409.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcreatefolderresult.folder
     * @type {EmailFolder} 
     */
    Folder {
        get => this.get_Folder()
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
    get_Status() {
        if (!this.HasProp("__IEmailMailboxCreateFolderResult")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCreateFolderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCreateFolderResult := IEmailMailboxCreateFolderResult(outPtr)
        }

        return this.__IEmailMailboxCreateFolderResult.get_Status()
    }

    /**
     * 
     * @returns {EmailFolder} 
     */
    get_Folder() {
        if (!this.HasProp("__IEmailMailboxCreateFolderResult")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCreateFolderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCreateFolderResult := IEmailMailboxCreateFolderResult(outPtr)
        }

        return this.__IEmailMailboxCreateFolderResult.get_Folder()
    }

;@endregion Instance Methods
}
