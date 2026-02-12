#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IMAPIProp.ahk

/**
 * Do not use. (IAddrBook)
 * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nn-wabiab-iaddrbook
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
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iaddrbook-openentry
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType) {
        lpulObjTypeMarshal := lpulObjType is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, lpulObjTypeMarshal, lpulObjType, "ptr*", &lppUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(lppUnk)
    }

    /**
     * Compares two entry identifiers.
     * @param {Integer} cbEntryID1 Value of type ULONG that specifies the number of bytes in the entry identifier to which the *lpEntryID1* parameter points.
     * @param {Pointer<ENTRYID>} lpEntryID1 Pointer to a variable of type ENTRYID that specifies the first entry identifier to be compared.
     * @param {Integer} cbEntryID2 Value of type ULONG that specifies the number of bytes in the entry identifier to which the *lpEntryID2* parameter points.
     * @param {Pointer<ENTRYID>} lpEntryID2 Pointer to a variable of type ENTRYID that specifies the first entry identifier to be compared.
     * @param {Integer} ulFlags Reserved. Must be set to 0.
     * @param {Pointer<Integer>} lpulResult Pointer to a variable of type ULONG that receives the result of the comparison. The contents of *lpulResult* are set to TRUE if the two entry identifiers refer to the same object, FALSE otherwise.
     * @returns {HRESULT} HRESULT
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-compareentryids
     */
    CompareEntryIDs(cbEntryID1, lpEntryID1, cbEntryID2, lpEntryID2, ulFlags, lpulResult) {
        lpulResultMarshal := lpulResult is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", cbEntryID1, "ptr", lpEntryID1, "uint", cbEntryID2, "ptr", lpEntryID2, "uint", ulFlags, lpulResultMarshal, lpulResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers the caller with the Windows Address Book (WAB) to receive notifications.
     * @remarks
     * At this time, the Windows Address Book (WAB) only provides notifications to generic changes in the store. Clients cannot register for notifications provided per entry identifier. When the Windows Address Book (WAB) store changes, the Windows Address Book (WAB) invokes the **IMAPIAdviseSink::OnNotify** method on the *lpAdviseSink* pointer passed into this function.
     * 
     * The **NOTIFICATION** structure passed to the **OnNotify method has the following valid members:
     * 
     * ```
     * <![CDATA[Notification.ulEventType = fnevObjectModified
     * Notification.info.obj.ulObjType = MAPI_ADDRBOOK]]>
     * ```
     * 	
     * All other members in the structure will be NULL or zero. Clients must use this notification only for refreshing their UI. Detailed information about modifications to individual objects within the Windows Address Book (WAB) is not currently available.
     * @param {Integer} cbEntryID Reserved. Must be set to 0.
     * @param {Pointer<ENTRYID>} lpEntryID Reserved. Must be set to NULL.
     * @param {Integer} ulEventMask Value of type ULONG that specifies the event masks. Set to **fnevObjectModified**. All other event masks will be rejected.
     * @param {IMAPIAdviseSink} lpAdviseSink Pointer to an **IUnknown** interface that specifies the object invoked by the Windows Address Book (WAB) to send notifications.
     * @param {Pointer<Integer>} lpulConnection Pointer to a variable of type ULONG that receives the connection number returned by the Windows Address Book (WAB). Use this number when calling [IAddrBook::Unadvise](nf-wabiab-iaddrbook-unadvise.md).
     * @returns {HRESULT} HRESULT
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-advise
     */
    Advise(cbEntryID, lpEntryID, ulEventMask, lpAdviseSink, lpulConnection) {
        lpulConnectionMarshal := lpulConnection is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulEventMask, "ptr", lpAdviseSink, lpulConnectionMarshal, lpulConnection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unregisters the caller from the Windows Address Book (WAB) for notifications.
     * @param {Integer} ulConnection Value of type ULONG that specifies the connection number returned by the matching call to [IAddrBook::Advise](nf-wabiab-iaddrbook-advise.md).
     * @returns {HRESULT} HRESULT
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-unadvise
     */
    Unadvise(ulConnection) {
        result := ComCall(17, this, "uint", ulConnection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an entry identifier for a one-off address.
     * @param {Pointer<Integer>} lpszName Pointer to a string that specifies the display name of the recipient. The *lpszName* parameter can be NULL.
     * @param {Pointer<Integer>} lpszAdrType Pointer to a string that specifies the address type of the recipient, such as FAX or SMTP. The *lpszAdrType* parameter cannot be NULL.
     * @param {Pointer<Integer>} lpszAddress Pointer to a string that specifies the address of the recipient. The *lpszAddress* parameter cannot be NULL.
     * @param {Integer} ulFlags Value of type ULONG that specifies the bitmask of flags that affect the one-off recipient. The following flags are valid in the Windows Address Book (WAB).</desc>
     * 
     * | Flag | Description |
     * |------|-------------|
     * | MAPI_SEND_NO_RICH_INFO | Indicates that the recipient cannot handle formatted message content. If **MAPI_SEND_NO_RICH_INFO** is set, MAPI sets the recipient's PR_SEND_RICH_INFO property to FALSE. If **MAPI_SEND_NO_RICH_INFO** is not set, MAPI sets this property to TRUE unless the recipient's messaging address (to which *lpszAddress* points) is interpreted to be an Internet address. In this case, MAPI sets PR_SEND_RICH_INFO to FALSE. |
     * | MAPI_UNICODE | Displays the name, address type, and address in Unicode format. If the **MAPI_UNICODE** flag is not set, these strings are displayed in ANSI format.
     * @param {Pointer<Integer>} lpcbEntryID Pointer to a variable of type ULONG that specifies the count of bytes in the entry identifier to which the *lppEntryID* parameter points.
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID Address of a pointer to a variable of type **ENTRYID** that receives the entry identifier for the one-off recipient.
     * @returns {HRESULT} HRESULT
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-createoneoff
     */
    CreateOneOff(lpszName, lpszAdrType, lpszAddress, ulFlags, lpcbEntryID, lppEntryID) {
        lpszNameMarshal := lpszName is VarRef ? "char*" : "ptr"
        lpszAdrTypeMarshal := lpszAdrType is VarRef ? "char*" : "ptr"
        lpszAddressMarshal := lpszAddress is VarRef ? "char*" : "ptr"
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, lpszNameMarshal, lpszName, lpszAdrTypeMarshal, lpszAdrType, lpszAddressMarshal, lpszAddress, "uint", ulFlags, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Displays a blank dialog box that enables the user to create a new entry.
     * @remarks
     * To create a new entry in the Windows Address Book (WAB) without showing any dialog boxes, use **CreateEntry**. The *cbEIDNewEntryTpl* and the *lpEIDNewEntryTpl* are the template entry identifiers that define the kind of object being created. To obtain the template entry identifiers, open any Windows Address Book (WAB) container and request the PR_DEF_CREATE_MAILUSER or PR_DEF_CREATE_DL property from the container by calling **IMAPIProp::GetProps**. The resulting binary properties are the corresponding template identifiers.
     * @param {Integer} ulUIParam Value of type ULONG_PTR that specifies the parent window handle for dialog boxes.
     * @param {Integer} ulFlags Reserved. Must be set to 0.
     * @param {Integer} cbEIDContainer Value of type **ULONG** that specifies the size of *lpEIDContainer*.
     * @param {Pointer<ENTRYID>} lpEIDContainer Pointer to a variable of type **ENTRYID** that specifies the entry identifier of the container where the new address is to be created.  If the value of this parameter is NULL, the method creates the entry in the root container. Note that this differs from the MAPI implementation of **NewEntry**.
     * @param {Integer} cbEIDNewEntryTpl Value of type ULONG that specifies the template entry identifier used to determine the object being created.
     * @param {Pointer<ENTRYID>} lpEIDNewEntryTpl Pointer to a variable of type **ENTRYID** that specifies the template entry identifier used to determine the object being created.
     * @param {Pointer<Integer>} lpcbEIDNewEntry Pointer to a variable of type ULONG that specifies the returned size of the contents of **lppEIDNewEntry**.
     * @param {Pointer<Pointer<ENTRYID>>} lppEIDNewEntry Address of a pointer to a variable of type **ENTRYID** that receives the returned entry identifier of the new entry.
     * @returns {HRESULT} HRESULT
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-newentry
     */
    NewEntry(ulUIParam, ulFlags, cbEIDContainer, lpEIDContainer, cbEIDNewEntryTpl, lpEIDNewEntryTpl, lpcbEIDNewEntry, lppEIDNewEntry) {
        lpcbEIDNewEntryMarshal := lpcbEIDNewEntry is VarRef ? "uint*" : "ptr"
        lppEIDNewEntryMarshal := lppEIDNewEntry is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, "uint", ulUIParam, "uint", ulFlags, "uint", cbEIDContainer, "ptr", lpEIDContainer, "uint", cbEIDNewEntryTpl, "ptr", lpEIDNewEntryTpl, lpcbEIDNewEntryMarshal, lpcbEIDNewEntry, lppEIDNewEntryMarshal, lppEIDNewEntry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resolves a partial recipient list to full addresses.
     * @remarks
     * **ResolveName** will optionally display a dialog box if ambiguous matches are found. **ResolveName** goes through the address list passed in <mark>lpAdrList</mark>, finds all the unresolved names, resolves them, and returns the appropriately modified address list. The address list passed in can be a list created using the [IAddrBook::Address](nf-wabiab-iaddrbook-address.md) method.
     * 			
     * If a recipient is ambiguous and the MAPI_DIALOG flag is not specified, **ResolveName** will return MAPI_E_AMBIGUOUS_RECIPIENT.
     * 
     * > [!NOTE]
     * > The **ADRENTRY** items in the **ADRLIST** should be separately allocated, NOT allocated with **AllocateMore**.  
     * 
     * When **ResolveName** replaces an entry, the **ADRENTRY** is freed through the action of **FreeBuffer**.  A new entry is allocated by **AllocateMore**
     * @param {Pointer} ulUIParam Value of type **ULONG_PTR** that specifies the parent window handle.
     * @param {Integer} ulFlags Value of type ULONG that specifies flags that affect behavior.
     * 
     * | Flag | Description |
     * |------|-------------|
     * | MAPI_DIALOG | Displays a dialog box to prompt the user for additional name-resolution information. If this flag is not set, no dialog box is displayed.|
     * | WAB_RESOLVE_ALL_EMAILS | Causes name resolution to check against every e-mail address of every entry, instead of checking against the entry's default e-mail address. This makes name resolution slow; avoid using this flag if speed is important.|
     * | WAB_RESOLVE_NO_ONE_OFFS | Prevents the Windows Address Book (WAB) from resolving valid e-mail addresses or name/e-mail address pairs as one-off addresses after the initial resolution attempt fails. If resolution fails,  the default behavior turns the information from a valid name/e-mail pair or e-mail address into a one-off address.|
     * | WAB_RESOLVE_NEED_CERT | Causes name resolution to succeed only if the matching entry has certificate data that can be returned on resolution. |
     * | WAB_RESOLVE_NO_NOT_FOUND_UI | Suppresses the Windows Address Book (WAB) UI that typically follows unsuccessful name resolution.|
     * | WAB_RESOLVE_USE_CURRENT_PROFILE | Restricts the name resolution to contacts corresponding to the current Identity only, in Profile- or Identity-enabled Windows Address Book (WAB) sessions. The name resolution first looks for an exact match within the list of the Identities private folders. If no match is found in the Identities folders, the Windows Address Book (WAB) searches all the shared folders, followed by the LDAP. If this flag is not specified, the Windows Address Book (WAB) searches against all its contents, irrespective of whether the Windows Address Book (WAB) is profile enabled.|
     * | WAB_RESOLVE_FIRST_MATCH | Causes the Windows Address Book (WAB) to return the first entry that matches the given criteria. Once the Windows Address Book (WAB) finds the first entry, it does not look for any other matches.|
     * |WAB_RESOLVE_LOCAL_ONLY | Causes the Windows Address Book (WAB) to skip name resolution on any LDAP servers even if such servers have been configured for name resolution. This flag is useful if you want to restrict your resolution or search to the contents within the Windows Address Book (WAB).|
     * @param {Pointer<Integer>} lpszNewEntryTitle Pointer to a string that specifies the title for the [IAddrBook::NewEntry](nf-wabiab-iaddrbook-newentry.md) dialog box.
     * @param {Pointer<ADRLIST>} lpAdrList Pointer to a variable of type **ADRLIST** that specifies the address list containing property lists to match. On output, *lpAdrList* receives a pointer to a variable containing an address list of resolved recipients.
     * @returns {HRESULT} HRESULT
     * 
     * | Value | Description |
     * |-------|-------------|
     * |S_OK | The name resolution process succeeded. |
     * | MAPI_E_AMBIGUOUS_RECIP | At least one recipient in the *lpAdrList* parameter matched more than one entry in the address book. Usually, this value is returned when the **MAPI_DIALOG** flag is not set, prohibiting the display of a dialog box. |
     * | MAPI_E_NOT_FOUND |At least one recipient in the *lpAdrList* parameter cannot be resolved. Usually, this value is returned when the **MAPI_DIALOG** flag is not set, prohibiting the display of a dialog box.|
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-resolvename
     */
    ResolveName(ulUIParam, ulFlags, lpszNewEntryTitle, lpAdrList) {
        lpszNewEntryTitleMarshal := lpszNewEntryTitle is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "ptr", ulUIParam, "uint", ulFlags, lpszNewEntryTitleMarshal, lpszNewEntryTitle, "ptr", lpAdrList, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * IAddrBook::Address displays the common address book dialog box.
     * @remarks
     * The behavior of the addressing dialog box is specified by flags and parameters in *lpAdrParms*. The Windows Address Book (WAB) does not support some of the customization features of the MAPI **Address** method. The Windows Address Book (WAB) also does not support the MAPI send options dialog button.
     * @param {Pointer<Integer>} lpulUIParam Pointer to a variable of type ULONG_PTR that specifies the handle of the parent window of the dialog box. On input, a window handle must always be passed. On output, if the DIALOG_SDI flag is set in the *lpAdrParms* parameter **ADRPARM** structure, the window handle of the modeless dialog box is returned.
     * @param {Pointer<ADRPARM>} lpAdrParms Pointer to a variable of type **ADRPARM** that specifies the presentation and behavior of the addressing dialog box.
     * @param {Pointer<Pointer<ADRLIST>>} lppAdrList Address of a pointer to a variable of type **ADRLIST** that specifies the current recipient list. On output, *lppAdrList* receives the address of a pointer to the **ADRLIST** where the **IAddrBook::Address** is stored. The user can set **lppAdrList** to **NULL** on input.
     * @returns {HRESULT} HRESULT
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-address
     */
    Address(lpulUIParam, lpAdrParms, lppAdrList) {
        lpulUIParamMarshal := lpulUIParam is VarRef ? "uint*" : "ptr"
        lppAdrListMarshal := lppAdrList is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, lpulUIParamMarshal, lpulUIParam, "ptr", lpAdrParms, lppAdrListMarshal, lppAdrList, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Displays a dialog box that shows details, and allows editing, of a particular entry in the Windows Address Book (WAB).
     * @remarks
     * Windows Address Book (WAB) does not support the Button callbacks. The property sheets are extensible through the **IWABExtInit** and **IShellPropSheetExt Interface** interfaces.
     * @param {Pointer<Pointer>} lpulUIParam Pointer to a variable of type ULONG_PTR that receives the returned parent window handle of the returned dialog box.
     * @param {Pointer<LPFNDISMISS>} lpfnDismiss_ DISMISSMODELESS function pointer.  This function  is called when the modeless dialog box is dismissed. Not implemented.
     * @param {Pointer<Void>} lpvDismissContext Not implemented.
     * @param {Integer} cbEntryID Value of type ULONG that specifies the size of *lpEntryID*.
     * @param {Pointer<ENTRYID>} lpEntryID Pointer to a variable of type ENTRYID that specifies the entry identifier of the entry on which to display details.
     * @param {Pointer<LPFNBUTTON>} lpfButtonCallback Not supported by the Windows Address Book (WAB); must be NULL.
     * @param {Pointer<Void>} lpvButtonContext Not supported by the Windows Address Book (WAB); must be NULL.
     * @param {Pointer<Integer>} lpszButtonText Not supported by the Windows Address Book (WAB); must be NULL.
     * @param {Integer} ulFlags Not supported by the Windows Address Book (WAB); must be NULL.
     * @returns {HRESULT} HRESULT
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-details
     */
    Details(lpulUIParam, lpfnDismiss_, lpvDismissContext, cbEntryID, lpEntryID, lpfButtonCallback, lpvButtonContext, lpszButtonText, ulFlags) {
        lpulUIParamMarshal := lpulUIParam is VarRef ? "ptr*" : "ptr"
        lpvDismissContextMarshal := lpvDismissContext is VarRef ? "ptr" : "ptr"
        lpvButtonContextMarshal := lpvButtonContext is VarRef ? "ptr" : "ptr"
        lpszButtonTextMarshal := lpszButtonText is VarRef ? "char*" : "ptr"

        result := ComCall(22, this, lpulUIParamMarshal, lpulUIParam, "ptr", lpfnDismiss_, lpvDismissContextMarshal, lpvDismissContext, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpfButtonCallback, lpvButtonContextMarshal, lpvButtonContext, lpszButtonTextMarshal, lpszButtonText, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not implemented. (IAddrBook::RecipOptions)
     * @param {Integer} ulUIParam Not implemented
     * @param {Integer} ulFlags Not implemented.
     * @param {Pointer<ADRENTRY>} lpRecip Not implemented.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-recipoptions
     */
    RecipOptions(ulUIParam, ulFlags, lpRecip) {
        result := ComCall(23, this, "uint", ulUIParam, "uint", ulFlags, "ptr", lpRecip, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not implemented. (IAddrBook::QueryDefaultRecipOpt)
     * @param {Pointer<Integer>} lpszAdrType Not implemented.
     * @param {Integer} ulFlags Not implemented.
     * @param {Pointer<Integer>} lpcValues Not implemented.
     * @param {Pointer<Pointer<SPropValue>>} lppOptions Not implemented.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-querydefaultrecipopt
     */
    QueryDefaultRecipOpt(lpszAdrType, ulFlags, lpcValues, lppOptions) {
        lpszAdrTypeMarshal := lpszAdrType is VarRef ? "char*" : "ptr"
        lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"
        lppOptionsMarshal := lppOptions is VarRef ? "ptr*" : "ptr"

        result := ComCall(24, this, lpszAdrTypeMarshal, lpszAdrType, "uint", ulFlags, lpcValuesMarshal, lpcValues, lppOptionsMarshal, lppOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the entry identifier of the default Windows Address Book (WAB) container.
     * @remarks
     * For versions of the Windows Address Book (WAB) in Internet Explorer 4 and earlier, the default Windows Address Book (WAB) container represented the entire address book; all address book contents could be accessed through this container.
     * 
     * For Windows Address Book (WAB) clients that specify a profile-aware Windows Address Book (WAB) session using Internet Explorer 5 and later, the default Windows Address Book (WAB) container corresponds to the current identity's 
     * default Contacts folder. As long as an application calls **IAddrBook::GetPAB** and manipulates data in the PAB container, 
     * all the data will automatically be manipulated within the current Identities 
     * folder.
     * 
     * For Windows Address Book (WAB) clients that do not request profile-aware sessions, the container returned by **IAddrBook::GetPAB** corresponds to the Contacts folder (if there is no Identity Manager) or the Shared Contacts folder (if Identities exist). This folder is available to all Windows Address Book (WAB) users. Application developers who are not interested in profiles can be assured that all their data manipulation in the PAB container is available to all users.
     * @param {Pointer<Integer>} lpcbEntryID Pointer to a variable of type **ULONG** that receives the returned size of the entry identifier.
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID Address of a pointer to a variable of type **ENTRYID** that receives the returned entry identifier of the default Windows Address Book (WAB) container.
     * @returns {HRESULT} HRESULT
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-getpab
     */
    GetPAB(lpcbEntryID, lppEntryID) {
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"

        result := ComCall(25, this, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not implemented. (IAddrBook::SetPAB)
     * @param {Integer} cbEntryID Not implemented.
     * @param {Pointer<ENTRYID>} lpEntryID Not implemented.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-setpab
     */
    SetPAB(cbEntryID, lpEntryID) {
        result := ComCall(26, this, "uint", cbEntryID, "ptr", lpEntryID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not implemented. (IAddrBook::GetDefaultDir)
     * @param {Pointer<Integer>} lpcbEntryID Not implemented.
     * @param {Pointer<Pointer<ENTRYID>>} lppEntryID Not implemented.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-getdefaultdir
     */
    GetDefaultDir(lpcbEntryID, lppEntryID) {
        lpcbEntryIDMarshal := lpcbEntryID is VarRef ? "uint*" : "ptr"
        lppEntryIDMarshal := lppEntryID is VarRef ? "ptr*" : "ptr"

        result := ComCall(27, this, lpcbEntryIDMarshal, lpcbEntryID, lppEntryIDMarshal, lppEntryID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not implemented. (IAddrBook::SetDefaultDir)
     * @param {Integer} cbEntryID Not implemented.
     * @param {Pointer<ENTRYID>} lpEntryID Not implemented.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-setdefaultdir
     */
    SetDefaultDir(cbEntryID, lpEntryID) {
        result := ComCall(28, this, "uint", cbEntryID, "ptr", lpEntryID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * IAddrBook::GetSearchPath returns an ordered list of the entry identifiers of containers to be included in the name resolution process initiated by the IAddrBook::ResolveName method.
     * @param {Integer} ulFlags Value of type **ULONG** that specifies the bitmask of flags that control the type of the strings returned in the search path. The following flag is valid for the Windows Address Book (WAB):
     * 
     * | Flag | Description |
     * |------|-------------|
     * | MAPI_UNICODE | Specifies that returned strings are formatted in Unicode. If this flag is not set, the strings will be in ANSI format. |
     * @param {Pointer<Pointer<SRowSet>>} lppSearchPath Address of a pointer to a variable of type **SRowSet** that specifies the ordered list of container entry identifiers. **IAddrBook::GetSearchPath** stores the ordered list in an **SRowSet** structure. If there are no containers in the address book hierarchy, the method returns zero in the **SRowSet** structure.
     * @returns {HRESULT} HRESULT
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-getsearchpath
     */
    GetSearchPath(ulFlags, lppSearchPath) {
        lppSearchPathMarshal := lppSearchPath is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, "uint", ulFlags, lppSearchPathMarshal, lppSearchPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not implemented. (IAddrBook::SetSearchPath)
     * @param {Integer} ulFlags Not implemented.
     * @param {Pointer<SRowSet>} lpSearchPath Not implemented.
     * @returns {HRESULT} Not implemented.
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-setsearchpath
     */
    SetSearchPath(ulFlags, lpSearchPath) {
        result := ComCall(30, this, "uint", ulFlags, "ptr", lpSearchPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prepares a recipient list for later use by the messaging system.
     * @param {Integer} ulFlags Reserved. Must be set to 0.
     * @param {Pointer<SPropTagArray>} lpPropTagArray Pointer to a variable of type **SPropTagArray** that specifies an array of property tags indicating properties that require updating, if any. The variable can be NULL.
     * @param {Pointer<ADRLIST>} lpRecipList Pointer to a variable of type **ADRLIST** that specifies the structure holding the list of recipients.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wabiab/nf-wabiab-iaddrbook-preparerecips
     */
    PrepareRecips(ulFlags, lpPropTagArray, lpRecipList) {
        result := ComCall(31, this, "uint", ulFlags, "ptr", lpPropTagArray, "ptr", lpRecipList, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
