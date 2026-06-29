#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\System\AddressBook\SPropTagArray.ahk" { SPropTagArray }
#Import "..\..\System\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\..\System\Com\IMalloc.ahk" { IMalloc }
#Import "..\..\System\AddressBook\IMessage.ahk" { IMessage }
#Import ".\SPropAttrArray.ahk" { SPropAttrArray }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\AddressBook\SPropProblemArray.ahk" { SPropProblemArray }
#Import ".\LPMSGSESS.ahk" { LPMSGSESS }

/**
 * @namespace Windows.Win32.Storage.Imapi
 */

;@region Functions
/**
 * Describes the syntax, parameters, and return value of OpenIMsgSession, which creates and opens a message session that groups the messages created within it.
 * @remarks
 * A message session is used by client applications and service providers that want to deal with several related MAPI [IMessage : IMAPIProp](imessageimapiprop.md) objects built on top of underlying OLE **IStorage** objects. The client or provider uses the **OpenIMsgSession** and [CloseIMsgSession](closeimsgsession.md) functions to wrap the creation of such messages inside a message session. Once the message session is opened, the client or provider passes a pointer to it in a call to [OpenIMsgOnIStg](openimsgonistg.md) to create a new **IMessage**-on- **IStorage** object.
 * 
 * A message session keeps track of all **IMessage**-on- **IStorage** objects created during the duration of the session, in addition to all the attachments and other properties of the messages. When a client or provider calls **CloseIMsgSession**, it closes all these objects. Calling **CloseIMsgSession** is the only way to close **IMessage**-on- **IStorage** objects.
 * 
 *  **OpenIMsgSession** is used by clients and providers that require the ability to handle several related messages as OLE **IStorage** objects. If only one such message is to be open at a time, there is no need to track multiple messages and no reason to create a message session with **OpenIMsgSession**.
 * 
 * Because it is dealing with an underlying OLE object, MAPI needs to use OLE memory allocation. For more information about OLE structured storage objects and OLE memory allocation, see [OLE and Data Transfer](https://msdn.microsoft.com/library/d4a57956-37ba-44ca-8efc-bf617ad5e77b.aspx).
 * @param {IMalloc} lpMalloc > [in] Pointer to a memory allocator object exposing the OLE [IMalloc](/windows/desktop/api/objidl/nn-objidl-imalloc) interface. MAPI needs to use this allocation method when working with the OLE [IStorage](/windows/desktop/api/objidl/nn-objidl-istorage) interface.
 * @param {Integer} ulFlags > [in] Reserved; must be zero.
 * @param {Pointer<LPMSGSESS>} lppMsgSess > [out] Pointer to a pointer to the returned message session object.
 * @returns {Integer} S_OK
 * 
 * > The session was opened.
 * 
 * MAPI_E_INVALID_PARAMETER
 * 
 * > _lpMalloc_ or _lppMsgSess_ is NULL.
 * 
 * MAPI_E_INVALID_FLAGS
 * 
 * > Invalid flags were passed.
 * 
 * MAPI_UNICODE
 * 
 * > When calling this function, a client or service provider sets the MAPI_UNICODE flag to create Unicode .msg files. The resulting [Imessage](imessageimapiprop.md) file shows STORE_UNICODE_OK in its PR_STORE_SUPPORT_MASK and supports Unicode properties.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/openimsgsession
 */
export OpenIMsgSession(lpMalloc, ulFlags, lppMsgSess) {
    lppMsgSessMarshal := lppMsgSess is VarRef ? "ptr*" : "ptr"

    result := DllCall("MAPI32.dll\OpenIMsgSession", "ptr", lpMalloc, "uint", ulFlags, lppMsgSessMarshal, lppMsgSess, Int32)
    return result
}

