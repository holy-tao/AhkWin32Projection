#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailDataProviderConnection.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\EmailDataProviderConnection.ahk
#Include .\EmailMailboxSyncManagerSyncRequestEventArgs.ahk
#Include .\EmailMailboxDownloadMessageRequestEventArgs.ahk
#Include .\EmailMailboxDownloadAttachmentRequestEventArgs.ahk
#Include .\EmailMailboxCreateFolderRequestEventArgs.ahk
#Include .\EmailMailboxDeleteFolderRequestEventArgs.ahk
#Include .\EmailMailboxEmptyFolderRequestEventArgs.ahk
#Include .\EmailMailboxMoveFolderRequestEventArgs.ahk
#Include .\EmailMailboxUpdateMeetingResponseRequestEventArgs.ahk
#Include .\EmailMailboxForwardMeetingRequestEventArgs.ahk
#Include .\EmailMailboxProposeNewTimeForMeetingRequestEventArgs.ahk
#Include .\EmailMailboxSetAutoReplySettingsRequestEventArgs.ahk
#Include .\EmailMailboxGetAutoReplySettingsRequestEventArgs.ahk
#Include .\EmailMailboxResolveRecipientsRequestEventArgs.ahk
#Include .\EmailMailboxValidateCertificatesRequestEventArgs.ahk
#Include .\EmailMailboxServerSearchReadBatchRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a connection to a data provider client.
 * @remarks
 * Use the instance of this class provided by the [Connection](emaildataprovidertriggerdetails_connection.md) property of the [EmailDataProviderTriggerDetails](emaildataprovidertriggerdetails.md) object passed to your background task on activation.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emaildataproviderconnection
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailDataProviderConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailDataProviderConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailDataProviderConnection.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMailboxSyncRequestedToken")) {
            this.remove_MailboxSyncRequested(this.__OnMailboxSyncRequestedToken)
            this.__OnMailboxSyncRequested.iface.Dispose()
        }

        if(this.HasProp("__OnDownloadMessageRequestedToken")) {
            this.remove_DownloadMessageRequested(this.__OnDownloadMessageRequestedToken)
            this.__OnDownloadMessageRequested.iface.Dispose()
        }

        if(this.HasProp("__OnDownloadAttachmentRequestedToken")) {
            this.remove_DownloadAttachmentRequested(this.__OnDownloadAttachmentRequestedToken)
            this.__OnDownloadAttachmentRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCreateFolderRequestedToken")) {
            this.remove_CreateFolderRequested(this.__OnCreateFolderRequestedToken)
            this.__OnCreateFolderRequested.iface.Dispose()
        }

        if(this.HasProp("__OnDeleteFolderRequestedToken")) {
            this.remove_DeleteFolderRequested(this.__OnDeleteFolderRequestedToken)
            this.__OnDeleteFolderRequested.iface.Dispose()
        }

        if(this.HasProp("__OnEmptyFolderRequestedToken")) {
            this.remove_EmptyFolderRequested(this.__OnEmptyFolderRequestedToken)
            this.__OnEmptyFolderRequested.iface.Dispose()
        }

        if(this.HasProp("__OnMoveFolderRequestedToken")) {
            this.remove_MoveFolderRequested(this.__OnMoveFolderRequestedToken)
            this.__OnMoveFolderRequested.iface.Dispose()
        }

        if(this.HasProp("__OnUpdateMeetingResponseRequestedToken")) {
            this.remove_UpdateMeetingResponseRequested(this.__OnUpdateMeetingResponseRequestedToken)
            this.__OnUpdateMeetingResponseRequested.iface.Dispose()
        }

        if(this.HasProp("__OnForwardMeetingRequestedToken")) {
            this.remove_ForwardMeetingRequested(this.__OnForwardMeetingRequestedToken)
            this.__OnForwardMeetingRequested.iface.Dispose()
        }

        if(this.HasProp("__OnProposeNewTimeForMeetingRequestedToken")) {
            this.remove_ProposeNewTimeForMeetingRequested(this.__OnProposeNewTimeForMeetingRequestedToken)
            this.__OnProposeNewTimeForMeetingRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSetAutoReplySettingsRequestedToken")) {
            this.remove_SetAutoReplySettingsRequested(this.__OnSetAutoReplySettingsRequestedToken)
            this.__OnSetAutoReplySettingsRequested.iface.Dispose()
        }

        if(this.HasProp("__OnGetAutoReplySettingsRequestedToken")) {
            this.remove_GetAutoReplySettingsRequested(this.__OnGetAutoReplySettingsRequestedToken)
            this.__OnGetAutoReplySettingsRequested.iface.Dispose()
        }

        if(this.HasProp("__OnResolveRecipientsRequestedToken")) {
            this.remove_ResolveRecipientsRequested(this.__OnResolveRecipientsRequestedToken)
            this.__OnResolveRecipientsRequested.iface.Dispose()
        }

        if(this.HasProp("__OnValidateCertificatesRequestedToken")) {
            this.remove_ValidateCertificatesRequested(this.__OnValidateCertificatesRequestedToken)
            this.__OnValidateCertificatesRequested.iface.Dispose()
        }

        if(this.HasProp("__OnServerSearchReadBatchRequestedToken")) {
            this.remove_ServerSearchReadBatchRequested(this.__OnServerSearchReadBatchRequestedToken)
            this.__OnServerSearchReadBatchRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxSyncManagerSyncRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MailboxSyncRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_MailboxSyncRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MailboxSyncRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_MailboxSyncRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxDownloadMessageRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadMessageRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_DownloadMessageRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DownloadMessageRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_DownloadMessageRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxDownloadAttachmentRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadAttachmentRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_DownloadAttachmentRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DownloadAttachmentRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_DownloadAttachmentRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxCreateFolderRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CreateFolderRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_CreateFolderRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CreateFolderRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_CreateFolderRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxDeleteFolderRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DeleteFolderRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_DeleteFolderRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DeleteFolderRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_DeleteFolderRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxEmptyFolderRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EmptyFolderRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_EmptyFolderRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EmptyFolderRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_EmptyFolderRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxMoveFolderRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MoveFolderRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_MoveFolderRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MoveFolderRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_MoveFolderRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxUpdateMeetingResponseRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UpdateMeetingResponseRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_UpdateMeetingResponseRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UpdateMeetingResponseRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_UpdateMeetingResponseRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxForwardMeetingRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ForwardMeetingRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_ForwardMeetingRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ForwardMeetingRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_ForwardMeetingRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxProposeNewTimeForMeetingRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProposeNewTimeForMeetingRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_ProposeNewTimeForMeetingRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProposeNewTimeForMeetingRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_ProposeNewTimeForMeetingRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxSetAutoReplySettingsRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SetAutoReplySettingsRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_SetAutoReplySettingsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SetAutoReplySettingsRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_SetAutoReplySettingsRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxGetAutoReplySettingsRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GetAutoReplySettingsRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_GetAutoReplySettingsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GetAutoReplySettingsRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_GetAutoReplySettingsRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxResolveRecipientsRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResolveRecipientsRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_ResolveRecipientsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ResolveRecipientsRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_ResolveRecipientsRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxValidateCertificatesRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ValidateCertificatesRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_ValidateCertificatesRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ValidateCertificatesRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_ValidateCertificatesRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EmailDataProviderConnection, EmailMailboxServerSearchReadBatchRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ServerSearchReadBatchRequested(handler) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.add_ServerSearchReadBatchRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ServerSearchReadBatchRequested(token) {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.remove_ServerSearchReadBatchRequested(token)
    }

    /**
     * Call this method to indicate that all event handlers have been set, and the data provider is ready to start handling requests.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emaildataproviderconnection.start
     */
    Start() {
        if (!this.HasProp("__IEmailDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderConnection := IEmailDataProviderConnection(outPtr)
        }

        return this.__IEmailDataProviderConnection.Start()
    }

;@endregion Instance Methods
}
