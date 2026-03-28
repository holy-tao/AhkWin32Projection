#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IMAPIPropIUnknown enables clients, service providers, and MAPI to work with properties. All objects that support properties implement this interface.
 * @remarks
 * **IMAPIProp** is the base interface for the following interfaces: 
 *   
 * - [IAttach](iattachimapiprop.md)
 *     
 * - [IMailUser](imailuserimapiprop.md)
 *     
 * - [IMAPIContainer](imapicontainerimapiprop.md)
 *     
 * - [IMAPIFormInfo](imapiforminfoimapiprop.md)
 *     
 * - [IMAPIStatus](imapistatusimapiprop.md)
 *     
 * - [IMessage](imessageimapiprop.md)
 *     
 * - [IMsgStore](imsgstoreimapiprop.md)
 *     
 * - [IProfSect](iprofsectimapiprop.md)
 *     
 * - [IPropData](ipropdataimapiprop.md)
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapipropiunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIProp extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLastError", "SaveChanges", "GetProps", "GetPropList", "OpenProperty", "SetProps", "DeleteProps", "CopyTo", "CopyProps", "GetNamesFromIDs", "GetIDsFromNames"]

    /**
     * 
     * @remarks
     * The **IMAPIProp::GetLastError** method supplies information about a prior method call that failed. Clients can provide their users with detailed information about the error by including the data from the **MAPIERROR** structure in a dialog box. 
     *   
     * All of the implementations of **GetLastError** provided by MAPI are ANSI implementations, except for the [IAddrBook](iaddrbookimapiprop.md) implementation. The **GetLastError** method included with **IAddrBook** supports Unicode.
     * @param {HRESULT} _hResult 
     * @param {Integer} ulFlags > [in] A bitmask of flags that indicates the format for the text returned in the **MAPIERROR** structure pointed to by  _lppMAPIError_. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The strings should be in Unicode format. If the MAPI_UNICODE flag is not set, the strings should be in ANSI format.
     * @param {Pointer<Pointer<MAPIERROR>>} lppMAPIError > [out] A pointer to a pointer to the **MAPIERROR** structure that contains version, component, and context information for the error. The  _lppMAPIError_ parameter can be set to NULL if there is no error information to return.
     * @returns {HRESULT} S_OK 
     *   
     * > The error information was returned.
     *     
     * MAPI_E_BAD_CHARWIDTH 
     *   
     * > Either the MAPI_UNICODE flag was set and the implementation does not support Unicode, or MAPI_UNICODE was not set and the implementation supports only Unicode.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-getlasterror
     */
    GetLastError(_hResult, ulFlags, lppMAPIError) {
        lppMAPIErrorMarshal := lppMAPIError is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", _hResult, "uint", ulFlags, lppMAPIErrorMarshal, lppMAPIError, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPIProp::SaveChanges** method makes property changes permanent for objects that support the transaction model of processing, such as messages, attachments, address book containers, and messaging user objects. Objects that do not support transactions, such as folders, message stores, and profile sections, make changes permanent immediately. No call to **SaveChanges** is required.
     *   
     * Because service providers do not have to generate an entry identifier for their objects until all properties have been saved, an object's **PR_ENTRYID** ([PidTagEntryId](pidtagentryid-canonical-property.md)) property might not be available until after its **SaveChanges** method has been called. Some providers wait until the KEEP_OPEN_READONLY flag is set on the **SaveChanges** call. KEEP_OPEN_READONLY indicates that the changes to be saved in the current call will be the last changes that will be made on the object.
     *   
     * Some message store implementations do not show newly created messages in a folder until a client saves the message changes by using **SaveChanges** and releases the message objects by using the [IUnknown::Release](https://msdn.microsoft.com/library/ms682317%28v=VS.85%29.aspx) method. In addition, some object implementations cannot generate a **PR_ENTRYID** property for a newly created object until after **SaveChanges** has been called, and some can do so only after **SaveChanges** has been called by using KEEP_OPEN_READONLY set in _ulFlags_.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls what happens to the object when the **IMAPIProp::SaveChanges** method is called. The following flags can be set:
     * 
     * NON_EMS_XP_SAVE
     *   
     * > Indicates that the message has not been delivered from a Microsoft Exchange Server. This flag should be used in combination with the [IMAPIFolder::CreateMessage](imapifolder-createmessage.md) method and the ITEMPROC_FORCE flag to indicate to a PST store that the message is eligible for rules processing before the Personal Folders file (PST) store notifies any listening client that the message has arrived. This rules processing only applies to new messages that are created with [IMAPIFolder::CreateMessage](imapifolder-createmessage.md) on a server that is not an Exchange Server, in which case the Exchange Server would have already processed rules on the message.
     * 
     * FORCE_SAVE
     *   
     * > Changes should be written to the object, overriding any previous changes that were made to the object, and the object should be closed. Read/write permission must be set for the operation to succeed. The FORCE_SAVE flag is used after a previous call to **SaveChanges** returned MAPI_E_OBJECT_CHANGED.
     * 
     * KEEP_OPEN_READONLY
     *   
     * > Changes should be committed and the object should be kept open for reading. No additional changes will be made.
     * 
     * KEEP_OPEN_READWRITE
     *   
     * > Changes should be committed and the object should be kept open for read/write permission. This flag is usually set when the object was first opened for read/write permission. Subsequent changes to the object are allowed.
     * 
     * MAPI_DEFERRED_ERRORS
     *   
     * > Allows **SaveChanges** to return successfully, possibly before the changes have been fully committed.
     * 
     * SPAMFILTER_ONSAVE
     *   
     * > Enables spam filtering on a message that is being saved. Spam filtering support is available only if the sender's email address type is Simple Mail Transfer Protocol (SMTP), and the message is being saved to a store for a Personal Folders file (PST).
     * @returns {HRESULT} S_OK
     *   
     * > The commitment of changes was successful.
     * 
     * MAPI_E_NO_ACCESS
     *   
     * > **SaveChanges** cannot keep the object open for read-only permission if KEEP_OPEN_READONLY is set, or read/write permission if KEEP_OPEN_READWRITE is set. No changes are committed.
     * 
     * MAPI_E_OBJECT_CHANGED
     *   
     * > The object has changed since it was opened.
     * 
     * MAPI_E_OBJECT_DELETED
     *   
     * > The object has been deleted since it was opened.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-savechanges
     */
    SaveChanges(ulFlags) {
        result := ComCall(4, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPIPropGetProps, which retrieves the property value of one or more properties of an object.
     * @remarks
     * The **IMAPIProp::GetProps** method obtains the property values of one or more properties of an object. 
     *   
     * The property values are returned in the same order as they were requested (that is, the order of properties in the property tag array pointed to by  _lpPropTagArray_ matches the order in the array of property value structures pointed to by  _lppPropArray_). 
     *   
     * The property types specified in the **aulPropTag** members of the property tag array indicate the type of value that should be returned in the **Value** member of each property value structure. However, if the caller does not know the type of a property, the type in the **aulPropTag** member can be set instead to PT_UNSPECIFIED. In retrieving the value, **GetProps** sets the correct type in the **aulPropTag** member of the property value structure for the property. 
     *   
     * If property types are specified in the **SPropTagArray** in  _lpPropTagArray_, the property values in the **SPropValue** returned in  _lppPropArray_ have types that exactly match the requested types, unless an error value is returned instead. 
     *   
     * String properties can have one of two property types: PT_UNICODE to represent the Unicode format and PT_STRING8 to represent the ANSI format. If the MAPI_UNICODE flag is set in the _ulFlags_ parameter, whenever **GetProps** cannot determine the appropriate format for a string property, it returns its value in the Unicode format. **GetProps** cannot determine an exact string property type in the following situations: 
     *   
     * - The  _lpPropTagArray_ parameter is set to NULL to request all properties. 
     *     
     * - The **aulPropTag** member includes the value PT_UNSPECIFIED as its property type in the property tag array. 
     *     
     * If the  _lpPropTagArray_ parameter is set to NULL to retrieve all of the properties of the object and no properties exist, **GetProps** does the following: 
     *   
     * - Returns S_OK.
     *     
     * - Sets the count value in the **cValues** member of the property value structure to 0. 
     *     
     * - Sets the contents of  _lpcValues_ to 0. 
     *     
     * - Sets  _lppPropArray_ to NULL. 
     *     
     *  **GetProps** must not return multiple-value properties with **cValues** set to 0.
     * @param {Pointer<SPropTagArray>} lpPropTagArray > [in] A pointer to an array of property tags that identify the properties whose values are to be retrieved. The  _lpPropTagArray_ parameter must be either NULL, indicating that values for all properties of the object should be returned, or point to an [SPropTagArray](sproptagarray.md) structure that contains one or more property tags.
     * @param {Integer} ulFlags > [in] A bitmask of flags that indicates the format for properties that have the type PT_UNSPECIFIED. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The string values for these properties should be returned in the Unicode format. If the MAPI_UNICODE flag is not set, the string values should be returned in the ANSI format.
     * @param {Pointer<Integer>} lpcValues > [out] A pointer to a count of property values pointed to by the  _lppPropArray_ parameter. If  _lppPropArray_ is NULL, the content of the  _lpcValues_ parameter is zero.
     * @param {Pointer<Pointer<SPropValue>>} lppPropArray > [out] A pointer to a pointer to the retrieved property values.
     * @returns {HRESULT} S_OK 
     *   
     * > The property values were successfully retrieved.
     *     
     * MAPI_W_ERRORS_RETURNED 
     *   
     * > The call succeeded overall, but one or more properties could not be accessed. The **aulPropTag** member of the property value for each unavailable property has a property type of PT_ERROR and an identifier of zero. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > Zero was passed in the **cValues** member of the **SPropTagArray** structure pointed to by  _lpPropTagArray_.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-getprops
     */
    GetProps(lpPropTagArray, ulFlags, lpcValues, lppPropArray) {
        lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"
        lppPropArrayMarshal := lppPropArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", lpPropTagArray, "uint", ulFlags, lpcValuesMarshal, lpcValues, lppPropArrayMarshal, lppPropArray, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPIPropGetPropList, which returns property tags for all properties.
     * @remarks
     * The **IMAPIProp::GetPropList** method retrieves the property tag for each property currently supported by an object. If the object does not currently support any properties, **GetPropList** returns a property tag array with the **cValues** member set to 0.
     *   
     * The scope of properties returned by **GetPropList** varies from provider to provider. Some service providers exclude those properties for which the caller does not have access. All providers return properties of type **PT_OBJECT**.
     *   
     * If the object does not support Unicode, **GetPropList** returns MAPI_E_BAD_CHARWIDTH, even if there are no string properties defined for the object.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the format for the strings in the returned property tags. The following flag can be set:
     * 
     * MAPI_UNICODE
     *   
     * > The returned strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @param {Pointer<Pointer<SPropTagArray>>} lppPropTagArray > [out] A pointer to a pointer to the property tag array that contains tags for all of the object's properties.
     * @returns {HRESULT} S_OK
     *   
     * > All of the property tags were returned successfully.
     * 
     * MAPI_E_BAD_CHARWIDTH
     *   
     * > Either the MAPI_UNICODE flag was set and the implementation does not support Unicode, or MAPI_UNICODE was not set and the implementation supports only Unicode.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-getproplist
     */
    GetPropList(ulFlags, lppPropTagArray) {
        lppPropTagArrayMarshal := lppPropTagArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", ulFlags, lppPropTagArrayMarshal, lppPropTagArray, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPIPropOpenProperty, which returns a pointer to an interface that can be used to access a property.
     * @remarks
     * The **IMAPIProp::OpenProperty** method provides access to a property through a particular interface. **OpenProperty** is an alternative to the [IMAPIProp::GetProps](imapiprop-getprops.md) and [IMAPIProp::SetProps](imapiprop-setprops.md) methods. When either **GetProps** or **SetProps** fails because the property is too large or too complex, call **OpenProperty**. **OpenProperty** is typically used to access properties of type PT_OBJECT.
     * @param {Integer} ulPropTag > [in] The property tag for the property to be accessed. Both the identifier and the type must be included in the property tag.
     * @param {Pointer<Guid>} lpiid > [in] A pointer to the identifier for the interface to be used to access the property. The  _lpiid_ parameter must not be **null**.
     * @param {Integer} ulInterfaceOptions > [in] Data that relates to the interface identified by the  _lpiid_ parameter.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls access to the property. The following flags can be set:
     *     
     * MAPI_CREATE 
     *   
     * > If the property does not exist, it should be created. If the property does exist, the current value of the property should be discarded. When a caller sets the MAPI_CREATE flag, it should also set the MAPI_MODIFY flag.
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > Allows **OpenProperty** to return successfully, possibly before the object is fully available to the caller. If the object is not available, making a subsequent object call can raise an error. 
     *     
     * MAPI_MODIFY 
     *   
     * > MAPI_MODIFY is required in these situations:
     *     
     *   - When opening a stream property, such as **IID_IStream**, to modify it.
     *     
     *   - When opening an embedded message attachment, such as [PR_ATTACH_DATA_OBJ](pidtagattachdataobject-canonical-property.md) opened with **IID_IMessage**, to modify it.
     * @returns {IUnknown} > [out] A pointer to the requested interface to be used for property access.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-openproperty
     */
    OpenProperty(ulPropTag, lpiid, ulInterfaceOptions, ulFlags) {
        result := ComCall(7, this, "uint", ulPropTag, "ptr", lpiid, "uint", ulInterfaceOptions, "uint", ulFlags, "ptr*", &lppUnk := 0, "HRESULT")
        return IUnknown(lppUnk)
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPIPropSetProps, which updates one or more properties.
     * @param {Integer} cValues > [in] The count of property values pointed to by the  _lpPropArray_ parameter. The  _cValues_ parameter must not be 0.
     * @param {Pointer<SPropValue>} lpPropArray > [in] A pointer to an array of [SPropValue](spropvalue.md) structures that contain property values to be updated.
     * @param {Pointer<Pointer<SPropProblemArray>>} lppProblems > [in, out] On input, a pointer to a pointer to an [SPropProblemArray](spropproblemarray.md) structure; otherwise, NULL, indicating no need for error information. If  _lppProblems_ is a valid pointer on input, **SetProps** returns detailed information about errors in updating one or more properties.
     * @returns {HRESULT} S_OK 
     *   
     * > The properties were successfully updated.
     *     
     * The following values can be returned in the **SPropProblemArray** structure, but not as return values for **SetProps**:
     *   
     * MAPI_E_BAD_CHARWIDTH 
     *   
     * > Either the MAPI_UNICODE flag was set and the implementation does not support Unicode, or MAPI_UNICODE was not set and the implementation supports only Unicode.
     *     
     * MAPI_E_COMPUTED 
     *   
     * > The property cannot be updated because it is read-only, computed by the service provider that is responsible for the object.
     *     
     * MAPI_E_INVALID_TYPE 
     *   
     * > The property type is invalid.
     *     
     * MAPI_E_NO_ACCESS 
     *   
     * > An attempt was made to modify a read-only object or to access an object for which the user has insufficient permissions.
     *     
     * MAPI_E_NOT_ENOUGH_MEMORY 
     *   
     * > The property cannot be updated because it is larger than the remote procedure call (RPC) buffer size.
     *     
     * MAPI_E_UNEXPECTED_TYPE 
     *   
     * > The property type is not the type expected by the calling implementation.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-setprops
     */
    SetProps(cValues, lpPropArray, lppProblems) {
        lppProblemsMarshal := lppProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "uint", cValues, "ptr", lpPropArray, lppProblemsMarshal, lppProblems, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPIPropDeleteProps, which deletes one or more properties from an object.
     * @remarks
     * The **IMAPIProp::DeleteProps** method removes one or more properties from the current object.
     * @param {Pointer<SPropTagArray>} lpPropTagArray > [in] A pointer to an array of property tags that indicate the properties to delete. The **cValues** member of the [SPropTagArray](sproptagarray.md) structure pointed to by  _lpPropTagArray_ must not be zero, and the  _lpPropTagArray_ parameter itself must not be NULL.
     * @param {Pointer<Pointer<SPropProblemArray>>} lppProblems > [in, out] On input, a pointer to a pointer to an [SPropProblemArray](spropproblemarray.md) structure; otherwise, NULL, which indicates that there is no need for error information. If  _lppProblems_ is a valid pointer on input, **DeleteProps** returns detailed information about errors in deleting one or more properties.
     * @returns {HRESULT} S_OK 
     *   
     * > Properties were successfully deleted.
     *     
     * MAPI_E_NO_ACCESS 
     *   
     * > The caller has insufficient permissions to delete properties.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-deleteprops
     */
    DeleteProps(lpPropTagArray, lppProblems) {
        lppProblemsMarshal := lppProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", lpPropTagArray, lppProblemsMarshal, lppProblems, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPIPropCopyTo, which copies or moves all properties, except for specifically excluded properties.
     * @remarks
     * By default, the **IMAPIProp::CopyTo** method copies or moves all of the current object's properties to a destination object. **CopyTo** is used when an object should be copied or moved exactly, with all or most of its properties intact. 
     *   
     * Any subobjects in the source object are automatically included in the operation and are copied or moved in their entirety. By default, **CopyTo** overwrites any properties in the destination object that match properties from the source object. If any of the copied or moved properties already exist in the destination object, the existing properties are overwritten by the new properties, unless the MAPI_NOREPLACE flag is set in the _ulFlags_ parameter. Existing information in the destination object that is not overwritten is left untouched.
     * @param {Integer} ciidExclude > [in] The count of interfaces to exclude when properties are copied or moved.
     * @param {Pointer<Guid>} rgiidExclude > [in] An array of interface identifiers (IIDs) that specify interfaces that should not be used when supplemental information is copied or moved to the destination object.
     * @param {Pointer<SPropTagArray>} lpExcludeProps > [in] A pointer to a property tag array that identifies the property tags that should be excluded from the copy or move operation. Passing **null** in the _lpExcludeProps_ parameter indicates that all of the object's properties should be copied or moved. **CopyTo** returns MAPI_E_INVALID_PARAMETER when the **cValues** member of the [SPropProblemArray](spropproblemarray.md) structure pointed to by  _lpExcludeProps_ is set to 0.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of the progress indicator.
     * @param {IMAPIProgress} lpProgress > [in] A pointer to a progress indicator implementation. If **null** is passed in the _lpProgress_ parameter, MAPI provides the progress implementation. The  _lpProgress_ parameter is ignored unless the MAPI_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) that represents the interface to be used to access the object pointed to by the  _lpDestObj_ parameter. The  _lpInterface_ parameter must not be **null**.
     * @param {Pointer<Void>} lpDestObj > [in] A pointer to the object to receive the copied or moved properties.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the copy or move operation. The following flags can be set:
     *     
     * MAPI_DECLINE_OK 
     *   
     * > If **CopyTo** calls the [IMAPISupport::DoCopyTo](imapisupport-docopyto.md) method to handle the copy or move operation, it should instead return immediately with the error value MAPI_E_DECLINE_COPY. The MAPI_DECLINE_OK flag is set by MAPI to limit recursion. Clients do not set this flag. 
     *     
     * MAPI_DIALOG 
     *   
     * > Displays a progress indicator.
     *     
     * MAPI_MOVE 
     *   
     * > **CopyTo** should perform a move operation instead of a copy operation. When this flag is not set, **CopyTo** performs a copy operation. 
     *     
     * MAPI_NOREPLACE 
     *   
     * > Existing properties in the destination object should not be overwritten. When this flag is not set, **CopyTo** overwrites existing properties.
     * @param {Pointer<Pointer<SPropProblemArray>>} lppProblems > [in, out] On input, a pointer to a pointer to an **SPropProblemArray** structure; otherwise, **null**, indicating no need for error information. If  _lppProblems_ is a valid pointer on input, **CopyTo** returns detailed information about errors in copying one or more properties.
     * @returns {HRESULT} S_OK 
     *   
     * > The properties have been successfully copied or moved.
     *     
     * MAPI_E_COLLISION 
     *   
     * > A subobject cannot be copied because a subobject with the same display name — specified by the **PR_DISPLAY_NAME** ([PidTagDisplayName](pidtagdisplayname-canonical-property.md)) property — already exists in the destination object. 
     *     
     * MAPI_E_DECLINE_COPY 
     *   
     * > The service provider does not implement the copy operation.
     *     
     * MAPI_E_FOLDER_CYCLE 
     *   
     * > The source object performing the copy or move operation directly or indirectly contains the destination object. Significant work might have been performed before this condition was discovered, so the source and destination objects might be partially modified. 
     *     
     * MAPI_E_INTERFACE_NOT_SUPPORTED 
     *   
     * > The interface identified by the  _lpInterface_ parameter is not supported by the destination object. 
     *     
     * MAPI_E_NO_ACCESS 
     *   
     * > An attempt was made to access an object for which the caller has insufficient permissions. This error is returned if the destination object is the same as the source object.
     *     
     * The following values can be returned in the **SPropProblemArray** structure, but not as return values for **CopyTo**. The following errors apply to a single property:
     *   
     * MAPI_E_BAD_CHARWIDTH 
     *   
     * > Either the MAPI_UNICODE flag was set and **CopyTo** does not support Unicode, or MAPI_UNICODE was not set and **CopyTo** supports only Unicode. 
     *     
     * MAPI_E_COMPUTED 
     *   
     * > The property cannot be modified by the caller because it is a read-only property, computed by the owner of the destination object. This error is not severe; the caller should allow the copy operation to continue.
     *     
     * MAPI_E_INVALID_TYPE 
     *   
     * > The property type is invalid.
     *     
     * MAPI_E_UNEXPECTED_TYPE 
     *   
     * > The property type is not the type expected by the caller.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-copyto
     */
    CopyTo(ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems) {
        lpDestObjMarshal := lpDestObj is VarRef ? "ptr" : "ptr"
        lppProblemsMarshal := lppProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "uint", ciidExclude, "ptr", rgiidExclude, "ptr", lpExcludeProps, "ptr", ulUIParam, "ptr", lpProgress, "ptr", lpInterface, lpDestObjMarshal, lpDestObj, "uint", ulFlags, lppProblemsMarshal, lppProblems, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPIPropCopyProps, which copies or moves selected properties.
     * @remarks
     * The **IMAPIProp::CopyProps** method copies or moves selected properties from the current object to a destination object. **CopyProps** is used mainly for replying to and forwarding messages, where only some of the properties from the original message travel with the reply or forwarded copy. 
     *   
     * Any subobjects in the source object are automatically included in the operation and copied or moved in their entirety, regardless of the use of properties indicated by the [SPropTagArray](sproptagarray.md) structure. By default, **CopyProps** overwrites any properties in the destination object that match properties from the source object. If any of the copied or moved properties already exist in the destination object, the existing properties are overwritten by the new properties, unless the MAPI_NOREPLACE flag is set in the _ulFlags_ parameter. Existing information in the destination object that is not overwritten is left untouched.
     * @param {Pointer<SPropTagArray>} lpIncludeProps > [in] A pointer to a property tag array that specifies the properties to copy or move. **PR_NULL** ([PidTagNull](pidtagnull-canonical-property.md)) cannot be included in the array. The  _lpIncludeProps_ parameter cannot be **null**.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of the progress indicator.
     * @param {IMAPIProgress} lpProgress > [in] A pointer to an implementation of a progress indicator. If **null** is passed in the _lpProgress_ parameter, the progress indicator is displayed by using the MAPI implementation. The  _lpProgress_ parameter is ignored unless the MAPI_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) that represents the interface that must be used to access the object pointed to by the  _lpDestObj_ parameter. The  _lpInterface_ parameter must not be **null**.
     * @param {Pointer<Void>} lpDestObj > [in] A pointer to the object to receive the copied or moved properties.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the copy or move operation. The following flags can be set:
     *     
     * MAPI_DECLINE_OK 
     *   
     * > If **CopyProps** calls the [IMAPISupport::DoCopyProps](imapisupport-docopyprops.md) method to handle the copy or move operation, it should instead return immediately with the error value MAPI_E_DECLINE_COPY. The MAPI_DECLINE_OK flag is set by MAPI to limit recursion. Clients do not set this flag. 
     *     
     * MAPI_DIALOG 
     *   
     * > Displays a progress indicator.
     *     
     * MAPI_MOVE 
     *   
     * > **CopyProps** should perform a move operation instead of a copy operation. When this flag is not set, **CopyProps** performs a copy operation. 
     *     
     * MAPI_NOREPLACE 
     *   
     * > Existing properties in the destination object should not be overwritten. When this flag is not set, **CopyProps** overwrites existing properties.
     * @param {Pointer<Pointer<SPropProblemArray>>} lppProblems > [in, out] On input, a pointer to a pointer to an [SPropProblemArray](spropproblemarray.md) structure; otherwise, **null**, indicating that there is no need for error information. If  _lppProblems_ is a valid pointer on input, **CopyProps** returns detailed information about errors in copying one or more properties.
     * @returns {HRESULT} S_OK 
     *   
     * > Properties have been successfully copied or moved.
     *     
     * MAPI_E_COLLISION 
     *   
     * > A subobject cannot be copied because a subobject with the same display name, defined by the **PR_DISPLAY_NAME** ([PidTagDisplayName](pidtagdisplayname-canonical-property.md)) property, already exists in the destination object. 
     *     
     * MAPI_E_DECLINE_COPY 
     *   
     * > The service provider does not implement the copy operation.
     *     
     * MAPI_E_FOLDER_CYCLE 
     *   
     * > The source object performing the copy or move operation directly or indirectly contains the destination object. Significant work might have been performed before this condition was discovered, so the source and destination objects might be partially modified. 
     *     
     * MAPI_E_INTERFACE_NOT_SUPPORTED 
     *   
     * > The interface identified by the  _lpInterface_ parameter is not supported by the destination object. 
     *     
     * MAPI_E_NO_ACCESS 
     *   
     * > An attempt was made to access an object for which the caller has insufficient permissions. This error is returned if the destination object is the same as the source object.
     *     
     * The following values can be returned in the **SPropProblemArray** structure, but not as return values for **CopyProps**. These errors apply to a single property.
     *   
     * MAPI_E_BAD_CHARWIDTH 
     *   
     * > Either the MAPI_UNICODE flag was set and **CopyProps** does not support Unicode, or MAPI_UNICODE was not set and **CopyProps** supports only Unicode. 
     *     
     * MAPI_E_COMPUTED 
     *   
     * > The property cannot be modified by the caller because it is a read-only property, computed by the owner of the destination object. This error is not severe; the caller should allow the copy operation to continue.
     *     
     * MAPI_E_INVALID_TYPE 
     *   
     * > The property type is invalid.
     *     
     * MAPI_E_UNEXPECTED_TYPE 
     *   
     * > The property type is not the type expected by the caller.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-copyprops
     */
    CopyProps(lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems) {
        lpDestObjMarshal := lpDestObj is VarRef ? "ptr" : "ptr"
        lppProblemsMarshal := lppProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", lpIncludeProps, "ptr", ulUIParam, "ptr", lpProgress, "ptr", lpInterface, lpDestObjMarshal, lpDestObj, "uint", ulFlags, lppProblemsMarshal, lppProblems, "HRESULT")
        return result
    }

    /**
     * IMAPIPropGetNamesFromIDs provides the property names that correspond to one or more property identifiers.
     * @remarks
     * While access to most properties is by property identifier, some properties can be accessed by name. The **IMAPIProp::GetNamesFromIDs** method can be called to do the following: 
     *   
     * - Retrieve names for specific property identifiers in a specific property set.
     *     
     * - Retrieve names for specific property identifiers in any property set.
     *     
     * - Retrieve names for all named properties that are included in the object's mapping.
     *     
     * If  _lppPropTags_ points to a valid property tag array with one or more property identifiers, and  _lpPropSetGuid_ points to a valid property set, **GetNamesFromIDs** ignores the property set and the property types and returns all of the names that map to the specified identifiers. 
     *   
     * If  _lppPropTags_ points to a valid property tag array with one or more property identifiers and  _lpPropSetGuid_ is NULL, **GetNamesFromIDs** returns all of the names that map to the specified identifiers. 
     *   
     * If a specified identifier does not have a name, **GetNamesFromIDs** returns NULL in that identifier's place in the structure returned in  _lpppPropNames_ and also returns MAPI_W_ERRORS_RETURNED. 
     *   
     * If both  _lpPropSetGuid_ and  _lppPropTags_ are NULL, **GetNamesFromIDs** allocates a new property tag array and returns all of the names for all of the named properties for the object. 
     *   
     * When there are no names to be returned, perhaps because there are no properties in the requested property set or all of the properties are of a type excluded by the flags, **GetNamesFromIDs** does the following: 
     *   
     * - Returns S_OK.
     *     
     * - Allocates a new **SPropTagArray** structure, setting the **cValues** member to 0. 
     *     
     * - Sets the contents of  _lpcPropNames_ to 0. 
     *     
     * - Sets the contents of  _lpppPropNames_ to NULL.
     * @param {Pointer<Pointer<SPropTagArray>>} lppPropTags > [in, out] On input, a pointer to an [SPropTagArray](sproptagarray.md) structure that contains an array of property tags; otherwise, NULL, indicating that all names should be returned. The **cValues** member for the property tag array cannot be 0. If  _lppPropTags_ is a valid pointer on input, **GetNamesFromIDs** returns names for each property identifier included in the array.
     * @param {Pointer<Guid>} lpPropSetGuid > [in] A pointer to a GUID, or [GUID](guid.md) structure, that identifies a property set. The  _lpPropSetGuid_ parameter can point to a valid property set or can be NULL.
     * @param {Integer} ulFlags > [in] A bitmask of flags that indicates the type of names to be returned. The following flags can be used (if both flags are set, no names will be returned):
     *     
     * MAPI_NO_IDS 
     *   
     * > Requests that only names stored as Unicode strings be returned. 
     *     
     * MAPI_NO_STRINGS 
     *   
     * > Requests that only names stored as numeric identifiers be returned.
     * @param {Pointer<Integer>} lpcPropNames > [out] A pointer to a count of the property name pointers in the array pointed to by the  _lppPropNames_ parameter.
     * @param {Pointer<Pointer<Pointer<MAPINAMEID>>>} lpppPropNames > [out] A pointer to an array of pointers to [MAPINAMEID](mapinameid.md) structures that contains property names.
     * @returns {HRESULT} S_OK 
     *   
     * > The property names were successfully returned. 
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The object does not support named properties. 
     *     
     * MAPI_W_ERRORS_RETURNED 
     *   
     * > The call succeeded overall, but names for one or more properties could not be returned. The property tags for the failing properties have a property type of **PT_ERROR**. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md). 
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > The **cValues** member of one or more of the entries in the property tag array pointed to by  _lppPropTags_ is set to 0.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-getnamesfromids
     */
    GetNamesFromIDs(lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames) {
        lppPropTagsMarshal := lppPropTags is VarRef ? "ptr*" : "ptr"
        lpcPropNamesMarshal := lpcPropNames is VarRef ? "uint*" : "ptr"
        lpppPropNamesMarshal := lpppPropNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, lppPropTagsMarshal, lppPropTags, "ptr", lpPropSetGuid, "uint", ulFlags, lpcPropNamesMarshal, lpcPropNames, lpppPropNamesMarshal, lpppPropNames, "HRESULT")
        return result
    }

    /**
     * IMAPIPropGetIDsFromNames provides the property identifiers that correspond to one or more property names.
     * @remarks
     * The **IMAPIProp::GetIDsFromNames** method retrieves an array of property tags that hold the property identifiers for one or more named properties. **IMAPIProp::GetIDsFromNames** can be called to do the following: 
     *   
     * - Create identifiers for new names.
     *     
     * - Retrieve identifiers for specific names.
     *     
     * - Retrieve identifiers for all named properties that are included in the object's mapping.
     *     
     * Named properties are typically used by message store providers for folders and messages. Other objects, such as messaging users and profile sections, might not support the association of names to property identifiers and might return MAPI_E_NO_SUPPORT from **GetIDsFromNames**.
     *   
     * If there is an error that returns an identifier for a particular name, **GetIDsFromNames** returns MAPI_W_ERRORS_RETURNED and sets the property type in the property tag array entry that corresponds to the name to **PT_ERROR** and the identifier to zero. 
     *   
     * Name-to-identifier mapping is represented by an object's **PR_MAPPING_SIGNATURE** ([PidTagMappingSignature](pidtagmappingsignature-canonical-property.md)) property. **PR_MAPPING_SIGNATURE** contains a [MAPIUID](mapiuid.md) structure that indicates the service provider responsible for the object. If the **PR_MAPPING_SIGNATURE** property is the same for two objects, assume that these objects use the same name-to-identifier mapping.
     * @param {Integer} cPropNames > [in] The count of property names pointed to by the  _lppPropNames_ parameter. If  _lppPropNames_ is NULL, the  _cPropNames_ parameter must be 0.
     * @param {Pointer<Pointer<MAPINAMEID>>} lppPropNames > [in] A pointer to an array of property names, or NULL. Passing NULL requests property identifiers for all property names in all property sets about which the object has information. The  _lppPropNames_ parameter must not be NULL if the MAPI_CREATE flag is set in the _ulFlags_ parameter.
     * @param {Integer} ulFlags > [in] A bitmask of flags that indicates how the property identifiers should be returned. The following flag can be set:
     *     
     * MAPI_CREATE 
     *   
     * > Assigns a property identifier, if one has not yet been assigned, to one or more of the names included in the property name array pointed to by  _lppPropNames_. This flag internally registers the identifier in the name-to-identifier mapping table.
     * @param {Pointer<Pointer<SPropTagArray>>} lppPropTags > [out] A pointer to a pointer to an array of property tags that contains existing or newly assigned property identifiers. The property types for the property tags in this array are set to **PT_UNSPECIFIED**.
     * @returns {HRESULT} S_OK 
     *   
     * > The identifiers for the specified property names were successfully returned.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The object does not support named properties.
     *     
     * MAPI_E_NOT_ENOUGH_MEMORY 
     *   
     * > Insufficient memory was available to retrieve the identifiers.
     *     
     * MAPI_E_TOO_BIG 
     *   
     * > The operation cannot be performed because it requires too many property tags to be returned.
     *     
     * MAPI_W_ERRORS_RETURNED 
     *   
     * > The call succeeded overall, but one or more property identifiers could not be returned. The corresponding property type for each unavailable property is set to **PT_ERROR** and its identifier to zero. When this warning is returned, handle the call as successful. To test for this warning, use the **HR_FAILED** macro. See [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-getidsfromnames
     */
    GetIDsFromNames(cPropNames, lppPropNames, ulFlags, lppPropTags) {
        lppPropNamesMarshal := lppPropNames is VarRef ? "ptr*" : "ptr"
        lppPropTagsMarshal := lppPropTags is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "uint", cPropNames, lppPropNamesMarshal, lppPropNames, "uint", ulFlags, lppPropTagsMarshal, lppPropTags, "HRESULT")
        return result
    }
}