/**
 * CloseIMsgSession closes a message session and all the messages created within that session.
 * @remarks
 * A message session is used by client applications and service providers that want to deal with several related MAPI **IMessage** objects built on top of underlying OLE **IStorage** objects. The client or provider uses the [OpenIMsgSession](openimsgsession.md) and **CloseIMsgSession** functions to wrap the creation of such messages inside a message session. Once the message session is opened, the client or provider passes a pointer to it in a call to [OpenIMsgOnIStg](openimsgonistg.md) to create a new **IMessage**-on- **IStorage** object. 
 *   
 * A message session keeps track of all **IMessage**-on- **IStorage** objects opened during the duration of the session, in addition to all the attachments and other properties of the messages. When a client or provider calls **CloseIMsgSession**, it closes all these objects. Calling **CloseIMsgSession** is the only way to close **IMessage**-on- **IStorage** objects.
 * @param {LPMSGSESS} _lpMsgSess > [in] Pointer to the message session object obtained using the [OpenIMsgSession](openimsgsession.md) function at the start of the message session.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/closeimsgsession
 */
export CloseIMsgSession(_lpMsgSess) {
    DllCall("MAPI32.dll\CloseIMsgSession", LPMSGSESS, _lpMsgSess)
}

/**
 * Builds a new IMessage object on top of an existing OLE IStorage object, to be used within a message session.
 * @remarks
 * Property attributes can only be accessed on property objects, that is, objects implementing the [IMAPIProp : IUnknown](imapipropiunknown.md) interface. To make MAPI properties available on an OLE structured storage object, **OpenIMsgOnIStg** builds an [IMessage : IMAPIProp](imessageimapiprop.md) object on top of the OLE **IStorage** object. The property attributes on such objects can be set or altered with [SetAttribIMsgOnIStg](setattribimsgonistg.md) and retrieved with [GetAttribIMsgOnIStg](getattribimsgonistg.md).
 * @param {LPMSGSESS} _lpMsgSess > [in] Pointer to a message session object within which the new **IMessage**-on- **IStorage** object is to be created.
 * @param {Pointer<LPALLOCATEBUFFER>} _lpAllocateBuffer > [in] Pointer to the [MAPIAllocateBuffer](mapiallocatebuffer.md) function, to be used to allocate memory.
 * @param {Pointer<LPALLOCATEMORE>} _lpAllocateMore > [in] Pointer to the [MAPIAllocateMore](mapiallocatemore.md) function, to be used to allocate additional memory.
 * @param {Pointer<LPFREEBUFFER>} _lpFreeBuffer > [in] Pointer to the [MAPIFreeBuffer](mapifreebuffer.md) function, to be used to free memory.
 * @param {IMalloc} lpMalloc > [in] Pointer to a memory allocator object exposing the OLE **IMalloc** interface. The **IMessage** interface needs to use this allocation method when working with interfaces such as **IStorage** and **IStream**.
 * @param {Pointer<Void>} lpMapiSup > [in] Optional pointer to a MAPI support object that a service provider can use to call the methods of the [IMAPISupport : IUnknown](imapisupportiunknown.md) interface.
 * @param {IStorage} lpStg > [in, out] Pointer to an OLE **IStorage** object that is open and has read-only or read/write permission. Because **IMessage** does not support write-only access, **OpenIMsgOnIStg** does not accept a storage object opened in write-only mode.
 * @param {Pointer<Pointer<MSGCALLRELEASE>>} lpfMsgCallRelease > [in] Optional pointer to a callback function based on the [MSGCALLRELEASE](msgcallrelease.md) prototype that MAPI is to call following the last release on the **IMessage**-on- **IStorage** object.
 * @param {Integer} ulCallerData > [in] Caller data saved by MAPI with the **IMessage**-on- **IStorage** object and passed to the **MSGCALLRELEASE** based callback function. The data provides context about the **IMessage** object being released and the **IStorage** object on top of which it was built.
 * @param {Integer} ulFlags > [in] Bitmask of flags used to control whether the OLE **IStorage::Commit** method is called when the client application or service provider calls the **IMessage::SaveChanges** method. The following flags can be set:
 * 
 * IMSG_NO_ISTG_COMMIT
 *   
 * > The OLE method **IStorage::Commit** is not to be called when the client or provider calls [SaveChanges](imapiprop-savechanges.md).
 * 
 * MAPI_UNICODE
 *   
 * > Enables creation of Unicode .msg files. The resulting [IMessage](imessageimapiprop.md) file shows STORE_UNICODE_OK in its [PR_STORE_SUPPORT_MASK](pidtagstoresupportmask-canonical-property.md) and supports Unicode properties.
 * 
 *   > [!NOTE]
 *   > The MAPI_UNICODE flag is only supported in this function on Outlook 2003 or higher.
 * @param {Pointer<IMessage>} lppMsg > [out] Pointer to a pointer to the opened **IMessage** object.
 * @returns {Integer} S_OK
 *   
 * > The call succeeded and has returned the expected value or values.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/openimsgonistg
 */
