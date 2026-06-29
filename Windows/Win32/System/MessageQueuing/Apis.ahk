#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\DistributedTransactionCoordinator\ITransaction.ahk" { ITransaction }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MQRESTRICTION.ahk" { MQRESTRICTION }
#Import "..\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import ".\MQQMPROPS.ahk" { MQQMPROPS }
#Import ".\MQMSGPROPS.ahk" { MQMSGPROPS }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\MQSORTSET.ahk" { MQSORTSET }
#Import "..\..\Security\OBJECT_SECURITY_INFORMATION.ahk" { OBJECT_SECURITY_INFORMATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MQMGMTPROPS.ahk" { MQMGMTPROPS }
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import ".\MQQUEUEPROPS.ahk" { MQQUEUEPROPS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MQPRIVATEPROPS.ahk" { MQPRIVATEPROPS }
#Import ".\MQCOLUMNSET.ahk" { MQCOLUMNSET }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */

;@region Functions
/**
 * 
 * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
 * @param {Pointer<MQQUEUEPROPS>} pQueueProps 
 * @param {PWSTR} lpwcsFormatName 
 * @param {Pointer<Integer>} lpdwFormatNameLength 
 * @returns {HRESULT} 
 */
export MQCreateQueue(pSecurityDescriptor, pQueueProps, lpwcsFormatName, lpdwFormatNameLength) {
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    lpdwFormatNameLengthMarshal := lpdwFormatNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("mqrt.dll\MQCreateQueue", PSECURITY_DESCRIPTOR, pSecurityDescriptor, MQQUEUEPROPS.Ptr, pQueueProps, "ptr", lpwcsFormatName, lpdwFormatNameLengthMarshal, lpdwFormatNameLength, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwcsFormatName 
 * @returns {HRESULT} 
 */
export MQDeleteQueue(lpwcsFormatName) {
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    result := DllCall("mqrt.dll\MQDeleteQueue", "ptr", lpwcsFormatName, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwcsContext 
 * @param {Pointer<MQRESTRICTION>} pRestriction 
 * @param {Pointer<MQCOLUMNSET>} pColumns 
 * @param {Pointer<MQSORTSET>} pSort 
 * @returns {HANDLE} 
 */
export MQLocateBegin(lpwcsContext, pRestriction, pColumns, pSort) {
    lpwcsContext := lpwcsContext is String ? StrPtr(lpwcsContext) : lpwcsContext

    phEnum := HANDLE.Owned()
    result := DllCall("mqrt.dll\MQLocateBegin", "ptr", lpwcsContext, MQRESTRICTION.Ptr, pRestriction, MQCOLUMNSET.Ptr, pColumns, MQSORTSET.Ptr, pSort, HANDLE.Ptr, phEnum, "HRESULT")
    return phEnum
}

/**
 * 
 * @param {HANDLE} hEnum 
 * @param {Pointer<Integer>} pcProps 
 * @param {Pointer<PROPVARIANT>} aPropVar 
 * @returns {HRESULT} 
 */
export MQLocateNext(hEnum, pcProps, aPropVar) {
    pcPropsMarshal := pcProps is VarRef ? "uint*" : "ptr"

    result := DllCall("mqrt.dll\MQLocateNext", HANDLE, hEnum, pcPropsMarshal, pcProps, PROPVARIANT.Ptr, aPropVar, "HRESULT")
    return result
}

/**
 * 
 * @param {HANDLE} hEnum 
 * @returns {HRESULT} 
 */
export MQLocateEnd(hEnum) {
    result := DllCall("mqrt.dll\MQLocateEnd", HANDLE, hEnum, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwcsFormatName 
 * @param {Integer} dwAccess 
 * @param {Integer} dwShareMode 
 * @returns {Pointer} 
 */
export MQOpenQueue(lpwcsFormatName, dwAccess, dwShareMode) {
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    result := DllCall("mqrt.dll\MQOpenQueue", "ptr", lpwcsFormatName, "uint", dwAccess, "uint", dwShareMode, "ptr*", &phQueue := 0, "HRESULT")
    return phQueue
}

/**
 * 
 * @param {Pointer} hDestinationQueue 
 * @param {Pointer<MQMSGPROPS>} pMessageProps 
 * @param {ITransaction} pTransaction 
 * @returns {HRESULT} 
 */
export MQSendMessage(hDestinationQueue, pMessageProps, pTransaction) {
    result := DllCall("mqrt.dll\MQSendMessage", "ptr", hDestinationQueue, MQMSGPROPS.Ptr, pMessageProps, "ptr", pTransaction, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer} hSource 
 * @param {Integer} dwTimeout 
 * @param {Integer} dwAction 
 * @param {Pointer<MQMSGPROPS>} pMessageProps 
 * @param {Pointer<OVERLAPPED>} lpOverlapped 
 * @param {Pointer<PMQRECEIVECALLBACK>} fnReceiveCallback 
 * @param {HANDLE} _hCursor 
 * @param {ITransaction} pTransaction 
 * @returns {HRESULT} 
 */
export MQReceiveMessage(hSource, dwTimeout, dwAction, pMessageProps, lpOverlapped, fnReceiveCallback, _hCursor, pTransaction) {
    result := DllCall("mqrt.dll\MQReceiveMessage", "ptr", hSource, "uint", dwTimeout, "uint", dwAction, MQMSGPROPS.Ptr, pMessageProps, OVERLAPPED.Ptr, lpOverlapped, "ptr", fnReceiveCallback, HANDLE, _hCursor, "ptr", pTransaction, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer} hSource 
 * @param {Integer} ullLookupId 
 * @param {Integer} dwLookupAction 
 * @param {Pointer<MQMSGPROPS>} pMessageProps 
 * @param {Pointer<OVERLAPPED>} lpOverlapped 
 * @param {Pointer<PMQRECEIVECALLBACK>} fnReceiveCallback 
 * @param {ITransaction} pTransaction 
 * @returns {HRESULT} 
 */
export MQReceiveMessageByLookupId(hSource, ullLookupId, dwLookupAction, pMessageProps, lpOverlapped, fnReceiveCallback, pTransaction) {
    result := DllCall("mqrt.dll\MQReceiveMessageByLookupId", "ptr", hSource, "uint", ullLookupId, "uint", dwLookupAction, MQMSGPROPS.Ptr, pMessageProps, OVERLAPPED.Ptr, lpOverlapped, "ptr", fnReceiveCallback, "ptr", pTransaction, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer} hQueue 
 * @returns {HANDLE} 
 */
export MQCreateCursor(hQueue) {
    phCursor := HANDLE.Owned()
    result := DllCall("mqrt.dll\MQCreateCursor", "ptr", hQueue, HANDLE.Ptr, phCursor, "HRESULT")
    return phCursor
}

/**
 * 
 * @param {HANDLE} _hCursor 
 * @returns {HRESULT} 
 */
export MQCloseCursor(_hCursor) {
    result := DllCall("mqrt.dll\MQCloseCursor", HANDLE, _hCursor, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer} hQueue 
 * @returns {HRESULT} 
 */
export MQCloseQueue(hQueue) {
    result := DllCall("mqrt.dll\MQCloseQueue", "ptr", hQueue, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwcsFormatName 
 * @param {Pointer<MQQUEUEPROPS>} pQueueProps 
 * @returns {HRESULT} 
 */
export MQSetQueueProperties(lpwcsFormatName, pQueueProps) {
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    result := DllCall("mqrt.dll\MQSetQueueProperties", "ptr", lpwcsFormatName, MQQUEUEPROPS.Ptr, pQueueProps, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwcsFormatName 
 * @param {Pointer<MQQUEUEPROPS>} pQueueProps 
 * @returns {HRESULT} 
 */
export MQGetQueueProperties(lpwcsFormatName, pQueueProps) {
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    result := DllCall("mqrt.dll\MQGetQueueProperties", "ptr", lpwcsFormatName, MQQUEUEPROPS.Ptr, pQueueProps, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwcsFormatName 
 * @param {Integer} RequestedInformation 
 * @param {Integer} pSecurityDescriptor 
 * @param {Integer} nLength 
 * @returns {Integer} 
 */
export MQGetQueueSecurity(lpwcsFormatName, RequestedInformation, pSecurityDescriptor, nLength) {
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    result := DllCall("mqrt.dll\MQGetQueueSecurity", "ptr", lpwcsFormatName, "uint", RequestedInformation, "ptr", pSecurityDescriptor, "uint", nLength, "uint*", &lpnLengthNeeded := 0, "HRESULT")
    return lpnLengthNeeded
}

/**
 * 
 * @param {PWSTR} lpwcsFormatName 
 * @param {OBJECT_SECURITY_INFORMATION} SecurityInformation 
 * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
 * @returns {HRESULT} 
 */
export MQSetQueueSecurity(lpwcsFormatName, SecurityInformation, pSecurityDescriptor) {
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    result := DllCall("mqrt.dll\MQSetQueueSecurity", "ptr", lpwcsFormatName, OBJECT_SECURITY_INFORMATION, SecurityInformation, PSECURITY_DESCRIPTOR, pSecurityDescriptor, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwcsPathName 
 * @param {PWSTR} lpwcsFormatName 
 * @param {Pointer<Integer>} lpdwFormatNameLength 
 * @returns {HRESULT} 
 */
export MQPathNameToFormatName(lpwcsPathName, lpwcsFormatName, lpdwFormatNameLength) {
    lpwcsPathName := lpwcsPathName is String ? StrPtr(lpwcsPathName) : lpwcsPathName
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    lpdwFormatNameLengthMarshal := lpdwFormatNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("mqrt.dll\MQPathNameToFormatName", "ptr", lpwcsPathName, "ptr", lpwcsFormatName, lpdwFormatNameLengthMarshal, lpdwFormatNameLength, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer} hQueue 
 * @param {PWSTR} lpwcsFormatName 
 * @param {Pointer<Integer>} lpdwFormatNameLength 
 * @returns {HRESULT} 
 */
export MQHandleToFormatName(hQueue, lpwcsFormatName, lpdwFormatNameLength) {
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    lpdwFormatNameLengthMarshal := lpdwFormatNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("mqrt.dll\MQHandleToFormatName", "ptr", hQueue, "ptr", lpwcsFormatName, lpdwFormatNameLengthMarshal, lpdwFormatNameLength, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Guid>} pGuid 
 * @param {PWSTR} lpwcsFormatName 
 * @param {Pointer<Integer>} lpdwFormatNameLength 
 * @returns {HRESULT} 
 */
export MQInstanceToFormatName(pGuid, lpwcsFormatName, lpdwFormatNameLength) {
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    lpdwFormatNameLengthMarshal := lpdwFormatNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("mqrt.dll\MQInstanceToFormatName", Guid.Ptr, pGuid, "ptr", lpwcsFormatName, lpdwFormatNameLengthMarshal, lpdwFormatNameLength, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwcsADsPath 
 * @param {PWSTR} lpwcsFormatName 
 * @param {Pointer<Integer>} lpdwFormatNameLength 
 * @returns {HRESULT} 
 */
export MQADsPathToFormatName(lpwcsADsPath, lpwcsFormatName, lpdwFormatNameLength) {
    lpwcsADsPath := lpwcsADsPath is String ? StrPtr(lpwcsADsPath) : lpwcsADsPath
    lpwcsFormatName := lpwcsFormatName is String ? StrPtr(lpwcsFormatName) : lpwcsFormatName

    lpdwFormatNameLengthMarshal := lpdwFormatNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("mqrt.dll\MQADsPathToFormatName", "ptr", lpwcsADsPath, "ptr", lpwcsFormatName, lpdwFormatNameLengthMarshal, lpdwFormatNameLength, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMemory 
 * @returns {String} Nothing - always returns an empty string
 */
export MQFreeMemory(pvMemory) {
    pvMemoryMarshal := pvMemory is VarRef ? "ptr" : "ptr"

    DllCall("mqrt.dll\MQFreeMemory", pvMemoryMarshal, pvMemory)
}

/**
 * 
 * @param {PWSTR} lpwcsMachineName 
 * @param {Pointer<Guid>} pguidMachineId 
 * @param {Pointer<MQQMPROPS>} pQMProps 
 * @returns {HRESULT} 
 */
export MQGetMachineProperties(lpwcsMachineName, pguidMachineId, pQMProps) {
    lpwcsMachineName := lpwcsMachineName is String ? StrPtr(lpwcsMachineName) : lpwcsMachineName

    result := DllCall("mqrt.dll\MQGetMachineProperties", "ptr", lpwcsMachineName, Guid.Ptr, pguidMachineId, MQQMPROPS.Ptr, pQMProps, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} lpCertBuffer 
 * @param {Integer} dwCertBufferLength 
 * @returns {HANDLE} 
 */
export MQGetSecurityContext(lpCertBuffer, dwCertBufferLength) {
    phSecurityContext := HANDLE.Owned()
    result := DllCall("mqrt.dll\MQGetSecurityContext", "ptr", lpCertBuffer, "uint", dwCertBufferLength, HANDLE.Ptr, phSecurityContext, "HRESULT")
    return phSecurityContext
}

/**
 * 
 * @param {Integer} lpCertBuffer 
 * @param {Integer} dwCertBufferLength 
 * @returns {HANDLE} 
 */
export MQGetSecurityContextEx(lpCertBuffer, dwCertBufferLength) {
    phSecurityContext := HANDLE.Owned()
    result := DllCall("mqrt.dll\MQGetSecurityContextEx", "ptr", lpCertBuffer, "uint", dwCertBufferLength, HANDLE.Ptr, phSecurityContext, "HRESULT")
    return phSecurityContext
}

/**
 * 
 * @param {HANDLE} hSecurityContext 
 * @returns {String} Nothing - always returns an empty string
 */
export MQFreeSecurityContext(hSecurityContext) {
    DllCall("mqrt.dll\MQFreeSecurityContext", HANDLE, hSecurityContext)
}

/**
 * 
 * @param {Integer} dwFlags 
 * @param {Pointer<Void>} lpCertBuffer 
 * @param {Integer} dwCertBufferLength 
 * @returns {HRESULT} 
 */
export MQRegisterCertificate(dwFlags, lpCertBuffer, dwCertBufferLength) {
    lpCertBufferMarshal := lpCertBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("mqrt.dll\MQRegisterCertificate", "uint", dwFlags, lpCertBufferMarshal, lpCertBuffer, "uint", dwCertBufferLength, "HRESULT")
    return result
}

/**
 * 
 * @returns {ITransaction} 
 */
export MQBeginTransaction() {
    result := DllCall("mqrt.dll\MQBeginTransaction", "ptr*", &ppTransaction := 0, "HRESULT")
    return ITransaction(ppTransaction)
}

/**
 * 
 * @param {Pointer<OVERLAPPED>} lpOverlapped 
 * @returns {HRESULT} 
 */
export MQGetOverlappedResult(lpOverlapped) {
    result := DllCall("mqrt.dll\MQGetOverlappedResult", OVERLAPPED.Ptr, lpOverlapped, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} lpwcsComputerName 
 * @param {Pointer<MQPRIVATEPROPS>} pPrivateProps 
 * @returns {HRESULT} 
 */
export MQGetPrivateComputerInformation(lpwcsComputerName, pPrivateProps) {
    lpwcsComputerName := lpwcsComputerName is String ? StrPtr(lpwcsComputerName) : lpwcsComputerName

    result := DllCall("mqrt.dll\MQGetPrivateComputerInformation", "ptr", lpwcsComputerName, MQPRIVATEPROPS.Ptr, pPrivateProps, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer} hQueue 
 * @returns {HRESULT} 
 */
export MQPurgeQueue(hQueue) {
    result := DllCall("mqrt.dll\MQPurgeQueue", "ptr", hQueue, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pComputerName 
 * @param {PWSTR} pObjectName 
 * @param {Pointer<MQMGMTPROPS>} pMgmtProps 
 * @returns {HRESULT} 
 */
export MQMgmtGetInfo(pComputerName, pObjectName, pMgmtProps) {
    pComputerName := pComputerName is String ? StrPtr(pComputerName) : pComputerName
    pObjectName := pObjectName is String ? StrPtr(pObjectName) : pObjectName

    result := DllCall("mqrt.dll\MQMgmtGetInfo", "ptr", pComputerName, "ptr", pObjectName, MQMGMTPROPS.Ptr, pMgmtProps, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pComputerName 
 * @param {PWSTR} pObjectName 
 * @param {PWSTR} pAction 
 * @returns {HRESULT} 
 */
export MQMgmtAction(pComputerName, pObjectName, pAction) {
    pComputerName := pComputerName is String ? StrPtr(pComputerName) : pComputerName
    pObjectName := pObjectName is String ? StrPtr(pObjectName) : pObjectName
    pAction := pAction is String ? StrPtr(pAction) : pAction

    result := DllCall("mqrt.dll\MQMgmtAction", "ptr", pComputerName, "ptr", pObjectName, "ptr", pAction, "HRESULT")
    return result
}

/**
 * 
 * @param {HANDLE} hQueue 
 * @param {Integer} ullLookupId 
 * @returns {HRESULT} 
 */
export MQMarkMessageRejected(hQueue, ullLookupId) {
    result := DllCall("mqrt.dll\MQMarkMessageRejected", HANDLE, hQueue, "uint", ullLookupId, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer} hSourceQueue 
 * @param {Pointer} hDestinationQueue 
 * @param {Integer} ullLookupId 
 * @param {ITransaction} pTransaction 
 * @returns {HRESULT} 
 */
export MQMoveMessage(hSourceQueue, hDestinationQueue, ullLookupId, pTransaction) {
    result := DllCall("mqrt.dll\MQMoveMessage", "ptr", hSourceQueue, "ptr", hDestinationQueue, "uint", ullLookupId, "ptr", pTransaction, "HRESULT")
    return result
}

;@endregion Functions
