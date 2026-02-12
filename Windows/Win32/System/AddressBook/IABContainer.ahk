#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk
#Include .\FlagList.ahk
#Include .\IMAPIContainer.ahk

/**
 * Do not use. This interface provides access to address book containers. Applications call the methods of the interface to perform name resolution and to create, copy, and delete recipients.
 * @see https://learn.microsoft.com/windows/win32/api//content/wabdefs/nn-wabdefs-iabcontainer
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IABContainer extends IMAPIContainer{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEntry", "CopyEntries", "DeleteEntries", "ResolveNames"]

    /**
     * 
     * @remarks
     * The **IABContainer::CreateEntry** method creates a new entry of a particular type in the specified container, returning a pointer to an interface implementation for further access to the entry. The new entry is created by using a template that has been selected from the container's list of available templates published in its one-off table. Callers access a container's one-off table by calling its [IMAPIProp::OpenProperty](imapiprop-openproperty.md) method and requesting the **PR_CREATE_TEMPLATES** ([PidTagCreateTemplates](pidtagcreatetemplates-canonical-property.md)) property.
     * @param {Integer} cbEntryID > [in] The count of the bytes in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier of a template for creating new entries of a particular type.
     * @param {Integer} ulCreateFlags > [in] A bitmask of flags that controls how entry creation is performed. The following flags can be set:
     *     
     * CREATE_CHECK_DUP_LOOSE 
     *   
     * > A loose level of duplicate entry checking should be performed. The implementation of loose duplicate entry checking is provider specific. For example, a provider can define a loose match as any two entries that have the same display name.
     *     
     * CREATE_CHECK_DUP_STRICT 
     *   
     * > A strict level of duplicate entry checking should be performed. The implementation of strict duplicate entry checking is provider specific. For example, a provider can define a strict match as any two entries that have both the same display name and messaging address.
     *     
     * CREATE_REPLACE 
     *   
     * > A new entry should replace an existing one if it is determined that the two are duplicates.
     * @returns {IMAPIProp} > [out] A pointer to a pointer to the newly created entry.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iabcontainer-createentry
     */
    CreateEntry(cbEntryID, lpEntryID, ulCreateFlags) {
        result := ComCall(19, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulCreateFlags, "ptr*", &lppMAPIPropEntry := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMAPIProp(lppMAPIPropEntry)
    }

    /**
     * 
     * @remarks
     * The **IABContainer::CopyEntries** method copies entries from the same container or a different container. A call to **CopyEntries** is functionally equivalent to making the following calls for each entry to be copied: 
     *   
     * 1. The [IABContainer::CreateEntry](iabcontainer-createentry.md) method to create the new entry. 
     *     
     * 2. The [IMAPIProp::GetProps](imapiprop-getprops.md) method to read properties from the entry to be copied. 
     *     
     * 3. The [IMAPIProp::SetProps](imapiprop-setprops.md) method to write properties to the new entry. 
     *     
     * 4. The new entry's [IMAPIProp::SaveChanges](imapiprop-savechanges.md) method to perform a save. 
     *     
     * 5. The new entry's [IUnknown::Release](https://msdn.microsoft.com/library/ms682317%28VS.85%29.aspx) method to release the container's reference.
     * @param {Pointer<SBinaryArray>} lpEntries > [in] A pointer to an array of [ENTRYLIST](entrylist.md) structures that contains the entry identifiers of the entries to copy.
     * @param {Pointer} ulUIParam > [in] The handle to the parent window of any dialog boxes or windows that this method displays. The  _ulUIParam_ parameter must be zero if the AB_NO_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {IMAPIProgress} lpProgress > [in] A pointer to a progress object that displays a progress indicator, or NULL. If  _lpProgress_ is NULL, a progress indicator should be displayed by using the progress object supplied by MAPI through the [IMAPISupport::DoProgressDialog](imapisupport-doprogressdialog.md) method. The  _lpProgress_ parameter is ignored if the AB_NO_DIALOG flag is set in  _ulFlags_.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the copy operation is performed. The following flags can be set:
     *     
     * AB_NO_DIALOG 
     *   
     * > Suppresses display of a progress indicator. If this flag is not set, a progress indicator is displayed.
     *     
     * CREATE_CHECK_DUP_LOOSE 
     *   
     * > Indicates that a loose level of duplicate entry checking should be performed. The implementation of loose duplicate entry checking is provider specific. For example, a provider can define a loose match as any two entries that have the same display name.
     *     
     * CREATE_CHECK_DUP_STRICT 
     *   
     * > Indicates that a strict level of duplicate entry checking should be performed. The implementation of strict duplicate entry checking is provider specific. For example, a provider can define a strict match as any two entries that have both the same display name and messaging address.
     *     
     * CREATE_REPLACE 
     *   
     * > Indicates that a new entry should replace an existing one if it is determined that the two are duplicates.
     * @returns {HRESULT} S_OK 
     *   
     * > The copy operation succeeded.
     *     
     * MAPI_W_PARTIAL_COMPLETION 
     *   
     * > The copy operation succeeded overall, but one or more of the entries could not be copied. When this value is returned, the call should be handled as successful. To test for this value, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iabcontainer-copyentries
     */
    CopyEntries(lpEntries, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(20, this, "ptr", lpEntries, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This article describes the IABContainerDeleteEntries function and provides syntax, parameters, and return value.
     * @param {Pointer<SBinaryArray>} lpEntries > [in] A pointer to an array of [ENTRYLIST](entrylist.md) structures that contain entry identifiers that represent the entries being deleted.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @returns {HRESULT} S_OK 
     *   
     * > The specified entries have been successfully deleted. 
     *     
     * MAPI_W_PARTIAL_COMPLETION 
     *   
     * > The call succeeded, but one or more of the entries could not be deleted. When this value is returned, the call should be handled as successful. To test for this value, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iabcontainer-deleteentries
     */
    DeleteEntries(lpEntries, ulFlags) {
        result := ComCall(21, this, "ptr", lpEntries, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **ResolveNames** method attempts to match unresolved recipients from the array of entries in the _lpAdrList_ parameter to recipients in this address book container. An unresolved recipient typically has only the **PR_DISPLAY_NAME** ([PidTagDisplayName](pidtagdisplayname-canonical-property.md)) property and possibly a few other properties. An unresolved recipient does not have the **PR_ENTRYID** ([PidTagEntryId](pidtagentryid-canonical-property.md)) property, and its corresponding flag in the _lpFlagList_ parameter is set to MAPI_UNRESOLVED. Conversely, a resolved recipient always has at least the **PR_ENTRYID** property plus several other properties such as **PR_EMAIL_ADDRESS** ([PidTagEmailAddress](pidtagemailaddress-canonical-property.md)), **PR_DISPLAY_NAME**, and **PR_ADDRTYPE** ([PidTagAddressType](pidtagaddresstype-canonical-property.md)).
     *   
     * Name resolution typically starts when a client calls the [IAddrBook::ResolveName](iaddrbook-resolvename.md) method. Outlook MAPI responds by calling the **ResolveNames** method of each address book container included in the address book search path, specified by the **PR_AB_SEARCH_PATH** ([PidTagAbSearchPath](pidtagabsearchpath-canonical-property.md)) property. The entries in the _lpAdrList_ parameter include recipients already resolved because they are in containers for which MAPI has already called **ResolveNames**, because the entries appear earlier in the search path. 
     *   
     * Each container attempts to resolve the unresolved entries by matching the display name of the recipient with the display name of one of its entries. When a unique match is found, **ResolveNames** adds the **PR_ENTRYID** property and other properties that are included in the _lpPropTagArray_ parameter to the corresponding entry in the outgoing **ADRLIST** structure. **ResolveNames** then sets the entry in the _lpFlagList_ parameter to MAPI_RESOLVED. The entry identifier stored in the **PR_ENTRYID** property can be short-term or long-term. 
     *   
     * After all of the containers in the search path have attempted the name resolution process, MAPI opens a dialog box, if possible, to prompt the user for help in resolving any remaining conflicts. 
     *   
     * Clients can also use the returned **ADRLIST** structure in calls to the [IMessage::ModifyRecipients](imessage-modifyrecipients.md) method.
     * @param {Pointer<SPropTagArray>} lpPropTagArray > [in] A pointer to an [SPropTagArray](sproptagarray.md) structure that contains an array of property tags describing the properties to be included in the [ADRLIST](adrlist.md) structure returned by the provider. To request the provider's default set of properties, pass NULL in the _lpPropTagArray_ parameter.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the text in the returned strings. The following flags can be set:
     *     
     * EMS_AB_ADDRESS_LOOKUP
     *   
     * > Only exact proxy address matches will be found; partial matches are ignored. This flag is supported only by the Exchange Address Book Provider.
     *     
     * MAPI_CACHE_ONLY
     *   
     * > Only the offline address book will be used to perform name resolution. For example, you can use this flag to enable a client application to open the global address list (GAL) in cached exchange mode and access an entry in that address book from the cache without creating traffic between the client and the server. This flag is supported only by the Exchange Address Book Provider. 
     *     
     * MAPI_UNICODE 
     *   
     * > The returned string properties are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @param {Pointer<ADRLIST>} lpAdrList > [in, out] On input, a pointer to an **ADRLIST** structure that contains the list of recipients to be resolved. On output, a pointer to an **ADRLIST** structure that contains the resolved names.
     * @returns {FlagList} > [in, out] A pointer to an array of flags, each flag corresponding to an [ADRENTRY](adrentry.md) structure in the _lpAdrList_ parameter, that provides the status of the name resolution operation for the recipient. The flags in the _lpFlagList_ parameter are in the same order as the entries in  _lpAdrList_. The following flags can be set:
     *     
     * MAPI_AMBIGUOUS 
     *   
     * > The corresponding recipient has been resolved, but not to a unique entry identifier. Other containers should not try to resolve this recipient. 
     *     
     * MAPI_RESOLVED 
     *   
     * > The corresponding recipient has been resolved to a unique entry identifier. Other containers should not try to resolve this recipient. 
     *     
     * MAPI_UNRESOLVED 
     *   
     * > The corresponding entry has not been resolved. Other containers should try to resolve this recipient.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iabcontainer-resolvenames
     */
    ResolveNames(lpPropTagArray, ulFlags, lpAdrList) {
        lpFlagList := FlagList()
        result := ComCall(22, this, "ptr", lpPropTagArray, "uint", ulFlags, "ptr", lpAdrList, "ptr", lpFlagList, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpFlagList
    }
}