export OpenIMsgOnIStg(_lpMsgSess, _lpAllocateBuffer, _lpAllocateMore, _lpFreeBuffer, lpMalloc, lpMapiSup, lpStg, lpfMsgCallRelease, ulCallerData, ulFlags, lppMsg) {
    lpMapiSupMarshal := lpMapiSup is VarRef ? "ptr" : "ptr"
    lpfMsgCallReleaseMarshal := lpfMsgCallRelease is VarRef ? "ptr*" : "ptr"

    result := DllCall("MAPI32.dll\OpenIMsgOnIStg", LPMSGSESS, _lpMsgSess, "ptr", _lpAllocateBuffer, "ptr", _lpAllocateMore, "ptr", _lpFreeBuffer, "ptr", lpMalloc, lpMapiSupMarshal, lpMapiSup, "ptr", lpStg, lpfMsgCallReleaseMarshal, lpfMsgCallRelease, "uint", ulCallerData, "uint", ulFlags, IMessage.Ptr, lppMsg, Int32)
    return result
}

/**
 * Describes GetAttribIMsgOnIStg and provides syntax, parameters, and return value.
 * @remarks
 * Property attributes can only be accessed on property objects, that is, objects implementing the [IMAPIProp : IUnknown](imapipropiunknown.md) interface. To make MAPI properties available on an OLE structured storage object, [OpenIMsgOnIStg](openimsgonistg.md) builds an [IMessage : IMAPIProp](imessageimapiprop.md) object on top of the OLE **IStorage** object. The property attributes on such objects can be set or altered with [SetAttribIMsgOnIStg](setattribimsgonistg.md) and retrieved with **GetAttribIMsgOnIStg**. 
 *   
 * > [!NOTE]
 * > **GetAttribIMsgOnIStg** and **SetAttribIMsgOnIStg** do not operate on all **IMessage** objects. They are only valid for **IMessage**-on- **IStorage** objects returned by **OpenIMsgOnIStg**. 
 *   
 * The number and positions of the attributes in the _lppPropAttrArray_ parameter correspond to the number and positions of the property tags in the _lpPropTagArray_ parameter.
 * @param {Pointer<Void>} lpObject > [in] Pointer to an **IMessage** object obtained from the [OpenIMsgOnIStg](openimsgonistg.md) function.
 * @param {Pointer<SPropTagArray>} lpPropTagArray > [in] Pointer to an [SPropTagArray](sproptagarray.md) structure that contains an array of property tags indicating the properties for which attributes are to be retrieved.
 * @param {Pointer<Pointer<SPropAttrArray>>} lppPropAttrArray > [out] Pointer to a pointer to the returned [SPropAttrArray](spropattrarray.md) structure that contains the retrieved property attributes.
 * @returns {HRESULT} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values. 
 *     
 * MAPI_W_ERRORS_RETURNED 
 *   
 * > The call succeeded overall, but one or more properties could not be accessed and were returned with a property type of PT_ERROR.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/getattribimsgonistg
 */
export GetAttribIMsgOnIStg(lpObject, lpPropTagArray, lppPropAttrArray) {
    lpObjectMarshal := lpObject is VarRef ? "ptr" : "ptr"
    lppPropAttrArrayMarshal := lppPropAttrArray is VarRef ? "ptr*" : "ptr"

    result := DllCall("MAPI32.dll\GetAttribIMsgOnIStg", lpObjectMarshal, lpObject, SPropTagArray.Ptr, lpPropTagArray, lppPropAttrArrayMarshal, lppPropAttrArray, "HRESULT")
    return result
}

