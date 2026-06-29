#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\NOTIFICATION.ahk" { NOTIFICATION }
#Import "..\Com\IStream.ahk" { IStream }
#Import ".\IPropData.ahk" { IPropData }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\IMAPIProp.ahk" { IMAPIProp }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\IMAPIAdviseSink.ahk" { IMAPIAdviseSink }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DTPAGE.ahk" { DTPAGE }
#Import ".\SPropTagArray.ahk" { SPropTagArray }
#Import ".\SSortOrderSet.ahk" { SSortOrderSet }
#Import ".\SRowSet.ahk" { SRowSet }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ADRLIST.ahk" { ADRLIST }
#Import ".\ITableData.ahk" { ITableData }
#Import ".\MAPINAMEID.ahk" { MAPINAMEID }
#Import "..\Com\IMalloc.ahk" { IMalloc }
#Import "..\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import ".\IMessage.ahk" { IMessage }
#Import ".\SPropValue.ahk" { SPropValue }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\SRestriction.ahk" { SRestriction }
#Import ".\IMAPITable.ahk" { IMAPITable }

/**
 * @namespace Windows.Win32.System.AddressBook
 */

;@region Functions
/**
 * CreateTable creates structures and an object handle for an ITableData object which can be used to create table contents.
 * @remarks
 * The _lpAllocateBuffer_, _lpAllocateMore_, and _lpFreeBuffer_ input parameters point to the [MAPIAllocateBuffer](mapiallocatebuffer.md), [MAPIAllocateMore](mapiallocatemore.md), and [MAPIFreeBuffer](mapifreebuffer.md) functions, respectively. A client application calling **CreateTable** passes in pointers to the MAPI functions just named; a service provider passes the pointers to these functions that it received in its initialization call or retrieved with a call to the [IMAPISupport::GetMemAllocRoutines](imapisupport-getmemallocroutines.md) method.
 * @param {Pointer<Guid>} lpInterface > [in] Pointer to an interface identifier (IID) for the table data object. The valid interface identifier is IID_IMAPITableData. Passing NULL in the _lpInterface_ parameter also causes the table data object returned in the _lppTableData_ parameter to be cast to the standard interface for a table data object.
 * @param {Pointer<LPALLOCATEBUFFER>} _lpAllocateBuffer > [in] Pointer to the [MAPIAllocateBuffer](mapiallocatebuffer.md) function, to be used to allocate memory.
 * @param {Pointer<LPALLOCATEMORE>} _lpAllocateMore > [in] Pointer to the [MAPIAllocateMore](mapiallocatemore.md) function, to be used to allocate additional memory.
 * @param {Pointer<LPFREEBUFFER>} _lpFreeBuffer > [in] Pointer to the [MAPIFreeBuffer](mapifreebuffer.md) function, to be used to free memory.
 * @param {Pointer<Void>} lpvReserved > [in] Reserved; must be zero.
 * @param {Integer} ulTableType > [in] A table type that is available to a client application or service provider as part of the [IMAPITable::GetStatus](imapitable-getstatus.md) return data on its table views. Possible values are:
 * 
 * TBLTYPE_DYNAMIC
 *   
 * > The table's contents are dynamic and can change as the underlying data changes.
 * 
 * TBLTYPE_KEYSET
 *   
 * > The rows in the table are fixed, but the values in these rows are dynamic and can change as the underlying data changes.
 * 
 * TBLTYPE_SNAPSHOT
 *   
 * > The table is static and the contents do not change when the underlying data changes.
 * @param {Integer} ulPropTagIndexColumn > [in] Index number of the column for use when changing table data.
 * @param {Pointer<SPropTagArray>} lpSPropTagArrayColumns > [in] Pointer to an [SPropTagArray](sproptagarray.md) structure that contains an array of property tags indicating the properties required in the table for which the object holds data.
 * @param {Pointer<ITableData>} lppTableData > [out] Pointer to a pointer to the returned table data object.
 * @returns {Integer} S_OK
 *   
 * > The call succeeded and has returned the expected value or values.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/createtable
 */
export CreateTable(lpInterface, _lpAllocateBuffer, _lpAllocateMore, _lpFreeBuffer, lpvReserved, ulTableType, ulPropTagIndexColumn, lpSPropTagArrayColumns, lppTableData) {
    lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("rtm.dll\CreateTable", Guid.Ptr, lpInterface, "ptr", _lpAllocateBuffer, "ptr", _lpAllocateMore, "ptr", _lpFreeBuffer, lpvReservedMarshal, lpvReserved, "uint", ulTableType, "uint", ulPropTagIndexColumn, SPropTagArray.Ptr, lpSPropTagArrayColumns, ITableData.Ptr, lppTableData, Int32)
    return result
}

/**
 * CreateIProp creates a property data object, that is, an IPropData object. This article describes its parameters, return value, and remarks.
 * @remarks
 * The _lpAllocateBuffer_, _lpAllocateMore_, and _lpFreeBuffer_ input parameters point to the [MAPIAllocateBuffer](mapiallocatebuffer.md), [MAPIAllocateMore](mapiallocatemore.md), and [MAPIFreeBuffer](mapifreebuffer.md) functions, respectively. A client application calling **CreateIProp** passes in pointers to the MAPI functions just named; a service provider passes the pointers to these functions it received in its initialization call or retrieved with a call to the [IMAPISupport::GetMemAllocRoutines](imapisupport-getmemallocroutines.md) method.
 * @param {Pointer<Guid>} lpInterface > [in] Pointer to an interface identifier (IID) for the property data object. The valid interface identifier is IID_IMAPIPropData. Passing NULL in the _lpInterface_ parameter also causes the property data object returned in the _lppPropData_ parameter to be cast to the standard interface for a property data object.
 * @param {Pointer<LPALLOCATEBUFFER>} _lpAllocateBuffer > [in] Pointer to the [MAPIAllocateBuffer](mapiallocatebuffer.md) function, to be used to allocate memory.
 * @param {Pointer<LPALLOCATEMORE>} _lpAllocateMore > [in] Pointer to the [MAPIAllocateMore](mapiallocatemore.md) function, to be used to allocate additional memory.
 * @param {Pointer<LPFREEBUFFER>} _lpFreeBuffer > [in] Pointer to the [MAPIFreeBuffer](mapifreebuffer.md) function, to be used to free memory.
 * @param {Pointer<Void>} lpvReserved > [in] Reserved; must be zero.
 * @param {Pointer<IPropData>} lppPropData > [out] Pointer to a pointer to the returned property data object.
 * @returns {Integer} S_OK
 *   
 * > The call succeeded and has returned the expected value or values.
 * 
 * MAPI_E_INTERFACE_NOT_SUPPORTED
 *   
 * > The requested interface is not supported for this object.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/createiprop
 */
export CreateIProp(lpInterface, _lpAllocateBuffer, _lpAllocateMore, _lpFreeBuffer, lpvReserved, lppPropData) {
    lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("MAPI32.dll\CreateIProp", Guid.Ptr, lpInterface, "ptr", _lpAllocateBuffer, "ptr", _lpAllocateMore, "ptr", _lpFreeBuffer, lpvReservedMarshal, lpvReserved, IPropData.Ptr, lppPropData, Int32)
    return result
}

/**
 * Describes the MAPIInitIdle function and provides syntax, parameters, return value, and additional remarks.
 * @remarks
 * A client application or service provider must call **MAPIInitIdle** before calling any other idle engine function. 
 *   
 * Every call to **MAPIInitIdle** must be matched by a subsequent call to [MAPIDeInitIdle](mapideinitidle.md), or the idle engine is left running for the calling application. 
 *   
 * The following functions deal with the MAPI idle engine and with idle routines based on the [FNIDLE](fnidle.md) function prototype: 
 *   
 * |**Idle routine function**|**Usage**|
 * |:-----|:-----|
 * |[ChangeIdleRoutine](changeidleroutine.md) <br/> |Changes the characteristics of a registered idle routine. |
 * |[DeregisterIdleRoutine](deregisteridleroutine.md) <br/> |Removes a registered idle routine from the MAPI system. |
 * |[EnableIdleRoutine](enableidleroutine.md) <br/> |Disables or re-enables a registered idle routine without removing it from the MAPI system. |
 * |[FtgRegisterIdleRoutine](ftgregisteridleroutine.md) <br/> |Adds an idle routine to the MAPI system, with or without enabling it. |
 * |[MAPIDeInitIdle](mapideinitidle.md) <br/> |Shuts down the MAPI idle engine for the calling application. |
 * |**MAPIInitIdle** <br/> |Initializes the MAPI idle engine for the calling application. |
 *    
 * When all foreground tasks for the platform become idle, the MAPI idle engine calls the highest priority idle routine that is ready to execute. There is no guarantee of calling order among idle routines of the same priority.
 * @param {Pointer<Void>} lpvReserved > [in] Reserved; must be zero.
 * @returns {Integer} The **MAPIInitIdle** function returns zero if initialization is successful, and 1 otherwise. If **MAPIInitIdle** is called multiple times, all additional calls succeed but are ignored except to increment the reference count.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapiinitidle
 */
