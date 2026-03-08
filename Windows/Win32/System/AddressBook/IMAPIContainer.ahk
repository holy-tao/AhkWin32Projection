#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPITable.ahk
#Include .\IMAPIProp.ahk

/**
 * IMAPIContainerIMAPIProp manages high-level operations on container objects such as address books, distribution lists, and folders.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainerimapiprop
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIContainer extends IMAPIProp{

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
    static VTableNames => ["GetContentsTable", "GetHierarchyTable", "OpenEntry", "SetSearchCriteria", "GetSearchCriteria"]

    /**
     * IMAPIContainerGetContentsTable returns a pointer to the container's contents table. This article describes its syntax, parameters, return value, and remarks.
     * @remarks
     * The **IMAPIContainer::GetContentsTable** method returns a pointer to the contents table of a container. A contents table contains summary information about objects in the container. 
     *   
     * Contents tables have lengthy column sets. For a complete list of the required and optional columns in contents tables, see [Contents Tables](contents-tables.md). 
     *   
     * It is possible for some containers to have no contents. These containers return MAPI_E_NO_SUPPORT from their implementations of **GetContentsTable**.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the contents table is returned. The following flags can be set:
     *     
     * MAPI_ASSOCIATED 
     *   
     * > The container's associated contents table should be returned instead of the standard contents table. This flag is used only with folders. The messages that are included in the associated contents table were created with the MAPI_ASSOCIATED flag set in the call to the [IMAPIFolder::CreateMessage](imapifolder-createmessage.md) method. Clients typically use the associated contents table to retrieve forms, views, and other hidden messages. 
     *     
     * ACLTABLE_FREEBUSY
     *   
     * > Enables access to the frightsFreeBusySimple and frightsFreeBusyDetailed rights in **PR_MEMBER_RIGHTS**.
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > **GetContentsTable** can return successfully, possibly before the table is made available to the caller. If the table is not available, making a subsequent table call can raise an error. 
     *     
     * MAPI_UNICODE 
     *   
     * > Requests that the columns that contain string data be returned in the Unicode format. If the MAPI_UNICODE flag is not set, the strings should be returned in the ANSI format. 
     *     
     * SHOW_SOFT_DELETES
     *   
     * > Shows items that are currently marked as soft deleted—that is, they are in the deleted item retention time phase.
     * @returns {IMAPITable} > [out] A pointer to a pointer to the contents table.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-getcontentstable
     */
    GetContentsTable(ulFlags) {
        result := ComCall(14, this, "uint", ulFlags, "ptr*", &lppTable := 0, "HRESULT")
        return IMAPITable(lppTable)
    }

    /**
     * IMAPIContainerGetHierarchyTable returns a pointer to the container's hierarchy table. This article describes its syntax, parameters, return value, and remarks.
     * @remarks
     * The **IMAPIContainer::GetHierarchyTable** method returns a pointer to the hierarchy table of a container. A hierarchy table holds summary information about the child containers in the container. Folder hierarchy tables hold information about subfolders; address book hierarchy tables hold information about child address book containers and distribution lists. 
     *   
     * It is possible for some containers to have no child containers. These containers return MAPI_E_NO_SUPPORT from their implementations of **GetHierarchyTable**.
     *   
     * When the CONVENIENT_DEPTH flag is set, each row in the hierarchy table also includes the **PR_DEPTH** ([PidTagDepth](pidtagdepth-canonical-property.md)) property as a column. **PR_DEPTH** indicates the level of each container relative to the container that implements the table. The implementing container's immediate child containers are at depth zero, child containers in the zero depth containers are at depth one, and so on. The values of **PR_DEPTH** increase sequentially as the hierarchy of levels deepens. 
     *   
     * For a complete list of required and optional columns in hierarchy tables, see [Hierarchy Tables](hierarchy-tables.md).
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how information is returned in the table. The following flags can be set:
     *     
     * CONVENIENT_DEPTH 
     *   
     * > Fills the hierarchy table with containers from multiple levels. If CONVENIENT_DEPTH is not set, the hierarchy table contains only the container's immediate child containers.
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > **GetHierarchyTable** can return successfully, possibly before the table is made available to the caller. If the table is not available, making a subsequent table call can raise an error. 
     *     
     * MAPI_UNICODE 
     *   
     * > Requests that the columns that contain string data be returned in Unicode format. If the MAPI_UNICODE flag is not set, the strings should be returned in ANSI format. 
     *     
     * SHOW_SOFT_DELETES
     *   
     * > Shows items that are currently marked as soft deleted—that is, they are in the deleted item retention time phase.
     * @returns {IMAPITable} > [out] A pointer to a pointer to the hierarchy table.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-gethierarchytable
     */
    GetHierarchyTable(ulFlags) {
        result := ComCall(15, this, "uint", ulFlags, "ptr*", &lppTable := 0, "HRESULT")
        return IMAPITable(lppTable)
    }

    /**
     * 
     * @remarks
     * The **IMAPIContainer::OpenEntry** method opens an object throughout a container and returns a pointer to an interface implementation to use for further access.
     * @param {Integer} cbEntryID > [in] The byte count in the entry identifier pointed to by the  _lpEntryID_ parameter.
     * @param {Pointer} lpEntryID > [in] A pointer to the entry identifier of the object to open. If  _lpEntryID_ is set to NULL, the top-level container in the container's hierarchy is opened.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) that represents the interface to be used to access the object. Passing NULL results in the identifier for the object's standard interface being returned. For messages, the standard interface is [IMAPIMessageSite : IUnknown](imapimessagesiteiunknown.md); for folders, it is [IMAPIFolder : IMAPIContainer](imapifolderimapicontainer.md). The standard interfaces for address book objects are [IDistList : IMAPIContainer](idistlistimapicontainer.md) for a distribution list and [IMailUser : IMAPIProp](imailuserimapiprop.md) for a messaging user.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the object is opened. The following flags can be set:
     *     
     * MAPI_BEST_ACCESS 
     *   
     * > Requests that the object will be opened with the maximum network permissions allowed for the user and the maximum client application access. For example, if the client has read/write permission, the object should be opened with read/write permission; if the client has read-only access, the object should be opened with read-only access. 
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > Allows **OpenEntry** to return successfully, possibly before the object is fully available to the calling client. If the object is not available, making a subsequent object call can raise an error. 
     *     
     * MAPI_MODIFY 
     *   
     * > Requests read/write permission. By default, objects are opened with read-only access, and clients should not work on the assumption that read/write permission has been granted. 
     *     
     * SHOW_SOFT_DELETES
     *   
     * > Shows items that are currently marked as soft deleted—that is, they are in the deleted item retention time phase.
     * @param {Pointer<Integer>} lpulObjType > [out] A pointer to the opened object's type.
     * @param {Pointer<IUnknown>} lppUnk > [out] A pointer to a pointer to the interface implementation to use to access the open object.
     * @returns {HRESULT} S_OK 
     *   
     * > The object was successfully opened.
     *     
     * MAPI_E_NO_ACCESS 
     *   
     * > Either the user has insufficient permissions to open the object or an attempt was made to open a read-only object with read/write permission.
     *     
     * MAPI_E_NOT_FOUND 
     *   
     * > The entry identifier specified by  _lpEntryID_ does not represent an object. 
     *     
     * MAPI_E_UNKNOWN_ENTRYID 
     *   
     * > The entry identifier in the _lpEntryID_ parameter is not of a format recognized by the container.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-openentry
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, lppUnk) {
        lpulObjTypeMarshal := lpulObjType is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, lpulObjTypeMarshal, lpulObjType, "ptr*", lppUnk, "HRESULT")
        return result
    }

    /**
     * IMAPIContainerSetSearchCriteria establishes search criteria for the container. This article describes its syntax, parameters, return value, and remarks.
     * @remarks
     * The **IMAPIContainer::SetSearchCriteria** method establishes search criteria for a container that supports searches, typically a search-results folder. A search-results folder contains links to the messages that meet the search criteria; the actual messages are still stored in their original locations. The only unique data that is contained in a search-results folder is its contents table. The contents table of a search-results folder has the merged contents of the message store after the search restriction has been applied. 
     *   
     * A search operation works only on this merged contents table; it does not search through other search-results folders. The search results return only the messages that match the search criteria; the folder hierarchy is not returned.
     *   
     * Control is returned to the client when the search has finished.
     * @param {Pointer<SRestriction>} lpRestriction > [in] A pointer to an [SRestriction](srestriction.md) structure that defines the search criteria. If NULL is passed in the _lpRestriction_ parameter, the search criteria that were used most recently for this container are used again. NULL should not be passed in  _lpRestriction_ for the first search in a container.
     * @param {Pointer<SBinaryArray>} lpContainerList > [in] A pointer to an array of entry identifiers that represent containers to be included in the search. If a client passes NULL in the _lpContainerList_ parameter, the entry identifiers used most recently to search this container are used for the new search. A client should not pass NULL in  _lpContainerList_ for the first search in a container.
     * @param {Integer} ulSearchFlags > [in] A bitmask of flags that control how the search is performed. The following flags can be set:
     *     
     * BACKGROUND_SEARCH 
     *   
     * > The search should run at normal priority relative to other searches. This flag cannot be set at the same time as the FOREGROUND_SEARCH flag.
     *     
     * FOREGROUND_SEARCH 
     *   
     * > The search should run at high priority relative to other searches. This flag cannot be set at the same time as the BACKGROUND_SEARCH flag.
     *     
     * NON_CONTENT_INDEXED_SEARCH
     *   
     * > The search should not use content indexing to find matching entries. This flag is only valid for Exchange stores.
     *     
     * RECURSIVE_SEARCH 
     *   
     * > The search should include the containers specified in the _lpContainerList_ parameter and all their child containers. This flag cannot be set at the same time as the SHALLOW_SEARCH flag. 
     *     
     * RESTART_SEARCH 
     *   
     * > The search should be initiated if this is the first call to **SetSearchCriteria**, or restarted if the search is inactive. This flag cannot be set at the same time as the STOP_SEARCH flag.
     *     
     * SHALLOW_SEARCH 
     *   
     * > The search should look only in the containers specified in the _lpContainerList_ parameter for matching entries. This flag cannot be set at the same time as the RECURSIVE_SEARCH flag. 
     *     
     * STOP_SEARCH 
     *   
     * > The search should be stopped. This flag cannot be set at the same time as the RESTART_SEARCH flag.
     * @returns {HRESULT} S_OK 
     *   
     * > The search criteria was successfully set.
     *     
     * MAPI_E_TOO_COMPLEX 
     *   
     * > The service provider does not support the specified search criteria.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-setsearchcriteria
     */
    SetSearchCriteria(lpRestriction, lpContainerList, ulSearchFlags) {
        result := ComCall(17, this, "ptr", lpRestriction, "ptr", lpContainerList, "uint", ulSearchFlags, "HRESULT")
        return result
    }

    /**
     * IMAPIContainerGetSearchCriteria obtains the search criteria for the container. This article describes its syntax, parameters, return value, and remarks.
     * @remarks
     * The **IMAPIContainer::GetSearchCriteria** method obtains the search criteria for a container that supports searches, typically a search-results folder. You create search criteria by calling a container's **IMAPIContainer::SetSearchCriteria** method.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the passed-in strings. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The passed-in strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @param {Pointer<Pointer<SRestriction>>} lppRestriction > [out] A pointer to a pointer to an [SRestriction](srestriction.md) structure that defines the search criteria. If a client application passes NULL in the _lppRestriction_ parameter, **GetSearchCriteria** does not return an **SRestriction** structure.
     * @param {Pointer<Pointer<SBinaryArray>>} lppContainerList > [out] A pointer to a pointer to an array of entry identifiers that represent containers to be included in the search. If a client passes NULL in the _lppContainerList_ parameter, **GetSearchCriteria** does not return an array of entry identifiers.
     * @param {Pointer<Integer>} lpulSearchState > [out] A pointer to a bitmask of flags used to indicate the current state of the search. If a client passes NULL in the _lpulSearchState_ parameter, **GetSearchCriteria** returns no flags. The following flags can be set: 
     *     
     * SEARCH_FOREGROUND 
     *   
     * > The search should run at high priority relative to other searches. If this flag is not set, the search runs at normal priority relative to other searches.
     *     
     * SEARCH_REBUILD 
     *   
     * > The search is in the CPU-intensive mode of its operation, trying to locate messages that match the criteria. If this flag is not set, the CPU-intensive part of the search's operation is over. This flag has meaning only if the search is active (that is, if the SEARCH_RUNNING flag is set).
     *     
     * SEARCH_RECURSIVE 
     *   
     * > The search is looking in specified containers and all their child containers for matching entries. If this flag is not set, only the containers explicitly included in the last call to the [IMAPIContainer::SetSearchCriteria](imapicontainer-setsearchcriteria.md) method are being searched. 
     *     
     * SEARCH_RUNNING 
     *   
     * > The search is active and the container's contents table is being updated to reflect changes in the message store or address book. If this flag is not set, the search is inactive and the contents table is static.
     * @returns {HRESULT} S_OK 
     *   
     * > The search criteria was successfully obtained.
     *     
     * MAPI_E_BAD_CHARWIDTH 
     *   
     * > Either the MAPI_UNICODE flag was set and the implementation does not support Unicode, or MAPI_UNICODE was not set and the implementation supports only Unicode.
     *     
     * MAPI_E_NOT_INITIALIZED 
     *   
     * > Search criteria were never established for the container.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-getsearchcriteria
     */
    GetSearchCriteria(ulFlags, lppRestriction, lppContainerList, lpulSearchState) {
        lppRestrictionMarshal := lppRestriction is VarRef ? "ptr*" : "ptr"
        lppContainerListMarshal := lppContainerList is VarRef ? "ptr*" : "ptr"
        lpulSearchStateMarshal := lpulSearchState is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "uint", ulFlags, lppRestrictionMarshal, lppRestriction, lppContainerListMarshal, lppContainerList, lpulSearchStateMarshal, lpulSearchState, "HRESULT")
        return result
    }
}