/**
 * Sets or alters attributes of properties on an IMessage object supplied by the OpenIMsgOnIStg function.
 * @remarks
 * Property attributes can only be accessed on property objects, that is, objects implementing the [IMAPIProp : IUnknown](imapipropiunknown.md) interface. To make MAPI properties available on an OLE structured storage object, [OpenIMsgOnIStg](openimsgonistg.md) builds an [IMessage : IMAPIProp](imessageimapiprop.md) object on top of the OLE **IStorage** object. The property attributes on such objects can be set or altered with **SetAttribIMsgOnIStg** and retrieved with [GetAttribIMsgOnIStg](getattribimsgonistg.md). 
 *   
 *  **Note** **GetAttribIMsgOnIStg** and **SetAttribIMsgOnIStg** do not operate on all **IMessage** objects. They are only valid for **IMessage**-on- **IStorage** objects returned by **OpenIMsgOnIStg**. 
 *   
 * In the  _lpPropAttrs_ parameter, the number and position of the attributes must match the number and position of the property tags passed in the _lpPropTags_ parameter. 
 *   
 * The **SetAttribIMsgOnIStg** function is used to make message properties read-only when required by the **IMessage** schema. The sample message store provider uses it for this purpose. For more information, see [Messages](mapi-messages.md).
 * @param {Pointer<Void>} lpObject > [in] Pointer to the object for which property attributes are being set.
 * @param {Pointer<SPropTagArray>} lpPropTags > [in] Pointer to an [SPropTagArray](sproptagarray.md) structure containing an array of property tags indicating the properties for which property attributes are being set.
 * @param {Pointer<SPropAttrArray>} lpPropAttrs > [in] Pointer to an [SPropAttrArray](spropattrarray.md) structure listing the property attributes to set.
 * @param {Pointer<Pointer<SPropProblemArray>>} lppPropProblems > [out] Pointer to the returned [SPropProblemArray](spropproblemarray.md) structure containing a set of property problems. This structure identifies problems encountered if **SetAttribIMsgOnIStg** has been able to set some properties, but not all. If a pointer to NULL is passed in the _lppPropProblems_ parameter, no property problem array is returned even if some properties were not set.
 * @returns {HRESULT} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values.
 *     
 * MAPI_W_ERRORS_RETURNED 
 *   
 * > The call succeeded overall, but one or more properties could not be accessed and were returned with a property type of PT_ERROR.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/setattribimsgonistg
 */
export SetAttribIMsgOnIStg(lpObject, lpPropTags, lpPropAttrs, lppPropProblems) {
    lpObjectMarshal := lpObject is VarRef ? "ptr" : "ptr"
    lppPropProblemsMarshal := lppPropProblems is VarRef ? "ptr*" : "ptr"

    result := DllCall("MAPI32.dll\SetAttribIMsgOnIStg", lpObjectMarshal, lpObject, SPropTagArray.Ptr, lpPropTags, SPropAttrArray.Ptr, lpPropAttrs, lppPropProblemsMarshal, lppPropProblems, "HRESULT")
    return result
}

/**
 * Describes the syntax, parameters, and return value of MapStorageSCode, which maps an SCODE return value from an OLE storage object to an HRESULT type.
 * @remarks
 * MAPI provides the **MapStorageSCode** function for the internal use of MAPI components that base their message implementations on the message DLL. Because these components open OLE storage themselves, they must be able to map error values returned for problems with OLE storage to an HRESULT value. 
 *   
 * For more information, see [Structured Storage](structured-storage-in-mapi.md).
 * @param {Integer} StgSCode > [in] MAPI SCODE return value from an OLE storage object to be mapped to a HRESULT value.
 * @returns {Integer} S_OK 
 *   
 * > The call succeeded and returned the expected value.
 *     
 * MAPI_E_CALL_FAILED 
 *   
 * > The function cannot find a matching value.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapstoragescode
 */
export MapStorageSCode(StgSCode) {
    result := DllCall("MAPI32.dll\MapStorageSCode", "int", StgSCode, Int32)
    return result
}

;@endregion Functions
