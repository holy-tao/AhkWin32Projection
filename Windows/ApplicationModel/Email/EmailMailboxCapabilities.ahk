#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxCapabilities.ahk
#Include .\IEmailMailboxCapabilities2.ahk
#Include .\IEmailMailboxCapabilities3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the capabilities associated with an email mailbox.
 * @remarks
 * The **Capabilities** property provides access to this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a Boolean value indicating whether an account is allowed to forward meeting requests.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.canforwardmeetings
     * @type {Boolean} 
     */
    CanForwardMeetings {
        get => this.get_CanForwardMeetings()
        set => this.put_CanForwardMeetings(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether an account is allowed to get and set automatic reply email messages intended for external audiences.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.cangetandsetexternalautoreplies
     * @type {Boolean} 
     */
    CanGetAndSetExternalAutoReplies {
        get => this.get_CanGetAndSetExternalAutoReplies()
        set => this.put_CanGetAndSetExternalAutoReplies(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether an account is allowed to get and set automatic reply email messages intended for internal audiences.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.cangetandsetinternalautoreplies
     * @type {Boolean} 
     */
    CanGetAndSetInternalAutoReplies {
        get => this.get_CanGetAndSetInternalAutoReplies()
        set => this.put_CanGetAndSetInternalAutoReplies(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether the email mailbox is allowed to update meeting responses.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.canupdatemeetingresponses
     * @type {Boolean} 
     */
    CanUpdateMeetingResponses {
        get => this.get_CanUpdateMeetingResponses()
        set => this.put_CanUpdateMeetingResponses(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether a search of specific folders on the server can be initiated from this email mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.canserversearchfolders
     * @type {Boolean} 
     */
    CanServerSearchFolders {
        get => this.get_CanServerSearchFolders()
        set => this.put_CanServerSearchFolders(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether a search of the server can be initiated from this email mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.canserversearchmailbox
     * @type {Boolean} 
     */
    CanServerSearchMailbox {
        get => this.get_CanServerSearchMailbox()
        set => this.put_CanServerSearchMailbox(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether an account is allowed to propose a new meeting time.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.canproposenewtimeformeetings
     * @type {Boolean} 
     */
    CanProposeNewTimeForMeetings {
        get => this.get_CanProposeNewTimeForMeetings()
        set => this.put_CanProposeNewTimeForMeetings(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether the email mailbox is allowed to attempt smart send.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.cansmartsend
     * @type {Boolean} 
     */
    CanSmartSend {
        get => this.get_CanSmartSend()
        set => this.put_CanSmartSend(value)
    }

    /**
     * Gets or sets a Boolean value that indicates whether the email mailbox is capable of resolving recipients.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.canresolverecipients
     * @type {Boolean} 
     */
    CanResolveRecipients {
        get => this.get_CanResolveRecipients()
        set => this.put_CanResolveRecipients(value)
    }

    /**
     * Gets or sets a Boolean value that indicates whether the email mailbox is capable of validating certificates.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.canvalidatecertificates
     * @type {Boolean} 
     */
    CanValidateCertificates {
        get => this.get_CanValidateCertificates()
        set => this.put_CanValidateCertificates(value)
    }

    /**
     * Gets or sets a Boolean value indicating if folders in the mailbox can be emptied.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.canemptyfolder
     * @type {Boolean} 
     */
    CanEmptyFolder {
        get => this.get_CanEmptyFolder()
        set => this.put_CanEmptyFolder(value)
    }

    /**
     * Gets or sets a Boolean value indicating if folders can be created in the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.cancreatefolder
     * @type {Boolean} 
     */
    CanCreateFolder {
        get => this.get_CanCreateFolder()
        set => this.put_CanCreateFolder(value)
    }

    /**
     * Gets or sets a Boolean value indicating if folders can be deleted from the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.candeletefolder
     * @type {Boolean} 
     */
    CanDeleteFolder {
        get => this.get_CanDeleteFolder()
        set => this.put_CanDeleteFolder(value)
    }

    /**
     * Gets or sets a Boolean value indicating if folders in the mailbox can be moved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxcapabilities.canmovefolder
     * @type {Boolean} 
     */
    CanMoveFolder {
        get => this.get_CanMoveFolder()
        set => this.put_CanMoveFolder(value)
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
    get_CanForwardMeetings() {
        if (!this.HasProp("__IEmailMailboxCapabilities")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities := IEmailMailboxCapabilities(outPtr)
        }

        return this.__IEmailMailboxCapabilities.get_CanForwardMeetings()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGetAndSetExternalAutoReplies() {
        if (!this.HasProp("__IEmailMailboxCapabilities")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities := IEmailMailboxCapabilities(outPtr)
        }

        return this.__IEmailMailboxCapabilities.get_CanGetAndSetExternalAutoReplies()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGetAndSetInternalAutoReplies() {
        if (!this.HasProp("__IEmailMailboxCapabilities")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities := IEmailMailboxCapabilities(outPtr)
        }

        return this.__IEmailMailboxCapabilities.get_CanGetAndSetInternalAutoReplies()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanUpdateMeetingResponses() {
        if (!this.HasProp("__IEmailMailboxCapabilities")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities := IEmailMailboxCapabilities(outPtr)
        }

        return this.__IEmailMailboxCapabilities.get_CanUpdateMeetingResponses()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanServerSearchFolders() {
        if (!this.HasProp("__IEmailMailboxCapabilities")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities := IEmailMailboxCapabilities(outPtr)
        }

        return this.__IEmailMailboxCapabilities.get_CanServerSearchFolders()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanServerSearchMailbox() {
        if (!this.HasProp("__IEmailMailboxCapabilities")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities := IEmailMailboxCapabilities(outPtr)
        }

        return this.__IEmailMailboxCapabilities.get_CanServerSearchMailbox()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanProposeNewTimeForMeetings() {
        if (!this.HasProp("__IEmailMailboxCapabilities")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities := IEmailMailboxCapabilities(outPtr)
        }

        return this.__IEmailMailboxCapabilities.get_CanProposeNewTimeForMeetings()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSmartSend() {
        if (!this.HasProp("__IEmailMailboxCapabilities")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities := IEmailMailboxCapabilities(outPtr)
        }

        return this.__IEmailMailboxCapabilities.get_CanSmartSend()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanResolveRecipients() {
        if (!this.HasProp("__IEmailMailboxCapabilities2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities2 := IEmailMailboxCapabilities2(outPtr)
        }

        return this.__IEmailMailboxCapabilities2.get_CanResolveRecipients()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanValidateCertificates() {
        if (!this.HasProp("__IEmailMailboxCapabilities2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities2 := IEmailMailboxCapabilities2(outPtr)
        }

        return this.__IEmailMailboxCapabilities2.get_CanValidateCertificates()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanEmptyFolder() {
        if (!this.HasProp("__IEmailMailboxCapabilities2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities2 := IEmailMailboxCapabilities2(outPtr)
        }

        return this.__IEmailMailboxCapabilities2.get_CanEmptyFolder()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCreateFolder() {
        if (!this.HasProp("__IEmailMailboxCapabilities2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities2 := IEmailMailboxCapabilities2(outPtr)
        }

        return this.__IEmailMailboxCapabilities2.get_CanCreateFolder()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDeleteFolder() {
        if (!this.HasProp("__IEmailMailboxCapabilities2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities2 := IEmailMailboxCapabilities2(outPtr)
        }

        return this.__IEmailMailboxCapabilities2.get_CanDeleteFolder()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMoveFolder() {
        if (!this.HasProp("__IEmailMailboxCapabilities2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities2 := IEmailMailboxCapabilities2(outPtr)
        }

        return this.__IEmailMailboxCapabilities2.get_CanMoveFolder()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanForwardMeetings(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanForwardMeetings(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanGetAndSetExternalAutoReplies(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanGetAndSetExternalAutoReplies(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanGetAndSetInternalAutoReplies(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanGetAndSetInternalAutoReplies(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanUpdateMeetingResponses(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanUpdateMeetingResponses(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanServerSearchFolders(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanServerSearchFolders(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanServerSearchMailbox(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanServerSearchMailbox(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanProposeNewTimeForMeetings(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanProposeNewTimeForMeetings(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanSmartSend(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanSmartSend(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanResolveRecipients(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanResolveRecipients(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanValidateCertificates(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanValidateCertificates(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanEmptyFolder(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanEmptyFolder(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanCreateFolder(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanCreateFolder(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanDeleteFolder(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanDeleteFolder(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanMoveFolder(value) {
        if (!this.HasProp("__IEmailMailboxCapabilities3")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCapabilities3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCapabilities3 := IEmailMailboxCapabilities3(outPtr)
        }

        return this.__IEmailMailboxCapabilities3.put_CanMoveFolder(value)
    }

;@endregion Instance Methods
}
