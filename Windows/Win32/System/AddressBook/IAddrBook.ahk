#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IMAPIProp.ahk

/**
 * Do not use. (IAddrBook)
 * @see https://learn.microsoft.com/windows/win32/api/wabiab/nn-wabiab-iaddrbook
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IAddrBook extends IMAPIProp{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenEntry", "CompareEntryIDs", "Advise", "Unadvise", "CreateOneOff", "NewEntry", "ResolveName", "Address", "Details", "RecipOptions", "QueryDefaultRecipOpt", "GetPAB", "SetPAB", "GetDefaultDir", "SetDefaultDir", "GetSearchPath", "SetSearchPath", "PrepareRecips"]

    /**
     * Opens an address book entry and returns a pointer to an interface that can be used to access the entry.
     * @remarks
     * Clients and service providers call the **IAddrBook::OpenEntry** method to open an address book entry. MAPI forwards the call to the appropriate address book provider, based on the [MAPIUID](mapiuid.md) structure included in the entry identifier passed in the _lpEntryID_ parameter. The address book provider opens the entry as read-only unless the MAPI_MODIFY or MAPI_BEST_ACCESS flag in the _ulFlags_ parameter is set. However, these flags are suggestions. If the address book provider does not allow modification for the entry requested, it returns MAPI_E_NO_ACCESS.
     *   
     * The _lpInterface_ parameter indicates which interface should be used to access the opened entry. Passing NULL in _lpInterface_ indicates the standard MAPI interface for that type of entry should be used. Because the address book provider might return a different interface than the one suggested by the _lpInterface_ parameter, the caller should check the value returned in the _lpulObjType_ parameter to determine whether the object type returned is what was expected. If the object type is not of the type expected, the caller can cast the _lppUnk_ parameter to a type that is more appropriate.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the _lpEntryID_ parameter.
     * @param {Pointer<ENTRYID>} lpEntryID > [in] A pointer to the entry identifier that represents the address book entry to open.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) of the interface to be used to access the open entry. Passing NULL returns the object's standard interface. For messaging users, the standard interface is [IMailUser : IMAPIProp](imailuserimapiprop.md). For distribution lists, it is [IDistList : IMAPIContainer](idistlistimapicontainer.md) and for containers, it is [IABContainer : IMAPIContainer](iabcontainerimapicontainer.md). Callers can set _lpInterface_ to the appropriate standard interface or an interface in the inheritance hierarchy.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the entry is opened. The following flags can be set.
     * 
     * MAPI_BEST_ACCESS
     *   
     * > Requests that the entry be opened with the maximum allowed network and client permissions. For example, if the client has read/write permission, the address book provider should attempt to open the entry with read/write permission. The client can retrieve the access level that was granted by calling the open entry's [IMAPIProp::GetProps](imapiprop-getprops.md) method and retrieving the **PR_ACCESS_LEVEL** ([PidTagAccessLevel](pidtagaccesslevel-canonical-property.md)) property.
     * 
     * MAPI_CACHE_ONLY
     *   
     * > Opens an address book entry and accesses it only from the cache. For example, you can use this flag to allow a client application to open the global address list (GAL) in cached exchange mode and access an entry in that address book from the cache without creating traffic between the client and the server. This flag is supported only by the Exchange address book provider.
     * 
     * MAPI_DEFERRED_ERRORS
     *   
     * > Allows the call to succeed, potentially before the entry is fully open and available, implying that later calls to the entry might return an error.
     * 
     * MAPI_GAL_ONLY
     *   
     * > Use only the GAL to perform name resolution. This flag is supported only by the Exchange Address Book Provider.
     * 
     *   > [!NOTE]
     *   > The _ulFlags_ MAPI_GAL_ONLY might not be defined in the downloadable header file you currently have, in which case you can add it to your code using the following value: 
     *   > `#define MAPI_GAL_ONLY (0x00000080)`
     *   
     * MAPI_MODIFY
     *   
     * > Requests that the entry be opened with read/write permission. Because entries are opened with read-only access by default, clients should not assume that read/write permission was granted regardless of whether MAPI_MODIFY is set.
     * 
     * MAPI_NO_CACHE
     *   
     * > Do not use the offline address book to perform name resolution. This flag is supported only by the Exchange Address Book Provider.
     * @param {Pointer<Integer>} lpulObjType > [out] A pointer to the type of the opened entry.
     * @returns {IUnknown} > [out] A pointer to a pointer to the opened entry.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-openentry
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType) {
        lpulObjTypeMarshal := lpulObjType is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, lpulObjTypeMarshal, lpulObjType, "ptr*", &lppUnk := 0, "HRESULT")
        return IUnknown(lppUnk)
    }

    /**
     * 
     * @remarks
     * Client applications and service providers call the **CompareEntryIDs** method to compare two entry identifiers that belongs to a single address book provider to determine whether they refer to the same object. **CompareEntryIDs** is useful because an object can have more than one valid entry identifier. This situation can occur, for example, after a new version of an address book provider is installed. 
     *   
     * MAPI passes this call to the address book provider that is responsible for the entry identifiers, determining the appropriate provider by matching the [MAPIUID](mapiuid.md) structure in the entry identifiers with the **MAPIUID** structure registered by the provider. 
     *   
     * If the two entry identifiers refer to the same object, **CompareEntryIDs** sets the contents of the  _lpulResult_ parameter to TRUE; if they refer to different objects, **CompareEntryIDs** sets the contents to FALSE. In either case, **CompareEntryIDs** returns S_OK. If **CompareEntryIDs** returns an error, which can occur if no address book provider has registered a **MAPIUID** structure that matches the one in the entry identifiers, clients and providers should not take any action based on the result of the comparison. They should instead take the most conservative approach to the action being performed.
     * @param {Integer} cbEntryID1 > [in] The byte count in the entry identifier pointed to by the  _lpEntryID1_ parameter.
     * @param {Pointer<ENTRYID>} lpEntryID1 > [in] A pointer to the first entry identifier to be compared.
     * @param {Integer} cbEntryID2 > [in] The byte count in the entry identifier pointed to by the  _lpEntryID2_ parameter.
     * @param {Pointer<ENTRYID>} lpEntryID2 > [in] A pointer to the second entry identifier to be compared.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {Pointer<Integer>} lpulResult > [out] A pointer to the result of the comparison. The contents of  _lpulResult_ are set to TRUE if the two entry identifiers refer to the same object; otherwise, the contents are set to FALSE.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values.
     *     
     * MAPI_E_UNKNOWN_ENTRYID 
     *   
     * > One or both of the entry identifiers passed in with the  _lpEntryID1_ or  _lpEntryID2_ parameters are not recognized by any address book provider.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-compareentryids
     */
    CompareEntryIDs(cbEntryID1, lpEntryID1, cbEntryID2, lpEntryID2, ulFlags, lpulResult) {
        lpulResultMarshal := lpulResult is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", cbEntryID1, "ptr", lpEntryID1, "uint", cbEntryID2, "ptr", lpEntryID2, "uint", ulFlags, lpulResultMarshal, lpulResult, "HRESULT")
        return result
    }

    /**
     * Registers a client or service provider to receive notifications about changes to one or more entries in the address book.
     * @remarks
     * Clients and service providers call the **Advise** method to register for a particular type or types of notification on an address book entry. The types of notification are indicated by the event mask passed in with the  _ulEventMask_ parameter. 
     *   
     * MAPI forwards this **Advise** call to the address book provider that is responsible for the entry as indicated by the entry identifier in the _lpEntryID_ parameter. The address book provider either handles the registration itself or calls the support method, [IMAPISupport::Subscribe](imapisupport-subscribe.md), to prompt MAPI to register the caller. A nonzero connection number is returned to represent the successful registration.
     *   
     * Whenever a change occurs to the entry of the type indicated by the notification registration, the address book provider calls the [IMAPIAdviseSink::OnNotify](imapiadvisesink-onnotify.md) method for the advise sink object specified in the _lpAdviseSink_ parameter. The **OnNotify** method includes a [NOTIFICATION](notification.md) structure as an input parameter that contains data to describe the event. 
     *   
     * Depending on the address book provider, the call to **OnNotify** can occur immediately following the change to the registered object or at a later time. On systems that support multiple threads of execution, the call to **OnNotify** can occur on any thread. Clients can request that these notifications occur on a particular thread by calling the [HrThisThreadAdviseSink](hrthisthreadadvisesink.md) function to create the advise sink object that is passed to **Advise**. 
     *   
     * Because an address book provider can release the advise sink object passed in by clients at any time after the successful completion of the **Advise** call and before an [IAddrBook::Unadvise](iaddrbook-unadvise.md) call to cancel the notification, clients should release their advise sink objects when **Advise** returns. 
     *   
     * For more information about the notification process, see [Event Notification in MAPI](event-notification-in-mapi.md).
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer<ENTRYID>} lpEntryID > [in] A pointer to the entry identifier of the address book container, messaging user, or distribution list that will generate a notification when a change occurs of the type or types described in the _ulEventMask_ parameter.
     * @param {Integer} ulEventMask > [in] One or more notification events that the caller is registering to receive. Each event is associated with a particular notification structure that contains information about the change that occurred. The following table lists the valid values for  _ulEventMask_ and their corresponding structures. 
     *     
     * |**Notification event**|**Corresponding structure**|
     * |:-----|:-----|
     * |**fnevCriticalError** <br/> |[ERROR_NOTIFICATION](error_notification.md) <br/> |
     * |**fnevObjectCreated** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevObjectDeleted** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevObjectModified** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevObjectCopied** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevObjectMoved** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevTableModified** <br/> |[TABLE_NOTIFICATION](table_notification.md) <br/> |
     * @param {IMAPIAdviseSink} lpAdviseSink > [in] A pointer to the advise sink object to be called when the event for which notification has been requested occurs.
     * @param {Pointer<Integer>} lpulConnection > [out] A pointer to a nonzero connection number that represents the notification registration.
     * @returns {HRESULT} S_OK 
     *   
     * > The notification registration was successful.
     *     
     * MAPI_E_INVALID_ENTRYID 
     *   
     * > The address book provider responsible for the entry identifier passed in  _lpEntryID_ could not register a notification for the corresponding entry. 
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > Notification is not supported by the address book provider responsible for the object identified by the entry identifier passed in the _lpEntryID_ parameter. 
     *     
     * MAPI_E_UNKNOWN_ENTRYID 
     *   
     * > The entry identifier passed in  _lpEntryID_ cannot be handled by any of the address book providers in the profile.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-advise
     */
    Advise(cbEntryID, lpEntryID, ulEventMask, lpAdviseSink, lpulConnection) {
        lpulConnectionMarshal := lpulConnection is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulEventMask, "ptr", lpAdviseSink, lpulConnectionMarshal, lpulConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * Clients call the **Unadvise** method to stop receiving notifications about changes to a particular address book entry. When a notification registration is canceled, the address book provider releases its pointer to the caller's advise sink. However, the release can occur during the **Unadvise** call or at some later point, if another thread is in the process of calling the [IMAPIAdviseSink::OnNotify](imapiadvisesink-onnotify.md) method. When a notification is in progress, the release is delayed until the **OnNotify** method returns.
     * @param {Integer} ulConnection > [in] A connection number that represents the registration to be canceled. The  _ulConnection_ parameter should contain a value returned by a prior call to the [IAddrBook::Advise](iaddrbook-advise.md) method.
     * @returns {HRESULT} S_OK 
     *   
     * > The registration was successfully canceled.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-unadvise
     */
    Unadvise(ulConnection) {
        result := ComCall(17, this, "uint", ulConnection, "HRESULT")
        return result
    }

    /**
     * This article describes the IAddrBookCreateOneOff function and provides syntax, parameters, and return value.
     * @remarks
     * Clients call the **CreateOneOff** method to create an entry identifier for a one-off recipient — a recipient that does not belong to any of the containers from any of the currently loaded address book providers. One-off recipients can have any kind of address that is supported by one of the active address book providers for the session. 
     *   
     * One-off recipients are typically created with a template for their particular address type. The address book provider that supports the address type supplies the template. A user of a client application enters the relevant information into the template.
     *   
     * MAPI supports Unicode character strings for the display name, address type, and address parameters of **CreateOneOff**.
     *   
     * The MAPI_SEND_NO_RICH_INFO flag controls whether formatted text in Rich Text Format (RTF) is sent along with each message. The Transport Neutral Encapsulation Format (TNEF) — a format that is used for transmitting formatted text — is sent by most transport providers, regardless of how the recipient sets its **PR_SEND_RICH_INFO** property. This is not an issue for messaging clients that work with interpersonal messages. However, because TNEF is typically used to send custom properties for custom message classes, not supporting it can be a problem for form-based clients or clients that require custom MAPI properties. For more information, see [Sending Messages with TNEF](sending-messages-with-tnef.md).
     * @param {Pointer<Integer>} lpszName > [in] A pointer to the value of the recipient's **PR_DISPLAY_NAME** ([PidTagDisplayName](pidtagdisplayname-canonical-property.md)) property. The  _lpszName_ parameter can be NULL.
     * @param {Pointer<Integer>} lpszAdrType > [in] A pointer to the address type of the recipient, such as FAX or SMTP. The  _lpszAdrType_ parameter cannot be NULL.
     * @param {Pointer<Integer>} lpszAddress > [in] A pointer to the address of the recipient. The  _lpszAddress_ parameter cannot be NULL.
     * @param {Integer} ulFlags > [in] A bitmask of flags that affects the one-off recipient. The following flags can be set:
     *     
     * MAPI_SEND_NO_RICH_INFO 
     *   
     * > The recipient cannot handle formatted message content. If MAPI_SEND_NO_RICH_INFO is set, MAPI sets the recipient's **PR_SEND_RICH_INFO** ([PidTagSendRichInfo](pidtagsendrichinfo-canonical-property.md)) property to FALSE. If MAPI_SEND_NO_RICH_INFO is not set, MAPI sets this property to TRUE unless the recipient's messaging address pointed to by  _lpszAddress_ is interpreted to be an Internet address. In this case, MAPI sets **PR_SEND_RICH_INFO** to FALSE. 
     *     
     * MAPI_UNICODE 
     *   
     * > The display name, address type, and address are in Unicode format. If the MAPI_UNICODE flag is not set, these strings are in ANSI format.
     * @param {Pointer<Integer>} lpcbEntryID > [out] A pointer to the byte count in the entry identifier pointed to by the  _lppEntryID_ parameter.
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID > [out] A pointer to a pointer to the entry identifier for the one-off recipient.
     * @returns {HRESULT} S_OK 
     *   
     * > The one-off entry identifier was created successfully.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-createoneoff
     */
    CreateOneOff(lpszName, lpszAdrType, lpszAddress, ulFlags, lpcbEntryID, lppEntryID) {
        lpszNameMarshal := lpszName is VarRef ? "char*" : "ptr"
        lpszAdrTypeMarshal := lpszAdrType is VarRef ? "char*" : "ptr"
        lpszAddressMarshal := lpszAddress is VarRef ? "char*" : "ptr"
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, lpszNameMarshal, lpszName, lpszAdrTypeMarshal, lpszAdrType, lpszAddressMarshal, lpszAddress, "uint", ulFlags, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **NewEntry** method creates a new address book entry, to be added directly into a container or to be used to address an outgoing message.
     * @param {Integer} ulUIParam > [in] A handle to the parent window for the dialog box.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the text that is used. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The passed-in strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @param {Integer} cbEIDContainer > [in] The byte count in the entry identifier pointed to by the  _lpEIDContainer_ parameter.
     * @param {Pointer<ENTRYID>} lpEIDContainer > [in] A pointer to the entry identifier of the container where the new recipient is to be added. If the  _cbEIDContainer_ parameter is zero, the **NewEntry** method returns a recipient entry identifier and a list of templates as if the [IAddrBook::CreateOneOff](iaddrbook-createoneoff.md) method was called.
     * @param {Integer} cbEIDNewEntryTpl > [in] The byte count in the entry identifier pointed to by the  _lpEIDNewEntryTpl_ parameter.
     * @param {Pointer<ENTRYID>} lpEIDNewEntryTpl > [in] A pointer to a one-off template that will be used to create the new recipient. If  _cbEIDNewEntryTpl_ is zero and  _lpEIDNewEntryTpl_ is NULL, **NewEntry** displays a dialog box with which the user can select from a list of templates for adding new entries.
     * @param {Pointer<Integer>} lpcbEIDNewEntry > [out] A pointer to the byte count in the entry identifier pointed to by the  _lppEIDNewEntry_ parameter.
     * @param {Pointer<Pointer<ENTRYID>>} lppEIDNewEntry > [out] A pointer to a pointer to the new recipient's entry identifier.
     * @returns {HRESULT} S_OK 
     *   
     * > The new address book entry was successfully created.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-newentry
     */
    NewEntry(ulUIParam, ulFlags, cbEIDContainer, lpEIDContainer, cbEIDNewEntryTpl, lpEIDNewEntryTpl, lpcbEIDNewEntry, lppEIDNewEntry) {
        lpcbEIDNewEntryMarshal := lpcbEIDNewEntry is VarRef ? "uint*" : "ptr"
        lppEIDNewEntryMarshal := lppEIDNewEntry is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, "uint", ulUIParam, "uint", ulFlags, "uint", cbEIDContainer, "ptr", lpEIDContainer, "uint", cbEIDNewEntryTpl, "ptr", lpEIDNewEntryTpl, lpcbEIDNewEntryMarshal, lpcbEIDNewEntry, lppEIDNewEntryMarshal, lppEIDNewEntry, "HRESULT")
        return result
    }

    /**
     * The IAddrBookResolveName function performs name resolution, assigning entry identifiers to recipients in a recipient list.
     * @remarks
     * Clients and service providers call the **ResolveName** method to initiate the name resolution process. An unresolved entry is an entry that does not yet have an entry identifier or **PR_ENTRYID** ([PidTagEntryId](pidtagentryid-canonical-property.md)) property.
     *   
     *  **ResolveName** goes through the following process for each unresolved entry in the address list passed in the _lpAdrList_ parameter. 
     *   
     * 1. If the address type of the recipient adheres to the format of an SMTP address ( _displayname_@ _domain.top-level-domain_), **ResolveName** assigns it a one-off entry identifier. 
     *     
     * 2. For each container in the **PR_AB_SEARCH_PATH** ([PidTagAbSearchPath](pidtagabsearchpath-canonical-property.md)) property, **ResolveName** calls the [IABContainer::ResolveNames](iabcontainer-resolvenames.md) method. **ResolveNames** tries to match the display name of each unresolved recipient with a display name that belongs to one of its entries. 
     *     
     * 3. If a container does not support **ResolveNames**, **ResolveName** restricts the container's contents table by using a **PR_ANR** ([PidTagAnr](pidtaganr-canonical-property.md)) property restriction. This restriction causes the container to perform a "best guess" type of search to locate a matching recipient. All containers must support the **PR_ANR** property restriction. 
     *     
     * 4. When a container returns a recipient that matches multiple names, **ResolveName** displays a dialog box if the MAPI_DIALOG flag is set, which lets the user select the correct name. 
     *     
     * 5. If all of the containers in the **PR_AB_SEARCH_PATH** property have been called and no match has been found, the recipient remains unresolved. 
     *     
     * If one or more recipients are unresolved, **ResolveName** returns MAPI_E_NOT_FOUND. If one or more recipients had ambiguous resolution that could not be resolved with a dialog box, or because the MAPI_DIALOG flag was not set, **ResolveName** returns MAPI_E_AMBIGUOUS_RECIP. When some of the recipients are ambiguous and some cannot be resolved, **ResolveName** can return either error value. 
     *   
     * If a name cannot be resolved, the client can create a one-off address that has a specially formatted address and entry identifier. For more information about the format of one-off entry identifiers, see [One-Off Entry Identifiers](one-off-entry-identifiers.md). For more information about the format of one-off addresses, see [One-Off Addresses](one-off-addresses.md).
     *   
     * MAPI supports Unicode character strings for the **ADRLIST** and the new entry title parameters to **ResolveName**; if you set the MAPI_UNICODE flag, the following properties are returned as type PT_UNICODE in the [ADRENTRY](adrentry.md) structures: 
     *   
     * - **PR_ADDRTYPE** ([PidTagAddressType](pidtagaddresstype-canonical-property.md))
     *     
     * - **PR_DISPLAY_NAME** ([PidTagDisplayName](pidtagdisplayname-canonical-property.md))
     *     
     * - **PR_EMAIL_ADDRESS** ([PidTagEmailAddress](pidtagemailaddress-canonical-property.md))
     *     
     * - **PR_TRANSMITABLE_DISPLAY_NAME** ([PidTagTransmittableDisplayName](pidtagtransmittabledisplayname-canonical-property.md))
     *     
     * However, the **PR_7BIT_DISPLAY_NAME** ([PidTag7BitDisplayName](pidtag7bitdisplayname-canonical-property.md)) property is always returned as type PT_STRING8.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of a dialog box that is shown, if specified, to prompt the user to resolve ambiguity.
     * @param {Integer} ulFlags > [in] A bitmask of flags that control various aspects of the resolution process. The following flags can be set:
     *     
     * AB_UNICODEUI
     *   
     * > Indicates that  _lpszNewEntryTitle_ is a UNICODE string. 
     *     
     * MAPI_CACHE_ONLY
     *   
     * > Use only the offline address book to perform name resolution. For example, you can use this flag to allow a client application to open the global address list (GAL) in cached exchange mode and access an entry in that address book from the cache without creating traffic between the client and the server. This flag is supported only by the Exchange Address Book Provider.
     *     
     * MAPI_DIALOG 
     *   
     * > Displays a dialog box to prompt the user for additional name resolution information. If this flag is not set, no dialog box is displayed. 
     *     
     * MAPI_UNICODE 
     *   
     * > Indicates that the properties returned in the address list should be of type PT_UNICODE instead of PT_STRING8.
     * @param {Pointer<Integer>} lpszNewEntryTitle > [in] A pointer to text for the title of the control in the dialog box that prompts the user to enter a recipient. The title varies depending on the type of recipient. The  _lpszNewEntryTitle_ parameter can be NULL.
     * @param {Pointer<ADRLIST>} lpAdrList > [in-out] A pointer to an [ADRLIST](adrlist.md) structure that contains the list of recipient names to be resolved. This **ADRLIST** structure can be created by the [IAddrBook::Address](iaddrbook-address.md) method.
     * @returns {HRESULT} S_OK 
     *   
     * > The name resolution process succeeded.
     *     
     * MAPI_E_AMBIGUOUS_RECIP 
     *   
     * > At least one recipient in the _lpAdrList_ parameter matched more than one entry in the address book. Usually, this value is returned when the MAPI_DIALOG flag is set, prohibiting the display of a dialog box. 
     *     
     * MAPI_E_NOT_FOUND 
     *   
     * > At least one recipient in the _lpAdrList_ parameter cannot be resolved. Usually, this value is returned when the MAPI_DIALOG flag is set, prohibiting the display of a dialog box.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-resolvename
     */
    ResolveName(ulUIParam, ulFlags, lpszNewEntryTitle, lpAdrList) {
        lpszNewEntryTitleMarshal := lpszNewEntryTitle is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "ptr", ulUIParam, "uint", ulFlags, lpszNewEntryTitleMarshal, lpszNewEntryTitle, "ptr", lpAdrList, "HRESULT")
        return result
    }

    /**
     * This article describes the IAddrBookAddress function and provides syntax, parameters, and return value.
     * @remarks
     * If the **ulFlags** member of the  _lpAdrParms_ parameter is set to DIALOG_SDI anticipating the return of the window handle of the modeless dialog box on output, it is ignored in Outlook; the modal version of the dialog is always shown in non-Outlook clients. 
     *   
     * The **ADRLIST** structure passed back by MAPI to the caller through the  _lppAdrList_ parameter contains an array of [ADRENTRY](adrentry.md) structures, one structure for each recipient. When passed to an outgoing message's [IMessage::ModifyRecipients](imessage-modifyrecipients.md) method in the _lpMods_ parameter, the **ADRLIST** structure can be used to update its recipient list. 
     *   
     * Each **ADRENTRY** structure in the **ADRLIST** structure contains zero or more [SPropValue](spropvalue.md) structures, one structure for every property set for the recipient. There can be zero **SPropValue** structures when the dialog box presented by the **Address** method is used to remove a recipient. When there are one or more **SPropValue** structures, the corresponding **ADRENTRY** structure is used to add or update a recipient. The recipient can be resolved, which indicates that one of the **SPropValue** structures describes the recipient's **PR_ENTRYID** ([PidTagEntryId](pidtagentryid-canonical-property.md)) property, or unresolved, which indicates that the **PR_ENTRYID** property is missing. 
     *   
     * In addition to **PR_ENTRYID**, resolved recipients include the following properties:
     *   
     * - **PR_RECIPIENT_TYPE** ([PidTagRecipientType](pidtagrecipienttype-canonical-property.md))
     *     
     * - **PR_DISPLAY_NAME** ([PidTagDisplayName](pidtagdisplayname-canonical-property.md))
     *     
     * - **PR_ADDRTYPE** ([PidTagAddressType](pidtagaddresstype-canonical-property.md))
     *     
     * - **PR_DISPLAY_TYPE** ([PidTagDisplayType](pidtagdisplaytype-canonical-property.md))
     *     
     * The **ADRLIST** structure that the caller passes in might be a different size from the structure that MAPI returns. If MAPI must return a larger **ADRLIST** structure, it frees the original structure and allocates a new one. When you allocate memory for the **ADRLIST** structure, allocate the memory for each **SPropValue** structure separately. For more information about how to allocate and free **ADRLIST** structures, see [Managing Memory for ADRLIST and SRowSet Structures](managing-memory-for-adrlist-and-srowset-structures.md)
     *   
     *  **Address** returns immediately if the DIALOG_SDI flag is set in the **ulFlags** member of the **ADRPARM** structure in the _lpAdrParms_ parameter. The DIALOG_SDI flag is ignored for non-Outlook clients. If DIALOG_SDI is ignored, the modal version of the dialog will be displayed and a pointer to a handle should not be expected in  _lpulUIParam_.
     *   
     *  **Address** supports Unicode character strings in the **ADRPARM** structure if AB_UNICODEUI was specified in the **ulFlags** member of **ADRPARM** in the _lpAdrParms_ parameter, and it supports Unicode character strings in **ADRLIST**. The Unicode strings are converted to the multibyte character string (MBCS) format before they are displayed in the Outlook address book dialog box.
     * @param {Pointer<Integer>} lpulUIParam > [in, out] A pointer to a handle of the parent window of the dialog box. On input, a window handle must always be passed. On output, if the **ulFlags** member of the  _lpAdrParms_ parameter is set to DIALOG_SDI, the window handle of the modeless dialog box is returned. See Remarks.
     * @param {Pointer<ADRPARM>} lpAdrParms > [in, out] A pointer to an [ADRPARM](adrparm.md) structure that controls the presentation and behavior of the address dialog box.
     * @param {Pointer<Pointer<ADRLIST>>} lppAdrList > [in, out] A pointer to a pointer to an [ADRLIST](adrlist.md) structure that contains recipient information. On input, this parameter can be NULL or point to a valid pointer. On output, this parameter points to a pointer to valid recipient information.
     * @returns {HRESULT} S_OK 
     *   
     * > The common address dialog box was successfully displayed.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-address
     */
    Address(lpulUIParam, lpAdrParms, lppAdrList) {
        lpulUIParamMarshal := lpulUIParam is VarRef ? "uint*" : "ptr"
        lppAdrListMarshal := lppAdrList is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, lpulUIParamMarshal, lpulUIParam, "ptr", lpAdrParms, lppAdrListMarshal, lppAdrList, "HRESULT")
        return result
    }

    /**
     * The IAddrBookDetails function displays a dialog box that shows details about a particular address book entry.
     * @remarks
     * Client applications call the **Details** method to display a dialog box that provides details about a particular entry in the address book. You can use the _lpfButtonCallback_, _lpvButtonContext_, and _lpszButtonText_ parameters to add a client-defined button to the dialog box. When the button is clicked, MAPI calls the callback function pointed to by _lpfButtonCallback_, passing both the entry identifier of the button and the data in _lpvButtonContext_. If you do not need an extensible button, _lpszButtonText_ should be NULL.
     *   
     *  **Details** supports Unicode character strings; Unicode strings are converted to the multibyte character string (MBCS) format before they are displayed in the details dialog box.
     * @param {Pointer<Pointer>} lpulUIParam > [in] A pointer to a handle of the parent window for the dialog box.
     * @param {Pointer<LPFNDISMISS>} _lpfnDismiss 
     * @param {Pointer<Void>} lpvDismissContext > [in] A pointer to context information to pass to the **DISMISSMODELESS** function pointed to by the  _lpfnDismiss_ parameter. This parameter applies only to the modeless version of the dialog box, by including the DIALOG_SDI flag in the _ulFlags_ parameter.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer<ENTRYID>} lpEntryID > [in] A pointer to the entry identifier for the entry for which details are displayed.
     * @param {Pointer<LPFNBUTTON>} lpfButtonCallback > [in] A pointer to a function based on the [LPFNBUTTON](lpfnbutton.md) function prototype. An **LPFNBUTTON** function adds a button to the details dialog box.
     * @param {Pointer<Void>} lpvButtonContext > [in] A pointer to data that was used as a parameter for the function specified by the _lpfButtonCallback_ parameter.
     * @param {Pointer<Integer>} lpszButtonText > [in] A pointer to a string that contains text to be applied to the added button, if that button is extensible. The _lpszButtonText_ parameter should be NULL if you do not need an extensible button.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the text for the _lpszButtonText_ parameter. The following flags can be set:
     * 
     * AB_TELL_DETAILS_CHANGE
     * 
     * > Indicates that **Details** returns S_OK if changes are actually made to the address; otherwise, **Details** returns S_FALSE.
     * 
     * DIALOG_MODAL
     * 
     * > Display the modal version of the common address dialog box, which is always shown in non-Outlook clients. This flag is mutually exclusive with DIALOG_SDI.
     * 
     * DIALOG_SDI
     * 
     * > Display the modeless version of the common address dialog box. This flag is ignored for non-Outlook clients.
     * 
     * MAPI_UNICODE
     * 
     * > The passed-in strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @returns {HRESULT} S_OK
     * 
     * > The details dialog box was successfully displayed for the address book entry.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-details
     */
    Details(lpulUIParam, _lpfnDismiss, lpvDismissContext, cbEntryID, lpEntryID, lpfButtonCallback, lpvButtonContext, lpszButtonText, ulFlags) {
        lpulUIParamMarshal := lpulUIParam is VarRef ? "ptr*" : "ptr"
        lpvDismissContextMarshal := lpvDismissContext is VarRef ? "ptr" : "ptr"
        lpvButtonContextMarshal := lpvButtonContext is VarRef ? "ptr" : "ptr"
        lpszButtonTextMarshal := lpszButtonText is VarRef ? "char*" : "ptr"

        result := ComCall(22, this, lpulUIParamMarshal, lpulUIParam, "ptr", _lpfnDismiss, lpvDismissContextMarshal, lpvDismissContext, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpfButtonCallback, lpvButtonContextMarshal, lpvButtonContext, lpszButtonTextMarshal, lpszButtonText, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * This method is not implemented. (IAddrBook::RecipOptions)
     * @param {Integer} ulUIParam Not implemented
     * @param {Integer} ulFlags Not implemented.
     * @param {Pointer<ADRENTRY>} lpRecip Not implemented.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabiab/nf-wabiab-iaddrbook-recipoptions
     */
    RecipOptions(ulUIParam, ulFlags, lpRecip) {
        result := ComCall(23, this, "uint", ulUIParam, "uint", ulFlags, "ptr", lpRecip, "HRESULT")
        return result
    }

    /**
     * This method is not implemented. (IAddrBook::QueryDefaultRecipOpt)
     * @param {Pointer<Integer>} lpszAdrType Not implemented.
     * @param {Integer} ulFlags Not implemented.
     * @param {Pointer<Integer>} lpcValues Not implemented.
     * @param {Pointer<Pointer<SPropValue>>} lppOptions Not implemented.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabiab/nf-wabiab-iaddrbook-querydefaultrecipopt
     */
    QueryDefaultRecipOpt(lpszAdrType, ulFlags, lpcValues, lppOptions) {
        lpszAdrTypeMarshal := lpszAdrType is VarRef ? "char*" : "ptr"
        lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"
        lppOptionsMarshal := lppOptions is VarRef ? "ptr*" : "ptr"

        result := ComCall(24, this, lpszAdrTypeMarshal, lpszAdrType, "uint", ulFlags, lpcValuesMarshal, lpcValues, lppOptionsMarshal, lppOptions, "HRESULT")
        return result
    }

    /**
     * The IAddrBookGetPAB returns the entry identifier of the container that is designated as the personal address book (PAB).
     * @remarks
     * Clients call the **GetPAB** method to retrieve the entry identifier of the container designated as the PAB. If a PAB has not been established in the profile, MAPI selects as the PAB the first container in the address book hierarchy that allows modifications.
     * @param {Pointer<Integer>} lpcbEntryID > [out] A pointer to the byte count in the entry identifier pointed to by the  _lppEntryID_ parameter.
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID > [out] A pointer to a pointer to the entry identifier of the PAB. The  _lppEntryID_ parameter contains zero if no container has been designated as the PAB.
     * @returns {HRESULT} S_OK 
     *   
     * > The entry identifier of the PAB was successfully returned.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-getpab
     */
    GetPAB(lpcbEntryID, lppEntryID) {
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"

        result := ComCall(25, this, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, "HRESULT")
        return result
    }

    /**
     * This article describes the IAddrBookSetPAB function and  provides syntax, parameters, return value, and additional remarks.
     * @remarks
     * Clients and service providers call the **SetPAB** method to designate a particular container as the PAB. The PAB is a container that consists of entries copied from other containers as well as new entries. 
     *   
     * A call to **SetPAB** establishes a container as the PAB until that container is made unavailable or a new container becomes the PAB through a subsequent call to **SetPAB**. 
     *   
     * Clients and providers do not have to call the [IMAPIProp::SaveChanges](imapiprop-savechanges.md) method to make the PAB change permanent.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer<ENTRYID>} lpEntryID > [in] A pointer to the entry identifier of the container to be designated as the PAB. The  _lpEntryID_ parameter cannot be NULL.
     * @returns {HRESULT} S_OK 
     *   
     * > The specified container has been established as the PAB.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-setpab
     */
    SetPAB(cbEntryID, lpEntryID) {
        result := ComCall(26, this, "uint", cbEntryID, "ptr", lpEntryID, "HRESULT")
        return result
    }

    /**
     * The IAddrBookGetDefaultDir function returns the entry identifier for the initial address book container.
     * @remarks
     * Client applications and service providers call the **GetDefaultDir** method to retrieve the entry identifier of the default address book container. The default container is what the user sees displayed in the address book when the address book is first opened. If a default container has not been set by a call to the [IAddrBook::SetDefaultDir](iaddrbook-setdefaultdir.md) method, MAPI assigns as the default container the first container with names that is not the personal address book (PAB). If such a container cannot be found, the PAB becomes the default container. 
     *   
     * To set the default directory, a client or provider calls the **SetDefaultDir** method. Clients and providers do not have to call the [IMAPIProp::SaveChanges](imapiprop-savechanges.md) method; because changes to the address book are not transacted, changes are immediately made permanent.
     * @param {Pointer<Integer>} lpcbEntryID > [out] A pointer to the byte count in the entry identifier pointed to by the  _lppEntryID_ parameter.
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID > [out] A pointer to a pointer to the entry identifier of the default container.
     * @returns {HRESULT} S_OK 
     *   
     * > The entry identifier of the default container was successfully returned.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-getdefaultdir
     */
    GetDefaultDir(lpcbEntryID, lppEntryID) {
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"

        result := ComCall(27, this, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, "HRESULT")
        return result
    }

    /**
     * This article describes the IAddrBookSetDefaultDir function and provides syntax, parameters, return value, and additional remarks.
     * @remarks
     * Clients and service providers call the **SetDefaultDir** method to establish a new default address book container. The default container is the container that the user sees displayed in the address book when the address book is first opened. **SetDefaultDir** saves the default container as an entry in the profile. The container remains as the default until either another call to **SetDefaultDir** is made in the same session or in another session, or the container is removed. 
     *   
     * > [!NOTE]
     * > The [PR_AB_CHOOSE_DIRECTORY_AUTOMATICALLY](pidtagaddressbookchoosedirectoryautomatically-canonical-property.md) property corresponds to the **Choose automatically** setting in the Address Book Options dialog. When this property exists in the [IID_CAPONE_PROF](https://msdn.microsoft.com/library/281aabc3-9656-299c-4c78-7733dc71050a%28Office.15%29.aspx) profile section and is set to **true**, the Address Book dialog no longer defaults to the container specified by **SetDefaultDir**, but chooses an address book that Microsoft Outlook considers appropriate for the context in which the dialog was displayed. Note that this may result in a poor experience for third-party address book providers.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer<ENTRYID>} lpEntryID > [in] A pointer to the entry identifier of the default address book container.
     * @returns {HRESULT} S_OK 
     *   
     * > The default address book container was successfully set.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-setdefaultdir
     */
    SetDefaultDir(cbEntryID, lpEntryID) {
        result := ComCall(28, this, "uint", cbEntryID, "ptr", lpEntryID, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * Clients and service providers call the **GetSearchPath** method to get the search path that is used to resolve names with the **ResolveName** method. Typically, clients call the [IAddrBook::SetSearchPath](iaddrbook-setsearchpath.md) method to establish a container search path in the profile before they call **GetSearchPath** to retrieve it. However, calling **SetSearchPath** is optional. 
     *   
     * If **SetSearchPath** has never been called, **GetSearchPath** builds a path by working through the address book's hierarchy tables. The default search path established by **GetSearchPath** consists of the following containers in the following order: 
     *   
     * 1. The first container with read/write permission, usually the personal address book (PAB).
     *     
     * 2. Every container that has its **PR_DISPLAY_TYPE** ([PidTagDisplayType](pidtagdisplaytype-canonical-property.md)) property set to DT_GLOBAL. This setting indicates that the container holds recipients. 
     *     
     * 3. The container designated as the default, if there are no containers that have the DT_GLOBAL flag set in their **PR_DISPLAY_TYPE** property and the default container differs from the first container with read/write permission. 
     *     
     * If **SetSearchPath** has been called, **GetSearchPath** builds a path by using the address book containers that have been stored in the profile. **GetSearchPath** validates this path before it returns it to the caller. 
     *   
     * After the first call to **SetSearchPath**, subsequent calls to **SetSearchPath** must be used to modify the search path returned by **GetSearchPath**. In other words, the calling client or provider does not receive the default search path after the first call to **SetSearchPath**.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the strings returned in the search path. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The returned strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @param {Pointer<Pointer<SRowSet>>} lppSearchPath > [out] A pointer to a pointer to an ordered list of container entry identifiers. **GetSearchPath** stores the ordered list in an [SRowSet](srowset.md) structure. If there are no containers in the address book hierarchy, zero is returned in the **SRowSet** structure.
     * @returns {HRESULT} S_OK 
     *   
     * > The search path was successfully retrieved.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-getsearchpath
     */
    GetSearchPath(ulFlags, lppSearchPath) {
        lppSearchPathMarshal := lppSearchPath is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, "uint", ulFlags, lppSearchPathMarshal, lppSearchPath, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * Clients and service providers call the **SetSearchPath** method to save changes that were made to the container search order that is used to resolve names with the [IAddrBook::ResolveName](iaddrbook-resolvename.md) method. The search path is saved between instances of a session. 
     *   
     * Clients and providers do not have to call the [IMAPIProp::SaveChanges](imapiprop-savechanges.md) method to make the search path changes permanent.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {Pointer<SRowSet>} lpSearchPath > [in] A pointer to the [SRowSet](srowset.md) structure used to hold the search path. The first property for each **aRow** member in **SRowSet** must be **PR_ENTRYID** ([PidTagEntryId](pidtagentryid-canonical-property.md)).
     * @returns {HRESULT} S_OK 
     *   
     * > The search path was successfully set.
     *     
     * MAPI_E_MISSING_REQUIRED_COLUMN 
     *   
     * > One of the containers described in the **SRowSet** structure did not include its **PR_ENTRYID** property.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-setsearchpath
     */
    SetSearchPath(ulFlags, lpSearchPath) {
        result := ComCall(30, this, "uint", ulFlags, "ptr", lpSearchPath, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * Clients and service providers call the **PrepareRecips** method to do the following: 
     *   
     * - Ensure that all recipients in the _lpRecipList_ parameter have long-term entry identifiers. 
     *     
     * - Ensure that each recipient in the _lpRecipList_ parameter has the properties listed in the _lpSPropTagArray_ parameter and that these properties appear at the start of the recipient list. 
     *     
     * MAPI converts each recipient's short-term entry identifiers to long-term entry identifiers. If necessary, recipients' long-term entry identifiers are retrieved from the appropriate address book provider and any additional properties are requested.
     *   
     * In an individual recipient entry, the requested properties are ordered first, followed by any properties that were already present for the entry. If one or more of the requested properties in the _lpSPropTagArray_ parameter are not handled by the appropriate address book provider, their property types will be set to PT_ERROR. Their property values will be set to either to MAPI_E_NOT_FOUND or to another value that gives a more specific reason why the properties are not available. Each [SPropValue](spropvalue.md) structure included in the _lpRecipList_ parameter must be separately allocated by using the [MAPIAllocateBuffer](mapiallocatebuffer.md) and [MAPIAllocateMore](mapiallocatemore.md) functions so that it can be freed individually. 
     *   
     * For information about PT_ERROR, see [Property Types](property-types.md).
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the entry is opened. The following flag can be set:
     *     
     * MAPI_CACHE_ONLY
     *   
     * > Use only the offline address book to perform name resolution. For example, you can use this flag to allow a client application to open the global address list (GAL) in cached exchange mode and to access an entry in that address book from the cache without creating traffic between the client and the server. This flag is supported only by the Exchange Address Book Provider.
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Pointer<ADRLIST>} lpRecipList > [in] A pointer to an [ADRLIST](adrlist.md) structure that contains the list of recipients.
     * @returns {HRESULT} S_OK 
     *   
     * > The recipient list was successfully prepared.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iaddrbook-preparerecips
     */
    PrepareRecips(ulFlags, lpPropTagArray, lpRecipList) {
        result := ComCall(31, this, "uint", ulFlags, "ptr", lpPropTagArray, "ptr", lpRecipList, "HRESULT")
        return result
    }
}