export MAPIInitIdle(lpvReserved) {
    lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("MAPI32.dll\MAPIInitIdle", lpvReservedMarshal, lpvReserved, Int32)
    return result
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export MAPIDeinitIdle() {
    DllCall("MAPI32.dll\MAPIDeinitIdle")
}

/**
 * Adds a FNIDLE function-based idle routine to the MAPI system. If FtgRegisterIdleRoutine cannot register the idle routine, it returns NULL.
 * @remarks
 * The following functions deal with the MAPI idle engine and with idle routines based on the [FNIDLE](fnidle.md) function prototype. 
 *   
 * |**Idle routine function**|**Usage**|
 * |:-----|:-----|
 * |[ChangeIdleRoutine](changeidleroutine.md) <br/> |Changes the characteristics of a registered idle routine. |
 * |[DeregisterIdleRoutine](deregisteridleroutine.md) <br/> |Removes a registered idle routine from the MAPI system. |
 * |[EnableIdleRoutine](enableidleroutine.md) <br/> |Disables or re-enables a registered idle routine without removing it from the MAPI system. |
 * |**FtgRegisterIdleRoutine** <br/> |Adds an idle routine to the MAPI system, with or without enabling it. |
 * |[MAPIDeInitIdle](mapideinitidle.md) <br/> |Shuts down the MAPI idle engine for the calling application. |
 * |[MAPIInitIdle](mapiinitidle.md) <br/> |Initializes the MAPI idle engine for the calling application. |
 *    
 * **ChangeIdleRoutine**, **DeregisterIdleRoutine**, and **EnableIdleRoutine** take as an input parameter the function tag returned by **FtgRegisterIdleRoutine**. 
 *   
 * When all foreground tasks for the platform become idle, the MAPI idle engine calls the highest priority idle routine that is ready to execute. There is no guarantee of calling order among idle routines of the same priority. 
 *   
 * The following is an example of using the FIRONOADJUSTMENT flag in the _iroIdle_ parameter. 
 *   
 * 1. Register an idle routine with a 5 minute delay.
 *     
 * 2. Hibernate/Sleep the computer after 1 minute (4 minutes left on the timer).
 *     
 * 3. Resume the computer 10 minutes later.
 *     
 * The default behavior, without FIRONOADJUSTMENT, is that you still have to wait 4 more minutes for your routine to run. That is, your timer was adjusted to allow for how long the computer was asleep. However, if you pass FIRONOADJUSTMENT your idle routine will run immediately because more than 5 minutes of real time have elapsed.
 * @param {Pointer<PFNIDLE>} lpfnIdle 
 * @param {Pointer<Void>} lpvIdleParam 
 * @param {Integer} priIdle > [in] The initial priority for the idle routine. Possible priorities for implementation-defined routines are greater than or less than zero, but not zero. The zero priority is reserved for a user event such as a mouse click or a WM_PAINT message. Priorities greater than zero represent background tasks that have a higher priority than user events and are dispatched as part of the standard Windows message pump loop. Priorities less than zero represent idle tasks that only run during message pump idle time. Examples of priorities are as follows: 1 for foreground submission, 2 for power-edit character insertion, and 3 for downloading new messages.
 * @param {Integer} csecIdle > [in] The initial time value, in hundredths of a second, to be used in specifying idle routine parameters. The meaning of the initial time value varies, depending on what is passed in the _iroIdle_ parameter. The meaning can be one of the following: 
 *     
 *   - The minimum period of user inaction that must elapse before the MAPI idle engine calls the idle routine for the first time, if the FIROWAIT flag is set in  _iroIdle_. After this time passes, the idle engine can call the idle routine as often as necessary. 
 *     
 *   - The minimum interval between calls to the idle routine, if the FIROINTERVAL flag is set in  _iroIdle_.
 * @param {Integer} iroIdle > [in] The bitmask of flags used to set initial options for the idle routine. The following flags can be set:
 *     
 *   FIRONOADJUSTMENT
 *     
 *   > Use this flag to specify that the idle routine timer should not be adjusted for sleep or resume. The default behavior without this flag is that sleep time is excluded when calculating the elapsed time. If FIRONOADJUSTMENT is passed then the sleep time is included when calculating elapsed time.
 *       
 *   FIRODISABLED
 *     
 *   > The idle routine should be disabled when registered. The default action is to enable the idle routine when **FtgRegisterIdleRoutine** registers it. 
 *       
 *   FIROINTERVAL 
 *     
 *   > The time specified by the  _csecIdle_ parameter is the minimum interval between successive calls to the idle routine. 
 *       
 *   FIROONCEONLY 
 *     
 *   > Obsolete. Do not use. 
 *       
 *   FIROPERBLOCK 
 *     
 *   > Obsolete. Do not use. 
 *       
 *   FIROWAIT 
 *     
 *   > The time specified by the  _csecIdle_ parameter is the minimum period of user inaction that must elapse before the MAPI idle engine calls the idle routine for the first time. After this time passes, the idle engine can call the idle routine as often as necessary.
 * @returns {Pointer<Void>} The **FtgRegisterIdleRoutine** function returns a function tag identifying the idle routine that was added to the MAPI system. If **FtgRegisterIdleRoutine** cannot register the idle routine for the client application or service provider, for example because of memory problems, it returns NULL.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftgregisteridleroutine
 */
export FtgRegisterIdleRoutine(lpfnIdle, lpvIdleParam, priIdle, csecIdle, iroIdle) {
    lpvIdleParamMarshal := lpvIdleParam is VarRef ? "ptr" : "ptr"

    result := DllCall("MAPI32.dll\FtgRegisterIdleRoutine", "ptr", lpfnIdle, lpvIdleParamMarshal, lpvIdleParam, "short", priIdle, "uint", csecIdle, "ushort", iroIdle, IntPtr)
    return result
}

/**
 * DeregisterIdleRoutine removes a FNIDLE based idle routine from the MAPI system. This article describes its parameters, return value, and remarks.
 * @remarks
 * Any task in a client application or service provider can deregister any idle routine for which it has a valid  _ftg_ parameter. In particular, an idle routine can deregister itself. 
 *   
 * The following functions deal with the MAPI idle engine and with idle routines based on the [FNIDLE](fnidle.md) function prototype: 
 *   
 * |**Idle routine function**|**Usage**|
 * |:-----|:-----|
 * |[ChangeIdleRoutine](changeidleroutine.md) <br/> |Changes the characteristics of a registered idle routine. |
 * |**DeregisterIdleRoutine** <br/> |Removes a registered idle routine from the MAPI system. |
 * |[EnableIdleRoutine](enableidleroutine.md) <br/> |Disables or re-enables a registered idle routine without removing it from the MAPI system. |
 * |[FtgRegisterIdleRoutine](ftgregisteridleroutine.md) <br/> |Adds an idle routine to the MAPI system, with or without enabling it. |
 * |[MAPIDeInitIdle](mapideinitidle.md) <br/> |Shuts down the MAPI idle engine for the calling application. |
 * |[MAPIInitIdle](mapiinitidle.md) <br/> |Initializes the MAPI idle engine for the calling application. |
 *    
 *  **ChangeIdleRoutine**, **DeregisterIdleRoutine**, and **EnableIdleRoutine** take as an input parameter the function tag returned by **FtgRegisterIdleRoutine**. 
 *   
 * When all foreground tasks for the platform become idle, the MAPI idle engine calls the highest priority idle routine that is ready to execute. There is no guarantee of calling order among idle routines of the same priority. 
 *   
 * After the idle routine is deregistered, the idle engine does not call it again. Any implementation that calls **DeregisterIdleRoutine** must deallocate any memory blocks to which it passed pointers for the idle engine to use in its original call to the **FtgRegisterIdleRoutine** function.
 * @param {Pointer<Void>} ftg > [in] Function tag that identifies the idle routine to be removed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/deregisteridleroutine
 */
export DeregisterIdleRoutine(ftg) {
    ftgMarshal := ftg is VarRef ? "ptr" : "ptr"

    DllCall("MAPI32.dll\DeregisterIdleRoutine", ftgMarshal, ftg)
}

/**
 * EnableIdleRoutine enables or disables a FNIDLE based idle routine. This article describes its syntax, parameters, and remarks.
 * @remarks
 * The following functions deal with the MAPI idle engine and with idle routines based on the [FNIDLE](fnidle.md) function prototype: 
 *   
 * |**Idle routine function**|**Usage**|
 * |:-----|:-----|
 * |[ChangeIdleRoutine](changeidleroutine.md) <br/> |Changes the characteristics of a registered idle routine. |
 * |[DeregisterIdleRoutine](deregisteridleroutine.md) <br/> |Removes a registered idle routine from the MAPI system. |
 * |**EnableIdleRoutine** <br/> |Disables or re-enables a registered idle routine without removing it from the MAPI system. |
 * |[FtgRegisterIdleRoutine](ftgregisteridleroutine.md) <br/> |Adds an idle routine to the MAPI system, with or without enabling it. |
 * |[MAPIDeInitIdle](mapideinitidle.md) <br/> |Shuts down the MAPI idle engine for the calling application. |
 * |[MAPIInitIdle](mapiinitidle.md) <br/> |Initializes the MAPI idle engine for the calling application. |
 *    
 *  **ChangeIdleRoutine**, **DeregisterIdleRoutine**, and **EnableIdleRoutine** take as an input parameter the function tag returned by **FtgRegisterIdleRoutine**. 
 *   
 * When all foreground tasks for the platform become idle, the MAPI idle engine calls the highest priority idle routine that is ready to execute. There is no guarantee of calling order among idle routines of the same priority.
 * @param {Pointer<Void>} ftg > [in] Function tag that identifies the idle routine to be enabled or disabled.
 * @param {BOOL} fEnable > [in] Contains TRUE if the idle engine should enable the idle routine, or FALSE if it should disable it.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/enableidleroutine
 */
export EnableIdleRoutine(ftg, fEnable) {
    ftgMarshal := ftg is VarRef ? "ptr" : "ptr"

    DllCall("MAPI32.dll\EnableIdleRoutine", ftgMarshal, ftg, BOOL, fEnable)
}

/**
 * Changes some or all of the characteristics of a FNIDLE based idle routine.
 * @remarks
 * The following functions deal with the MAPI idle engine and with idle routines based on the [FNIDLE](fnidle.md) function prototype:
 *   
 * |**Idle routine function**|**Usage**|
 * |:-----|:-----|
 * |**ChangeIdleRoutine** <br/> |Changes the characteristics of a registered idle routine. |
 * |[DeregisterIdleRoutine](deregisteridleroutine.md) <br/> |Removes a registered idle routine from the MAPI system. |
 * |[EnableIdleRoutine](enableidleroutine.md) <br/> |Disables or re-enables a registered idle routine without removing it from the MAPI system. |
 * |[FtgRegisterIdleRoutine](ftgregisteridleroutine.md) <br/> |Adds an idle routine to the MAPI system, with or without enabling it. |
 * |[MAPIDeInitIdle](mapideinitidle.md) <br/> |Shuts down the MAPI idle engine for the calling application. |
 * |[MAPIInitIdle](mapiinitidle.md) <br/> |Initializes the MAPI idle engine for the calling application. |
 * 
 * **ChangeIdleRoutine**, **DeregisterIdleRoutine**, and **EnableIdleRoutine** take as an input parameter the function tag returned by **FtgRegisterIdleRoutine**.
 *   
 * When all foreground tasks for the platform become idle, the MAPI idle engine calls the highest priority idle routine that is ready to execute. There is no guarantee of calling order among idle routines of the same priority.
 * @param {Pointer<Void>} ftg > [in] Function tag that identifies the idle routine.
 * @param {Pointer<PFNIDLE>} lpfnIdle 
 * @param {Pointer<Void>} lpvIdleParam 
 * @param {Integer} priIdle > [in] Value representing a new priority for the idle routine. Possible priorities for implementation-defined routines are greater than or less than zero, but not zero. A value of zero is reserved for a user event such as a mouse click or a WM_PAINT message. Values greater than zero represent priorities for background tasks that have a higher priority than user events and are dispatched as part of the standard Windows message pump loop. Values less than zero represent priorities for idle tasks that only run during message-pump idle time. Examples of priorities are: 1 for foreground submission, 1 for power-edit character insertion, and 3 for downloading new messages.
 * @param {Integer} csecIdle > [in] A new time, in hundredths of a second, to apply to the idle routine. The meaning of the initial time value varies, depending on what is passed in the _iroIdle_ parameter. It can be:
 * 
 * - The minimum period of user inaction that must elapse before the MAPI idle engine calls the idle routine for the first time, if the FIROWAIT flag is set in _iroIdle_. After this time passes, the idle engine can call the idle routine as often as necessary.
 * 
 * - The minimum interval between calls to the idle routine, if the FIROINTERVAL flag is set in _iroIdle_.
 * @param {Integer} iroIdle > [in] Bitmask of flags indicating new options for calling the idle routine. Exactly one of the following flags must be set:
 * 
 * - FIROINTERVAL: The time specified by the _csecIdle_ parameter is the minimum interval between successive calls to the idle routine.
 * 
 * - FIROONCEONLY: Obsolete. Do not use.
 * 
 * - FIROPERBLOCK: Obsolete. Do not use.
 * 
 * - FIROWAIT: The time specified by the _csecIdle_ parameter is the minimum period of user inaction that must elapse before the MAPI idle engine calls the idle routine for the first time. After this time passes, the idle engine can call the idle routine as often as necessary.
 * @param {Integer} ircIdle > [in] Bitmask of flags used to indicate the changes to be made to the idle routine. The following flags can be set in any combination:
 * 
 * - FIRCCSEC: A change to the time associated with the idle routine, that is, a change indicated by the value passed in the _csecIdle_ parameter.
 * 
 * - FIRCIRO: A change to the options for the idle routine, that is, a change indicated by the value passed in the _iroIdle_ parameter.
 * 
 * - FIRCPFN: A change to the idle routine pointer, that is, a change indicated by the value passed in the _pfnIdle_ parameter.
 * 
 * - FIRCPRI: A change to the priority of the idle routine, that is, a change indicated by the value passed in the _priIdle_ parameter.
 * 
 * - FIRCPV: A change to the memory block of the idle routine, that is, a change indicated by the value passed in the _pvIdleParam_ parameter.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/changeidleroutine
 */
export ChangeIdleRoutine(ftg, lpfnIdle, lpvIdleParam, priIdle, csecIdle, iroIdle, ircIdle) {
    ftgMarshal := ftg is VarRef ? "ptr" : "ptr"
    lpvIdleParamMarshal := lpvIdleParam is VarRef ? "ptr" : "ptr"

    DllCall("MAPI32.dll\ChangeIdleRoutine", ftgMarshal, ftg, "ptr", lpfnIdle, lpvIdleParamMarshal, lpvIdleParam, "short", priIdle, "uint", csecIdle, "ushort", iroIdle, "ushort", ircIdle)
}

/**
 * The MAPIGetDefaultMalloc function retrieves the address of the default MAPI memory allocation function.
 * @returns {IMalloc} None. 
 *   
 * 
 * The **MAPIGetDefaultMalloc** function returns a pointer to the default MAPI memory allocation function.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapigetdefaultmalloc
 */
export MAPIGetDefaultMalloc() {
    result := DllCall("MAPI32.dll\MAPIGetDefaultMalloc", IMalloc)
    return result
}

/**
 * OpenStreamOnFile allocates and initializes an OLE IStream object to access the contents of a file. This function takes an ANSI string as the file name.
 * @remarks
 * The **OpenStreamOnFile** function has two important uses, distinguished by the setting of the SOF_UNIQUEFILENAME flag. When this flag is not set, **OpenStreamOnFile** opens an **IStream** object on an existing file, for example to copy its contents to the **PR_ATTACH_DATA_BIN** ([PidTagAttachDataBinary](pidtagattachdatabinary-canonical-property.md)) property of an attachment using the **IStream::CopyTo** method. In this case the _lpszFileName_ parameter specifies the path and filename of the file.
 *   
 * When SOF_UNIQUEFILENAME is set, **OpenStreamOnFile** creates a temporary file to hold data for an **IStream** object. For this usage, the _lpszFileName_ parameter can optionally designate the path to the directory where the file is to be created, and the  _lpszPrefix_ parameter can optionally specify a prefix for the filename.
 *   
 * When the calling client application or service provider is finished with the **IStream** object, it should free it by calling the OLE **IStream::Release** method.
 *   
 * MAPI uses the functions pointed to by _lpAllocateBuffer_ and _lpFreeBuffer_ for most memory allocation and deallocation, in particular to allocate memory for use by client applications when calling object interfaces such as [IMAPIProp::GetProps](imapiprop-getprops.md) and [IMAPITable::QueryRows](imapitable-queryrows.md).
 * @param {Pointer<LPALLOCATEBUFFER>} _lpAllocateBuffer > [in] Pointer to the [MAPIAllocateBuffer](mapiallocatebuffer.md) function, to be used to allocate memory.
 * @param {Pointer<LPFREEBUFFER>} _lpFreeBuffer > [in] Pointer to the [MAPIFreeBuffer](mapifreebuffer.md) function, to be used to free memory.
 * @param {Integer} ulFlags > [in] Bitmask of flags used to control the creation or opening of the file to be accessed through the OLE **IStream** object. The following flags can be set:
 * 
 * SOF_UNIQUEFILENAME
 *   
 * > A temporary file is to be created for the **IStream** object. If this flag is set, the STGM_CREATE and STGM_READWRITE flags should also be set.
 * 
 * STGM_CREATE
 *   
 * > The file is to be created even if one already exists. If the  _lpszFileName_ parameter is not set, both this flag and STGM_DELETEONRELEASE must be set. If STGM_CREATE is set, the STGM_READWRITE flag must also be set.
 * 
 * STGM_DELETEONRELEASE
 *   
 * > The file is to be deleted when the **IStream** object is released. If the  _lpszFileName_ parameter is not set, both this flag and STGM_CREATE must be set.
 * 
 * STGM_READ
 *   
 * > The file is to be created or opened with read-only access.
 * 
 * STGM_READWRITE
 *   
 * > The file is to be created or opened with read/write permission. If this flag is not set, the STGM_CREATE flag must not be set either.
 * @param {Pointer<Integer>} lpszFileName > [in] The filename, including path and extension, of the file for which **OpenStreamOnFile** initializes the **IStream** object. If the SOF_UNIQUEFILENAME flag is set, _lpszFileName_ contains the path to the directory in which to create a temporary file. If  _lpszFileName_ is NULL, **OpenStreamOnFile** obtains an appropriate path from the system, and both the STGM_CREATE and STGM_DELETEONRELEASE flags must be set.
 * @param {Pointer<Integer>} lpszPrefix > [in] The prefix for the filename on which **OpenStreamOnFile** initializes the **IStream** object. If set, the prefix must contain not more than three characters. If  _lpszPrefix_ is NULL, a prefix of "SOF" is used.
 * @returns {IStream} > [out] Pointer to a pointer to an object exposing the **IStream** interface.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/openstreamonfile
 */
export OpenStreamOnFile(_lpAllocateBuffer, _lpFreeBuffer, ulFlags, lpszFileName, lpszPrefix) {
    lpszFileNameMarshal := lpszFileName is VarRef ? "char*" : "ptr"
    lpszPrefixMarshal := lpszPrefix is VarRef ? "char*" : "ptr"

    result := DllCall("MAPI32.dll\OpenStreamOnFile", "ptr", _lpAllocateBuffer, "ptr", _lpFreeBuffer, "uint", ulFlags, lpszFileNameMarshal, lpszFileName, lpszPrefixMarshal, lpszPrefix, "ptr*", &lppStream := 0, "HRESULT")
    return IStream(lppStream)
}

/**
 * Outlines PropCopyMore, which copies a single property value from a source location to a destination location.
 * @remarks
 * A client application or service provider can use the **PropCopyMore** function to copy a property out of a table that is about to be freed in order to use it elsewhere. 
 *   
 *  **PropCopyMore** does not need to allocate memory unless the property value copied is of a type, such as PT_STRING8, that does not fit in an [SPropValue](spropvalue.md) structure. For these large properties, the function allocates memory using the [MAPIAllocateMore](mapiallocatemore.md) function to which a pointer is passed in the _lpfAllocMore_ parameter. 
 *   
 * Injudicious use of **PropCopyMore** fragments memory; consider using the [ScCopyProps](sccopyprops.md) function instead.
 * @param {Pointer<SPropValue>} lpSPropValueDest > [out] Pointer to the location to which this function writes an [SPropValue](spropvalue.md) structure defining the copied property value.
 * @param {Pointer<SPropValue>} lpSPropValueSrc > [in] Pointer to the [SPropValue](spropvalue.md) structure that contains the property value to be copied.
 * @param {Pointer<LPALLOCATEMORE>} lpfAllocMore > [in] Pointer to the [MAPIAllocateMore](mapiallocatemore.md) function to be used to allocate additional memory if the destination location is not large enough to hold the property to be copied.
 * @param {Pointer<Void>} lpvObject > [in] Pointer to an object for which **MAPIAllocateMore** will allocate space if necessary.
 * @returns {Integer} S_OK
 *   
 * > The single property value was copied successfully.
 *     
 * MAPI_E_NO_SUPPORT
 *   
 * > An unknown property type was encountered.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/propcopymore
 */
export PropCopyMore(lpSPropValueDest, lpSPropValueSrc, lpfAllocMore, lpvObject) {
    lpvObjectMarshal := lpvObject is VarRef ? "ptr" : "ptr"

    result := DllCall("MAPI32.dll\PropCopyMore", SPropValue.Ptr, lpSPropValueDest, SPropValue.Ptr, lpSPropValueSrc, "ptr", lpfAllocMore, lpvObjectMarshal, lpvObject, Int32)
    return result
}

/**
 * Returns the size of a single property value. The function disregards the size of the remainder of the SPropValue structure.
 * @remarks
 * The **UlPropSize** function returns the size, in bytes, of the property value for the specified property. It disregards the size of the remainder of the **SPropValue** structure.
 * @param {Pointer<SPropValue>} lpSPropValue > [in] Pointer to an [SPropValue](spropvalue.md) structure defining the property to be measured.
 * @returns {Integer} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values. 
 *     
 * MAPI_E_CALL_FAILED 
 *   
 * > An error of unexpected or unknown origin prevented the operation from completing.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ulpropsize
 */
export UlPropSize(lpSPropValue) {
    result := DllCall("MAPI32.dll\UlPropSize", SPropValue.Ptr, lpSPropValue, UInt32)
    return result
}

/**
 * Describes FEqualNames and provides syntax, parameters, and return value.
 * @remarks
 * The **FEqualNames** function is useful because the **MAPINAMEID** structure contains a [GUID](guid.md) and can represent the property name itself in more than one way. This means the two structures cannot be compared by simple binary methods. 
 *   
 * The testing process is case-sensitive for the property name strings.
 * @param {Pointer<MAPINAMEID>} lpName1 > [in] Pointer to a [MAPINAMEID](mapinameid.md) structure describing the first named property.
 * @param {Pointer<MAPINAMEID>} lpName2 > [in] Pointer to a **MAPINAMEID** structure describing the second named property.
 * @returns {BOOL} TRUE 
 *   
 * > The two property names are equal. 
 *     
 * FALSE 
 *   
 * > The two property names are not equal.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/fequalnames
 */
export FEqualNames(lpName1, lpName2) {
    result := DllCall("MAPI32.dll\FEqualNames", MAPINAMEID.Ptr, lpName1, MAPINAMEID.Ptr, lpName2, BOOL)
    return result
}

/**
 * Describes FPropContainsProp and provides syntax, parameters, and return value.
 * @remarks
 * The comparison method depends on the property types specified in the [SPropValue](spropvalue.md) property definitions and the fuzzy level heuristic provided in the _ulFuzzyLevel_ parameter. The [FPropCompareProp](fpropcompareprop.md) and **FPropContainsProp** functions can be used to prepare restrictions for generating a table. 
 *   
 * The upper 16 bits of  _ulFuzzyLevel_ are ignored for property type PT_BINARY. If the settings in  _ulFuzzyLevel_ are missing or invalid, a full-string exact match is performed. For more information about property containment, see the [SContentRestriction](scontentrestriction.md) structure.
 * @param {Pointer<SPropValue>} lpSPropValueDst > [in] Pointer to an [SPropValue](spropvalue.md) structure defining the property value that might contain the search string pointed to by the  _lpSPropValueSrc_ parameter.
 * @param {Pointer<SPropValue>} lpSPropValueSrc > [in] Pointer to an **SPropValue** structure defining the search string that **FPropContainsProp** is seeking in the property value pointed to by the  _lpSPropValueDst_ parameter.
 * @param {Integer} ulFuzzyLevel > [in] Option settings defining the level of preciseness to use in the comparison. 
 * 
 *   - The **lower 16 bits** apply to properties of type PT_BINARY and PT_STRING8. They must be set to exactly one of the following values:
 *       
 *     - FL_FULLSTRING: The  _lpSPropValueSrc_ search string must be equal to the property value identified by  _lpSPropValueDst_.
 *         
 *     - FL_PREFIX: The  _lpSPropValueSrc_ search string must appear at the beginning of the property value identified by  _lpSPropValueDst_. The two values should be compared only up to the length of the search string indicated by  _lpSPropValueSrc_. 
 *         
 *     - FL_SUBSTRING: The  _lpSPropValueSrc_ search string must be contained anywhere in the property value identified by  _lpSPropValueDst_. 
 *       
 *   - The **upper 16 bits** apply only to properties of type PT_STRING8. They can be set to the following values in any combination:
 *     
 *     - FL_IGNORECASE: The comparison should be made without considering case sensitivity. 
 *         
 *     - FL_IGNORENONSPACE: The comparison should ignore Unicode-defined nonspacing characters such as diacritical marks. 
 *         
 *     - FL_LOOSE: The comparison should indicate a match whenever possible, ignoring case sensitivity and nonspacing characters.
 * @returns {BOOL} TRUE 
 *   
 * > The parameters are all valid and the  _lpSPropValueSrc_ search string is contained as specified in the _lpSPropValueDst_ property value. 
 *     
 * FALSE 
 *   
 * > The property values being compared are not of type PT_STRING8 or PT_BINARY, the property values are of different types, or the  _lpSPropValueSrc_ search string is not contained as specified in the _lpSPropValueDst_ property value.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/fpropcontainsprop
 */
export FPropContainsProp(lpSPropValueDst, lpSPropValueSrc, ulFuzzyLevel) {
    result := DllCall("MAPI32.dll\FPropContainsProp", SPropValue.Ptr, lpSPropValueDst, SPropValue.Ptr, lpSPropValueSrc, "uint", ulFuzzyLevel, BOOL)
    return result
}

/**
 * Compares two property values using a specified relational operator.
 * @remarks
 * The comparison method depends on the property types specified in the [SPropValue](spropvalue.md) property definitions. The **FPropCompareProp** and [FPropContainsProp](fpropcontainsprop.md) functions can be used to prepare restrictions for generating a table.
 *   
 * The order of comparison is _lpSPropValue1_, _ulRelOp_, _lpSPropValue2_. If the property types of the property values to be compared do not match, the **FPropCompareProp** function returns FALSE.
 * @param {Pointer<SPropValue>} lpSPropValue1 > [in] Pointer to an [SPropValue](spropvalue.md) structure defining the first property value for comparison.
 * @param {Integer} ulRelOp > [in] The relational operator to use in the comparison. For allowable values, see the [SComparePropsRestriction](scomparepropsrestriction.md) structure.
 * @param {Pointer<SPropValue>} lpSPropValue2 > [in] Pointer to an **SPropValue** structure defining the second property value for comparison.
 * @returns {BOOL} TRUE
 *   
 * > The property values satisfy the specified relation.
 * 
 * FALSE
 *   
 * > The property values do not satisfy the specified relation.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/fpropcompareprop
 */
export FPropCompareProp(lpSPropValue1, ulRelOp, lpSPropValue2) {
    result := DllCall("MAPI32.dll\FPropCompareProp", SPropValue.Ptr, lpSPropValue1, "uint", ulRelOp, SPropValue.Ptr, lpSPropValue2, BOOL)
    return result
}

/**
 * Compares two property values to determine whether they are equal. Use this function only if the types of the two properties to be compared are the same.
 * @remarks
 * Use the **LPropCompareProp** function only if the types of the two properties to be compared are the same. 
 *   
 * Before calling **LPropCompareProp**, a client application or service provider must first retrieve the properties for comparison with a call to the [IMAPIProp::GetProps](imapiprop-getprops.md) method. When a client or provider calls **LPropCompareProp**, the function first examines the property tags to make sure that the comparison of property values is valid. The function then compares the property values, returning an appropriate value. 
 *   
 * If the property values are unequal, **LPropCompareProp** determines which one is the greater. The properties that **LPropCompareProp** compares do not have to belong to the same object.
 * @param {Pointer<SPropValue>} lpSPropValueA > [in] Pointer to an [SPropValue](spropvalue.md) structure defining the first property value to be compared.
 * @param {Pointer<SPropValue>} lpSPropValueB > [in] Pointer to an **SPropValue** structure defining the second property value to be compared.
 * @returns {Integer} **LPropCompareProp** returns one of the following values for most property types: 
 *   
 * - Less than zero if the value indicated by the  _lpSPropValueA_ parameter is less than that indicated by the  _lpSPropValueB_ parameter. 
 *     
 * - Greater than zero if the value indicated by  _lpSPropValueA_ is greater than that indicated by  _lpSPropValueB_.
 *     
 * - Zero if the value indicated by  _lpSPropValueA_ equals the value indicated by  _lpSPropValueB_. 
 *     
 * For property types that have no intrinsic ordering, such as Boolean or error types, the **LPropCompareProp** function returns an undefined value if the two property values are not equal. This undefined value is nonzero and consistent across calls.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/lpropcompareprop
 */
export LPropCompareProp(lpSPropValueA, lpSPropValueB) {
    result := DllCall("MAPI32.dll\LPropCompareProp", SPropValue.Ptr, lpSPropValueA, SPropValue.Ptr, lpSPropValueB, Int32)
    return result
}

/**
 * This article describes the HrAddColumns function and provides syntax, parameters, return value, and additional remarks.
 * @remarks
 * The **HrAddColumns** function is equivalent to using **HrAddColumnsEx** with  _lpfnFilterColumns_ set to NULL.
 * @param {IMAPITable} lptbl > [in] Pointer to the MAPI table affected.
 * @param {Pointer<SPropTagArray>} lpproptagColumnsNew > [in] Pointer to an **SPropTagArray** structure that contains an array of property tags for the properties to be added or moved to the beginning of the table.
 * @param {Pointer<LPALLOCATEBUFFER>} _lpAllocateBuffer > [in] Pointer to the **MAPIAllocateBuffer** function. Used to allocate memory.
 * @param {Pointer<LPFREEBUFFER>} _lpFreeBuffer > [in] Pointer to the **MAPIFreeBuffer** function. Used to free memory.
 * @returns {HRESULT} **S_OK**
 *   
 * > The call succeeded and the specified columns were moved or added.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hraddcolumns
 */
export HrAddColumns(lptbl, lpproptagColumnsNew, _lpAllocateBuffer, _lpFreeBuffer) {
    result := DllCall("MAPI32.dll\HrAddColumns", "ptr", lptbl, SPropTagArray.Ptr, lpproptagColumnsNew, "ptr", _lpAllocateBuffer, "ptr", _lpFreeBuffer, "HRESULT")
    return result
}

/**
 * This article describes the HrAddColumnsEx function and provides syntax, parameters, and return value.
 * @remarks
 * The properties passed to **HrAddColumnsEx** using the  _lpproptagColumnsNew_ parameter become the first properties exposed on subsequent calls to the [IMAPITable::QueryRows](imapitable-queryrows.md) method. Any properties previously in the table that were not specified in the _lpproptagColumnsNew_ parameter are exposed after all the added and moved properties. 
 *   
 * If any table properties are undefined when **QueryRows** is called, they are returned with property type PT_NULL and property identifier PROP_ID_NULL.
 * @param {IMAPITable} lptbl > [in] Pointer to the MAPI table affected.
 * @param {Pointer<SPropTagArray>} lpproptagColumnsNew > [in] Pointer to an [SPropTagArray](sproptagarray.md) structure that contains an array of property tags for the properties to be added or moved to the beginning of the table.
 * @param {Pointer<LPALLOCATEBUFFER>} _lpAllocateBuffer > [in] Pointer to the [MAPIAllocateBuffer](mapiallocatebuffer.md) function, to be used to allocate memory.
 * @param {Pointer<LPFREEBUFFER>} _lpFreeBuffer > [in] Pointer to the [MAPIFreeBuffer](mapifreebuffer.md) function, to be used to free memory.
 * @param {Pointer} lpfnFilterColumns > [in] Pointer to a callback function furnished by the caller. If the  _lpfnFilterColumns_ parameter is set to NULL, no callback is made.
 * @returns {HRESULT} S_OK 
 *   
 * > The call succeeded and the specified columns were moved or added.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hraddcolumnsex
 */
export HrAddColumnsEx(lptbl, lpproptagColumnsNew, _lpAllocateBuffer, _lpFreeBuffer, lpfnFilterColumns) {
    result := DllCall("MAPI32.dll\HrAddColumnsEx", "ptr", lptbl, SPropTagArray.Ptr, lpproptagColumnsNew, "ptr", _lpAllocateBuffer, "ptr", _lpFreeBuffer, "ptr", lpfnFilterColumns, "HRESULT")
    return result
}

/**
 * This article describes the HrAllocAdviseSink function and provides syntax, parameters, and return value.
 * @remarks
 * To use the **HrAllocAdviseSink** function, a client application or service provider creates an object to receive notifications, creates a notification callback function based on the [NOTIFCALLBACK](notifcallback.md) function prototype that goes with that object, and passes a pointer to the object in the **HrAllocAdviseSink** function as the  _lpvContext_ value. Doing so performs a notification; and as part of the notification process, MAPI calls the callback function with the object pointer as the context. 
 *   
 * MAPI implements its notification engine asynchronously. In C++, the notification callback can be an object method. If the object generating the notification is not present, the client or provider requesting notification must keep a separate reference count for that object for the object's advise sink. 
 *   
 * > [!CAUTION]
 * > **HrAllocAdviseSink** should be used sparingly; it is safer for clients to create their own advise sinks.
 * @param {Pointer<LPNOTIFCALLBACK>} lpfnCallback > [in] Pointer to a callback function based on the [NOTIFCALLBACK](notifcallback.md) prototype that MAPI is to call when a notification event occurs for the newly created advise sink.
 * @param {Pointer<Void>} lpvContext > [in] Pointer to caller data passed to the callback function when MAPI calls it. The caller data can represent an address of significance to the client or provider. Typically, for C++ code, the  _lpvContext_ parameter represents a pointer to the address of an object.
 * @returns {IMAPIAdviseSink} > [out] Pointer to a pointer to an advise sink object.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrallocadvisesink
 */
export HrAllocAdviseSink(lpfnCallback, lpvContext) {
    lpvContextMarshal := lpvContext is VarRef ? "ptr" : "ptr"

    result := DllCall("MAPI32.dll\HrAllocAdviseSink", "ptr", lpfnCallback, lpvContextMarshal, lpvContext, "ptr*", &lppAdviseSink := 0, "HRESULT")
    return IMAPIAdviseSink(lppAdviseSink)
}

/**
 * This article describes the HrThisThreadAdviseSink function and provides syntax, parameters, and return value.
 * @remarks
 * The purpose of the wrapper is to make sure that notification is called on the same thread that called the **HrThisThreadAdviseSink** function. This function is used to protect notification callbacks that must run on a particular thread. 
 *   
 * Client applications should use **HrThisThreadAdviseSink** to restrict when notifications are generated, that is, when calls are made to the [IMAPIAdviseSink::OnNotify](imapiadvisesink-onnotify.md) method of the advise sink object passed by the client in a previous **Advise** call. If notifications are allowed to be generated arbitrarily, a notification implementation might force a client into multithreaded operation when that would not be appropriate. For example, a client might use a library, such as one of the Microsoft Foundation Class Libraries, that does not support multithreaded calls. Notification on a different thread would make such a client difficult to test and prone to error. 
 *   
 *  **HrThisThreadAdviseSink** makes sure that **OnNotify** calls occur only at these appropriate times: 
 *   
 * - During processing of a call to any MAPI method. 
 *     
 * - During processing of Windows messages. 
 *     
 * When **HrThisThreadAdviseSink** is implemented, any calls to the new advise sink's **OnNotify** method on any thread cause the original notification method to be executed on the thread on which **HrThisThreadAdviseSink** was called. 
 *   
 * For more information about notification and advise sinks, see [Event Notification in MAPI](event-notification-in-mapi.md) and [Implementing an Advise Sink Object](implementing-an-advise-sink-object.md).
 * @param {IMAPIAdviseSink} lpAdviseSink > [in] Pointer to the advise sink to be wrapped.
 * @returns {IMAPIAdviseSink} > [out] Pointer to a pointer to a new advise sink that wraps the advise sink pointed to by the  _lpAdviseSink_ parameter.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrthisthreadadvisesink
 */
export HrThisThreadAdviseSink(lpAdviseSink) {
    result := DllCall("MAPI32.dll\HrThisThreadAdviseSink", "ptr", lpAdviseSink, "ptr*", &lppAdviseSink := 0, "HRESULT")
    return IMAPIAdviseSink(lppAdviseSink)
}

/**
 * This article describes the HrDispatchNotifications function and provides syntax, parameters, and return value.
 * @remarks
 * The **HrDispatchNotifications** function causes MAPI to dispatch all notifications that are currently queued in the MAPI notification engine without waiting for a message dispatch. This can have a beneficial effect on memory utilization. For more information, see [Forcing a Notification](forcing-a-notification.md).
 * @param {Integer} ulFlags > [in] Reserved; must be zero.
 * @returns {HRESULT} S_OK
 *   
 * > All queued notifications have been dispatched.
 *     
 * MAPI_E_USER_CANCEL
 *   
 * > WM_QUIT, WM_QUERYENDSESSION, or WM_ENDSESSION was received.
 *     
 * MAPI_E_NOT_INITIALIZED
 *   
 * > MAPI was not initialized.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrdispatchnotifications
 */
export HrDispatchNotifications(ulFlags) {
    result := DllCall("MAPI32.dll\HrDispatchNotifications", "uint", ulFlags, "HRESULT")
    return result
}

/**
 * Creates a display table from the property page data contained in one or more DTPAGE structures.
 * @remarks
 * MAPI uses the functions pointed to by _lpAllocateBuffer_, _lpAllocateMore_, and _lpFreeBuffer_ for most memory allocation and deallocation, in particular to allocate memory for use by client applications when calling object interfaces such as [IMAPIProp::GetProps](imapiprop-getprops.md) and [IMAPITable::QueryRows](imapitable-queryrows.md).
 * @param {Pointer<LPALLOCATEBUFFER>} _lpAllocateBuffer > [in] Pointer to the [MAPIAllocateBuffer](mapiallocatebuffer.md) function, to be used to allocate memory.
 * @param {Pointer<LPALLOCATEMORE>} _lpAllocateMore > [in] Pointer to the [MAPIAllocateMore](mapiallocatemore.md) function, to be used to allocate additional memory.
 * @param {Pointer<LPFREEBUFFER>} _lpFreeBuffer > [in] Pointer to the [MAPIFreeBuffer](mapifreebuffer.md) function, to be used to free memory.
 * @param {IMalloc} lpMalloc > Unused; should be set to NULL.
 * @param {HINSTANCE} _hInstance > [in] An instance of a MAPI object from which **BuildDisplayTable** retrieves resources.
 * @param {Integer} cPages > [in] Count of [DTPAGE](dtpage.md) structures in the array pointed to by the _lpPage_ parameter.
 * @param {Pointer<DTPAGE>} lpPage > [in] Pointer to an array of **DTPAGE** structures that contain information about the display table pages to be built.
 * @param {Integer} ulFlags > [in] Bitmask of flags. The following flag can be set:
 * 
 * MAPI_UNICODE
 *   
 * > The passed-in strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
 * @param {Pointer<IMAPITable>} lppTable > [out] Pointer to a pointer to the display table, which exposes the [IMAPITable](imapitableiunknown.md) interface.
 * @param {Pointer<ITableData>} lppTblData > [in, out] Pointer to a pointer to a table data object exposing the [ITableData](itabledataiunknown.md) interface on the table returned in the _lppTable_ parameter. If no table data object is desired, _lppTblData_ should be set to NULL instead of a pointer value.
 * @returns {HRESULT} None
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/builddisplaytable
 */
export BuildDisplayTable(_lpAllocateBuffer, _lpAllocateMore, _lpFreeBuffer, lpMalloc, _hInstance, cPages, lpPage, ulFlags, lppTable, lppTblData) {
    result := DllCall("MAPI32.dll\BuildDisplayTable", "ptr", _lpAllocateBuffer, "ptr", _lpAllocateMore, "ptr", _lpFreeBuffer, "ptr", lpMalloc, HINSTANCE, _hInstance, "uint", cPages, DTPAGE.Ptr, lpPage, "uint", ulFlags, IMAPITable.Ptr, lppTable, ITableData.Ptr, lppTblData, "HRESULT")
    return result
}

/**
 * Determines the size, in bytes, of an array of event notifications, and validates the memory associated with the array.
 * @remarks
 * If NULL is passed in the _pcb_ parameter, the **ScCountNotifications** function only validates the array of notifications but no counting is done; if a non-null value is passed in  _pcb_, **ScCountNotifications** determines the size of the array and stores the cause  _pcb_. The  _pcb_ parameter must be large enough to contain the entire array.
 * @param {Integer} cNotifications 
 * @param {Pointer<NOTIFICATION>} lpNotifications 
 * @param {Pointer<Integer>} lpcb 
 * @returns {Integer} S_OK
 *   
 * > Count was determined successfully.
 *     
 * MAPI_E_INVALID_PARAMETER
 *   
 * > An invalid notification was encountered.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccountnotifications
 */
export ScCountNotifications(cNotifications, lpNotifications, lpcb) {
    lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

    result := DllCall("MAPI32.dll\ScCountNotifications", "int", cNotifications, NOTIFICATION.Ptr, lpNotifications, lpcbMarshal, lpcb, Int32)
    return result
}

/**
 * Copies a group of event notifications to a single block of memory for Outlook 2013 or Outlook 2016.
 * @remarks
 * If NULL is passed in the _pcb_ parameter, no copying is performed; if a non-null value is passed in  _pcb_, the **ScCopyNotifications** function copies the size of the array and the array itself to a single block of memory. If  _pcb_ is not NULL, it is set to the number of bytes stored in the _pvDst_ parameter. The  _pvDst_ parameter must be large enough to contain the entire array.
 * @param {Integer} cNotification 
 * @param {Pointer<NOTIFICATION>} lpNotifications 
 * @param {Pointer<Void>} lpvDst 
 * @param {Pointer<Integer>} lpcb 
 * @returns {Integer} S_OK
 *   
 * > Event notifications were copied successfully.
 *     
 * E_INVALIDARG
 *   
 * > An invalid notification was encountered.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccopynotifications
 */
export ScCopyNotifications(cNotification, lpNotifications, lpvDst, lpcb) {
    lpvDstMarshal := lpvDst is VarRef ? "ptr" : "ptr"
    lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

    result := DllCall("MAPI32.dll\ScCopyNotifications", "int", cNotification, NOTIFICATION.Ptr, lpNotifications, lpvDstMarshal, lpvDst, lpcbMarshal, lpcb, Int32)
    return result
}

/**
 * Adjusts a pointer within a specified event notification array for Outlook 2013 or Outlook 2016.
 * @remarks
 * The  _pcb_ parameter to the **ScRelocNotifications** function is optional.
 * @param {Integer} cNotification 
 * @param {Pointer<NOTIFICATION>} lpNotifications 
 * @param {Pointer<Void>} lpvBaseOld 
 * @param {Pointer<Void>} lpvBaseNew 
 * @param {Pointer<Integer>} lpcb 
 * @returns {Integer} S_OK
 *   
 * > A pointer was adjusted successfully.
 *     
 * MAPI_E_INVALID_PARAMETER
 *   
 * > An invalid notification was encountered.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/screlocnotifications
 */
export ScRelocNotifications(cNotification, lpNotifications, lpvBaseOld, lpvBaseNew, lpcb) {
    lpvBaseOldMarshal := lpvBaseOld is VarRef ? "ptr" : "ptr"
    lpvBaseNewMarshal := lpvBaseNew is VarRef ? "ptr" : "ptr"
    lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

    result := DllCall("MAPI32.dll\ScRelocNotifications", "int", cNotification, NOTIFICATION.Ptr, lpNotifications, lpvBaseOldMarshal, lpvBaseOld, lpvBaseNewMarshal, lpvBaseNew, lpcbMarshal, lpcb, Int32)
    return result
}

/**
 * Determines the size, in bytes, of a property value array and validates the memory associated with the array. 
 * @remarks
 * If NULL is passed in the _pcb_ parameter, the **ScCountProps** function validates the array of notifications but no counting is done. If a non-null value is passed in  _pcb_, the **ScCountNotifications** function determines the size of the array and stores the cause  _pcb_. The  _pcb_ parameter must be large enough to contain the entire array. 
 *   
 * As it is counting, **ScCountProps** validates the memory associated with the array. **ScCountProps** only works with properties about which MAPI has information.
 * @param {Integer} cValues 
 * @param {Pointer<SPropValue>} lpPropArray 
 * @param {Pointer<Integer>} lpcb 
 * @returns {Integer} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values. 
 *     
 * MAPI_E_INVALID_PARAMETER 
 *   
 * > At least one property in the property value array has an identifier of PROP_ID_NULL or PROP_ID_INVALID, or the property array contains a multivalued property with no property values.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccountprops
 */
export ScCountProps(cValues, lpPropArray, lpcb) {
    lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

    result := DllCall("MAPI32.dll\ScCountProps", "int", cValues, SPropValue.Ptr, lpPropArray, lpcbMarshal, lpcb, Int32)
    return result
}

/**
 * Describes the LpValFindProp function and provides, syntax, parameters, return value, and additional remarks.
 * @remarks
 * The **LpValFindProp** function is identical to **PpropFindProp**.
 * @param {Integer} ulPropTag > [in] Tag for the property to search for in the property set, indicated by the  _lpPropArray_ parameter.
 * @param {Integer} cValues > [in] Count of properties in the property set, indicated by the  _lpPropArray_ parameter.
 * @param {Pointer<SPropValue>} lpPropArray > [in] Array of **SPropValue** structures that defines the properties to be searched.
 * @returns {Pointer<SPropValue>} The **LpValFindProp** function returns an **SPropValue** structure that defines the property that matches the input property tag, or NULL if there is no match.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/lpvalfindprop
 */
export LpValFindProp(ulPropTag, cValues, lpPropArray) {
    result := DllCall("MAPI32.dll\LpValFindProp", "uint", ulPropTag, "uint", cValues, SPropValue.Ptr, lpPropArray, SPropValue.Ptr)
    return result
}

/**
 * Copies the properties defined by an array of SPropValue structures to a new destination.  ScCopyProps maintains the original property order for the copied property array.
 * @remarks
 * The new array and its data reside in a buffer created with a single allocation, and the [ScRelocProps](screlocprops.md) function can be used to adjust the pointers in the individual [SPropValue](spropvalue.md) structures. Prior to this adjustment, the pointers are valid. 
 *   
 *  **ScCopyProps** maintains the original property order for the copied property array. 
 *   
 * The  _pcb_ parameter is optional; if it is not NULL, it is set to the number of bytes stored in the _pvDst_ parameter.
 * @param {Integer} cValues 
 * @param {Pointer<SPropValue>} lpPropArray 
 * @param {Pointer<Void>} lpvDst 
 * @param {Pointer<Integer>} lpcb 
 * @returns {Integer} S_OK
 *   
 * > Properties were copied successfully.
 *     
 * MAPI_E_INVALID_PARAMETER
 *   
 * > An unknown property type was encountered.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccopyprops
 */
export ScCopyProps(cValues, lpPropArray, lpvDst, lpcb) {
    lpvDstMarshal := lpvDst is VarRef ? "ptr" : "ptr"
    lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

    result := DllCall("MAPI32.dll\ScCopyProps", "int", cValues, SPropValue.Ptr, lpPropArray, lpvDstMarshal, lpvDst, lpcbMarshal, lpcb, Int32)
    return result
}

/**
 * Adjusts the pointers in an SPropValue array after the array and its data have been copied or moved to a new location.
 * @remarks
 * The **ScRelocProps** function operates on the assumption that the property value array for which pointers are adjusted was originally allocated in a single call similar to a call to the **ScCopyProps** function. If a client application or service provider is working with a property value that is built from disjointed blocks of memory, it should use [ScCopyProps](sccopyprops.md) to copy properties instead. 
 *   
 *  **ScRelocProps** is used to maintain the validity of pointers in an [SPropValue](spropvalue.md) array. To maintain pointers' validity when writing such an array to and reading it from a disk, perform the following operations: 
 *   
 * 1. Before writing the array and data to a disk, call **ScRelocProps** on the array with the  _pvBaseNew_ parameter pointing to some standard value zero, for instance. 
 *     
 * 2. After reading the array and data from a disk, call **ScRelocProps** on the array with the  _pvBaseOld_ parameter equal to the same standard value used in Step 1. The array and data must be read into a buffer created with a single allocation. 
 *     
 * 3. The  _pcb_ parameter to **ScRelocProps** is optional.
 * @param {Integer} cValues 
 * @param {Pointer<SPropValue>} lpPropArray 
 * @param {Pointer<Void>} lpvBaseOld 
 * @param {Pointer<Void>} lpvBaseNew 
 * @param {Pointer<Integer>} lpcb 
 * @returns {Integer} S_OK
 *   
 * > Pointers were adjusted successfully.
 *     
 * MAPI_E_INVALID_PARAMETER
 *   
 * > One or both parameters were invalid, or an unknown property type was encountered.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/screlocprops
 */
export ScRelocProps(cValues, lpPropArray, lpvBaseOld, lpvBaseNew, lpcb) {
    lpvBaseOldMarshal := lpvBaseOld is VarRef ? "ptr" : "ptr"
    lpvBaseNewMarshal := lpvBaseNew is VarRef ? "ptr" : "ptr"
    lpcbMarshal := lpcb is VarRef ? "uint*" : "ptr"

    result := DllCall("MAPI32.dll\ScRelocProps", "int", cValues, SPropValue.Ptr, lpPropArray, lpvBaseOldMarshal, lpvBaseOld, lpvBaseNewMarshal, lpvBaseNew, lpcbMarshal, lpcb, Int32)
    return result
}

/**
 * Duplicates a property value array in a single block of MAPI memory combining the operations of the ScCopyProps and ScCountProps functions.
 * @param {Integer} cValues 
 * @param {Pointer<SPropValue>} lpPropArray 
 * @param {Pointer<LPALLOCATEBUFFER>} _lpAllocateBuffer > [in] Pointer to the [MAPIAllocateBuffer](mapiallocatebuffer.md) function, to be used to allocate memory for the duplicated array.
 * @param {Pointer<Pointer<SPropValue>>} lppPropArray 
 * @returns {Integer} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/scduppropset
 */
export ScDupPropset(cValues, lpPropArray, _lpAllocateBuffer, lppPropArray) {
    lppPropArrayMarshal := lppPropArray is VarRef ? "ptr*" : "ptr"

    result := DllCall("MAPI32.dll\ScDupPropset", "int", cValues, SPropValue.Ptr, lpPropArray, "ptr", _lpAllocateBuffer, lppPropArrayMarshal, lppPropArray, Int32)
    return result
}

/**
 * Provides an alternative way to invoke the OLE method IUnknown::AddRef for Outlook 2013 or Outlook 2016.
 * @remarks
 * **UlAddRef** returns the value returned by the **IUnknown::AddRef** method, which is the new value of the reference count for the interface. The value is nonzero. 
 *   
 * For more information about **IUnknown::AddRef**, see [Implementing the IUnknown Interface](implementing-the-iunknown-interface.md).
 * @param {Pointer<Void>} lpunk 
 * @returns {Integer} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values. 
 *     
 * MAPI_E_CALL_FAILED 
 *   
 * > An error of unexpected or unknown origin prevented the operation from completing.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/uladdref
 */
export UlAddRef(lpunk) {
    lpunkMarshal := lpunk is VarRef ? "ptr" : "ptr"

    result := DllCall("MAPI32.dll\UlAddRef", lpunkMarshal, lpunk, UInt32)
    return result
}

/**
 * Outlines UlRelease, including how it provides an alternative way to invoke the OLE method IUnknown::Release.
 * @remarks
 * The reference count is the number of existing pointers to the object to be released. 
 *   
 * If the  _punk_ parameter is NULL, the function returns immediately without calling **IUnknown::Release**
 *   
 *  **UlRelease** returns the value returned by the **IUnknown::Release** method, which can be equal to the reference count for the object to be released. 
 *   
 * For more information about **IUnknown::Release**, see [Implementing the IUnknown Interface](implementing-the-iunknown-interface.md).
 * @param {Pointer<Void>} lpunk 
 * @returns {Integer} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values. 
 *     
 * MAPI_E_CALL_FAILED 
 *   
 * > An error of unexpected or unknown origin prevented the operation from completing.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ulrelease
 */
export UlRelease(lpunk) {
    lpunkMarshal := lpunk is VarRef ? "ptr" : "ptr"

    result := DllCall("MAPI32.dll\UlRelease", lpunkMarshal, lpunk, UInt32)
    return result
}

/**
 * Retrieves the value of a single property from a property interface, that is, an interface derived from IMAPIProp.
 * @remarks
 * Unlike the [IMAPIProp::GetProps](imapiprop-getprops.md) method, the **HrGetOneProp** function never returns any warning. Because it retrieves only one property, it simply either succeeds or fails. For retrieving multiple properties, **GetProps** is faster. 
 *   
 * You can set or change a single property with the [HrSetOneProp](hrsetoneprop.md) function.
 * @param {IMAPIProp} lpMapiProp 
 * @param {Integer} ulPropTag > [in] Property tag of the property to be retrieved.
 * @param {Pointer<Pointer<SPropValue>>} lppProp 
 * @returns {HRESULT} MAPI_E_NOT_FOUND 
 *   
 * > The requested property is not available from the specified interface.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrgetoneprop
 */
export HrGetOneProp(lpMapiProp, ulPropTag, lppProp) {
    lppPropMarshal := lppProp is VarRef ? "ptr*" : "ptr"

    result := DllCall("MAPI32.dll\HrGetOneProp", "ptr", lpMapiProp, "uint", ulPropTag, lppPropMarshal, lppProp, "HRESULT")
    return result
}

/**
 * Sets or changes the value of a single property on a property interface, that is, an interface derived from IMAPIProp.
 * @remarks
 * Unlike the [IMAPIProp::SetProps](imapiprop-setprops.md) method, the **HrSetOneProp** function never returns any warnings. Because it sets only one property, it simply either succeeds or fails. For setting or changing multiple properties, **SetProps** is faster. 
 *   
 * You can retrieve a single property with the [HrGetOneProp](hrgetoneprop.md) function.
 * @param {IMAPIProp} lpMapiProp 
 * @param {Pointer<SPropValue>} lpProp 
 * @returns {HRESULT} None.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrsetoneprop
 */
export HrSetOneProp(lpMapiProp, lpProp) {
    result := DllCall("MAPI32.dll\HrSetOneProp", "ptr", lpMapiProp, SPropValue.Ptr, lpProp, "HRESULT")
    return result
}

/**
 * Describes FPropExists and provides syntax, parameters, and return value.
 * @remarks
 * If the property tag in the _ulPropTag_ parameter has type PT_UNSPECIFIED, the **FPropExists** function looks for a match based only on the property identifier. Otherwise, the match is for the entire property tag, including the type.
 * @param {IMAPIProp} lpMapiProp 
 * @param {Integer} ulPropTag > [in] Property tag for which to search.
 * @returns {BOOL} TRUE 
 *   
 * > A match for the given property tag was found. 
 *     
 * FALSE 
 *   
 * > A match for the given property tag was not found.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/fpropexists
 */
export FPropExists(lpMapiProp, ulPropTag) {
    result := DllCall("MAPI32.dll\FPropExists", "ptr", lpMapiProp, "uint", ulPropTag, BOOL)
    return result
}

/**
 * Searches for a specified property in a property set for Outlook 2013 and Outlook 2016.
 * @remarks
 * If the given property tag indicates a property of type PT_UNSPECIFIED, the **PpropFindProp** function finds a match only for the property identifier in the tag. Otherwise, it finds a match for the entire property tag, including the property type, and returns the property identified.
 * @param {Pointer<SPropValue>} lpPropArray 
 * @param {Integer} cValues 
 * @param {Integer} ulPropTag > [in] Property tag for the property to search for in the property set indicated by the  _rgprop_ parameter.
 * @returns {Pointer<SPropValue>} **PpropFindProp** returns an [SPropValue](spropvalue.md) structure defining the property that matches the input property tag, or NULL if there is no match.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ppropfindprop
 */
export PpropFindProp(lpPropArray, cValues, ulPropTag) {
    result := DllCall("MAPI32.dll\PpropFindProp", SPropValue.Ptr, lpPropArray, "uint", cValues, "uint", ulPropTag, SPropValue.Ptr)
    return result
}

/**
 * Describes FreePadrlist and provides syntax, parameters, and return value.
 * @param {Pointer<ADRLIST>} lpAdrlist 
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/freepadrlist
 */
export FreePadrlist(lpAdrlist) {
    DllCall("MAPI32.dll\FreePadrlist", ADRLIST.Ptr, lpAdrlist)
}

/**
 * Destroys an SRowSet structure and frees associated memory, including memory allocated for all member arrays and structures.
 * @param {Pointer<SRowSet>} lpRows 
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/freeprows
 */
export FreeProws(lpRows) {
    DllCall("MAPI32.dll\FreeProws", SRowSet.Ptr, lpRows)
}

/**
 * Retrieves all rows of a table. A client application or service provider has no control over the number of rows it attempts to retrieve.
 * @remarks
 * A client application or service provider has no control over the number of rows **HrQueryAllRows** attempts to retrieve, other than by imposing a restriction pointed to by the  _pres_ parameter. The  _crowsMax_ parameter does not limit the retrieval to a certain number of table rows, but rather defines a maximum amount of memory available to hold all retrieved rows. The only protection against massive memory overflow is the stopgap feature provided by setting  _crowsMax_. The error return MAPI_E_TABLE_TOO_BIG means the table contains too many rows to be held all at once in memory. 
 *   
 * Tables that are typically small, such as a message store table or a provider table, usually can be safely retrieved with **HrQueryAllRows**. Tables at risk of being very large, such as a contents table or even a recipients table, should be traversed in subsections using the [IMAPITable::QueryRows](imapitable-queryrows.md) method. 
 *   
 * If any table properties are undefined when **HrQueryAllRows** is called, they are returned with property type PT_NULL and property identifier PROP_ID_NULL
 * @param {IMAPITable} lpTable 
 * @param {Pointer<SPropTagArray>} lpPropTags 
 * @param {Pointer<SRestriction>} lpRestriction 
 * @param {Pointer<SSortOrderSet>} lpSortOrderSet 
 * @param {Integer} crowsMax > [in] Maximum number of rows to be retrieved. If the value of the  _crowsMax_ parameter is zero, no limit on the number of rows retrieved is set.
 * @param {Pointer<Pointer<SRowSet>>} lppRows 
 * @returns {HRESULT} S_OK 
 *   
 * > The call retrieved the expected rows of a table. 
 *     
 * MAPI_E_TABLE_TOO_BIG 
 *   
 * > The number of rows in the table is larger than the number passed for the  _crowsMax_ parameter.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hrqueryallrows
 */
export HrQueryAllRows(lpTable, lpPropTags, lpRestriction, lpSortOrderSet, crowsMax, lppRows) {
    lppRowsMarshal := lppRows is VarRef ? "ptr*" : "ptr"

    result := DllCall("MAPI32.dll\HrQueryAllRows", "ptr", lpTable, SPropTagArray.Ptr, lpPropTags, SRestriction.Ptr, lpRestriction, SSortOrderSet.Ptr, lpSortOrderSet, "int", crowsMax, lppRowsMarshal, lppRows, "HRESULT")
    return result
}

/**
 * Searches for the first occurrence of a character in a null-terminated string. Searches in the Unicode and DBCS formats are supported.
 * @remarks
 * The **SzFindCh** function searches for an exact match only; it is sensitive to case and diacritical differences. Searches in the Unicode and DBCS formats are supported.
 * @param {Pointer<Integer>} lpsz > [in] Pointer to the null-terminated string to be searched.
 * @param {Integer} ch > [in] The character to be searched for.
 * @returns {Pointer<Integer>} **SzFindCh** returns a pointer to the first occurrence of the character in the string. If the character does not occur anywhere in the string, or if the _lpsz_ parameter is NULL, a value of NULL is returned.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/szfindch
 */
export SzFindCh(lpsz, ch) {
    lpszMarshal := lpsz is VarRef ? "char*" : "ptr"

    result := DllCall("MAPI32.dll\SzFindCh", lpszMarshal, lpsz, "ushort", ch, IntPtr)
    return result
}

/**
 * Searches for the last occurrence of a character in a null-terminated string. If the character does not occur, a value of NULL is returned.
 * @remarks
 * The **SzFindLastCh** function searches for an exact match only; it is sensitive to case and diacritical differences. Searches in the Unicode and DBCS formats are supported.
 * @param {Pointer<Integer>} lpsz > [in] Pointer to the null-terminated string to be searched.
 * @param {Integer} ch > [in] The character to be searched for.
 * @returns {Pointer<Integer>} **SzFindLastCh** returns a pointer to the last occurrence of the character in the string. If the character does not occur anywhere in the string, or if the _lpsz_ parameter is NULL, a value of NULL is returned.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/szfindlastch
 */
export SzFindLastCh(lpsz, ch) {
    lpszMarshal := lpsz is VarRef ? "char*" : "ptr"

    result := DllCall("MAPI32.dll\SzFindLastCh", lpszMarshal, lpsz, "ushort", ch, IntPtr)
    return result
}

/**
 * Locates the first occurrence of a null-terminated substring in a null-terminated string. Searches in Unicode and DBCS formats are supported.
 * @remarks
 * The **SzFindSz** function searches for an exact match only; it is sensitive to case and diacritical differences. Searches in Unicode and DBCS formats are supported. The length limit on both parameters is in characters, not necessarily bytes.
 * @param {Pointer<Integer>} lpsz > [in] Pointer to the null-terminated string to be searched. The  _lpsz_ parameter must not exceed 65536 characters.
 * @param {Pointer<Integer>} lpszKey > [in] Pointer to the null-terminated substring to be searched for. The  _lpszKey_ parameter must not exceed 65536 characters.
 * @returns {Pointer<Integer>} **SzFindSz** returns a pointer to the first character of the first occurrence of the substring in the string. If the substring does not occur anywhere in the string, if  _lpszKey_ is larger than  _lpsz_, or if either parameter is NULL, a value of NULL is returned.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/szfindsz
 */
export SzFindSz(lpsz, lpszKey) {
    lpszMarshal := lpsz is VarRef ? "char*" : "ptr"
    lpszKeyMarshal := lpszKey is VarRef ? "char*" : "ptr"

    result := DllCall("MAPI32.dll\SzFindSz", lpszMarshal, lpsz, lpszKeyMarshal, lpszKey, IntPtr)
    return result
}

/**
 * Converts a null-terminated string of decimal digits into an unsigned integer. If the string doesn't begin with at least one decimal digit, zero is returned.
 * @remarks
 * The **UFromSz** function stops converting when it reaches the first character in the string that is not a decimal digit. For example, given the string "55", **UFromSz** returns the integer value 55. Given the string "5a5b", the function returns the integer value 5. Given the string "a5b5", **UFromSz** returns zero. 
 *   
 *  **UFromSz** is sensitive to diacritical differences. Strings in the Unicode and DBCS formats are supported. The length limit on  _lpsz_ is in characters, not necessarily bytes.
 * @param {Pointer<Integer>} lpsz > [in] Pointer to the null-terminated string to be converted. The  _lpsz_ parameter must not exceed 65536 characters.
 * @returns {Integer} **UFromSz** returns an unsigned integer. If the string does not begin with at least one decimal digit, zero is returned.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ufromsz
 */
export UFromSz(lpsz) {
    lpszMarshal := lpsz is VarRef ? "char*" : "ptr"

    result := DllCall("MAPI32.dll\UFromSz", lpszMarshal, lpsz, UInt32)
    return result
}

/**
 * Locates a universal naming convention (UNC) path counterpart to the given local path for Outlook 2013 or Outlook 2016.
 * @param {PSTR} lpszLocal 
 * @param {PSTR} lpszUNC 
 * @param {Integer} cchUNC > [in] Size of the buffer for the output string.
 * @returns {Integer} S_OK
 *   
 * > The UNC path counterpart was successfully located.
 *     
 * MAPI_E_INVALID_PARAMETER
 *   
 * > One or more parameters are invalid.
 *     
 * MAPI_E_TOO_BIG
 *   
 * >  _szUNC_ was not large enough to hold the result. 
 *     
 * S_FALSE
 *   
 * > The local path was already a UNC string.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/scuncfromlocalpath
 */
export ScUNCFromLocalPath(lpszLocal, lpszUNC, cchUNC) {
    lpszLocal := lpszLocal is String ? StrPtr(lpszLocal) : lpszLocal
    lpszUNC := lpszUNC is String ? StrPtr(lpszUNC) : lpszUNC

    result := DllCall("MAPI32.dll\ScUNCFromLocalPath", "ptr", lpszLocal, "ptr", lpszUNC, "uint", cchUNC, Int32)
    return result
}

/**
 * Locates a local path counterpart to the given universal naming convention (UNC) path for Outlook 2013 or Outlook 2016.
 * @param {PSTR} lpszUNC 
 * @param {PSTR} lpszLocal 
 * @param {Integer} cchLocal > [in] Size of the buffer for the output string.
 * @returns {Integer} S_OK
 *   
 * > A local path was successfully located.
 *     
 * MAPI_E_TOO_BIG
 *   
 * >  _szLocal_ was not large enough to hold the result. 
 *     
 * S_FALSE
 *   
 * > The UNC string was already a local path.
 *     
 * MAPI_E_NOT_FOUND
 *   
 * > A local path was not found.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sclocalpathfromunc
 */
export ScLocalPathFromUNC(lpszUNC, lpszLocal, cchLocal) {
    lpszUNC := lpszUNC is String ? StrPtr(lpszUNC) : lpszUNC
    lpszLocal := lpszLocal is String ? StrPtr(lpszLocal) : lpszLocal

    result := DllCall("MAPI32.dll\ScLocalPathFromUNC", "ptr", lpszUNC, "ptr", lpszLocal, "uint", cchLocal, Int32)
    return result
}

/**
 * Adds one unsigned 64-bit integer to another for Outlook 2013 or Outlook 2016.
 * @param {FILETIME} ftAddend1 
 * @param {FILETIME} ftAddend2 
 * @returns {FILETIME} The **FtAddFt** function returns a **FILETIME** structure that contains the sum of the two integers. The two input parameters remain unchanged.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftaddft
 */
export FtAddFt(ftAddend1, ftAddend2) {
    result := DllCall("MAPI32.dll\FtAddFt", FILETIME, ftAddend1, FILETIME, ftAddend2, FILETIME)
    return result
}

/**
 * Describes FtMulDwDw and provides syntax, parameters, and return value.
 * @param {Integer} ftMultiplicand 
 * @param {Integer} ftMultiplier 
 * @returns {FILETIME} The **FtMulDwDw** function returns a [FILETIME](filetime.md) structure that contains the product of the two integers. The two input parameters remain unchanged.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftmuldwdw
 */
export FtMulDwDw(ftMultiplicand, ftMultiplier) {
    result := DllCall("MAPI32.dll\FtMulDwDw", "uint", ftMultiplicand, "uint", ftMultiplier, FILETIME)
    return result
}

/**
 * Multiplies an unsigned 64-bit integer by an unsigned 32-bit integer. The two input parameters remain unchanged.
 * @param {Integer} ftMultiplier 
 * @param {FILETIME} ftMultiplicand 
 * @returns {FILETIME} The **FtMulDw** function returns a **FILETIME** structure that contains the product of the two integers. The two input parameters remain unchanged.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftmuldw
 */
export FtMulDw(ftMultiplier, ftMultiplicand) {
    result := DllCall("MAPI32.dll\FtMulDw", "uint", ftMultiplier, FILETIME, ftMultiplicand, FILETIME)
    return result
}

/**
 * Describes FtSubFt and provides syntax, parameters, and return value.
 * @param {FILETIME} ftMinuend 
 * @param {FILETIME} ftSubtrahend 
 * @returns {FILETIME} The **FtSubFt** function returns a **FILETIME** structure that contains the result of the subtraction. The two input parameters remain unchanged.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftsubft
 */
export FtSubFt(ftMinuend, ftSubtrahend) {
    result := DllCall("MAPI32.dll\FtSubFt", FILETIME, ftMinuend, FILETIME, ftSubtrahend, FILETIME)
    return result
}

/**
 * Describes FtNegFt and provides syntax, parameters, and return value.
 * @param {FILETIME} ft > [in] A [FILETIME](filetime.md) structure that contains the unsigned 64-bit integer for which to compute the two's complement.
 * @returns {FILETIME} The **FtNegFt** function returns a **FILETIME** structure that contains the two's complement of the integer. The input parameter remains unchanged.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ftnegft
 */
export FtNegFt(ft) {
    result := DllCall("MAPI32.dll\FtNegFt", FILETIME, ft, FILETIME)
    return result
}

/**
 * Indicates where in a message thread a message belongs for Outlook 2013 or Outlook 2016.
 * @param {Integer} cbParent > [in] Count of bytes in the parent conversation index.
 * @param {Pointer<Integer>} lpbParent > [in] Pointer to bytes in the parent conversation index. This may be NULL if  _cbParent_ is zero.
 * @param {Pointer<Integer>} lpcbConvIndex 
 * @param {Pointer<Pointer<Integer>>} lppbConvIndex 
 * @returns {Integer} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sccreateconversationindex
 */
export ScCreateConversationIndex(cbParent, lpbParent, lpcbConvIndex, lppbConvIndex) {
    lpbParentMarshal := lpbParent is VarRef ? "char*" : "ptr"
    lpcbConvIndexMarshal := lpcbConvIndex is VarRef ? "uint*" : "ptr"
    lppbConvIndexMarshal := lppbConvIndex is VarRef ? "ptr*" : "ptr"

    result := DllCall("MAPI32.dll\ScCreateConversationIndex", "uint", cbParent, lpbParentMarshal, lpbParent, lpcbConvIndexMarshal, lpcbConvIndex, lppbConvIndexMarshal, lppbConvIndex, Int32)
    return result
}

/**
 * Converts a message store's internal entry identifier to an entry identifier more usable by the messaging system.
 * @remarks
 * A message store object retains an internal entry identifier which is meaningful only to service providers coresident with that message store. For other messaging components, MAPI supplies a wrapped version of the internal entry identifier that makes it recognizable as that belong to the message store. Coresident service providers should always be given the original unwrapped message store entry identifier; client applications should always be given the wrapped version, which is then usable anywhere in the messaging domain and in other domains. 
 *   
 * A service provider can wrap a message store entry identifier using either the **WrapStoreEntryID** function or the [IMAPISupport::WrapStoreEntryID](imapisupport-wrapstoreentryid.md) method, which calls the **WrapStoreEntryID** function. The provider must wrap the entry identifier when exposing the message store's **PR_ENTRYID** ([PidTagEntryId](pidtagentryid-canonical-property.md)) property or writing it into a profile section, and when exposing the **PR_STORE_ENTRYID** ([PidTagStoreEntryId](pidtagstoreentryid-canonical-property.md)) property. MAPI wraps a message store entry identifier when responding to an [IMAPISession::OpenMsgStore](imapisession-openmsgstore.md) call. 
 *   
 * When a client application passes a wrapped message store entry identifier to MAPI, for example in an [IMAPISession::OpenEntry](imapisession-openentry.md) call, MAPI unwraps the entry identifier before using it to call a provider method such as [IMSProvider::Logon](imsprovider-logon.md) or [IMSProvider::CompareStoreIDs](imsprovider-comparestoreids.md).
 * @param {Integer} ulFlags > [in] Bitmask of flags. The following flag can be set:
 *     
 * MAPI_UNICODE 
 *   
 * > The strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
 * @param {Pointer<Integer>} lpszDLLName 
 * @param {Integer} cbOrigEntry > [in] Size, in bytes, of the original entry identifier for the message store.
 * @param {Integer} lpOrigEntry > [in] Pointer to an [ENTRYID](entryid.md) structure that contains the original entry identifier.
 * @param {Integer} lppWrappedEntry > [out] Pointer to a pointer to an **ENTRYID** structure that contains the new entry identifier.
 * @returns {Integer} > [out] Pointer to the size, in bytes, of the new entry identifier.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/wrapstoreentryid
 */
export WrapStoreEntryID(ulFlags, lpszDLLName, cbOrigEntry, lpOrigEntry, lppWrappedEntry) {
    lpszDLLNameMarshal := lpszDLLName is VarRef ? "char*" : "ptr"

    result := DllCall("MAPI32.dll\WrapStoreEntryID", "uint", ulFlags, lpszDLLNameMarshal, lpszDLLName, "uint", cbOrigEntry, "ptr", lpOrigEntry, "uint*", &lpcbWrappedEntry := 0, "ptr", lppWrappedEntry, "HRESULT")
    return lpcbWrappedEntry
}

/**
 * Makes sure that the RTF message text matches the plain text version. Call this function before reading the RTF version and after modifying the RTF version.
 * @remarks
 * If the **PR_RTF_IN_SYNC** ([PidTagRtfInSync](pidtagrtfinsync-canonical-property.md)) property is missing or is FALSE, before reading the **PR_RTF_COMPRESSED** ([PidTagRtfCompressed](pidtagrtfcompressed-canonical-property.md)) property the **RTFSync** function should be called with the RTF_SYNC_BODY_CHANGED flag set. 
 *   
 * If the STORE_RTF_OK flag is not set in the **PR_STORE_SUPPORT_MASK** ([PidTagStoreSupportMask](pidtagstoresupportmask-canonical-property.md)) property, this function should be called with the RTF_SYNC_RTF_CHANGED flag set after modifying **PR_RTF_COMPRESSED**. 
 *   
 * If both **PR_BODY** ([PidTagBody](pidtagbody-canonical-property.md)) and **PR_RTF_COMPRESSED** have been changed, the **RTFSync** function should be called with both flags set. 
 *   
 * If the value of the  _lpfMessageUpdated_ parameter is set to TRUE, then the [IMAPIProp::SaveChanges](imapiprop-savechanges.md) method should be called for the message. If **SaveChanges** is not called, the modifications will not be saved in the message. 
 *   
 * Message store providers can use **RTFSync** to keep the **PR_BODY** and **PR_RTF_COMPRESSED** properties synchronized. 
 *   
 * For more information, see [Supporting RTF Text for Message Store Providers](supporting-rtf-text-for-message-store-providers.md).
 * @param {IMessage} lpMessage > [in] Pointer to the message to be updated.
 * @param {Integer} ulFlags > [in] Bitmask of flags used to indicate the RTF or plain text version of the message has changed. The following flags can be set:
 *     
 *   - RTF_SYNC_BODY_CHANGED: The plain text version of the message has changed.
 *       
 *   - RTF_SYNC_RTF_CHANGED: The RTF version of the message has changed.
 *     
 *   All other bits in the _ulFlags_ parameter are reserved for future use.
 * @param {Pointer<BOOL>} lpfMessageUpdated > [out] Pointer to a variable indicating whether there is an updated message. TRUE if there is an updated message, FALSE otherwise.
 * @returns {HRESULT} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/rtfsync
 */
export RTFSync(lpMessage, ulFlags, lpfMessageUpdated) {
    lpfMessageUpdatedMarshal := lpfMessageUpdated is VarRef ? "int*" : "ptr"

    result := DllCall("MAPI32.dll\RTFSync", "ptr", lpMessage, "uint", ulFlags, lpfMessageUpdatedMarshal, lpfMessageUpdated, "HRESULT")
    return result
}

/**
 * Creates a text stream in uncompressed Rich Text Format from the compressed format used in the PR_RTF_COMPRESSED property.
 * @remarks
 * If the MAPI_MODIFY flag is passed in the _ulFlags_ parameter, the  _lpCompressedRTFStream_ parameter must already be open for reading and writing. New, uncompressed RTF text should be written into the stream interface returned in  _lpUncompressedRTFStream_. Because it is not possible to append the existing stream, the entire message text must be written. 
 *   
 * If zero is passed in the _ulFlags_ parameter, then  _lpCompressedRTFStream_ may be opened read-only. Only the entire message text can be read out of the stream interface returned in  _lpUncompressedRTFStream_. It is not possible to search starting the middle of the stream. 
 *   
 *  **WrapCompressedRTFStream** assumes that the compressed stream's pointer is set to the beginning of the stream. Certain OLE **IStream** methods are not supported by the returned uncompressed stream. These include **IStream::Clone**, **IStream::LockRegion**, **IStream::Revert**, **IStream::Seek**, **IStream::SetSize**, **IStream::Stat**, and **IStream::UnlockRegion**. In order to copy to the entire stream, a read/write loop is needed. 
 *   
 * Because the client writes new RTF in uncompressed format, it should use **WrapCompressedRTFStream**, instead of directly writing to the stream. RTF-aware clients should search for the STORE_UNCOMPRESSED_RTF flag in the **PR_STORE_SUPPORT_MASK** ([PidTagStoreSupportMask](pidtagstoresupportmask-canonical-property.md)) property and pass it to **WrapCompressed RTFStream** if it is set.
 * @param {IStream} lpCompressedRTFStream > [in] Pointer to a stream opened on the PR_RTF_COMPRESSED property of a message.
 * @param {Integer} ulFlags > [in] Bitmask of option flags for the function. The following flags can be set:
 *     
 * MAPI_MODIFY 
 *   
 * > Whether the client intends to read or write the wrapped stream interface that is returned. 
 *     
 * STORE_UNCOMPRESSED_RTF 
 *   
 * > Uncompressed RTF should be written to the stream pointed to by  _lpCompressedRTFStream_
 * @returns {IStream} > [out] Pointer to the location where **WrapCompressedRTFStream** returns a stream for the uncompressed RTF.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/wrapcompressedrtfstream
 */
export WrapCompressedRTFStream(lpCompressedRTFStream, ulFlags) {
    result := DllCall("MAPI32.dll\WrapCompressedRTFStream", "ptr", lpCompressedRTFStream, "uint", ulFlags, "ptr*", &lpUncompressedRTFStream := 0, "HRESULT")
    return IStream(lpUncompressedRTFStream)
}

/**
 * This article describes HrIStorageFromStream, it provides syntax, parameters, return value, and additional remarks.
 * @remarks
 * Message store providers support the **HrIStorageFromStream** function using the **IStorage** interface for attachments. Store providers must implement the **IStream** interface. **HrIStorageFromStream** provides the **IStorage** interface for the **IStream** object. It is possible to pass either an **ILockBytes** or an **IStream** interface in  _lpUnkIn_.
 * @param {IUnknown} lpUnkIn > [in] Pointer to the **IUnknown** object implementing **IStream**.
 * @param {Pointer<Guid>} lpInterface > [in] Pointer to the interface identifier (IID) for the stream object. Any of the following values can be passed in the _lpInterface_ parameter: NULL, IID_IStream, or IID_ILockBytes. Passing NULL in  _lpInterface_ is the same as passing IID_IStream.
 * @param {Integer} ulFlags > [in] Bitmask of flags that controls how the storage object is to be created relative to the stream. The default setting is STGSTRM_RESET, which gives the storage object read-only access and starts it at position zero of the stream. The following flags can be set in any combination, except as noted:
 *     
 * STGSTRM_CREATE 
 *   
 * > Creates a new storage object for the stream object. This flag cannot be set if the STGSTRM_RESET flag is set. 
 *     
 * STGSTRM_CURRENT 
 *   
 * > Starts storage at the current position of the stream. This flag cannot be set if the STGSTRM_RESET flag is set. 
 *     
 * STGSTRM_MODIFY 
 *   
 * > Allows the calling service provider to write to the returned storage. This flag cannot be set if the STGSTRM_RESET flag is set. 
 *     
 * STGSTRM_RESET 
 *   
 * > Starts storage at position zero. This flag cannot be set if any other flag is set.
 * @returns {IStorage} > [out] Pointer to a pointer to the returned **IStorage** object.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hristoragefromstream
 */
export HrIStorageFromStream(lpUnkIn, lpInterface, ulFlags) {
    result := DllCall("MAPI32.dll\HrIStorageFromStream", "ptr", lpUnkIn, Guid.Ptr, lpInterface, "uint", ulFlags, "ptr*", &lppStorageOut := 0, "HRESULT")
    return IStorage(lppStorageOut)
}

/**
 * Replaces MAPIInitialize when only select utility functions are being used for Outlook 2013 or Outlook 2016.
 * @remarks
 * The **ScInitMapiUtil** and [DeinitMapiUtil](deinitmapiutil.md) functions cooperate to call and release select utility functions, as opposed to [MAPIInitialize](mapiinitialize.md), which calls core as well as utility functions. When **ScInitMapiUtil** calls utility functions, it also initializes the necessary memory. 
 *   
 * When use of the functions that **ScInitMapiUtil** has called is complete, **DeinitMapiUtil** must be explicitly called to release them. In contrast, **MAPIInitialize** implicitly calls **DeinitMapiUtil**.
 * @param {Integer} ulFlags > [in] Reserved; must be zero.
 * @returns {Integer} S_OK 
 *   
 * > The call succeeded and has returned the expected value or values.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/scinitmapiutil
 */
export ScInitMapiUtil(ulFlags) {
    result := DllCall("MAPI32.dll\ScInitMapiUtil", "uint", ulFlags, Int32)
    return result
}

/**
 * Releases utility functions called explicitly by the ScInitMapiUtil function or implicitly by the MAPIInitialize function. 
 * @remarks
 * The **DeinitMapiUtil** function release functions initialized with [ScInitMapiUtil](scinitmapiutil.md) or [MAPIInitialize](mapiinitialize.md). 
 *   
 * When use of the functions called by **ScInitMapiUtil** is complete, **DeinitMapiUtil** must be explicitly called to release them. In contrast, [MAPIUninitialize](mapiuninitialize.md) implicitly calls **DeinitMapiUtil**.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/deinitmapiutil
 */
export DeinitMapiUtil() {
    DllCall("MAPI32.dll\DeinitMapiUtil")
}

;@endregion Functions
