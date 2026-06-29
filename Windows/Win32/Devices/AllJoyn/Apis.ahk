#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\alljoyn_keystorelistener.ahk" { alljoyn_keystorelistener }
#Import ".\alljoyn_applicationstate.ahk" { alljoyn_applicationstate }
#Import ".\alljoyn_certificateid.ahk" { alljoyn_certificateid }
#Import ".\alljoyn_abouticonproxy.ahk" { alljoyn_abouticonproxy }
#Import ".\alljoyn_about_announceflag.ahk" { alljoyn_about_announceflag }
#Import ".\alljoyn_buslistener_callbacks.ahk" { alljoyn_buslistener_callbacks }
#Import ".\alljoyn_typeid.ahk" { alljoyn_typeid }
#Import ".\alljoyn_aboutlistener_callback.ahk" { alljoyn_aboutlistener_callback }
#Import ".\alljoyn_aboutlistener.ahk" { alljoyn_aboutlistener }
#Import ".\alljoyn_sessionopts.ahk" { alljoyn_sessionopts }
#Import ".\alljoyn_aboutdatalistener_callbacks.ahk" { alljoyn_aboutdatalistener_callbacks }
#Import ".\alljoyn_keystore.ahk" { alljoyn_keystore }
#Import ".\alljoyn_busobject.ahk" { alljoyn_busobject }
#Import ".\alljoyn_manifestarray.ahk" { alljoyn_manifestarray }
#Import ".\alljoyn_permissionconfigurationlistener_callbacks.ahk" { alljoyn_permissionconfigurationlistener_callbacks }
#Import ".\QStatus.ahk" { QStatus }
#Import ".\alljoyn_aboutobjectdescription.ahk" { alljoyn_aboutobjectdescription }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\alljoyn_aboutobj.ahk" { alljoyn_aboutobj }
#Import ".\alljoyn_applicationstatelistener_callbacks.ahk" { alljoyn_applicationstatelistener_callbacks }
#Import ".\alljoyn_aboutdatalistener.ahk" { alljoyn_aboutdatalistener }
#Import ".\alljoyn_proxybusobject.ahk" { alljoyn_proxybusobject }
#Import ".\alljoyn_permissionconfigurator.ahk" { alljoyn_permissionconfigurator }
#Import ".\alljoyn_authlistener.ahk" { alljoyn_authlistener }
#Import ".\alljoyn_interfacedescription.ahk" { alljoyn_interfacedescription }
#Import ".\alljoyn_pinglistener.ahk" { alljoyn_pinglistener }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\alljoyn_applicationstatelistener.ahk" { alljoyn_applicationstatelistener }
#Import ".\alljoyn_authlistenerasync_callbacks.ahk" { alljoyn_authlistenerasync_callbacks }
#Import ".\alljoyn_authlistener_callbacks.ahk" { alljoyn_authlistener_callbacks }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\alljoyn_observer.ahk" { alljoyn_observer }
#Import ".\alljoyn_aboutdata.ahk" { alljoyn_aboutdata }
#Import ".\alljoyn_observerlistener_callback.ahk" { alljoyn_observerlistener_callback }
#Import ".\alljoyn_abouticon.ahk" { alljoyn_abouticon }
#Import ".\alljoyn_interfacedescription_securitypolicy.ahk" { alljoyn_interfacedescription_securitypolicy }
#Import ".\alljoyn_busobject_methodentry.ahk" { alljoyn_busobject_methodentry }
#Import ".\alljoyn_msgarg.ahk" { alljoyn_msgarg }
#Import ".\alljoyn_certificateidarray.ahk" { alljoyn_certificateidarray }
#Import ".\alljoyn_interfacedescription_property.ahk" { alljoyn_interfacedescription_property }
#Import ".\alljoyn_sessionportlistener.ahk" { alljoyn_sessionportlistener }
#Import ".\alljoyn_message.ahk" { alljoyn_message }
#Import ".\alljoyn_busattachment.ahk" { alljoyn_busattachment }
#Import ".\alljoyn_busobject_callbacks.ahk" { alljoyn_busobject_callbacks }
#Import ".\alljoyn_sessionlistener_callbacks.ahk" { alljoyn_sessionlistener_callbacks }
#Import ".\alljoyn_pinglistener_callback.ahk" { alljoyn_pinglistener_callback }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\alljoyn_credentials.ahk" { alljoyn_credentials }
#Import ".\alljoyn_aboutproxy.ahk" { alljoyn_aboutproxy }
#Import ".\alljoyn_sessionlistener.ahk" { alljoyn_sessionlistener }
#Import ".\alljoyn_permissionconfigurationlistener.ahk" { alljoyn_permissionconfigurationlistener }
#Import ".\alljoyn_messagetype.ahk" { alljoyn_messagetype }
#Import ".\alljoyn_interfacedescription_member.ahk" { alljoyn_interfacedescription_member }
#Import ".\alljoyn_buslistener.ahk" { alljoyn_buslistener }
#Import ".\alljoyn_abouticonobj.ahk" { alljoyn_abouticonobj }
#Import ".\alljoyn_keystorelistener_callbacks.ahk" { alljoyn_keystorelistener_callbacks }
#Import ".\alljoyn_observerlistener.ahk" { alljoyn_observerlistener }
#Import ".\alljoyn_securityapplicationproxy.ahk" { alljoyn_securityapplicationproxy }
#Import ".\alljoyn_sessionportlistener_callbacks.ahk" { alljoyn_sessionportlistener_callbacks }
#Import ".\alljoyn_proxybusobject_ref.ahk" { alljoyn_proxybusobject_ref }
#Import ".\alljoyn_autopinger.ahk" { alljoyn_autopinger }
#Import ".\alljoyn_keystorelistener_with_synchronization_callbacks.ahk" { alljoyn_keystorelistener_with_synchronization_callbacks }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */

;@region Functions
/**
 * Opens the AllJoyn Router Node Service named pipe, and sets it to PIPE_NOWAIT.
 * @param {PWSTR} connectionSpec Optional parameter to pass connection spec for future use.
 * @returns {HANDLE} The client side handle.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>INVALID_HANDLE_VALUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred.  Call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for more information.  The app can retry the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msajtransport/nf-msajtransport-alljoynconnecttobus">ConnectToBus</a> in case of GetLastError() == <b>ERROR_PIPE_BUSY</b>.  In AllJoyn, we allow multiple instances of server, so <b>ERROR_PIPE_BUSY</b> is not expected to occur in a normal use case.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msajtransport/nf-msajtransport-alljoynconnecttobus
 * @since windows10.0.10240
 */
export AllJoynConnectToBus(connectionSpec) {
    connectionSpec := connectionSpec is String ? StrPtr(connectionSpec) : connectionSpec

    A_LastError := 0

    result := DllCall("MSAJApi.dll\AllJoynConnectToBus", "ptr", connectionSpec, HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Closes the Named Pipe handle.
 * @param {HANDLE} busHandle The bus handle.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msajtransport/nf-msajtransport-alljoynclosebushandle
 * @since windows10.0.10240
 */
export AllJoynCloseBusHandle(busHandle) {
    A_LastError := 0

    result := DllCall("MSAJApi.dll\AllJoynCloseBusHandle", HANDLE, busHandle, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sends data to the bus via named pipe. The caller of this API is responsible to check if the bytesTransferred is less than the requested bytes and call this API again to resend the rest of the data.
 * @param {HANDLE} connectedBusHandle Pipe handle.
 * @param {Integer} _buffer Input data buffer.
 * @param {Integer} bytesToWrite Number of bytes to send.
 * @param {Pointer<Integer>} bytesTransferred Number of bytes written.
 * @param {Pointer<Void>} reserved May be used in a future version as OVERLAPPED address. Currently must be NULL.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msajtransport/nf-msajtransport-alljoynsendtobus
 * @since windows10.0.10240
 */
export AllJoynSendToBus(connectedBusHandle, _buffer, bytesToWrite, bytesTransferred, reserved) {
    bytesTransferredMarshal := bytesTransferred is VarRef ? "uint*" : "ptr"
    reservedMarshal := reserved is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("MSAJApi.dll\AllJoynSendToBus", HANDLE, connectedBusHandle, "ptr", _buffer, "uint", bytesToWrite, bytesTransferredMarshal, bytesTransferred, reservedMarshal, reserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Receives data from the bus via named pipe.
 * @param {HANDLE} connectedBusHandle Pipe handle.
 * @param {Integer} _buffer Output data buffer.
 * @param {Integer} bytesToRead Number of bytes to receive.
 * @param {Pointer<Integer>} bytesTransferred Number of bytes read.
 * @param {Pointer<Void>} reserved May be used in a future version as OVERLAPPED address. Currently must be NULL.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msajtransport/nf-msajtransport-alljoynreceivefrombus
 * @since windows10.0.10240
 */
export AllJoynReceiveFromBus(connectedBusHandle, _buffer, bytesToRead, bytesTransferred, reserved) {
    bytesTransferredMarshal := bytesTransferred is VarRef ? "uint*" : "ptr"
    reservedMarshal := reserved is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("MSAJApi.dll\AllJoynReceiveFromBus", HANDLE, connectedBusHandle, "ptr", _buffer, "uint", bytesToRead, bytesTransferredMarshal, bytesTransferred, reservedMarshal, reserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Provides AllJoyn transport functionality similar to the TCP socket WSAEventSelect functionality.
 * @param {HANDLE} connectedBusHandle Pipe handle.
 * @param {HANDLE} eventHandle Handle to the event to be set when any of the events in bit mask happens.
 * @param {Integer} eventTypes Bit mask of events to select.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msajtransport/nf-msajtransport-alljoyneventselect
 * @since windows10.0.10240
 */
export AllJoynEventSelect(connectedBusHandle, eventHandle, eventTypes) {
    A_LastError := 0

    result := DllCall("MSAJApi.dll\AllJoynEventSelect", HANDLE, connectedBusHandle, HANDLE, eventHandle, "uint", eventTypes, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Provides AllJoyn transport functionality similar to the TCP socket WSAEnumNetworkEvents functionality.
 * @param {HANDLE} connectedBusHandle Pipe handle.
 * @param {HANDLE} eventToReset Optional handle to the event to be reset after completion of this call.
 * @param {Pointer<Integer>} eventTypes Output for bitmask of events being set.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msajtransport/nf-msajtransport-alljoynenumevents
 * @since windows10.0.10240
 */
export AllJoynEnumEvents(connectedBusHandle, eventToReset, eventTypes) {
    eventTypesMarshal := eventTypes is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("MSAJApi.dll\AllJoynEnumEvents", HANDLE, connectedBusHandle, HANDLE, eventToReset, eventTypesMarshal, eventTypes, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {Integer} outBufferSize 
 * @param {Integer} inBufferSize 
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
 * @returns {HANDLE} 
 */
export AllJoynCreateBus(outBufferSize, inBufferSize, lpSecurityAttributes) {
    result := DllCall("MSAJApi.dll\AllJoynCreateBus", "uint", outBufferSize, "uint", inBufferSize, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} serverBusHandle 
 * @param {HANDLE} abortEvent 
 * @returns {Integer} 
 */
export AllJoynAcceptBusConnection(serverBusHandle, abortEvent) {
    result := DllCall("MSAJApi.dll\AllJoynAcceptBusConnection", HANDLE, serverBusHandle, HANDLE, abortEvent, UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export alljoyn_unity_deferred_callbacks_process() {
    result := DllCall("MSAJApi.dll\alljoyn_unity_deferred_callbacks_process", Int32)
    return result
}

/**
 * 
 * @param {Integer} mainthread_only 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_unity_set_deferred_callback_mainthread_only(mainthread_only) {
    DllCall("MSAJApi.dll\alljoyn_unity_set_deferred_callback_mainthread_only", "int", mainthread_only)
}

/**
 * 
 * @param {QStatus} _status 
 * @returns {PSTR} 
 */
export QCC_StatusText(_status) {
    result := DllCall("MSAJApi.dll\QCC_StatusText", QStatus, _status, PSTR)
    return result
}

/**
 * 
 * @returns {alljoyn_msgarg} 
 */
export alljoyn_msgarg_create() {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_create", alljoyn_msgarg)
    return result
}

/**
 * 
 * @param {PSTR} signature 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {alljoyn_msgarg} 
 */
export alljoyn_msgarg_create_and_set(signature, args*) {
    signature := signature is String ? StrPtr(signature) : signature

    varArgs := [args*]
    varArgs.Push(alljoyn_msgarg)

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_create_and_set", "ptr", signature, varArgs*)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_msgarg_destroy(arg) {
    DllCall("MSAJApi.dll\alljoyn_msgarg_destroy", alljoyn_msgarg, arg)
}

/**
 * 
 * @param {Pointer} _size 
 * @returns {alljoyn_msgarg} 
 */
export alljoyn_msgarg_array_create(_size) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_create", "ptr", _size, alljoyn_msgarg)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} index 
 * @returns {alljoyn_msgarg} 
 */
export alljoyn_msgarg_array_element(arg, index) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_element", alljoyn_msgarg, arg, "ptr", index, alljoyn_msgarg)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} signature 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set(arg, signature, args*) {
    signature := signature is String ? StrPtr(signature) : signature

    varArgs := [args*]
    varArgs.Push(QStatus)

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set", alljoyn_msgarg, arg, "ptr", signature, varArgs*)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} signature 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get(arg, signature, args*) {
    signature := signature is String ? StrPtr(signature) : signature

    varArgs := [args*]
    varArgs.Push(QStatus)

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get", alljoyn_msgarg, arg, "ptr", signature, varArgs*)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} source 
 * @returns {alljoyn_msgarg} 
 */
export alljoyn_msgarg_copy(source) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_copy", alljoyn_msgarg, source, alljoyn_msgarg)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} destination 
 * @param {alljoyn_msgarg} source 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_msgarg_clone(destination, source) {
    DllCall("MSAJApi.dll\alljoyn_msgarg_clone", alljoyn_msgarg, destination, alljoyn_msgarg, source)
}

/**
 * 
 * @param {alljoyn_msgarg} lhv 
 * @param {alljoyn_msgarg} rhv 
 * @returns {Integer} 
 */
export alljoyn_msgarg_equal(lhv, rhv) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_equal", alljoyn_msgarg, lhv, alljoyn_msgarg, rhv, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer<Pointer>} numArgs 
 * @param {PSTR} signature 
 * @param {Any} _args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {QStatus} 
 */
export alljoyn_msgarg_array_set(args, numArgs, signature, _args*) {
    signature := signature is String ? StrPtr(signature) : signature

    numArgsMarshal := numArgs is VarRef ? "ptr*" : "ptr"

    varArgs := [_args*]
    varArgs.Push(QStatus)

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_set", alljoyn_msgarg, args, numArgsMarshal, numArgs, "ptr", signature, varArgs*)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @param {PSTR} signature 
 * @param {Any} _args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {QStatus} 
 */
export alljoyn_msgarg_array_get(args, numArgs, signature, _args*) {
    signature := signature is String ? StrPtr(signature) : signature

    varArgs := [_args*]
    varArgs.Push(QStatus)

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_get", alljoyn_msgarg, args, "ptr", numArgs, "ptr", signature, varArgs*)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} str 
 * @param {Pointer} buf 
 * @param {Pointer} indent 
 * @returns {Pointer} 
 */
export alljoyn_msgarg_tostring(arg, str, buf, indent) {
    str := str is String ? StrPtr(str) : str

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_tostring", alljoyn_msgarg, arg, "ptr", str, "ptr", buf, "ptr", indent, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @param {PSTR} str 
 * @param {Pointer} buf 
 * @param {Pointer} indent 
 * @returns {Pointer} 
 */
export alljoyn_msgarg_array_tostring(args, numArgs, str, buf, indent) {
    str := str is String ? StrPtr(str) : str

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_tostring", alljoyn_msgarg, args, "ptr", numArgs, "ptr", str, "ptr", buf, "ptr", indent, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} str 
 * @param {Pointer} buf 
 * @returns {Pointer} 
 */
export alljoyn_msgarg_signature(arg, str, buf) {
    str := str is String ? StrPtr(str) : str

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_signature", alljoyn_msgarg, arg, "ptr", str, "ptr", buf, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} values 
 * @param {Pointer} numValues 
 * @param {PSTR} str 
 * @param {Pointer} buf 
 * @returns {Pointer} 
 */
export alljoyn_msgarg_array_signature(values, numValues, str, buf) {
    str := str is String ? StrPtr(str) : str

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_signature", alljoyn_msgarg, values, "ptr", numValues, "ptr", str, "ptr", buf, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} signature 
 * @returns {Integer} 
 */
export alljoyn_msgarg_hassignature(arg, signature) {
    signature := signature is String ? StrPtr(signature) : signature

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_hassignature", alljoyn_msgarg, arg, "ptr", signature, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} elemSig 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {QStatus} 
 */
export alljoyn_msgarg_getdictelement(arg, elemSig, args*) {
    elemSig := elemSig is String ? StrPtr(elemSig) : elemSig

    varArgs := [args*]
    varArgs.Push(QStatus)

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_getdictelement", alljoyn_msgarg, arg, "ptr", elemSig, varArgs*)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @returns {alljoyn_typeid} 
 */
export alljoyn_msgarg_gettype(arg) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_gettype", alljoyn_msgarg, arg, alljoyn_typeid)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_msgarg_clear(arg) {
    DllCall("MSAJApi.dll\alljoyn_msgarg_clear", alljoyn_msgarg, arg)
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_msgarg_stabilize(arg) {
    DllCall("MSAJApi.dll\alljoyn_msgarg_stabilize", alljoyn_msgarg, arg)
}

/**
 * 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} argOffset 
 * @param {Pointer<Pointer>} numArgs 
 * @param {PSTR} signature 
 * @param {Any} _args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {QStatus} 
 */
export alljoyn_msgarg_array_set_offset(args, argOffset, numArgs, signature, _args*) {
    signature := signature is String ? StrPtr(signature) : signature

    numArgsMarshal := numArgs is VarRef ? "ptr*" : "ptr"

    varArgs := [_args*]
    varArgs.Push(QStatus)

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_set_offset", alljoyn_msgarg, args, "ptr", argOffset, numArgsMarshal, numArgs, "ptr", signature, varArgs*)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} signature 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_and_stabilize(arg, signature, args*) {
    signature := signature is String ? StrPtr(signature) : signature

    varArgs := [args*]
    varArgs.Push(QStatus)

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_and_stabilize", alljoyn_msgarg, arg, "ptr", signature, varArgs*)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Integer} y 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_uint8(arg, y) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint8", alljoyn_msgarg, arg, "char", y, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Integer} b 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_bool(arg, b) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_bool", alljoyn_msgarg, arg, "int", b, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Integer} n 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_int16(arg, n) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int16", alljoyn_msgarg, arg, "short", n, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Integer} q 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_uint16(arg, q) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint16", alljoyn_msgarg, arg, "ushort", q, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Integer} i 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_int32(arg, i) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int32", alljoyn_msgarg, arg, "int", i, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Integer} u 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_uint32(arg, u) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint32", alljoyn_msgarg, arg, "uint", u, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Integer} x 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_int64(arg, x) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int64", alljoyn_msgarg, arg, "int64", x, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Integer} t 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_uint64(arg, t) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint64", alljoyn_msgarg, arg, "uint", t, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Float} d 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_double(arg, d) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_double", alljoyn_msgarg, arg, "double", d, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} s 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_string(arg, s) {
    s := s is String ? StrPtr(s) : s

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_string", alljoyn_msgarg, arg, "ptr", s, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} o 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_objectpath(arg, o) {
    o := o is String ? StrPtr(o) : o

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_objectpath", alljoyn_msgarg, arg, "ptr", o, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} g 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_signature(arg, g) {
    g := g is String ? StrPtr(g) : g

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_signature", alljoyn_msgarg, arg, "ptr", g, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Integer>} y 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_uint8(arg, y) {
    yMarshal := y is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint8", alljoyn_msgarg, arg, yMarshal, y, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Integer>} b 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_bool(arg, b) {
    bMarshal := b is VarRef ? "int*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_bool", alljoyn_msgarg, arg, bMarshal, b, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Integer>} n 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_int16(arg, n) {
    nMarshal := n is VarRef ? "short*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int16", alljoyn_msgarg, arg, nMarshal, n, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Integer>} q 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_uint16(arg, q) {
    qMarshal := q is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint16", alljoyn_msgarg, arg, qMarshal, q, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Integer>} i 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_int32(arg, i) {
    iMarshal := i is VarRef ? "int*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int32", alljoyn_msgarg, arg, iMarshal, i, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Integer>} u 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_uint32(arg, u) {
    uMarshal := u is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint32", alljoyn_msgarg, arg, uMarshal, u, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Integer>} x 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_int64(arg, x) {
    xMarshal := x is VarRef ? "int64*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int64", alljoyn_msgarg, arg, xMarshal, x, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Integer>} t 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_uint64(arg, t) {
    tMarshal := t is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint64", alljoyn_msgarg, arg, tMarshal, t, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Float>} d 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_double(arg, d) {
    dMarshal := d is VarRef ? "double*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_double", alljoyn_msgarg, arg, dMarshal, d, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer<Integer>>} s 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_string(arg, s) {
    sMarshal := s is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_string", alljoyn_msgarg, arg, sMarshal, s, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer<Integer>>} o 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_objectpath(arg, o) {
    oMarshal := o is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_objectpath", alljoyn_msgarg, arg, oMarshal, o, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer<Integer>>} g 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_signature(arg, g) {
    gMarshal := g is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_signature", alljoyn_msgarg, arg, gMarshal, g, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {alljoyn_msgarg} v 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_variant(arg, v) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_variant", alljoyn_msgarg, arg, alljoyn_msgarg, v, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Integer>} ay 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_uint8_array(arg, length, ay) {
    ayMarshal := ay is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint8_array", alljoyn_msgarg, arg, "ptr", length, ayMarshal, ay, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Integer>} ab 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_bool_array(arg, length, ab) {
    abMarshal := ab is VarRef ? "int*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_bool_array", alljoyn_msgarg, arg, "ptr", length, abMarshal, ab, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Integer>} an 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_int16_array(arg, length, an) {
    anMarshal := an is VarRef ? "short*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int16_array", alljoyn_msgarg, arg, "ptr", length, anMarshal, an, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Integer>} aq 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_uint16_array(arg, length, aq) {
    aqMarshal := aq is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint16_array", alljoyn_msgarg, arg, "ptr", length, aqMarshal, aq, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Integer>} ai 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_int32_array(arg, length, ai) {
    aiMarshal := ai is VarRef ? "int*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int32_array", alljoyn_msgarg, arg, "ptr", length, aiMarshal, ai, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Integer>} au 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_uint32_array(arg, length, au) {
    auMarshal := au is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint32_array", alljoyn_msgarg, arg, "ptr", length, auMarshal, au, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Integer>} ax 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_int64_array(arg, length, ax) {
    axMarshal := ax is VarRef ? "int64*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int64_array", alljoyn_msgarg, arg, "ptr", length, axMarshal, ax, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Integer>} at 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_uint64_array(arg, length, at) {
    atMarshal := at is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint64_array", alljoyn_msgarg, arg, "ptr", length, atMarshal, at, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Float>} ad 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_double_array(arg, length, ad) {
    adMarshal := ad is VarRef ? "double*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_double_array", alljoyn_msgarg, arg, "ptr", length, adMarshal, ad, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Pointer<Integer>>} _as 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_string_array(arg, length, _as) {
    _asMarshal := _as is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_string_array", alljoyn_msgarg, arg, "ptr", length, _asMarshal, _as, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Pointer<Integer>>} ao 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_objectpath_array(arg, length, ao) {
    aoMarshal := ao is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_objectpath_array", alljoyn_msgarg, arg, "ptr", length, aoMarshal, ao, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} length 
 * @param {Pointer<Pointer<Integer>>} ag 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_set_signature_array(arg, length, ag) {
    agMarshal := ag is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_signature_array", alljoyn_msgarg, arg, "ptr", length, agMarshal, ag, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<Integer>} ay 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_uint8_array(arg, length, ay) {
    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    ayMarshal := ay is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint8_array", alljoyn_msgarg, arg, lengthMarshal, length, ayMarshal, ay, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<Integer>} ab 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_bool_array(arg, length, ab) {
    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    abMarshal := ab is VarRef ? "int*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_bool_array", alljoyn_msgarg, arg, lengthMarshal, length, abMarshal, ab, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<Integer>} an 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_int16_array(arg, length, an) {
    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    anMarshal := an is VarRef ? "short*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int16_array", alljoyn_msgarg, arg, lengthMarshal, length, anMarshal, an, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<Integer>} aq 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_uint16_array(arg, length, aq) {
    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    aqMarshal := aq is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint16_array", alljoyn_msgarg, arg, lengthMarshal, length, aqMarshal, aq, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<Integer>} ai 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_int32_array(arg, length, ai) {
    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    aiMarshal := ai is VarRef ? "int*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int32_array", alljoyn_msgarg, arg, lengthMarshal, length, aiMarshal, ai, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<Integer>} au 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_uint32_array(arg, length, au) {
    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    auMarshal := au is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint32_array", alljoyn_msgarg, arg, lengthMarshal, length, auMarshal, au, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<Integer>} ax 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_int64_array(arg, length, ax) {
    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    axMarshal := ax is VarRef ? "int64*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int64_array", alljoyn_msgarg, arg, lengthMarshal, length, axMarshal, ax, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<Integer>} at 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_uint64_array(arg, length, at) {
    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    atMarshal := at is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint64_array", alljoyn_msgarg, arg, lengthMarshal, length, atMarshal, at, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<Float>} ad 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_double_array(arg, length, ad) {
    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    adMarshal := ad is VarRef ? "double*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_double_array", alljoyn_msgarg, arg, lengthMarshal, length, adMarshal, ad, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} signature 
 * @param {Pointer<Pointer>} length 
 * @param {Pointer<alljoyn_msgarg>} av 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_get_variant_array(arg, signature, length, av) {
    signature := signature is String ? StrPtr(signature) : signature

    lengthMarshal := length is VarRef ? "ptr*" : "ptr"
    avMarshal := av is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_variant_array", alljoyn_msgarg, arg, "ptr", signature, lengthMarshal, length, avMarshal, av, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @returns {Pointer} 
 */
export alljoyn_msgarg_get_array_numberofelements(arg) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_array_numberofelements", alljoyn_msgarg, arg, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} index 
 * @param {Pointer<alljoyn_msgarg>} element 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_msgarg_get_array_element(arg, index, element) {
    elementMarshal := element is VarRef ? "ptr*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_msgarg_get_array_element", alljoyn_msgarg, arg, "ptr", index, elementMarshal, element)
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} index 
 * @returns {PSTR} 
 */
export alljoyn_msgarg_get_array_elementsignature(arg, index) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_array_elementsignature", alljoyn_msgarg, arg, "ptr", index, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @returns {alljoyn_msgarg} 
 */
export alljoyn_msgarg_getkey(arg) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_getkey", alljoyn_msgarg, arg, alljoyn_msgarg)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @returns {alljoyn_msgarg} 
 */
export alljoyn_msgarg_getvalue(arg) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_getvalue", alljoyn_msgarg, arg, alljoyn_msgarg)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {alljoyn_msgarg} key 
 * @param {alljoyn_msgarg} value 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_setdictentry(arg, key, value) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_setdictentry", alljoyn_msgarg, arg, alljoyn_msgarg, key, alljoyn_msgarg, value, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {alljoyn_msgarg} struct_members 
 * @param {Pointer} num_members 
 * @returns {QStatus} 
 */
export alljoyn_msgarg_setstruct(arg, struct_members, num_members) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_setstruct", alljoyn_msgarg, arg, alljoyn_msgarg, struct_members, "ptr", num_members, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @returns {Pointer} 
 */
export alljoyn_msgarg_getnummembers(arg) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_getnummembers", alljoyn_msgarg, arg, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {Pointer} index 
 * @returns {alljoyn_msgarg} 
 */
export alljoyn_msgarg_getmember(arg, index) {
    result := DllCall("MSAJApi.dll\alljoyn_msgarg_getmember", alljoyn_msgarg, arg, "ptr", index, alljoyn_msgarg)
    return result
}

/**
 * 
 * @returns {alljoyn_aboutdata} 
 */
export alljoyn_aboutdata_create_empty() {
    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_create_empty", alljoyn_aboutdata)
    return result
}

/**
 * 
 * @param {PSTR} defaultLanguage 
 * @returns {alljoyn_aboutdata} 
 */
export alljoyn_aboutdata_create(defaultLanguage) {
    defaultLanguage := defaultLanguage is String ? StrPtr(defaultLanguage) : defaultLanguage

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_create", "ptr", defaultLanguage, alljoyn_aboutdata)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} language 
 * @returns {alljoyn_aboutdata} 
 */
export alljoyn_aboutdata_create_full(arg, language) {
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_create_full", alljoyn_msgarg, arg, "ptr", language, alljoyn_aboutdata)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_aboutdata_destroy(data) {
    DllCall("MSAJApi.dll\alljoyn_aboutdata_destroy", alljoyn_aboutdata, data)
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} aboutDataXml 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_createfromxml(data, aboutDataXml) {
    aboutDataXml := aboutDataXml is String ? StrPtr(aboutDataXml) : aboutDataXml

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_createfromxml", alljoyn_aboutdata, data, "ptr", aboutDataXml, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} language 
 * @returns {Integer} 
 */
export alljoyn_aboutdata_isvalid(data, language) {
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_isvalid", alljoyn_aboutdata, data, "ptr", language, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {alljoyn_msgarg} arg 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_createfrommsgarg(data, arg, language) {
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_createfrommsgarg", alljoyn_aboutdata, data, alljoyn_msgarg, arg, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Integer>} appId 
 * @param {Pointer} num 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setappid(data, appId, num) {
    appIdMarshal := appId is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setappid", alljoyn_aboutdata, data, appIdMarshal, appId, "ptr", num, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} appId 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setappid_fromstring(data, appId) {
    appId := appId is String ? StrPtr(appId) : appId

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setappid_fromstring", alljoyn_aboutdata, data, "ptr", appId, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} appId 
 * @param {Pointer<Pointer>} num 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getappid(data, appId, num) {
    appIdMarshal := appId is VarRef ? "ptr*" : "ptr"
    numMarshal := num is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getappid", alljoyn_aboutdata, data, appIdMarshal, appId, numMarshal, num, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} defaultLanguage 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setdefaultlanguage(data, defaultLanguage) {
    defaultLanguage := defaultLanguage is String ? StrPtr(defaultLanguage) : defaultLanguage

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdefaultlanguage", alljoyn_aboutdata, data, "ptr", defaultLanguage, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} defaultLanguage 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getdefaultlanguage(data, defaultLanguage) {
    defaultLanguageMarshal := defaultLanguage is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdefaultlanguage", alljoyn_aboutdata, data, defaultLanguageMarshal, defaultLanguage, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} deviceName 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setdevicename(data, deviceName, language) {
    deviceName := deviceName is String ? StrPtr(deviceName) : deviceName
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdevicename", alljoyn_aboutdata, data, "ptr", deviceName, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} deviceName 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getdevicename(data, deviceName, language) {
    language := language is String ? StrPtr(language) : language

    deviceNameMarshal := deviceName is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdevicename", alljoyn_aboutdata, data, deviceNameMarshal, deviceName, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} deviceId 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setdeviceid(data, deviceId) {
    deviceId := deviceId is String ? StrPtr(deviceId) : deviceId

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdeviceid", alljoyn_aboutdata, data, "ptr", deviceId, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} deviceId 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getdeviceid(data, deviceId) {
    deviceIdMarshal := deviceId is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdeviceid", alljoyn_aboutdata, data, deviceIdMarshal, deviceId, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} appName 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setappname(data, appName, language) {
    appName := appName is String ? StrPtr(appName) : appName
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setappname", alljoyn_aboutdata, data, "ptr", appName, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} appName 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getappname(data, appName, language) {
    language := language is String ? StrPtr(language) : language

    appNameMarshal := appName is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getappname", alljoyn_aboutdata, data, appNameMarshal, appName, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} manufacturer 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setmanufacturer(data, manufacturer, language) {
    manufacturer := manufacturer is String ? StrPtr(manufacturer) : manufacturer
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setmanufacturer", alljoyn_aboutdata, data, "ptr", manufacturer, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} manufacturer 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getmanufacturer(data, manufacturer, language) {
    language := language is String ? StrPtr(language) : language

    manufacturerMarshal := manufacturer is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getmanufacturer", alljoyn_aboutdata, data, manufacturerMarshal, manufacturer, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} modelNumber 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setmodelnumber(data, modelNumber) {
    modelNumber := modelNumber is String ? StrPtr(modelNumber) : modelNumber

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setmodelnumber", alljoyn_aboutdata, data, "ptr", modelNumber, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} modelNumber 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getmodelnumber(data, modelNumber) {
    modelNumberMarshal := modelNumber is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getmodelnumber", alljoyn_aboutdata, data, modelNumberMarshal, modelNumber, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setsupportedlanguage(data, language) {
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setsupportedlanguage", alljoyn_aboutdata, data, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} languageTags 
 * @param {Pointer} num 
 * @returns {Pointer} 
 */
export alljoyn_aboutdata_getsupportedlanguages(data, languageTags, num) {
    languageTagsMarshal := languageTags is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getsupportedlanguages", alljoyn_aboutdata, data, languageTagsMarshal, languageTags, "ptr", num, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} description 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setdescription(data, description, language) {
    description := description is String ? StrPtr(description) : description
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdescription", alljoyn_aboutdata, data, "ptr", description, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} description 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getdescription(data, description, language) {
    language := language is String ? StrPtr(language) : language

    descriptionMarshal := description is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdescription", alljoyn_aboutdata, data, descriptionMarshal, description, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} dateOfManufacture 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setdateofmanufacture(data, dateOfManufacture) {
    dateOfManufacture := dateOfManufacture is String ? StrPtr(dateOfManufacture) : dateOfManufacture

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdateofmanufacture", alljoyn_aboutdata, data, "ptr", dateOfManufacture, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} dateOfManufacture 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getdateofmanufacture(data, dateOfManufacture) {
    dateOfManufactureMarshal := dateOfManufacture is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdateofmanufacture", alljoyn_aboutdata, data, dateOfManufactureMarshal, dateOfManufacture, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} softwareVersion 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setsoftwareversion(data, softwareVersion) {
    softwareVersion := softwareVersion is String ? StrPtr(softwareVersion) : softwareVersion

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setsoftwareversion", alljoyn_aboutdata, data, "ptr", softwareVersion, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} softwareVersion 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getsoftwareversion(data, softwareVersion) {
    softwareVersionMarshal := softwareVersion is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getsoftwareversion", alljoyn_aboutdata, data, softwareVersionMarshal, softwareVersion, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} ajSoftwareVersion 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getajsoftwareversion(data, ajSoftwareVersion) {
    ajSoftwareVersionMarshal := ajSoftwareVersion is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getajsoftwareversion", alljoyn_aboutdata, data, ajSoftwareVersionMarshal, ajSoftwareVersion, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} hardwareVersion 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_sethardwareversion(data, hardwareVersion) {
    hardwareVersion := hardwareVersion is String ? StrPtr(hardwareVersion) : hardwareVersion

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_sethardwareversion", alljoyn_aboutdata, data, "ptr", hardwareVersion, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} hardwareVersion 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_gethardwareversion(data, hardwareVersion) {
    hardwareVersionMarshal := hardwareVersion is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_gethardwareversion", alljoyn_aboutdata, data, hardwareVersionMarshal, hardwareVersion, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} supportUrl 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setsupporturl(data, supportUrl) {
    supportUrl := supportUrl is String ? StrPtr(supportUrl) : supportUrl

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setsupporturl", alljoyn_aboutdata, data, "ptr", supportUrl, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} supportUrl 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getsupporturl(data, supportUrl) {
    supportUrlMarshal := supportUrl is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getsupporturl", alljoyn_aboutdata, data, supportUrlMarshal, supportUrl, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} name 
 * @param {alljoyn_msgarg} value 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_setfield(data, name, value, language) {
    name := name is String ? StrPtr(name) : name
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setfield", alljoyn_aboutdata, data, "ptr", name, alljoyn_msgarg, value, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} name 
 * @param {Pointer<alljoyn_msgarg>} value 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getfield(data, name, value, language) {
    name := name is String ? StrPtr(name) : name
    language := language is String ? StrPtr(language) : language

    valueMarshal := value is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getfield", alljoyn_aboutdata, data, "ptr", name, valueMarshal, value, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {Pointer<Pointer<Integer>>} fields 
 * @param {Pointer} num_fields 
 * @returns {Pointer} 
 */
export alljoyn_aboutdata_getfields(data, fields, num_fields) {
    fieldsMarshal := fields is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getfields", alljoyn_aboutdata, data, fieldsMarshal, fields, "ptr", num_fields, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {alljoyn_msgarg} msgArg 
 * @param {PSTR} language 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getaboutdata(data, msgArg, language) {
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getaboutdata", alljoyn_aboutdata, data, alljoyn_msgarg, msgArg, "ptr", language, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {alljoyn_msgarg} msgArg 
 * @returns {QStatus} 
 */
export alljoyn_aboutdata_getannouncedaboutdata(data, msgArg) {
    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getannouncedaboutdata", alljoyn_aboutdata, data, alljoyn_msgarg, msgArg, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} fieldName 
 * @returns {Integer} 
 */
export alljoyn_aboutdata_isfieldrequired(data, fieldName) {
    fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_isfieldrequired", alljoyn_aboutdata, data, "ptr", fieldName, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} fieldName 
 * @returns {Integer} 
 */
export alljoyn_aboutdata_isfieldannounced(data, fieldName) {
    fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_isfieldannounced", alljoyn_aboutdata, data, "ptr", fieldName, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} fieldName 
 * @returns {Integer} 
 */
export alljoyn_aboutdata_isfieldlocalized(data, fieldName) {
    fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_isfieldlocalized", alljoyn_aboutdata, data, "ptr", fieldName, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdata} data 
 * @param {PSTR} fieldName 
 * @returns {PSTR} 
 */
export alljoyn_aboutdata_getfieldsignature(data, fieldName) {
    fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

    result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getfieldsignature", alljoyn_aboutdata, data, "ptr", fieldName, PSTR)
    return result
}

/**
 * 
 * @returns {alljoyn_abouticon} 
 */
export alljoyn_abouticon_create() {
    result := DllCall("MSAJApi.dll\alljoyn_abouticon_create", alljoyn_abouticon)
    return result
}

/**
 * 
 * @param {alljoyn_abouticon} icon 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_abouticon_destroy(icon) {
    DllCall("MSAJApi.dll\alljoyn_abouticon_destroy", alljoyn_abouticon, icon)
}

/**
 * 
 * @param {alljoyn_abouticon} icon 
 * @param {Pointer<Pointer<Integer>>} data 
 * @param {Pointer<Pointer>} _size 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_abouticon_getcontent(icon, data, _size) {
    dataMarshal := data is VarRef ? "ptr*" : "ptr"
    _sizeMarshal := _size is VarRef ? "ptr*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_abouticon_getcontent", alljoyn_abouticon, icon, dataMarshal, data, _sizeMarshal, _size)
}

/**
 * 
 * @param {alljoyn_abouticon} icon 
 * @param {PSTR} type 
 * @param {Pointer<Integer>} data 
 * @param {Pointer} csize 
 * @param {Integer} ownsData 
 * @returns {QStatus} 
 */
export alljoyn_abouticon_setcontent(icon, type, data, csize, ownsData) {
    type := type is String ? StrPtr(type) : type

    dataMarshal := data is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_abouticon_setcontent", alljoyn_abouticon, icon, "ptr", type, dataMarshal, data, "ptr", csize, "char", ownsData, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_abouticon} icon 
 * @param {Pointer<Pointer<Integer>>} type 
 * @param {Pointer<Pointer<Integer>>} url 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_abouticon_geturl(icon, type, url) {
    typeMarshal := type is VarRef ? "ptr*" : "ptr"
    urlMarshal := url is VarRef ? "ptr*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_abouticon_geturl", alljoyn_abouticon, icon, typeMarshal, type, urlMarshal, url)
}

/**
 * 
 * @param {alljoyn_abouticon} icon 
 * @param {PSTR} type 
 * @param {PSTR} url 
 * @returns {QStatus} 
 */
export alljoyn_abouticon_seturl(icon, type, url) {
    type := type is String ? StrPtr(type) : type
    url := url is String ? StrPtr(url) : url

    result := DllCall("MSAJApi.dll\alljoyn_abouticon_seturl", alljoyn_abouticon, icon, "ptr", type, "ptr", url, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_abouticon} icon 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_abouticon_clear(icon) {
    DllCall("MSAJApi.dll\alljoyn_abouticon_clear", alljoyn_abouticon, icon)
}

/**
 * 
 * @param {alljoyn_abouticon} icon 
 * @param {alljoyn_msgarg} arg 
 * @returns {QStatus} 
 */
export alljoyn_abouticon_setcontent_frommsgarg(icon, arg) {
    result := DllCall("MSAJApi.dll\alljoyn_abouticon_setcontent_frommsgarg", alljoyn_abouticon, icon, alljoyn_msgarg, arg, QStatus)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export alljoyn_permissionconfigurator_getdefaultclaimcapabilities() {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getdefaultclaimcapabilities", UInt16)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<alljoyn_applicationstate>} state 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getapplicationstate(configurator, state) {
    stateMarshal := state is VarRef ? "int*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getapplicationstate", alljoyn_permissionconfigurator, configurator, stateMarshal, state, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {alljoyn_applicationstate} state 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_setapplicationstate(configurator, state) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_setapplicationstate", alljoyn_permissionconfigurator, configurator, alljoyn_applicationstate, state, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Pointer<Integer>>} publicKey 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getpublickey(configurator, publicKey) {
    publicKeyMarshal := publicKey is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getpublickey", alljoyn_permissionconfigurator, configurator, publicKeyMarshal, publicKey, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} publicKey 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_permissionconfigurator_publickey_destroy(publicKey) {
    publicKeyMarshal := publicKey is VarRef ? "char*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_publickey_destroy", publicKeyMarshal, publicKey)
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Pointer<Integer>>} manifestTemplateXml 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getmanifesttemplate(configurator, manifestTemplateXml) {
    manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getmanifesttemplate", alljoyn_permissionconfigurator, configurator, manifestTemplateXmlMarshal, manifestTemplateXml, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} manifestTemplateXml 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_permissionconfigurator_manifesttemplate_destroy(manifestTemplateXml) {
    manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "char*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_manifesttemplate_destroy", manifestTemplateXmlMarshal, manifestTemplateXml)
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Integer>} manifestTemplateXml 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_setmanifesttemplatefromxml(configurator, manifestTemplateXml) {
    manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_setmanifesttemplatefromxml", alljoyn_permissionconfigurator, configurator, manifestTemplateXmlMarshal, manifestTemplateXml, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Integer>} claimCapabilities 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getclaimcapabilities(configurator, claimCapabilities) {
    claimCapabilitiesMarshal := claimCapabilities is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getclaimcapabilities", alljoyn_permissionconfigurator, configurator, claimCapabilitiesMarshal, claimCapabilities, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Integer} claimCapabilities 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_setclaimcapabilities(configurator, claimCapabilities) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_setclaimcapabilities", alljoyn_permissionconfigurator, configurator, "ushort", claimCapabilities, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Integer>} additionalInfo 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo(configurator, additionalInfo) {
    additionalInfoMarshal := additionalInfo is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo", alljoyn_permissionconfigurator, configurator, additionalInfoMarshal, additionalInfo, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Integer} additionalInfo 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo(configurator, additionalInfo) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo", alljoyn_permissionconfigurator, configurator, "ushort", additionalInfo, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_reset(configurator) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_reset", alljoyn_permissionconfigurator, configurator, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Integer>} caKey 
 * @param {Pointer<Integer>} identityCertificateChain 
 * @param {Pointer<Integer>} groupId 
 * @param {Pointer} groupSize 
 * @param {Pointer<Integer>} groupAuthority 
 * @param {Pointer<Pointer<Integer>>} manifestsXmls 
 * @param {Pointer} manifestsCount 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_claim(configurator, caKey, identityCertificateChain, groupId, groupSize, groupAuthority, manifestsXmls, manifestsCount) {
    caKeyMarshal := caKey is VarRef ? "char*" : "ptr"
    identityCertificateChainMarshal := identityCertificateChain is VarRef ? "char*" : "ptr"
    groupIdMarshal := groupId is VarRef ? "char*" : "ptr"
    groupAuthorityMarshal := groupAuthority is VarRef ? "char*" : "ptr"
    manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_claim", alljoyn_permissionconfigurator, configurator, caKeyMarshal, caKey, identityCertificateChainMarshal, identityCertificateChain, groupIdMarshal, groupId, "ptr", groupSize, groupAuthorityMarshal, groupAuthority, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Integer>} identityCertificateChain 
 * @param {Pointer<Pointer<Integer>>} manifestsXmls 
 * @param {Pointer} manifestsCount 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_updateidentity(configurator, identityCertificateChain, manifestsXmls, manifestsCount) {
    identityCertificateChainMarshal := identityCertificateChain is VarRef ? "char*" : "ptr"
    manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_updateidentity", alljoyn_permissionconfigurator, configurator, identityCertificateChainMarshal, identityCertificateChain, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Pointer<Integer>>} identityCertificateChain 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getidentity(configurator, identityCertificateChain) {
    identityCertificateChainMarshal := identityCertificateChain is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getidentity", alljoyn_permissionconfigurator, configurator, identityCertificateChainMarshal, identityCertificateChain, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} certificateChain 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_permissionconfigurator_certificatechain_destroy(certificateChain) {
    certificateChainMarshal := certificateChain is VarRef ? "char*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_certificatechain_destroy", certificateChainMarshal, certificateChain)
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<alljoyn_manifestarray>} manifestArray 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getmanifests(configurator, manifestArray) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getmanifests", alljoyn_permissionconfigurator, configurator, alljoyn_manifestarray.Ptr, manifestArray, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<alljoyn_manifestarray>} manifestArray 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_permissionconfigurator_manifestarray_cleanup(manifestArray) {
    DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_manifestarray_cleanup", alljoyn_manifestarray.Ptr, manifestArray)
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Pointer<Integer>>} manifestsXmls 
 * @param {Pointer} manifestsCount 
 * @param {Integer} append 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_installmanifests(configurator, manifestsXmls, manifestsCount, append) {
    manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_installmanifests", alljoyn_permissionconfigurator, configurator, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, "int", append, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<alljoyn_certificateid>} certificateId 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getidentitycertificateid(configurator, certificateId) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getidentitycertificateid", alljoyn_permissionconfigurator, configurator, alljoyn_certificateid.Ptr, certificateId, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<alljoyn_certificateid>} certificateId 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_permissionconfigurator_certificateid_cleanup(certificateId) {
    DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_certificateid_cleanup", alljoyn_certificateid.Ptr, certificateId)
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Integer>} policyXml 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_updatepolicy(configurator, policyXml) {
    policyXmlMarshal := policyXml is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_updatepolicy", alljoyn_permissionconfigurator, configurator, policyXmlMarshal, policyXml, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Pointer<Integer>>} policyXml 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getpolicy(configurator, policyXml) {
    policyXmlMarshal := policyXml is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getpolicy", alljoyn_permissionconfigurator, configurator, policyXmlMarshal, policyXml, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Pointer<Integer>>} policyXml 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getdefaultpolicy(configurator, policyXml) {
    policyXmlMarshal := policyXml is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getdefaultpolicy", alljoyn_permissionconfigurator, configurator, policyXmlMarshal, policyXml, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} policyXml 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_permissionconfigurator_policy_destroy(policyXml) {
    policyXmlMarshal := policyXml is VarRef ? "char*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_policy_destroy", policyXmlMarshal, policyXml)
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_resetpolicy(configurator) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_resetpolicy", alljoyn_permissionconfigurator, configurator, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<alljoyn_certificateidarray>} certificateIds 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_getmembershipsummaries(configurator, certificateIds) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getmembershipsummaries", alljoyn_permissionconfigurator, configurator, alljoyn_certificateidarray.Ptr, certificateIds, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<alljoyn_certificateidarray>} certificateIdArray 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_permissionconfigurator_certificateidarray_cleanup(certificateIdArray) {
    DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_certificateidarray_cleanup", alljoyn_certificateidarray.Ptr, certificateIdArray)
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Integer>} membershipCertificateChain 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_installmembership(configurator, membershipCertificateChain) {
    membershipCertificateChainMarshal := membershipCertificateChain is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_installmembership", alljoyn_permissionconfigurator, configurator, membershipCertificateChainMarshal, membershipCertificateChain, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @param {Pointer<Integer>} serial 
 * @param {Pointer} serialLen 
 * @param {Pointer<Integer>} issuerPublicKey 
 * @param {Pointer<Integer>} issuerAki 
 * @param {Pointer} issuerAkiLen 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_removemembership(configurator, serial, serialLen, issuerPublicKey, issuerAki, issuerAkiLen) {
    serialMarshal := serial is VarRef ? "char*" : "ptr"
    issuerPublicKeyMarshal := issuerPublicKey is VarRef ? "char*" : "ptr"
    issuerAkiMarshal := issuerAki is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_removemembership", alljoyn_permissionconfigurator, configurator, serialMarshal, serial, "ptr", serialLen, issuerPublicKeyMarshal, issuerPublicKey, issuerAkiMarshal, issuerAki, "ptr", issuerAkiLen, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_startmanagement(configurator) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_startmanagement", alljoyn_permissionconfigurator, configurator, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurator} configurator 
 * @returns {QStatus} 
 */
export alljoyn_permissionconfigurator_endmanagement(configurator) {
    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_endmanagement", alljoyn_permissionconfigurator, configurator, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<alljoyn_applicationstatelistener_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_applicationstatelistener} 
 */
export alljoyn_applicationstatelistener_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_applicationstatelistener_create", alljoyn_applicationstatelistener_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_applicationstatelistener)
    return result
}

/**
 * 
 * @param {alljoyn_applicationstatelistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_applicationstatelistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_applicationstatelistener_destroy", alljoyn_applicationstatelistener, listener)
}

/**
 * 
 * @param {Pointer<alljoyn_keystorelistener_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_keystorelistener} 
 */
export alljoyn_keystorelistener_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_keystorelistener_create", alljoyn_keystorelistener_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_keystorelistener)
    return result
}

/**
 * 
 * @param {Pointer<alljoyn_keystorelistener_with_synchronization_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_keystorelistener} 
 */
export alljoyn_keystorelistener_with_synchronization_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_keystorelistener_with_synchronization_create", alljoyn_keystorelistener_with_synchronization_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_keystorelistener)
    return result
}

/**
 * 
 * @param {alljoyn_keystorelistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_keystorelistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_keystorelistener_destroy", alljoyn_keystorelistener, listener)
}

/**
 * 
 * @param {alljoyn_keystorelistener} listener 
 * @param {alljoyn_keystore} keyStore 
 * @param {PSTR} source 
 * @param {PSTR} password 
 * @returns {QStatus} 
 */
export alljoyn_keystorelistener_putkeys(listener, keyStore, source, password) {
    source := source is String ? StrPtr(source) : source
    password := password is String ? StrPtr(password) : password

    result := DllCall("MSAJApi.dll\alljoyn_keystorelistener_putkeys", alljoyn_keystorelistener, listener, alljoyn_keystore, keyStore, "ptr", source, "ptr", password, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_keystorelistener} listener 
 * @param {alljoyn_keystore} keyStore 
 * @param {PSTR} sink 
 * @param {Pointer<Pointer>} sink_sz 
 * @returns {QStatus} 
 */
export alljoyn_keystorelistener_getkeys(listener, keyStore, sink, sink_sz) {
    sink := sink is String ? StrPtr(sink) : sink

    sink_szMarshal := sink_sz is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_keystorelistener_getkeys", alljoyn_keystorelistener, listener, alljoyn_keystore, keyStore, "ptr", sink, sink_szMarshal, sink_sz, QStatus)
    return result
}

/**
 * 
 * @param {Integer} traffic 
 * @param {Integer} isMultipoint 
 * @param {Integer} proximity 
 * @param {Integer} transports 
 * @returns {alljoyn_sessionopts} 
 */
export alljoyn_sessionopts_create(traffic, isMultipoint, proximity, transports) {
    result := DllCall("MSAJApi.dll\alljoyn_sessionopts_create", "char", traffic, "int", isMultipoint, "char", proximity, "ushort", transports, alljoyn_sessionopts)
    return result
}

/**
 * 
 * @param {alljoyn_sessionopts} opts 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_sessionopts_destroy(opts) {
    DllCall("MSAJApi.dll\alljoyn_sessionopts_destroy", alljoyn_sessionopts, opts)
}

/**
 * 
 * @param {alljoyn_sessionopts} opts 
 * @returns {Integer} 
 */
export alljoyn_sessionopts_get_traffic(opts) {
    result := DllCall("MSAJApi.dll\alljoyn_sessionopts_get_traffic", alljoyn_sessionopts, opts, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_sessionopts} opts 
 * @param {Integer} traffic 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_sessionopts_set_traffic(opts, traffic) {
    DllCall("MSAJApi.dll\alljoyn_sessionopts_set_traffic", alljoyn_sessionopts, opts, "char", traffic)
}

/**
 * 
 * @param {alljoyn_sessionopts} opts 
 * @returns {Integer} 
 */
export alljoyn_sessionopts_get_multipoint(opts) {
    result := DllCall("MSAJApi.dll\alljoyn_sessionopts_get_multipoint", alljoyn_sessionopts, opts, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_sessionopts} opts 
 * @param {Integer} isMultipoint 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_sessionopts_set_multipoint(opts, isMultipoint) {
    DllCall("MSAJApi.dll\alljoyn_sessionopts_set_multipoint", alljoyn_sessionopts, opts, "int", isMultipoint)
}

/**
 * 
 * @param {alljoyn_sessionopts} opts 
 * @returns {Integer} 
 */
export alljoyn_sessionopts_get_proximity(opts) {
    result := DllCall("MSAJApi.dll\alljoyn_sessionopts_get_proximity", alljoyn_sessionopts, opts, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_sessionopts} opts 
 * @param {Integer} proximity 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_sessionopts_set_proximity(opts, proximity) {
    DllCall("MSAJApi.dll\alljoyn_sessionopts_set_proximity", alljoyn_sessionopts, opts, "char", proximity)
}

/**
 * 
 * @param {alljoyn_sessionopts} opts 
 * @returns {Integer} 
 */
export alljoyn_sessionopts_get_transports(opts) {
    result := DllCall("MSAJApi.dll\alljoyn_sessionopts_get_transports", alljoyn_sessionopts, opts, UInt16)
    return result
}

/**
 * 
 * @param {alljoyn_sessionopts} opts 
 * @param {Integer} transports 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_sessionopts_set_transports(opts, transports) {
    DllCall("MSAJApi.dll\alljoyn_sessionopts_set_transports", alljoyn_sessionopts, opts, "ushort", transports)
}

/**
 * 
 * @param {alljoyn_sessionopts} one 
 * @param {alljoyn_sessionopts} other 
 * @returns {Integer} 
 */
export alljoyn_sessionopts_iscompatible(one, other) {
    result := DllCall("MSAJApi.dll\alljoyn_sessionopts_iscompatible", alljoyn_sessionopts, one, alljoyn_sessionopts, other, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_sessionopts} one 
 * @param {alljoyn_sessionopts} other 
 * @returns {Integer} 
 */
export alljoyn_sessionopts_cmp(one, other) {
    result := DllCall("MSAJApi.dll\alljoyn_sessionopts_cmp", alljoyn_sessionopts, one, alljoyn_sessionopts, other, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {alljoyn_message} 
 */
export alljoyn_message_create(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_message_create", alljoyn_busattachment, bus, alljoyn_message)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_message_destroy(_msg) {
    DllCall("MSAJApi.dll\alljoyn_message_destroy", alljoyn_message, _msg)
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_isbroadcastsignal(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_isbroadcastsignal", alljoyn_message, _msg, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_isglobalbroadcast(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_isglobalbroadcast", alljoyn_message, _msg, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_issessionless(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_issessionless", alljoyn_message, _msg, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_getflags(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getflags", alljoyn_message, _msg, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @param {Pointer<Integer>} tillExpireMS 
 * @returns {Integer} 
 */
export alljoyn_message_isexpired(_msg, tillExpireMS) {
    tillExpireMSMarshal := tillExpireMS is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_message_isexpired", alljoyn_message, _msg, tillExpireMSMarshal, tillExpireMS, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_isunreliable(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_isunreliable", alljoyn_message, _msg, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_isencrypted(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_isencrypted", alljoyn_message, _msg, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {PSTR} 
 */
export alljoyn_message_getauthmechanism(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getauthmechanism", alljoyn_message, _msg, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {alljoyn_messagetype} 
 */
export alljoyn_message_gettype(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_gettype", alljoyn_message, _msg, alljoyn_messagetype)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @param {Pointer<Pointer>} numArgs 
 * @param {Pointer<alljoyn_msgarg>} args 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_message_getargs(_msg, numArgs, args) {
    numArgsMarshal := numArgs is VarRef ? "ptr*" : "ptr"
    argsMarshal := args is VarRef ? "ptr*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_message_getargs", alljoyn_message, _msg, numArgsMarshal, numArgs, argsMarshal, args)
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @param {Pointer} argN 
 * @returns {alljoyn_msgarg} 
 */
export alljoyn_message_getarg(_msg, argN) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getarg", alljoyn_message, _msg, "ptr", argN, alljoyn_msgarg)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @param {PSTR} signature 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {QStatus} 
 */
export alljoyn_message_parseargs(_msg, signature, args*) {
    signature := signature is String ? StrPtr(signature) : signature

    varArgs := [args*]
    varArgs.Push(QStatus)

    result := DllCall("MSAJApi.dll\alljoyn_message_parseargs", alljoyn_message, _msg, "ptr", signature, varArgs*)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_getcallserial(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getcallserial", alljoyn_message, _msg, UInt32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {PSTR} 
 */
export alljoyn_message_getsignature(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getsignature", alljoyn_message, _msg, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {PSTR} 
 */
export alljoyn_message_getobjectpath(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getobjectpath", alljoyn_message, _msg, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {PSTR} 
 */
export alljoyn_message_getinterface(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getinterface", alljoyn_message, _msg, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {PSTR} 
 */
export alljoyn_message_getmembername(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getmembername", alljoyn_message, _msg, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_getreplyserial(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getreplyserial", alljoyn_message, _msg, UInt32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {PSTR} 
 */
export alljoyn_message_getsender(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getsender", alljoyn_message, _msg, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {PSTR} 
 */
export alljoyn_message_getreceiveendpointname(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getreceiveendpointname", alljoyn_message, _msg, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {PSTR} 
 */
export alljoyn_message_getdestination(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getdestination", alljoyn_message, _msg, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_getcompressiontoken(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getcompressiontoken", alljoyn_message, _msg, UInt32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_getsessionid(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_getsessionid", alljoyn_message, _msg, UInt32)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @param {PSTR} errorMessage 
 * @param {Pointer<Pointer>} errorMessage_size 
 * @returns {PSTR} 
 */
export alljoyn_message_geterrorname(_msg, errorMessage, errorMessage_size) {
    errorMessage := errorMessage is String ? StrPtr(errorMessage) : errorMessage

    errorMessage_sizeMarshal := errorMessage_size is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_message_geterrorname", alljoyn_message, _msg, "ptr", errorMessage, errorMessage_sizeMarshal, errorMessage_size, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @param {PSTR} str 
 * @param {Pointer} buf 
 * @returns {Pointer} 
 */
export alljoyn_message_tostring(_msg, str, buf) {
    str := str is String ? StrPtr(str) : str

    result := DllCall("MSAJApi.dll\alljoyn_message_tostring", alljoyn_message, _msg, "ptr", str, "ptr", buf, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @param {PSTR} str 
 * @param {Pointer} buf 
 * @returns {Pointer} 
 */
export alljoyn_message_description(_msg, str, buf) {
    str := str is String ? StrPtr(str) : str

    result := DllCall("MSAJApi.dll\alljoyn_message_description", alljoyn_message, _msg, "ptr", str, "ptr", buf, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_message} _msg 
 * @returns {Integer} 
 */
export alljoyn_message_gettimestamp(_msg) {
    result := DllCall("MSAJApi.dll\alljoyn_message_gettimestamp", alljoyn_message, _msg, UInt32)
    return result
}

/**
 * 
 * @param {alljoyn_message} one 
 * @param {alljoyn_message} other 
 * @returns {Integer} 
 */
export alljoyn_message_eql(one, other) {
    result := DllCall("MSAJApi.dll\alljoyn_message_eql", alljoyn_message, one, alljoyn_message, other, Int32)
    return result
}

/**
 * 
 * @param {Integer} endian 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_message_setendianess(endian) {
    DllCall("MSAJApi.dll\alljoyn_message_setendianess", "char", endian)
}

/**
 * 
 * @param {alljoyn_authlistener} listener 
 * @param {Pointer<Void>} authContext 
 * @param {Integer} accept 
 * @param {alljoyn_credentials} credentials 
 * @returns {QStatus} 
 */
export alljoyn_authlistener_requestcredentialsresponse(listener, authContext, accept, credentials) {
    authContextMarshal := authContext is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_authlistener_requestcredentialsresponse", alljoyn_authlistener, listener, authContextMarshal, authContext, "int", accept, alljoyn_credentials, credentials, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_authlistener} listener 
 * @param {Pointer<Void>} authContext 
 * @param {Integer} accept 
 * @returns {QStatus} 
 */
export alljoyn_authlistener_verifycredentialsresponse(listener, authContext, accept) {
    authContextMarshal := authContext is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_authlistener_verifycredentialsresponse", alljoyn_authlistener, listener, authContextMarshal, authContext, "int", accept, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<alljoyn_authlistener_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_authlistener} 
 */
export alljoyn_authlistener_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_authlistener_create", alljoyn_authlistener_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_authlistener)
    return result
}

/**
 * 
 * @param {Pointer<alljoyn_authlistenerasync_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_authlistener} 
 */
export alljoyn_authlistenerasync_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_authlistenerasync_create", alljoyn_authlistenerasync_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_authlistener)
    return result
}

/**
 * 
 * @param {alljoyn_authlistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_authlistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_authlistener_destroy", alljoyn_authlistener, listener)
}

/**
 * 
 * @param {alljoyn_authlistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_authlistenerasync_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_authlistenerasync_destroy", alljoyn_authlistener, listener)
}

/**
 * 
 * @param {alljoyn_authlistener} listener 
 * @param {Pointer<Integer>} sharedSecret 
 * @param {Pointer} sharedSecretSize 
 * @returns {QStatus} 
 */
export alljoyn_authlistener_setsharedsecret(listener, sharedSecret, sharedSecretSize) {
    sharedSecretMarshal := sharedSecret is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_authlistener_setsharedsecret", alljoyn_authlistener, listener, sharedSecretMarshal, sharedSecret, "ptr", sharedSecretSize, QStatus)
    return result
}

/**
 * 
 * @returns {alljoyn_credentials} 
 */
export alljoyn_credentials_create() {
    result := DllCall("MSAJApi.dll\alljoyn_credentials_create", alljoyn_credentials)
    return result
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_credentials_destroy(cred) {
    DllCall("MSAJApi.dll\alljoyn_credentials_destroy", alljoyn_credentials, cred)
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @param {Integer} creds 
 * @returns {Integer} 
 */
export alljoyn_credentials_isset(cred, creds) {
    result := DllCall("MSAJApi.dll\alljoyn_credentials_isset", alljoyn_credentials, cred, "ushort", creds, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @param {PSTR} pwd 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_credentials_setpassword(cred, pwd) {
    pwd := pwd is String ? StrPtr(pwd) : pwd

    DllCall("MSAJApi.dll\alljoyn_credentials_setpassword", alljoyn_credentials, cred, "ptr", pwd)
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @param {PSTR} userName 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_credentials_setusername(cred, userName) {
    userName := userName is String ? StrPtr(userName) : userName

    DllCall("MSAJApi.dll\alljoyn_credentials_setusername", alljoyn_credentials, cred, "ptr", userName)
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @param {PSTR} certChain 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_credentials_setcertchain(cred, certChain) {
    certChain := certChain is String ? StrPtr(certChain) : certChain

    DllCall("MSAJApi.dll\alljoyn_credentials_setcertchain", alljoyn_credentials, cred, "ptr", certChain)
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @param {PSTR} pk 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_credentials_setprivatekey(cred, pk) {
    pk := pk is String ? StrPtr(pk) : pk

    DllCall("MSAJApi.dll\alljoyn_credentials_setprivatekey", alljoyn_credentials, cred, "ptr", pk)
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @param {PSTR} logonEntry 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_credentials_setlogonentry(cred, logonEntry) {
    logonEntry := logonEntry is String ? StrPtr(logonEntry) : logonEntry

    DllCall("MSAJApi.dll\alljoyn_credentials_setlogonentry", alljoyn_credentials, cred, "ptr", logonEntry)
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @param {Integer} expiration 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_credentials_setexpiration(cred, expiration) {
    DllCall("MSAJApi.dll\alljoyn_credentials_setexpiration", alljoyn_credentials, cred, "uint", expiration)
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @returns {PSTR} 
 */
export alljoyn_credentials_getpassword(cred) {
    result := DllCall("MSAJApi.dll\alljoyn_credentials_getpassword", alljoyn_credentials, cred, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @returns {PSTR} 
 */
export alljoyn_credentials_getusername(cred) {
    result := DllCall("MSAJApi.dll\alljoyn_credentials_getusername", alljoyn_credentials, cred, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @returns {PSTR} 
 */
export alljoyn_credentials_getcertchain(cred) {
    result := DllCall("MSAJApi.dll\alljoyn_credentials_getcertchain", alljoyn_credentials, cred, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @returns {PSTR} 
 */
export alljoyn_credentials_getprivateKey(cred) {
    result := DllCall("MSAJApi.dll\alljoyn_credentials_getprivateKey", alljoyn_credentials, cred, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @returns {PSTR} 
 */
export alljoyn_credentials_getlogonentry(cred) {
    result := DllCall("MSAJApi.dll\alljoyn_credentials_getlogonentry", alljoyn_credentials, cred, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @returns {Integer} 
 */
export alljoyn_credentials_getexpiration(cred) {
    result := DllCall("MSAJApi.dll\alljoyn_credentials_getexpiration", alljoyn_credentials, cred, UInt32)
    return result
}

/**
 * 
 * @param {alljoyn_credentials} cred 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_credentials_clear(cred) {
    DllCall("MSAJApi.dll\alljoyn_credentials_clear", alljoyn_credentials, cred)
}

/**
 * 
 * @param {Pointer<alljoyn_buslistener_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_buslistener} 
 */
export alljoyn_buslistener_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_buslistener_create", alljoyn_buslistener_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_buslistener)
    return result
}

/**
 * 
 * @param {alljoyn_buslistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_buslistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_buslistener_destroy", alljoyn_buslistener, listener)
}

/**
 * 
 * @param {alljoyn_interfacedescription_member} member 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_member_getannotationscount(member) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getannotationscount", alljoyn_interfacedescription_member, member, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {Pointer} index 
 * @param {PSTR} name 
 * @param {Pointer<Pointer>} name_size 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_interfacedescription_member_getannotationatindex(member, index, name, name_size, value, value_size) {
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    name_sizeMarshal := name_size is VarRef ? "ptr*" : "ptr"
    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getannotationatindex", alljoyn_interfacedescription_member, member, "ptr", index, "ptr", name, name_sizeMarshal, name_size, "ptr", value, value_sizeMarshal, value_size)
}

/**
 * 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_member_getannotation(member, name, value, value_size) {
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getannotation", alljoyn_interfacedescription_member, member, "ptr", name, "ptr", value, value_sizeMarshal, value_size, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {PSTR} argName 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_member_getargannotationscount(member, argName) {
    argName := argName is String ? StrPtr(argName) : argName

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getargannotationscount", alljoyn_interfacedescription_member, member, "ptr", argName, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {PSTR} argName 
 * @param {Pointer} index 
 * @param {PSTR} name 
 * @param {Pointer<Pointer>} name_size 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_interfacedescription_member_getargannotationatindex(member, argName, index, name, name_size, value, value_size) {
    argName := argName is String ? StrPtr(argName) : argName
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    name_sizeMarshal := name_size is VarRef ? "ptr*" : "ptr"
    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getargannotationatindex", alljoyn_interfacedescription_member, member, "ptr", argName, "ptr", index, "ptr", name, name_sizeMarshal, name_size, "ptr", value, value_sizeMarshal, value_size)
}

/**
 * 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {PSTR} argName 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_member_getargannotation(member, argName, name, value, value_size) {
    argName := argName is String ? StrPtr(argName) : argName
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getargannotation", alljoyn_interfacedescription_member, member, "ptr", argName, "ptr", name, "ptr", value, value_sizeMarshal, value_size, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription_property} _property 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_property_getannotationscount(_property) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_property_getannotationscount", alljoyn_interfacedescription_property, _property, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription_property} _property 
 * @param {Pointer} index 
 * @param {PSTR} name 
 * @param {Pointer<Pointer>} name_size 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_interfacedescription_property_getannotationatindex(_property, index, name, name_size, value, value_size) {
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    name_sizeMarshal := name_size is VarRef ? "ptr*" : "ptr"
    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_interfacedescription_property_getannotationatindex", alljoyn_interfacedescription_property, _property, "ptr", index, "ptr", name, name_sizeMarshal, name_size, "ptr", value, value_sizeMarshal, value_size)
}

/**
 * 
 * @param {alljoyn_interfacedescription_property} _property 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_property_getannotation(_property, name, value, value_size) {
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_property_getannotation", alljoyn_interfacedescription_property, _property, "ptr", name, "ptr", value, value_sizeMarshal, value_size, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_interfacedescription_activate(iface) {
    DllCall("MSAJApi.dll\alljoyn_interfacedescription_activate", alljoyn_interfacedescription, iface)
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_addannotation(iface, name, value) {
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addannotation", alljoyn_interfacedescription, iface, "ptr", name, "ptr", value, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_getannotation(iface, name, value, value_size) {
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getannotation", alljoyn_interfacedescription, iface, "ptr", name, "ptr", value, value_sizeMarshal, value_size, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_getannotationscount(iface) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getannotationscount", alljoyn_interfacedescription, iface, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {Pointer} index 
 * @param {PSTR} name 
 * @param {Pointer<Pointer>} name_size 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_interfacedescription_getannotationatindex(iface, index, name, name_size, value, value_size) {
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    name_sizeMarshal := name_size is VarRef ? "ptr*" : "ptr"
    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_interfacedescription_getannotationatindex", alljoyn_interfacedescription, iface, "ptr", index, "ptr", name, name_sizeMarshal, name_size, "ptr", value, value_sizeMarshal, value_size)
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {Pointer<alljoyn_interfacedescription_member>} member 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_getmember(iface, name, member) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmember", alljoyn_interfacedescription, iface, "ptr", name, alljoyn_interfacedescription_member.Ptr, member, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {alljoyn_messagetype} type 
 * @param {PSTR} name 
 * @param {PSTR} inputSig 
 * @param {PSTR} outSig 
 * @param {PSTR} argNames 
 * @param {Integer} annotation 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_addmember(iface, type, name, inputSig, outSig, argNames, annotation) {
    name := name is String ? StrPtr(name) : name
    inputSig := inputSig is String ? StrPtr(inputSig) : inputSig
    outSig := outSig is String ? StrPtr(outSig) : outSig
    argNames := argNames is String ? StrPtr(argNames) : argNames

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addmember", alljoyn_interfacedescription, iface, alljoyn_messagetype, type, "ptr", name, "ptr", inputSig, "ptr", outSig, "ptr", argNames, "char", annotation, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_addmemberannotation(iface, member, name, value) {
    member := member is String ? StrPtr(member) : member
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addmemberannotation", alljoyn_interfacedescription, iface, "ptr", member, "ptr", name, "ptr", value, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_getmemberannotation(iface, member, name, value, value_size) {
    member := member is String ? StrPtr(member) : member
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmemberannotation", alljoyn_interfacedescription, iface, "ptr", member, "ptr", name, "ptr", value, value_sizeMarshal, value_size, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {Pointer<alljoyn_interfacedescription_member>} members 
 * @param {Pointer} numMembers 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_getmembers(iface, members, numMembers) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmembers", alljoyn_interfacedescription, iface, alljoyn_interfacedescription_member.Ptr, members, "ptr", numMembers, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {PSTR} inSig 
 * @param {PSTR} outSig 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_hasmember(iface, name, inSig, outSig) {
    name := name is String ? StrPtr(name) : name
    inSig := inSig is String ? StrPtr(inSig) : inSig
    outSig := outSig is String ? StrPtr(outSig) : outSig

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_hasmember", alljoyn_interfacedescription, iface, "ptr", name, "ptr", inSig, "ptr", outSig, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {PSTR} inputSig 
 * @param {PSTR} outSig 
 * @param {PSTR} argNames 
 * @param {Integer} annotation 
 * @param {PSTR} accessPerms 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_addmethod(iface, name, inputSig, outSig, argNames, annotation, accessPerms) {
    name := name is String ? StrPtr(name) : name
    inputSig := inputSig is String ? StrPtr(inputSig) : inputSig
    outSig := outSig is String ? StrPtr(outSig) : outSig
    argNames := argNames is String ? StrPtr(argNames) : argNames
    accessPerms := accessPerms is String ? StrPtr(accessPerms) : accessPerms

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addmethod", alljoyn_interfacedescription, iface, "ptr", name, "ptr", inputSig, "ptr", outSig, "ptr", argNames, "char", annotation, "ptr", accessPerms, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {Pointer<alljoyn_interfacedescription_member>} member 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_getmethod(iface, name, member) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmethod", alljoyn_interfacedescription, iface, "ptr", name, alljoyn_interfacedescription_member.Ptr, member, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {PSTR} sig 
 * @param {PSTR} argNames 
 * @param {Integer} annotation 
 * @param {PSTR} accessPerms 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_addsignal(iface, name, sig, argNames, annotation, accessPerms) {
    name := name is String ? StrPtr(name) : name
    sig := sig is String ? StrPtr(sig) : sig
    argNames := argNames is String ? StrPtr(argNames) : argNames
    accessPerms := accessPerms is String ? StrPtr(accessPerms) : accessPerms

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addsignal", alljoyn_interfacedescription, iface, "ptr", name, "ptr", sig, "ptr", argNames, "char", annotation, "ptr", accessPerms, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {Pointer<alljoyn_interfacedescription_member>} member 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_getsignal(iface, name, member) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getsignal", alljoyn_interfacedescription, iface, "ptr", name, alljoyn_interfacedescription_member.Ptr, member, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {Pointer<alljoyn_interfacedescription_property>} _property 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_getproperty(iface, name, _property) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getproperty", alljoyn_interfacedescription, iface, "ptr", name, alljoyn_interfacedescription_property.Ptr, _property, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {Pointer<alljoyn_interfacedescription_property>} props 
 * @param {Pointer} numProps 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_getproperties(iface, props, numProps) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getproperties", alljoyn_interfacedescription, iface, alljoyn_interfacedescription_property.Ptr, props, "ptr", numProps, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {PSTR} signature 
 * @param {Integer} access 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_addproperty(iface, name, signature, access) {
    name := name is String ? StrPtr(name) : name
    signature := signature is String ? StrPtr(signature) : signature

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addproperty", alljoyn_interfacedescription, iface, "ptr", name, "ptr", signature, "char", access, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} _property 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_addpropertyannotation(iface, _property, name, value) {
    _property := _property is String ? StrPtr(_property) : _property
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addpropertyannotation", alljoyn_interfacedescription, iface, "ptr", _property, "ptr", name, "ptr", value, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} _property 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} str_size 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_getpropertyannotation(iface, _property, name, value, str_size) {
    _property := _property is String ? StrPtr(_property) : _property
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    str_sizeMarshal := str_size is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getpropertyannotation", alljoyn_interfacedescription, iface, "ptr", _property, "ptr", name, "ptr", value, str_sizeMarshal, str_size, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_hasproperty(iface, name) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_hasproperty", alljoyn_interfacedescription, iface, "ptr", name, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_hasproperties(iface) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_hasproperties", alljoyn_interfacedescription, iface, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {PSTR} 
 */
export alljoyn_interfacedescription_getname(iface) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getname", alljoyn_interfacedescription, iface, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} str 
 * @param {Pointer} buf 
 * @param {Pointer} indent 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_introspect(iface, str, buf, indent) {
    str := str is String ? StrPtr(str) : str

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_introspect", alljoyn_interfacedescription, iface, "ptr", str, "ptr", buf, "ptr", indent, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_issecure(iface) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_issecure", alljoyn_interfacedescription, iface, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {alljoyn_interfacedescription_securitypolicy} 
 */
export alljoyn_interfacedescription_getsecuritypolicy(iface) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getsecuritypolicy", alljoyn_interfacedescription, iface, alljoyn_interfacedescription_securitypolicy)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} language 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_interfacedescription_setdescriptionlanguage(iface, language) {
    language := language is String ? StrPtr(language) : language

    DllCall("MSAJApi.dll\alljoyn_interfacedescription_setdescriptionlanguage", alljoyn_interfacedescription, iface, "ptr", language)
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {Pointer<Pointer<Integer>>} languages 
 * @param {Pointer} _size 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_getdescriptionlanguages(iface, languages, _size) {
    languagesMarshal := languages is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getdescriptionlanguages", alljoyn_interfacedescription, iface, languagesMarshal, languages, "ptr", _size, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} languages 
 * @param {Pointer} languagesSize 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_getdescriptionlanguages2(iface, languages, languagesSize) {
    languages := languages is String ? StrPtr(languages) : languages

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getdescriptionlanguages2", alljoyn_interfacedescription, iface, "ptr", languages, "ptr", languagesSize, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} description 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_interfacedescription_setdescription(iface, description) {
    description := description is String ? StrPtr(description) : description

    DllCall("MSAJApi.dll\alljoyn_interfacedescription_setdescription", alljoyn_interfacedescription, iface, "ptr", description)
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} description 
 * @param {PSTR} languageTag 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_setdescriptionforlanguage(iface, description, languageTag) {
    description := description is String ? StrPtr(description) : description
    languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setdescriptionforlanguage", alljoyn_interfacedescription, iface, "ptr", description, "ptr", languageTag, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} description 
 * @param {Pointer} maxLanguageLength 
 * @param {PSTR} languageTag 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_getdescriptionforlanguage(iface, description, maxLanguageLength, languageTag) {
    description := description is String ? StrPtr(description) : description
    languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getdescriptionforlanguage", alljoyn_interfacedescription, iface, "ptr", description, "ptr", maxLanguageLength, "ptr", languageTag, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} description 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_setmemberdescription(iface, member, description) {
    member := member is String ? StrPtr(member) : member
    description := description is String ? StrPtr(description) : description

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setmemberdescription", alljoyn_interfacedescription, iface, "ptr", member, "ptr", description, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} description 
 * @param {PSTR} languageTag 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_setmemberdescriptionforlanguage(iface, member, description, languageTag) {
    member := member is String ? StrPtr(member) : member
    description := description is String ? StrPtr(description) : description
    languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setmemberdescriptionforlanguage", alljoyn_interfacedescription, iface, "ptr", member, "ptr", description, "ptr", languageTag, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} description 
 * @param {Pointer} maxLanguageLength 
 * @param {PSTR} languageTag 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_getmemberdescriptionforlanguage(iface, member, description, maxLanguageLength, languageTag) {
    member := member is String ? StrPtr(member) : member
    description := description is String ? StrPtr(description) : description
    languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmemberdescriptionforlanguage", alljoyn_interfacedescription, iface, "ptr", member, "ptr", description, "ptr", maxLanguageLength, "ptr", languageTag, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} argName 
 * @param {PSTR} description 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_setargdescription(iface, member, argName, description) {
    member := member is String ? StrPtr(member) : member
    argName := argName is String ? StrPtr(argName) : argName
    description := description is String ? StrPtr(description) : description

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setargdescription", alljoyn_interfacedescription, iface, "ptr", member, "ptr", argName, "ptr", description, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} arg 
 * @param {PSTR} description 
 * @param {PSTR} languageTag 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_setargdescriptionforlanguage(iface, member, arg, description, languageTag) {
    member := member is String ? StrPtr(member) : member
    arg := arg is String ? StrPtr(arg) : arg
    description := description is String ? StrPtr(description) : description
    languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setargdescriptionforlanguage", alljoyn_interfacedescription, iface, "ptr", member, "ptr", arg, "ptr", description, "ptr", languageTag, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} arg 
 * @param {PSTR} description 
 * @param {Pointer} maxLanguageLength 
 * @param {PSTR} languageTag 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_getargdescriptionforlanguage(iface, member, arg, description, maxLanguageLength, languageTag) {
    member := member is String ? StrPtr(member) : member
    arg := arg is String ? StrPtr(arg) : arg
    description := description is String ? StrPtr(description) : description
    languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getargdescriptionforlanguage", alljoyn_interfacedescription, iface, "ptr", member, "ptr", arg, "ptr", description, "ptr", maxLanguageLength, "ptr", languageTag, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {PSTR} description 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_setpropertydescription(iface, name, description) {
    name := name is String ? StrPtr(name) : name
    description := description is String ? StrPtr(description) : description

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setpropertydescription", alljoyn_interfacedescription, iface, "ptr", name, "ptr", description, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} name 
 * @param {PSTR} description 
 * @param {PSTR} languageTag 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_setpropertydescriptionforlanguage(iface, name, description, languageTag) {
    name := name is String ? StrPtr(name) : name
    description := description is String ? StrPtr(description) : description
    languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setpropertydescriptionforlanguage", alljoyn_interfacedescription, iface, "ptr", name, "ptr", description, "ptr", languageTag, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} _property 
 * @param {PSTR} description 
 * @param {Pointer} maxLanguageLength 
 * @param {PSTR} languageTag 
 * @returns {Pointer} 
 */
export alljoyn_interfacedescription_getpropertydescriptionforlanguage(iface, _property, description, maxLanguageLength, languageTag) {
    _property := _property is String ? StrPtr(_property) : _property
    description := description is String ? StrPtr(description) : description
    languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getpropertydescriptionforlanguage", alljoyn_interfacedescription, iface, "ptr", _property, "ptr", description, "ptr", maxLanguageLength, "ptr", languageTag, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {Pointer<alljoyn_interfacedescription_translation_callback_ptr>} translationCallback 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_interfacedescription_setdescriptiontranslationcallback(iface, translationCallback) {
    DllCall("MSAJApi.dll\alljoyn_interfacedescription_setdescriptiontranslationcallback", alljoyn_interfacedescription, iface, "ptr", translationCallback)
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {Pointer<alljoyn_interfacedescription_translation_callback_ptr>} 
 */
export alljoyn_interfacedescription_getdescriptiontranslationcallback(iface) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getdescriptiontranslationcallback", alljoyn_interfacedescription, iface, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_hasdescription(iface) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_hasdescription", alljoyn_interfacedescription, iface, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} argName 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @returns {QStatus} 
 */
export alljoyn_interfacedescription_addargannotation(iface, member, argName, name, value) {
    member := member is String ? StrPtr(member) : member
    argName := argName is String ? StrPtr(argName) : argName
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addargannotation", alljoyn_interfacedescription, iface, "ptr", member, "ptr", argName, "ptr", name, "ptr", value, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} iface 
 * @param {PSTR} member 
 * @param {PSTR} argName 
 * @param {PSTR} name 
 * @param {PSTR} value 
 * @param {Pointer<Pointer>} value_size 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_getmemberargannotation(iface, member, argName, name, value, value_size) {
    member := member is String ? StrPtr(member) : member
    argName := argName is String ? StrPtr(argName) : argName
    name := name is String ? StrPtr(name) : name
    value := value is String ? StrPtr(value) : value

    value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmemberargannotation", alljoyn_interfacedescription, iface, "ptr", member, "ptr", argName, "ptr", name, "ptr", value, value_sizeMarshal, value_size, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription} one 
 * @param {alljoyn_interfacedescription} other 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_eql(one, other) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_eql", alljoyn_interfacedescription, one, alljoyn_interfacedescription, other, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription_member} one 
 * @param {alljoyn_interfacedescription_member} other 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_member_eql(one, other) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_eql", alljoyn_interfacedescription_member, one, alljoyn_interfacedescription_member, other, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_interfacedescription_property} one 
 * @param {alljoyn_interfacedescription_property} other 
 * @returns {Integer} 
 */
export alljoyn_interfacedescription_property_eql(one, other) {
    result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_property_eql", alljoyn_interfacedescription_property, one, alljoyn_interfacedescription_property, other, Int32)
    return result
}

/**
 * 
 * @param {PSTR} _path 
 * @param {Integer} isPlaceholder 
 * @param {Pointer<alljoyn_busobject_callbacks>} callbacks_in 
 * @param {Pointer<Void>} context_in 
 * @returns {alljoyn_busobject} 
 */
export alljoyn_busobject_create(_path, isPlaceholder, callbacks_in, context_in) {
    _path := _path is String ? StrPtr(_path) : _path

    context_inMarshal := context_in is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busobject_create", "ptr", _path, "int", isPlaceholder, alljoyn_busobject_callbacks.Ptr, callbacks_in, context_inMarshal, context_in, alljoyn_busobject)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busobject_destroy(bus) {
    DllCall("MSAJApi.dll\alljoyn_busobject_destroy", alljoyn_busobject, bus)
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @returns {PSTR} 
 */
export alljoyn_busobject_getpath(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_getpath", alljoyn_busobject, bus, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {PSTR} ifcName 
 * @param {PSTR} propName 
 * @param {alljoyn_msgarg} _val 
 * @param {Integer} id 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busobject_emitpropertychanged(bus, ifcName, propName, _val, id) {
    ifcName := ifcName is String ? StrPtr(ifcName) : ifcName
    propName := propName is String ? StrPtr(propName) : propName

    DllCall("MSAJApi.dll\alljoyn_busobject_emitpropertychanged", alljoyn_busobject, bus, "ptr", ifcName, "ptr", propName, alljoyn_msgarg, _val, "uint", id)
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {PSTR} ifcName 
 * @param {Pointer<Pointer<Integer>>} propNames 
 * @param {Pointer} numProps 
 * @param {Integer} id 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busobject_emitpropertieschanged(bus, ifcName, propNames, numProps, id) {
    ifcName := ifcName is String ? StrPtr(ifcName) : ifcName

    propNamesMarshal := propNames is VarRef ? "ptr*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_busobject_emitpropertieschanged", alljoyn_busobject, bus, "ptr", ifcName, propNamesMarshal, propNames, "ptr", numProps, "uint", id)
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {PSTR} _buffer 
 * @param {Pointer} bufferSz 
 * @returns {Pointer} 
 */
export alljoyn_busobject_getname(bus, _buffer, bufferSz) {
    _buffer := _buffer is String ? StrPtr(_buffer) : _buffer

    result := DllCall("MSAJApi.dll\alljoyn_busobject_getname", alljoyn_busobject, bus, "ptr", _buffer, "ptr", bufferSz, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {QStatus} 
 */
export alljoyn_busobject_addinterface(bus, iface) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_addinterface", alljoyn_busobject, bus, alljoyn_interfacedescription, iface, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {Pointer<alljoyn_messagereceiver_methodhandler_ptr>} handler 
 * @param {Pointer<Void>} _context 
 * @returns {QStatus} 
 */
export alljoyn_busobject_addmethodhandler(bus, member, handler, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busobject_addmethodhandler", alljoyn_busobject, bus, alljoyn_interfacedescription_member, member, "ptr", handler, _contextMarshal, _context, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {Pointer<alljoyn_busobject_methodentry>} entries 
 * @param {Pointer} numEntries 
 * @returns {QStatus} 
 */
export alljoyn_busobject_addmethodhandlers(bus, entries, numEntries) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_addmethodhandlers", alljoyn_busobject, bus, alljoyn_busobject_methodentry.Ptr, entries, "ptr", numEntries, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {alljoyn_message} _msg 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @returns {QStatus} 
 */
export alljoyn_busobject_methodreply_args(bus, _msg, args, numArgs) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_methodreply_args", alljoyn_busobject, bus, alljoyn_message, _msg, alljoyn_msgarg, args, "ptr", numArgs, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {alljoyn_message} _msg 
 * @param {PSTR} _error 
 * @param {PSTR} errorMessage 
 * @returns {QStatus} 
 */
export alljoyn_busobject_methodreply_err(bus, _msg, _error, errorMessage) {
    _error := _error is String ? StrPtr(_error) : _error
    errorMessage := errorMessage is String ? StrPtr(errorMessage) : errorMessage

    result := DllCall("MSAJApi.dll\alljoyn_busobject_methodreply_err", alljoyn_busobject, bus, alljoyn_message, _msg, "ptr", _error, "ptr", errorMessage, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {alljoyn_message} _msg 
 * @param {QStatus} _status 
 * @returns {QStatus} 
 */
export alljoyn_busobject_methodreply_status(bus, _msg, _status) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_methodreply_status", alljoyn_busobject, bus, alljoyn_message, _msg, QStatus, _status, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @returns {alljoyn_busattachment} 
 */
export alljoyn_busobject_getbusattachment(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_getbusattachment", alljoyn_busobject, bus, alljoyn_busattachment)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {PSTR} destination 
 * @param {Integer} sessionId 
 * @param {alljoyn_interfacedescription_member} signal 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @param {Integer} timeToLive 
 * @param {Integer} flags 
 * @param {alljoyn_message} _msg 
 * @returns {QStatus} 
 */
export alljoyn_busobject_signal(bus, destination, sessionId, signal, args, numArgs, timeToLive, flags, _msg) {
    destination := destination is String ? StrPtr(destination) : destination

    result := DllCall("MSAJApi.dll\alljoyn_busobject_signal", alljoyn_busobject, bus, "ptr", destination, "uint", sessionId, alljoyn_interfacedescription_member, signal, alljoyn_msgarg, args, "ptr", numArgs, "ushort", timeToLive, "char", flags, alljoyn_message, _msg, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {Integer} serialNumber 
 * @returns {QStatus} 
 */
export alljoyn_busobject_cancelsessionlessmessage_serial(bus, serialNumber) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_cancelsessionlessmessage_serial", alljoyn_busobject, bus, "uint", serialNumber, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {alljoyn_message} _msg 
 * @returns {QStatus} 
 */
export alljoyn_busobject_cancelsessionlessmessage(bus, _msg) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_cancelsessionlessmessage", alljoyn_busobject, bus, alljoyn_message, _msg, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @returns {Integer} 
 */
export alljoyn_busobject_issecure(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_issecure", alljoyn_busobject, bus, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {Pointer<Pointer<Integer>>} interfaces 
 * @param {Pointer} numInterfaces 
 * @returns {Pointer} 
 */
export alljoyn_busobject_getannouncedinterfacenames(bus, interfaces, numInterfaces) {
    interfacesMarshal := interfaces is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busobject_getannouncedinterfacenames", alljoyn_busobject, bus, interfacesMarshal, interfaces, "ptr", numInterfaces, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {alljoyn_interfacedescription} iface 
 * @param {alljoyn_about_announceflag} isAnnounced 
 * @returns {QStatus} 
 */
export alljoyn_busobject_setannounceflag(bus, iface, isAnnounced) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_setannounceflag", alljoyn_busobject, bus, alljoyn_interfacedescription, iface, alljoyn_about_announceflag, isAnnounced, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busobject} bus 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {QStatus} 
 */
export alljoyn_busobject_addinterface_announced(bus, iface) {
    result := DllCall("MSAJApi.dll\alljoyn_busobject_addinterface_announced", alljoyn_busobject, bus, alljoyn_interfacedescription, iface, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} service 
 * @param {PSTR} _path 
 * @param {Integer} sessionId 
 * @returns {alljoyn_proxybusobject} 
 */
export alljoyn_proxybusobject_create(bus, service, _path, sessionId) {
    service := service is String ? StrPtr(service) : service
    _path := _path is String ? StrPtr(_path) : _path

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_create", alljoyn_busattachment, bus, "ptr", service, "ptr", _path, "uint", sessionId, alljoyn_proxybusobject)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} service 
 * @param {PSTR} _path 
 * @param {Integer} sessionId 
 * @returns {alljoyn_proxybusobject} 
 */
export alljoyn_proxybusobject_create_secure(bus, service, _path, sessionId) {
    service := service is String ? StrPtr(service) : service
    _path := _path is String ? StrPtr(_path) : _path

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_create_secure", alljoyn_busattachment, bus, "ptr", service, "ptr", _path, "uint", sessionId, alljoyn_proxybusobject)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_proxybusobject_destroy(proxyObj) {
    DllCall("MSAJApi.dll\alljoyn_proxybusobject_destroy", alljoyn_proxybusobject, proxyObj)
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_addinterface(proxyObj, iface) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_addinterface", alljoyn_proxybusobject, proxyObj, alljoyn_interfacedescription, iface, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} name 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_addinterface_by_name(proxyObj, name) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_addinterface_by_name", alljoyn_proxybusobject, proxyObj, "ptr", name, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {Pointer<alljoyn_proxybusobject>} children 
 * @param {Pointer} numChildren 
 * @returns {Pointer} 
 */
export alljoyn_proxybusobject_getchildren(proxyObj, children, numChildren) {
    childrenMarshal := children is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getchildren", alljoyn_proxybusobject, proxyObj, childrenMarshal, children, "ptr", numChildren, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} _path 
 * @returns {alljoyn_proxybusobject} 
 */
export alljoyn_proxybusobject_getchild(proxyObj, _path) {
    _path := _path is String ? StrPtr(_path) : _path

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getchild", alljoyn_proxybusobject, proxyObj, "ptr", _path, alljoyn_proxybusobject)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {alljoyn_proxybusobject} child 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_addchild(proxyObj, child) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_addchild", alljoyn_proxybusobject, proxyObj, alljoyn_proxybusobject, child, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} _path 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_removechild(proxyObj, _path) {
    _path := _path is String ? StrPtr(_path) : _path

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_removechild", alljoyn_proxybusobject, proxyObj, "ptr", _path, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_introspectremoteobject(proxyObj) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_introspectremoteobject", alljoyn_proxybusobject, proxyObj, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {Pointer<alljoyn_proxybusobject_listener_introspectcb_ptr>} callback 
 * @param {Pointer<Void>} _context 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_introspectremoteobjectasync(proxyObj, callback, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_introspectremoteobjectasync", alljoyn_proxybusobject, proxyObj, "ptr", callback, _contextMarshal, _context, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @param {PSTR} _property 
 * @param {alljoyn_msgarg} value 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_getproperty(proxyObj, iface, _property, value) {
    iface := iface is String ? StrPtr(iface) : iface
    _property := _property is String ? StrPtr(_property) : _property

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getproperty", alljoyn_proxybusobject, proxyObj, "ptr", iface, "ptr", _property, alljoyn_msgarg, value, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @param {PSTR} _property 
 * @param {Pointer<alljoyn_proxybusobject_listener_getpropertycb_ptr>} callback 
 * @param {Integer} timeout 
 * @param {Pointer<Void>} _context 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_getpropertyasync(proxyObj, iface, _property, callback, timeout, _context) {
    iface := iface is String ? StrPtr(iface) : iface
    _property := _property is String ? StrPtr(_property) : _property

    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getpropertyasync", alljoyn_proxybusobject, proxyObj, "ptr", iface, "ptr", _property, "ptr", callback, "uint", timeout, _contextMarshal, _context, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @param {alljoyn_msgarg} values 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_getallproperties(proxyObj, iface, values) {
    iface := iface is String ? StrPtr(iface) : iface

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getallproperties", alljoyn_proxybusobject, proxyObj, "ptr", iface, alljoyn_msgarg, values, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @param {Pointer<alljoyn_proxybusobject_listener_getallpropertiescb_ptr>} callback 
 * @param {Integer} timeout 
 * @param {Pointer<Void>} _context 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_getallpropertiesasync(proxyObj, iface, callback, timeout, _context) {
    iface := iface is String ? StrPtr(iface) : iface

    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getallpropertiesasync", alljoyn_proxybusobject, proxyObj, "ptr", iface, "ptr", callback, "uint", timeout, _contextMarshal, _context, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @param {PSTR} _property 
 * @param {alljoyn_msgarg} value 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_setproperty(proxyObj, iface, _property, value) {
    iface := iface is String ? StrPtr(iface) : iface
    _property := _property is String ? StrPtr(_property) : _property

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_setproperty", alljoyn_proxybusobject, proxyObj, "ptr", iface, "ptr", _property, alljoyn_msgarg, value, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @param {Pointer<Pointer<Integer>>} _properties 
 * @param {Pointer} numProperties 
 * @param {Pointer<alljoyn_proxybusobject_listener_propertieschanged_ptr>} callback 
 * @param {Pointer<Void>} _context 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_registerpropertieschangedlistener(proxyObj, iface, _properties, numProperties, callback, _context) {
    iface := iface is String ? StrPtr(iface) : iface

    _propertiesMarshal := _properties is VarRef ? "ptr*" : "ptr"
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_registerpropertieschangedlistener", alljoyn_proxybusobject, proxyObj, "ptr", iface, _propertiesMarshal, _properties, "ptr", numProperties, "ptr", callback, _contextMarshal, _context, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @param {Pointer<alljoyn_proxybusobject_listener_propertieschanged_ptr>} callback 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_unregisterpropertieschangedlistener(proxyObj, iface, callback) {
    iface := iface is String ? StrPtr(iface) : iface

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_unregisterpropertieschangedlistener", alljoyn_proxybusobject, proxyObj, "ptr", iface, "ptr", callback, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @param {PSTR} _property 
 * @param {alljoyn_msgarg} value 
 * @param {Pointer<alljoyn_proxybusobject_listener_setpropertycb_ptr>} callback 
 * @param {Integer} timeout 
 * @param {Pointer<Void>} _context 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_setpropertyasync(proxyObj, iface, _property, value, callback, timeout, _context) {
    iface := iface is String ? StrPtr(iface) : iface
    _property := _property is String ? StrPtr(_property) : _property

    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_setpropertyasync", alljoyn_proxybusobject, proxyObj, "ptr", iface, "ptr", _property, alljoyn_msgarg, value, "ptr", callback, "uint", timeout, _contextMarshal, _context, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} ifaceName 
 * @param {PSTR} methodName 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @param {alljoyn_message} replyMsg 
 * @param {Integer} timeout 
 * @param {Integer} flags 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_methodcall(proxyObj, ifaceName, methodName, args, numArgs, replyMsg, timeout, flags) {
    ifaceName := ifaceName is String ? StrPtr(ifaceName) : ifaceName
    methodName := methodName is String ? StrPtr(methodName) : methodName

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcall", alljoyn_proxybusobject, proxyObj, "ptr", ifaceName, "ptr", methodName, alljoyn_msgarg, args, "ptr", numArgs, alljoyn_message, replyMsg, "uint", timeout, "char", flags, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {alljoyn_interfacedescription_member} method 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @param {alljoyn_message} replyMsg 
 * @param {Integer} timeout 
 * @param {Integer} flags 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_methodcall_member(proxyObj, method, args, numArgs, replyMsg, timeout, flags) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcall_member", alljoyn_proxybusobject, proxyObj, alljoyn_interfacedescription_member, method, alljoyn_msgarg, args, "ptr", numArgs, alljoyn_message, replyMsg, "uint", timeout, "char", flags, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} ifaceName 
 * @param {PSTR} methodName 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @param {Integer} flags 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_methodcall_noreply(proxyObj, ifaceName, methodName, args, numArgs, flags) {
    ifaceName := ifaceName is String ? StrPtr(ifaceName) : ifaceName
    methodName := methodName is String ? StrPtr(methodName) : methodName

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcall_noreply", alljoyn_proxybusobject, proxyObj, "ptr", ifaceName, "ptr", methodName, alljoyn_msgarg, args, "ptr", numArgs, "char", flags, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {alljoyn_interfacedescription_member} method 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @param {Integer} flags 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_methodcall_member_noreply(proxyObj, method, args, numArgs, flags) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcall_member_noreply", alljoyn_proxybusobject, proxyObj, alljoyn_interfacedescription_member, method, alljoyn_msgarg, args, "ptr", numArgs, "char", flags, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} ifaceName 
 * @param {PSTR} methodName 
 * @param {Pointer<alljoyn_messagereceiver_replyhandler_ptr>} replyFunc 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @param {Pointer<Void>} _context 
 * @param {Integer} timeout 
 * @param {Integer} flags 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_methodcallasync(proxyObj, ifaceName, methodName, replyFunc, args, numArgs, _context, timeout, flags) {
    ifaceName := ifaceName is String ? StrPtr(ifaceName) : ifaceName
    methodName := methodName is String ? StrPtr(methodName) : methodName

    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcallasync", alljoyn_proxybusobject, proxyObj, "ptr", ifaceName, "ptr", methodName, "ptr", replyFunc, alljoyn_msgarg, args, "ptr", numArgs, _contextMarshal, _context, "uint", timeout, "char", flags, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {alljoyn_interfacedescription_member} method 
 * @param {Pointer<alljoyn_messagereceiver_replyhandler_ptr>} replyFunc 
 * @param {alljoyn_msgarg} args 
 * @param {Pointer} numArgs 
 * @param {Pointer<Void>} _context 
 * @param {Integer} timeout 
 * @param {Integer} flags 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_methodcallasync_member(proxyObj, method, replyFunc, args, numArgs, _context, timeout, flags) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcallasync_member", alljoyn_proxybusobject, proxyObj, alljoyn_interfacedescription_member, method, "ptr", replyFunc, alljoyn_msgarg, args, "ptr", numArgs, _contextMarshal, _context, "uint", timeout, "char", flags, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} xml 
 * @param {PSTR} identifier 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_parsexml(proxyObj, xml, identifier) {
    xml := xml is String ? StrPtr(xml) : xml
    identifier := identifier is String ? StrPtr(identifier) : identifier

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_parsexml", alljoyn_proxybusobject, proxyObj, "ptr", xml, "ptr", identifier, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {Integer} forceAuth 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_secureconnection(proxyObj, forceAuth) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_secureconnection", alljoyn_proxybusobject, proxyObj, "int", forceAuth, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {Integer} forceAuth 
 * @returns {QStatus} 
 */
export alljoyn_proxybusobject_secureconnectionasync(proxyObj, forceAuth) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_secureconnectionasync", alljoyn_proxybusobject, proxyObj, "int", forceAuth, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @returns {alljoyn_interfacedescription} 
 */
export alljoyn_proxybusobject_getinterface(proxyObj, iface) {
    iface := iface is String ? StrPtr(iface) : iface

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getinterface", alljoyn_proxybusobject, proxyObj, "ptr", iface, alljoyn_interfacedescription)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {Pointer<alljoyn_interfacedescription>} ifaces 
 * @param {Pointer} numIfaces 
 * @returns {Pointer} 
 */
export alljoyn_proxybusobject_getinterfaces(proxyObj, ifaces, numIfaces) {
    ifacesMarshal := ifaces is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getinterfaces", alljoyn_proxybusobject, proxyObj, ifacesMarshal, ifaces, "ptr", numIfaces, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @returns {PSTR} 
 */
export alljoyn_proxybusobject_getpath(proxyObj) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getpath", alljoyn_proxybusobject, proxyObj, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @returns {PSTR} 
 */
export alljoyn_proxybusobject_getservicename(proxyObj) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getservicename", alljoyn_proxybusobject, proxyObj, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @returns {PSTR} 
 */
export alljoyn_proxybusobject_getuniquename(proxyObj) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getuniquename", alljoyn_proxybusobject, proxyObj, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @returns {Integer} 
 */
export alljoyn_proxybusobject_getsessionid(proxyObj) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getsessionid", alljoyn_proxybusobject, proxyObj, UInt32)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @param {PSTR} iface 
 * @returns {Integer} 
 */
export alljoyn_proxybusobject_implementsinterface(proxyObj, iface) {
    iface := iface is String ? StrPtr(iface) : iface

    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_implementsinterface", alljoyn_proxybusobject, proxyObj, "ptr", iface, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} source 
 * @returns {alljoyn_proxybusobject} 
 */
export alljoyn_proxybusobject_copy(source) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_copy", alljoyn_proxybusobject, source, alljoyn_proxybusobject)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @returns {Integer} 
 */
export alljoyn_proxybusobject_isvalid(proxyObj) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_isvalid", alljoyn_proxybusobject, proxyObj, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @returns {Integer} 
 */
export alljoyn_proxybusobject_issecure(proxyObj) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_issecure", alljoyn_proxybusobject, proxyObj, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxyObj 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_proxybusobject_enablepropertycaching(proxyObj) {
    DllCall("MSAJApi.dll\alljoyn_proxybusobject_enablepropertycaching", alljoyn_proxybusobject, proxyObj)
}

/**
 * 
 * @param {Pointer<alljoyn_permissionconfigurationlistener_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_permissionconfigurationlistener} 
 */
export alljoyn_permissionconfigurationlistener_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurationlistener_create", alljoyn_permissionconfigurationlistener_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_permissionconfigurationlistener)
    return result
}

/**
 * 
 * @param {alljoyn_permissionconfigurationlistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_permissionconfigurationlistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_permissionconfigurationlistener_destroy", alljoyn_permissionconfigurationlistener, listener)
}

/**
 * 
 * @param {Pointer<alljoyn_sessionlistener_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_sessionlistener} 
 */
export alljoyn_sessionlistener_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_sessionlistener_create", alljoyn_sessionlistener_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_sessionlistener)
    return result
}

/**
 * 
 * @param {alljoyn_sessionlistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_sessionlistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_sessionlistener_destroy", alljoyn_sessionlistener, listener)
}

/**
 * 
 * @param {Pointer<alljoyn_sessionportlistener_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_sessionportlistener} 
 */
export alljoyn_sessionportlistener_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_sessionportlistener_create", alljoyn_sessionportlistener_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_sessionportlistener)
    return result
}

/**
 * 
 * @param {alljoyn_sessionportlistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_sessionportlistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_sessionportlistener_destroy", alljoyn_sessionportlistener, listener)
}

/**
 * 
 * @param {Pointer<alljoyn_aboutlistener_callback>} callback 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_aboutlistener} 
 */
export alljoyn_aboutlistener_create(callback, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutlistener_create", alljoyn_aboutlistener_callback.Ptr, callback, _contextMarshal, _context, alljoyn_aboutlistener)
    return result
}

/**
 * 
 * @param {alljoyn_aboutlistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_aboutlistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_aboutlistener_destroy", alljoyn_aboutlistener, listener)
}

/**
 * 
 * @param {PSTR} applicationName 
 * @param {Integer} allowRemoteMessages 
 * @returns {alljoyn_busattachment} 
 */
export alljoyn_busattachment_create(applicationName, allowRemoteMessages) {
    applicationName := applicationName is String ? StrPtr(applicationName) : applicationName

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_create", "ptr", applicationName, "int", allowRemoteMessages, alljoyn_busattachment)
    return result
}

/**
 * 
 * @param {PSTR} applicationName 
 * @param {Integer} allowRemoteMessages 
 * @param {Integer} concurrency 
 * @returns {alljoyn_busattachment} 
 */
export alljoyn_busattachment_create_concurrency(applicationName, allowRemoteMessages, concurrency) {
    applicationName := applicationName is String ? StrPtr(applicationName) : applicationName

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_create_concurrency", "ptr", applicationName, "int", allowRemoteMessages, "uint", concurrency, alljoyn_busattachment)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busattachment_destroy(bus) {
    DllCall("MSAJApi.dll\alljoyn_busattachment_destroy", alljoyn_busattachment, bus)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_start(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_start", alljoyn_busattachment, bus, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_stop(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_stop", alljoyn_busattachment, bus, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_join(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_join", alljoyn_busattachment, bus, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {Integer} 
 */
export alljoyn_busattachment_getconcurrency(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getconcurrency", alljoyn_busattachment, bus, UInt32)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {PSTR} 
 */
export alljoyn_busattachment_getconnectspec(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getconnectspec", alljoyn_busattachment, bus, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busattachment_enableconcurrentcallbacks(bus) {
    DllCall("MSAJApi.dll\alljoyn_busattachment_enableconcurrentcallbacks", alljoyn_busattachment, bus)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @param {Pointer<alljoyn_interfacedescription>} iface 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_createinterface(bus, name, iface) {
    name := name is String ? StrPtr(name) : name

    ifaceMarshal := iface is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_createinterface", alljoyn_busattachment, bus, "ptr", name, ifaceMarshal, iface, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @param {Pointer<alljoyn_interfacedescription>} iface 
 * @param {alljoyn_interfacedescription_securitypolicy} secPolicy 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_createinterface_secure(bus, name, iface, secPolicy) {
    name := name is String ? StrPtr(name) : name

    ifaceMarshal := iface is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_createinterface_secure", alljoyn_busattachment, bus, "ptr", name, ifaceMarshal, iface, alljoyn_interfacedescription_securitypolicy, secPolicy, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} connectSpec 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_connect(bus, connectSpec) {
    connectSpec := connectSpec is String ? StrPtr(connectSpec) : connectSpec

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_connect", alljoyn_busattachment, bus, "ptr", connectSpec, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_buslistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busattachment_registerbuslistener(bus, listener) {
    DllCall("MSAJApi.dll\alljoyn_busattachment_registerbuslistener", alljoyn_busattachment, bus, alljoyn_buslistener, listener)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_buslistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busattachment_unregisterbuslistener(bus, listener) {
    DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterbuslistener", alljoyn_busattachment, bus, alljoyn_buslistener, listener)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} namePrefix 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_findadvertisedname(bus, namePrefix) {
    namePrefix := namePrefix is String ? StrPtr(namePrefix) : namePrefix

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_findadvertisedname", alljoyn_busattachment, bus, "ptr", namePrefix, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} namePrefix 
 * @param {Integer} transports 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_findadvertisednamebytransport(bus, namePrefix, transports) {
    namePrefix := namePrefix is String ? StrPtr(namePrefix) : namePrefix

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_findadvertisednamebytransport", alljoyn_busattachment, bus, "ptr", namePrefix, "ushort", transports, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} namePrefix 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_cancelfindadvertisedname(bus, namePrefix) {
    namePrefix := namePrefix is String ? StrPtr(namePrefix) : namePrefix

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_cancelfindadvertisedname", alljoyn_busattachment, bus, "ptr", namePrefix, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} namePrefix 
 * @param {Integer} transports 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_cancelfindadvertisednamebytransport(bus, namePrefix, transports) {
    namePrefix := namePrefix is String ? StrPtr(namePrefix) : namePrefix

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_cancelfindadvertisednamebytransport", alljoyn_busattachment, bus, "ptr", namePrefix, "ushort", transports, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @param {Integer} transports 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_advertisename(bus, name, transports) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_advertisename", alljoyn_busattachment, bus, "ptr", name, "ushort", transports, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @param {Integer} transports 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_canceladvertisename(bus, name, transports) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_canceladvertisename", alljoyn_busattachment, bus, "ptr", name, "ushort", transports, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @returns {alljoyn_interfacedescription} 
 */
export alljoyn_busattachment_getinterface(bus, name) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getinterface", alljoyn_busattachment, bus, "ptr", name, alljoyn_interfacedescription)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} sessionHost 
 * @param {Integer} sessionPort 
 * @param {alljoyn_sessionlistener} listener 
 * @param {Pointer<Integer>} sessionId 
 * @param {alljoyn_sessionopts} opts 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_joinsession(bus, sessionHost, sessionPort, listener, sessionId, opts) {
    sessionHost := sessionHost is String ? StrPtr(sessionHost) : sessionHost

    sessionIdMarshal := sessionId is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_joinsession", alljoyn_busattachment, bus, "ptr", sessionHost, "ushort", sessionPort, alljoyn_sessionlistener, listener, sessionIdMarshal, sessionId, alljoyn_sessionopts, opts, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} sessionHost 
 * @param {Integer} sessionPort 
 * @param {alljoyn_sessionlistener} listener 
 * @param {alljoyn_sessionopts} opts 
 * @param {Pointer<alljoyn_busattachment_joinsessioncb_ptr>} callback 
 * @param {Pointer<Void>} _context 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_joinsessionasync(bus, sessionHost, sessionPort, listener, opts, callback, _context) {
    sessionHost := sessionHost is String ? StrPtr(sessionHost) : sessionHost

    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_joinsessionasync", alljoyn_busattachment, bus, "ptr", sessionHost, "ushort", sessionPort, alljoyn_sessionlistener, listener, alljoyn_sessionopts, opts, "ptr", callback, _contextMarshal, _context, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_busobject} obj 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_registerbusobject(bus, obj) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_registerbusobject", alljoyn_busattachment, bus, alljoyn_busobject, obj, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_busobject} obj 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_registerbusobject_secure(bus, obj) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_registerbusobject_secure", alljoyn_busattachment, bus, alljoyn_busobject, obj, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_busobject} _object 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busattachment_unregisterbusobject(bus, _object) {
    DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterbusobject", alljoyn_busattachment, bus, alljoyn_busobject, _object)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} requestedName 
 * @param {Integer} flags 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_requestname(bus, requestedName, flags) {
    requestedName := requestedName is String ? StrPtr(requestedName) : requestedName

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_requestname", alljoyn_busattachment, bus, "ptr", requestedName, "uint", flags, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_releasename(bus, name) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_releasename", alljoyn_busattachment, bus, "ptr", name, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<Integer>} sessionPort 
 * @param {alljoyn_sessionopts} opts 
 * @param {alljoyn_sessionportlistener} listener 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_bindsessionport(bus, sessionPort, opts, listener) {
    sessionPortMarshal := sessionPort is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_bindsessionport", alljoyn_busattachment, bus, sessionPortMarshal, sessionPort, alljoyn_sessionopts, opts, alljoyn_sessionportlistener, listener, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Integer} sessionPort 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_unbindsessionport(bus, sessionPort) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_unbindsessionport", alljoyn_busattachment, bus, "ushort", sessionPort, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} authMechanisms 
 * @param {alljoyn_authlistener} listener 
 * @param {PSTR} keyStoreFileName 
 * @param {Integer} isShared 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_enablepeersecurity(bus, authMechanisms, listener, keyStoreFileName, isShared) {
    authMechanisms := authMechanisms is String ? StrPtr(authMechanisms) : authMechanisms
    keyStoreFileName := keyStoreFileName is String ? StrPtr(keyStoreFileName) : keyStoreFileName

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_enablepeersecurity", alljoyn_busattachment, bus, "ptr", authMechanisms, alljoyn_authlistener, listener, "ptr", keyStoreFileName, "int", isShared, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} authMechanisms 
 * @param {alljoyn_authlistener} authListener 
 * @param {PSTR} keyStoreFileName 
 * @param {Integer} isShared 
 * @param {alljoyn_permissionconfigurationlistener} permissionConfigurationListener 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener(bus, authMechanisms, authListener, keyStoreFileName, isShared, permissionConfigurationListener) {
    authMechanisms := authMechanisms is String ? StrPtr(authMechanisms) : authMechanisms
    keyStoreFileName := keyStoreFileName is String ? StrPtr(keyStoreFileName) : keyStoreFileName

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener", alljoyn_busattachment, bus, "ptr", authMechanisms, alljoyn_authlistener, authListener, "ptr", keyStoreFileName, "int", isShared, alljoyn_permissionconfigurationlistener, permissionConfigurationListener, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {Integer} 
 */
export alljoyn_busattachment_ispeersecurityenabled(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_ispeersecurityenabled", alljoyn_busattachment, bus, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} xml 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_createinterfacesfromxml(bus, xml) {
    xml := xml is String ? StrPtr(xml) : xml

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_createinterfacesfromxml", alljoyn_busattachment, bus, "ptr", xml, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<alljoyn_interfacedescription>} ifaces 
 * @param {Pointer} numIfaces 
 * @returns {Pointer} 
 */
export alljoyn_busattachment_getinterfaces(bus, ifaces, numIfaces) {
    ifacesMarshal := ifaces is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getinterfaces", alljoyn_busattachment, bus, ifacesMarshal, ifaces, "ptr", numIfaces, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_interfacedescription} iface 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_deleteinterface(bus, iface) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_deleteinterface", alljoyn_busattachment, bus, alljoyn_interfacedescription, iface, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {Integer} 
 */
export alljoyn_busattachment_isstarted(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_isstarted", alljoyn_busattachment, bus, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {Integer} 
 */
export alljoyn_busattachment_isstopping(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_isstopping", alljoyn_busattachment, bus, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {Integer} 
 */
export alljoyn_busattachment_isconnected(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_isconnected", alljoyn_busattachment, bus, Int32)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} unused 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_disconnect(bus, unused) {
    unused := unused is String ? StrPtr(unused) : unused

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_disconnect", alljoyn_busattachment, bus, "ptr", unused, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {alljoyn_proxybusobject} 
 */
export alljoyn_busattachment_getdbusproxyobj(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getdbusproxyobj", alljoyn_busattachment, bus, alljoyn_proxybusobject)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {alljoyn_proxybusobject} 
 */
export alljoyn_busattachment_getalljoynproxyobj(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getalljoynproxyobj", alljoyn_busattachment, bus, alljoyn_proxybusobject)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {alljoyn_proxybusobject} 
 */
export alljoyn_busattachment_getalljoyndebugobj(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getalljoyndebugobj", alljoyn_busattachment, bus, alljoyn_proxybusobject)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {PSTR} 
 */
export alljoyn_busattachment_getuniquename(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getuniquename", alljoyn_busattachment, bus, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {PSTR} 
 */
export alljoyn_busattachment_getglobalguidstring(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getglobalguidstring", alljoyn_busattachment, bus, PSTR)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<alljoyn_messagereceiver_signalhandler_ptr>} signal_handler 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {PSTR} srcPath 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_registersignalhandler(bus, signal_handler, member, srcPath) {
    srcPath := srcPath is String ? StrPtr(srcPath) : srcPath

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_registersignalhandler", alljoyn_busattachment, bus, "ptr", signal_handler, alljoyn_interfacedescription_member, member, "ptr", srcPath, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<alljoyn_messagereceiver_signalhandler_ptr>} signal_handler 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {PSTR} matchRule 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_registersignalhandlerwithrule(bus, signal_handler, member, matchRule) {
    matchRule := matchRule is String ? StrPtr(matchRule) : matchRule

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_registersignalhandlerwithrule", alljoyn_busattachment, bus, "ptr", signal_handler, alljoyn_interfacedescription_member, member, "ptr", matchRule, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<alljoyn_messagereceiver_signalhandler_ptr>} signal_handler 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {PSTR} srcPath 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_unregistersignalhandler(bus, signal_handler, member, srcPath) {
    srcPath := srcPath is String ? StrPtr(srcPath) : srcPath

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_unregistersignalhandler", alljoyn_busattachment, bus, "ptr", signal_handler, alljoyn_interfacedescription_member, member, "ptr", srcPath, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<alljoyn_messagereceiver_signalhandler_ptr>} signal_handler 
 * @param {alljoyn_interfacedescription_member} member 
 * @param {PSTR} matchRule 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_unregistersignalhandlerwithrule(bus, signal_handler, member, matchRule) {
    matchRule := matchRule is String ? StrPtr(matchRule) : matchRule

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_unregistersignalhandlerwithrule", alljoyn_busattachment, bus, "ptr", signal_handler, alljoyn_interfacedescription_member, member, "ptr", matchRule, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_unregisterallhandlers(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterallhandlers", alljoyn_busattachment, bus, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_keystorelistener} listener 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_registerkeystorelistener(bus, listener) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_registerkeystorelistener", alljoyn_busattachment, bus, alljoyn_keystorelistener, listener, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_reloadkeystore(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_reloadkeystore", alljoyn_busattachment, bus, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busattachment_clearkeystore(bus) {
    DllCall("MSAJApi.dll\alljoyn_busattachment_clearkeystore", alljoyn_busattachment, bus)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} guid 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_clearkeys(bus, guid) {
    guid := guid is String ? StrPtr(guid) : guid

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_clearkeys", alljoyn_busattachment, bus, "ptr", guid, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} guid 
 * @param {Integer} timeout 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_setkeyexpiration(bus, guid, timeout) {
    guid := guid is String ? StrPtr(guid) : guid

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_setkeyexpiration", alljoyn_busattachment, bus, "ptr", guid, "uint", timeout, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} guid 
 * @param {Pointer<Integer>} timeout 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_getkeyexpiration(bus, guid, timeout) {
    guid := guid is String ? StrPtr(guid) : guid

    timeoutMarshal := timeout is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getkeyexpiration", alljoyn_busattachment, bus, "ptr", guid, timeoutMarshal, timeout, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} authMechanism 
 * @param {PSTR} userName 
 * @param {PSTR} password 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_addlogonentry(bus, authMechanism, userName, password) {
    authMechanism := authMechanism is String ? StrPtr(authMechanism) : authMechanism
    userName := userName is String ? StrPtr(userName) : userName
    password := password is String ? StrPtr(password) : password

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_addlogonentry", alljoyn_busattachment, bus, "ptr", authMechanism, "ptr", userName, "ptr", password, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} rule 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_addmatch(bus, rule) {
    rule := rule is String ? StrPtr(rule) : rule

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_addmatch", alljoyn_busattachment, bus, "ptr", rule, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} rule 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_removematch(bus, rule) {
    rule := rule is String ? StrPtr(rule) : rule

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_removematch", alljoyn_busattachment, bus, "ptr", rule, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Integer} sessionId 
 * @param {alljoyn_sessionlistener} listener 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_setsessionlistener(bus, sessionId, listener) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_setsessionlistener", alljoyn_busattachment, bus, "uint", sessionId, alljoyn_sessionlistener, listener, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Integer} sessionId 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_leavesession(bus, sessionId) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_leavesession", alljoyn_busattachment, bus, "uint", sessionId, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @param {Integer} forceAuth 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_secureconnection(bus, name, forceAuth) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_secureconnection", alljoyn_busattachment, bus, "ptr", name, "int", forceAuth, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @param {Integer} forceAuth 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_secureconnectionasync(bus, name, forceAuth) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_secureconnectionasync", alljoyn_busattachment, bus, "ptr", name, "int", forceAuth, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Integer} sessionId 
 * @param {PSTR} memberName 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_removesessionmember(bus, sessionId, memberName) {
    memberName := memberName is String ? StrPtr(memberName) : memberName

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_removesessionmember", alljoyn_busattachment, bus, "uint", sessionId, "ptr", memberName, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Integer} sessionid 
 * @param {Pointer<Integer>} linkTimeout 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_setlinktimeout(bus, sessionid, linkTimeout) {
    linkTimeoutMarshal := linkTimeout is VarRef ? "uint*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_setlinktimeout", alljoyn_busattachment, bus, "uint", sessionid, linkTimeoutMarshal, linkTimeout, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Integer} sessionid 
 * @param {Integer} linkTimeout 
 * @param {Pointer<alljoyn_busattachment_setlinktimeoutcb_ptr>} callback 
 * @param {Pointer<Void>} _context 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_setlinktimeoutasync(bus, sessionid, linkTimeout, callback, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_setlinktimeoutasync", alljoyn_busattachment, bus, "uint", sessionid, "uint", linkTimeout, "ptr", callback, _contextMarshal, _context, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @param {Pointer<Integer>} hasOwner 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_namehasowner(bus, name, hasOwner) {
    name := name is String ? StrPtr(name) : name

    hasOwnerMarshal := hasOwner is VarRef ? "int*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_namehasowner", alljoyn_busattachment, bus, "ptr", name, hasOwnerMarshal, hasOwner, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @param {PSTR} guid 
 * @param {Pointer<Pointer>} guidSz 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_getpeerguid(bus, name, guid, guidSz) {
    name := name is String ? StrPtr(name) : name
    guid := guid is String ? StrPtr(guid) : guid

    guidSzMarshal := guidSz is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getpeerguid", alljoyn_busattachment, bus, "ptr", name, "ptr", guid, guidSzMarshal, guidSz, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} module 
 * @param {Integer} level 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_setdaemondebug(bus, module, level) {
    module := module is String ? StrPtr(module) : module

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_setdaemondebug", alljoyn_busattachment, bus, "ptr", module, "uint", level, QStatus)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export alljoyn_busattachment_gettimestamp() {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_gettimestamp", UInt32)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} name 
 * @param {Integer} timeout 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_ping(bus, name, timeout) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_ping", alljoyn_busattachment, bus, "ptr", name, "uint", timeout, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_aboutlistener} aboutListener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busattachment_registeraboutlistener(bus, aboutListener) {
    DllCall("MSAJApi.dll\alljoyn_busattachment_registeraboutlistener", alljoyn_busattachment, bus, alljoyn_aboutlistener, aboutListener)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_aboutlistener} aboutListener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busattachment_unregisteraboutlistener(bus, aboutListener) {
    DllCall("MSAJApi.dll\alljoyn_busattachment_unregisteraboutlistener", alljoyn_busattachment, bus, alljoyn_aboutlistener, aboutListener)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_busattachment_unregisterallaboutlisteners(bus) {
    DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterallaboutlisteners", alljoyn_busattachment, bus)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<Pointer<Integer>>} implementsInterfaces 
 * @param {Pointer} numberInterfaces 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_whoimplements_interfaces(bus, implementsInterfaces, numberInterfaces) {
    implementsInterfacesMarshal := implementsInterfaces is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_whoimplements_interfaces", alljoyn_busattachment, bus, implementsInterfacesMarshal, implementsInterfaces, "ptr", numberInterfaces, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} implementsInterface 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_whoimplements_interface(bus, implementsInterface) {
    implementsInterface := implementsInterface is String ? StrPtr(implementsInterface) : implementsInterface

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_whoimplements_interface", alljoyn_busattachment, bus, "ptr", implementsInterface, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<Pointer<Integer>>} implementsInterfaces 
 * @param {Pointer} numberInterfaces 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_cancelwhoimplements_interfaces(bus, implementsInterfaces, numberInterfaces) {
    implementsInterfacesMarshal := implementsInterfaces is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_cancelwhoimplements_interfaces", alljoyn_busattachment, bus, implementsInterfacesMarshal, implementsInterfaces, "ptr", numberInterfaces, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} implementsInterface 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_cancelwhoimplements_interface(bus, implementsInterface) {
    implementsInterface := implementsInterface is String ? StrPtr(implementsInterface) : implementsInterface

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_cancelwhoimplements_interface", alljoyn_busattachment, bus, "ptr", implementsInterface, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {alljoyn_permissionconfigurator} 
 */
export alljoyn_busattachment_getpermissionconfigurator(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_getpermissionconfigurator", alljoyn_busattachment, bus, alljoyn_permissionconfigurator)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_applicationstatelistener} listener 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_registerapplicationstatelistener(bus, listener) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_registerapplicationstatelistener", alljoyn_busattachment, bus, alljoyn_applicationstatelistener, listener, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_applicationstatelistener} listener 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_unregisterapplicationstatelistener(bus, listener) {
    result := DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterapplicationstatelistener", alljoyn_busattachment, bus, alljoyn_applicationstatelistener, listener, QStatus)
    return result
}

/**
 * 
 * @param {PSTR} applicationName 
 * @returns {QStatus} 
 */
export alljoyn_busattachment_deletedefaultkeystore(applicationName) {
    applicationName := applicationName is String ? StrPtr(applicationName) : applicationName

    result := DllCall("MSAJApi.dll\alljoyn_busattachment_deletedefaultkeystore", "ptr", applicationName, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_abouticon} icon 
 * @returns {alljoyn_abouticonobj} 
 */
export alljoyn_abouticonobj_create(bus, icon) {
    result := DllCall("MSAJApi.dll\alljoyn_abouticonobj_create", alljoyn_busattachment, bus, alljoyn_abouticon, icon, alljoyn_abouticonobj)
    return result
}

/**
 * 
 * @param {alljoyn_abouticonobj} icon 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_abouticonobj_destroy(icon) {
    DllCall("MSAJApi.dll\alljoyn_abouticonobj_destroy", alljoyn_abouticonobj, icon)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} busName 
 * @param {Integer} sessionId 
 * @returns {alljoyn_abouticonproxy} 
 */
export alljoyn_abouticonproxy_create(bus, busName, sessionId) {
    busName := busName is String ? StrPtr(busName) : busName

    result := DllCall("MSAJApi.dll\alljoyn_abouticonproxy_create", alljoyn_busattachment, bus, "ptr", busName, "uint", sessionId, alljoyn_abouticonproxy)
    return result
}

/**
 * 
 * @param {alljoyn_abouticonproxy} proxy 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_abouticonproxy_destroy(proxy) {
    DllCall("MSAJApi.dll\alljoyn_abouticonproxy_destroy", alljoyn_abouticonproxy, proxy)
}

/**
 * 
 * @param {alljoyn_abouticonproxy} proxy 
 * @param {alljoyn_abouticon} icon 
 * @returns {QStatus} 
 */
export alljoyn_abouticonproxy_geticon(proxy, icon) {
    result := DllCall("MSAJApi.dll\alljoyn_abouticonproxy_geticon", alljoyn_abouticonproxy, proxy, alljoyn_abouticon, icon, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_abouticonproxy} proxy 
 * @param {Pointer<Integer>} _version 
 * @returns {QStatus} 
 */
export alljoyn_abouticonproxy_getversion(proxy, _version) {
    _versionMarshal := _version is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_abouticonproxy_getversion", alljoyn_abouticonproxy, proxy, _versionMarshal, _version, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<alljoyn_aboutdatalistener_callbacks>} callbacks 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_aboutdatalistener} 
 */
export alljoyn_aboutdatalistener_create(callbacks, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutdatalistener_create", alljoyn_aboutdatalistener_callbacks.Ptr, callbacks, _contextMarshal, _context, alljoyn_aboutdatalistener)
    return result
}

/**
 * 
 * @param {alljoyn_aboutdatalistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_aboutdatalistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_aboutdatalistener_destroy", alljoyn_aboutdatalistener, listener)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {alljoyn_about_announceflag} isAnnounced 
 * @returns {alljoyn_aboutobj} 
 */
export alljoyn_aboutobj_create(bus, isAnnounced) {
    result := DllCall("MSAJApi.dll\alljoyn_aboutobj_create", alljoyn_busattachment, bus, alljoyn_about_announceflag, isAnnounced, alljoyn_aboutobj)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobj} obj 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_aboutobj_destroy(obj) {
    DllCall("MSAJApi.dll\alljoyn_aboutobj_destroy", alljoyn_aboutobj, obj)
}

/**
 * 
 * @param {alljoyn_aboutobj} obj 
 * @param {Integer} sessionPort 
 * @param {alljoyn_aboutdata} aboutData 
 * @returns {QStatus} 
 */
export alljoyn_aboutobj_announce(obj, sessionPort, aboutData) {
    result := DllCall("MSAJApi.dll\alljoyn_aboutobj_announce", alljoyn_aboutobj, obj, "ushort", sessionPort, alljoyn_aboutdata, aboutData, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobj} obj 
 * @param {Integer} sessionPort 
 * @param {alljoyn_aboutdatalistener} aboutListener 
 * @returns {QStatus} 
 */
export alljoyn_aboutobj_announce_using_datalistener(obj, sessionPort, aboutListener) {
    result := DllCall("MSAJApi.dll\alljoyn_aboutobj_announce_using_datalistener", alljoyn_aboutobj, obj, "ushort", sessionPort, alljoyn_aboutdatalistener, aboutListener, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobj} obj 
 * @returns {QStatus} 
 */
export alljoyn_aboutobj_unannounce(obj) {
    result := DllCall("MSAJApi.dll\alljoyn_aboutobj_unannounce", alljoyn_aboutobj, obj, QStatus)
    return result
}

/**
 * 
 * @returns {alljoyn_aboutobjectdescription} 
 */
export alljoyn_aboutobjectdescription_create() {
    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_create", alljoyn_aboutobjectdescription)
    return result
}

/**
 * 
 * @param {alljoyn_msgarg} arg 
 * @returns {alljoyn_aboutobjectdescription} 
 */
export alljoyn_aboutobjectdescription_create_full(arg) {
    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_create_full", alljoyn_msgarg, arg, alljoyn_aboutobjectdescription)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @param {alljoyn_msgarg} arg 
 * @returns {QStatus} 
 */
export alljoyn_aboutobjectdescription_createfrommsgarg(description, arg) {
    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_createfrommsgarg", alljoyn_aboutobjectdescription, description, alljoyn_msgarg, arg, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_aboutobjectdescription_destroy(description) {
    DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_destroy", alljoyn_aboutobjectdescription, description)
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @param {Pointer<Pointer<Integer>>} paths 
 * @param {Pointer} numPaths 
 * @returns {Pointer} 
 */
export alljoyn_aboutobjectdescription_getpaths(description, paths, numPaths) {
    pathsMarshal := paths is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_getpaths", alljoyn_aboutobjectdescription, description, pathsMarshal, paths, "ptr", numPaths, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @param {PSTR} _path 
 * @param {Pointer<Pointer<Integer>>} interfaces 
 * @param {Pointer} numInterfaces 
 * @returns {Pointer} 
 */
export alljoyn_aboutobjectdescription_getinterfaces(description, _path, interfaces, numInterfaces) {
    _path := _path is String ? StrPtr(_path) : _path

    interfacesMarshal := interfaces is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_getinterfaces", alljoyn_aboutobjectdescription, description, "ptr", _path, interfacesMarshal, interfaces, "ptr", numInterfaces, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @param {PSTR} interfaceName 
 * @param {Pointer<Pointer<Integer>>} paths 
 * @param {Pointer} numPaths 
 * @returns {Pointer} 
 */
export alljoyn_aboutobjectdescription_getinterfacepaths(description, interfaceName, paths, numPaths) {
    interfaceName := interfaceName is String ? StrPtr(interfaceName) : interfaceName

    pathsMarshal := paths is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_getinterfacepaths", alljoyn_aboutobjectdescription, description, "ptr", interfaceName, pathsMarshal, paths, "ptr", numPaths, IntPtr)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_aboutobjectdescription_clear(description) {
    DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_clear", alljoyn_aboutobjectdescription, description)
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @param {PSTR} _path 
 * @returns {Integer} 
 */
export alljoyn_aboutobjectdescription_haspath(description, _path) {
    _path := _path is String ? StrPtr(_path) : _path

    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_haspath", alljoyn_aboutobjectdescription, description, "ptr", _path, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @param {PSTR} interfaceName 
 * @returns {Integer} 
 */
export alljoyn_aboutobjectdescription_hasinterface(description, interfaceName) {
    interfaceName := interfaceName is String ? StrPtr(interfaceName) : interfaceName

    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_hasinterface", alljoyn_aboutobjectdescription, description, "ptr", interfaceName, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @param {PSTR} _path 
 * @param {PSTR} interfaceName 
 * @returns {Integer} 
 */
export alljoyn_aboutobjectdescription_hasinterfaceatpath(description, _path, interfaceName) {
    _path := _path is String ? StrPtr(_path) : _path
    interfaceName := interfaceName is String ? StrPtr(interfaceName) : interfaceName

    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_hasinterfaceatpath", alljoyn_aboutobjectdescription, description, "ptr", _path, "ptr", interfaceName, Int8)
    return result
}

/**
 * 
 * @param {alljoyn_aboutobjectdescription} description 
 * @param {alljoyn_msgarg} msgArg 
 * @returns {QStatus} 
 */
export alljoyn_aboutobjectdescription_getmsgarg(description, msgArg) {
    result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_getmsgarg", alljoyn_aboutobjectdescription, description, alljoyn_msgarg, msgArg, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {PSTR} busName 
 * @param {Integer} sessionId 
 * @returns {alljoyn_aboutproxy} 
 */
export alljoyn_aboutproxy_create(bus, busName, sessionId) {
    busName := busName is String ? StrPtr(busName) : busName

    result := DllCall("MSAJApi.dll\alljoyn_aboutproxy_create", alljoyn_busattachment, bus, "ptr", busName, "uint", sessionId, alljoyn_aboutproxy)
    return result
}

/**
 * 
 * @param {alljoyn_aboutproxy} proxy 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_aboutproxy_destroy(proxy) {
    DllCall("MSAJApi.dll\alljoyn_aboutproxy_destroy", alljoyn_aboutproxy, proxy)
}

/**
 * 
 * @param {alljoyn_aboutproxy} proxy 
 * @param {alljoyn_msgarg} objectDesc 
 * @returns {QStatus} 
 */
export alljoyn_aboutproxy_getobjectdescription(proxy, objectDesc) {
    result := DllCall("MSAJApi.dll\alljoyn_aboutproxy_getobjectdescription", alljoyn_aboutproxy, proxy, alljoyn_msgarg, objectDesc, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutproxy} proxy 
 * @param {PSTR} language 
 * @param {alljoyn_msgarg} data 
 * @returns {QStatus} 
 */
export alljoyn_aboutproxy_getaboutdata(proxy, language, data) {
    language := language is String ? StrPtr(language) : language

    result := DllCall("MSAJApi.dll\alljoyn_aboutproxy_getaboutdata", alljoyn_aboutproxy, proxy, "ptr", language, alljoyn_msgarg, data, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_aboutproxy} proxy 
 * @param {Pointer<Integer>} _version 
 * @returns {QStatus} 
 */
export alljoyn_aboutproxy_getversion(proxy, _version) {
    _versionMarshal := _version is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_aboutproxy_getversion", alljoyn_aboutproxy, proxy, _versionMarshal, _version, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<alljoyn_pinglistener_callback>} callback 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_pinglistener} 
 */
export alljoyn_pinglistener_create(callback, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_pinglistener_create", alljoyn_pinglistener_callback.Ptr, callback, _contextMarshal, _context, alljoyn_pinglistener)
    return result
}

/**
 * 
 * @param {alljoyn_pinglistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_pinglistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_pinglistener_destroy", alljoyn_pinglistener, listener)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @returns {alljoyn_autopinger} 
 */
export alljoyn_autopinger_create(bus) {
    result := DllCall("MSAJApi.dll\alljoyn_autopinger_create", alljoyn_busattachment, bus, alljoyn_autopinger)
    return result
}

/**
 * 
 * @param {alljoyn_autopinger} autopinger 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_autopinger_destroy(autopinger) {
    DllCall("MSAJApi.dll\alljoyn_autopinger_destroy", alljoyn_autopinger, autopinger)
}

/**
 * 
 * @param {alljoyn_autopinger} autopinger 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_autopinger_pause(autopinger) {
    DllCall("MSAJApi.dll\alljoyn_autopinger_pause", alljoyn_autopinger, autopinger)
}

/**
 * 
 * @param {alljoyn_autopinger} autopinger 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_autopinger_resume(autopinger) {
    DllCall("MSAJApi.dll\alljoyn_autopinger_resume", alljoyn_autopinger, autopinger)
}

/**
 * 
 * @param {alljoyn_autopinger} autopinger 
 * @param {PSTR} group 
 * @param {alljoyn_pinglistener} listener 
 * @param {Integer} pinginterval 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_autopinger_addpinggroup(autopinger, group, listener, pinginterval) {
    group := group is String ? StrPtr(group) : group

    DllCall("MSAJApi.dll\alljoyn_autopinger_addpinggroup", alljoyn_autopinger, autopinger, "ptr", group, alljoyn_pinglistener, listener, "uint", pinginterval)
}

/**
 * 
 * @param {alljoyn_autopinger} autopinger 
 * @param {PSTR} group 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_autopinger_removepinggroup(autopinger, group) {
    group := group is String ? StrPtr(group) : group

    DllCall("MSAJApi.dll\alljoyn_autopinger_removepinggroup", alljoyn_autopinger, autopinger, "ptr", group)
}

/**
 * 
 * @param {alljoyn_autopinger} autopinger 
 * @param {PSTR} group 
 * @param {Integer} pinginterval 
 * @returns {QStatus} 
 */
export alljoyn_autopinger_setpinginterval(autopinger, group, pinginterval) {
    group := group is String ? StrPtr(group) : group

    result := DllCall("MSAJApi.dll\alljoyn_autopinger_setpinginterval", alljoyn_autopinger, autopinger, "ptr", group, "uint", pinginterval, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_autopinger} autopinger 
 * @param {PSTR} group 
 * @param {PSTR} destination 
 * @returns {QStatus} 
 */
export alljoyn_autopinger_adddestination(autopinger, group, destination) {
    group := group is String ? StrPtr(group) : group
    destination := destination is String ? StrPtr(destination) : destination

    result := DllCall("MSAJApi.dll\alljoyn_autopinger_adddestination", alljoyn_autopinger, autopinger, "ptr", group, "ptr", destination, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_autopinger} autopinger 
 * @param {PSTR} group 
 * @param {PSTR} destination 
 * @param {Integer} removeall 
 * @returns {QStatus} 
 */
export alljoyn_autopinger_removedestination(autopinger, group, destination, removeall) {
    group := group is String ? StrPtr(group) : group
    destination := destination is String ? StrPtr(destination) : destination

    result := DllCall("MSAJApi.dll\alljoyn_autopinger_removedestination", alljoyn_autopinger, autopinger, "ptr", group, "ptr", destination, "int", removeall, QStatus)
    return result
}

/**
 * 
 * @returns {PSTR} 
 */
export alljoyn_getversion() {
    result := DllCall("MSAJApi.dll\alljoyn_getversion", PSTR)
    return result
}

/**
 * 
 * @returns {PSTR} 
 */
export alljoyn_getbuildinfo() {
    result := DllCall("MSAJApi.dll\alljoyn_getbuildinfo", PSTR)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export alljoyn_getnumericversion() {
    result := DllCall("MSAJApi.dll\alljoyn_getnumericversion", UInt32)
    return result
}

/**
 * 
 * @returns {QStatus} 
 */
export alljoyn_init() {
    result := DllCall("MSAJApi.dll\alljoyn_init", QStatus)
    return result
}

/**
 * 
 * @returns {QStatus} 
 */
export alljoyn_shutdown() {
    result := DllCall("MSAJApi.dll\alljoyn_shutdown", QStatus)
    return result
}

/**
 * 
 * @returns {QStatus} 
 */
export alljoyn_routerinit() {
    result := DllCall("MSAJApi.dll\alljoyn_routerinit", QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} configXml 
 * @returns {QStatus} 
 */
export alljoyn_routerinitwithconfig(configXml) {
    configXmlMarshal := configXml is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_routerinitwithconfig", configXmlMarshal, configXml, QStatus)
    return result
}

/**
 * 
 * @returns {QStatus} 
 */
export alljoyn_routershutdown() {
    result := DllCall("MSAJApi.dll\alljoyn_routershutdown", QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject} proxy 
 * @returns {alljoyn_proxybusobject_ref} 
 */
export alljoyn_proxybusobject_ref_create(proxy) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_ref_create", alljoyn_proxybusobject, proxy, alljoyn_proxybusobject_ref)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject_ref} ref 
 * @returns {alljoyn_proxybusobject} 
 */
export alljoyn_proxybusobject_ref_get(ref) {
    result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_ref_get", alljoyn_proxybusobject_ref, ref, alljoyn_proxybusobject)
    return result
}

/**
 * 
 * @param {alljoyn_proxybusobject_ref} ref 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_proxybusobject_ref_incref(ref) {
    DllCall("MSAJApi.dll\alljoyn_proxybusobject_ref_incref", alljoyn_proxybusobject_ref, ref)
}

/**
 * 
 * @param {alljoyn_proxybusobject_ref} ref 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_proxybusobject_ref_decref(ref) {
    DllCall("MSAJApi.dll\alljoyn_proxybusobject_ref_decref", alljoyn_proxybusobject_ref, ref)
}

/**
 * 
 * @param {Pointer<alljoyn_observerlistener_callback>} callback 
 * @param {Pointer<Void>} _context 
 * @returns {alljoyn_observerlistener} 
 */
export alljoyn_observerlistener_create(callback, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_observerlistener_create", alljoyn_observerlistener_callback.Ptr, callback, _contextMarshal, _context, alljoyn_observerlistener)
    return result
}

/**
 * 
 * @param {alljoyn_observerlistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_observerlistener_destroy(listener) {
    DllCall("MSAJApi.dll\alljoyn_observerlistener_destroy", alljoyn_observerlistener, listener)
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<Pointer<Integer>>} mandatoryInterfaces 
 * @param {Pointer} numMandatoryInterfaces 
 * @returns {alljoyn_observer} 
 */
export alljoyn_observer_create(bus, mandatoryInterfaces, numMandatoryInterfaces) {
    mandatoryInterfacesMarshal := mandatoryInterfaces is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_observer_create", alljoyn_busattachment, bus, mandatoryInterfacesMarshal, mandatoryInterfaces, "ptr", numMandatoryInterfaces, alljoyn_observer)
    return result
}

/**
 * 
 * @param {alljoyn_observer} observer 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_observer_destroy(observer) {
    DllCall("MSAJApi.dll\alljoyn_observer_destroy", alljoyn_observer, observer)
}

/**
 * 
 * @param {alljoyn_observer} observer 
 * @param {alljoyn_observerlistener} listener 
 * @param {Integer} triggerOnExisting 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_observer_registerlistener(observer, listener, triggerOnExisting) {
    DllCall("MSAJApi.dll\alljoyn_observer_registerlistener", alljoyn_observer, observer, alljoyn_observerlistener, listener, "int", triggerOnExisting)
}

/**
 * 
 * @param {alljoyn_observer} observer 
 * @param {alljoyn_observerlistener} listener 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_observer_unregisterlistener(observer, listener) {
    DllCall("MSAJApi.dll\alljoyn_observer_unregisterlistener", alljoyn_observer, observer, alljoyn_observerlistener, listener)
}

/**
 * 
 * @param {alljoyn_observer} observer 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_observer_unregisteralllisteners(observer) {
    DllCall("MSAJApi.dll\alljoyn_observer_unregisteralllisteners", alljoyn_observer, observer)
}

/**
 * 
 * @param {alljoyn_observer} observer 
 * @param {PSTR} uniqueBusName 
 * @param {PSTR} objectPath 
 * @returns {alljoyn_proxybusobject_ref} 
 */
export alljoyn_observer_get(observer, uniqueBusName, objectPath) {
    uniqueBusName := uniqueBusName is String ? StrPtr(uniqueBusName) : uniqueBusName
    objectPath := objectPath is String ? StrPtr(objectPath) : objectPath

    result := DllCall("MSAJApi.dll\alljoyn_observer_get", alljoyn_observer, observer, "ptr", uniqueBusName, "ptr", objectPath, alljoyn_proxybusobject_ref)
    return result
}

/**
 * 
 * @param {alljoyn_observer} observer 
 * @returns {alljoyn_proxybusobject_ref} 
 */
export alljoyn_observer_getfirst(observer) {
    result := DllCall("MSAJApi.dll\alljoyn_observer_getfirst", alljoyn_observer, observer, alljoyn_proxybusobject_ref)
    return result
}

/**
 * 
 * @param {alljoyn_observer} observer 
 * @param {alljoyn_proxybusobject_ref} proxyref 
 * @returns {alljoyn_proxybusobject_ref} 
 */
export alljoyn_observer_getnext(observer, proxyref) {
    result := DllCall("MSAJApi.dll\alljoyn_observer_getnext", alljoyn_observer, observer, alljoyn_proxybusobject_ref, proxyref, alljoyn_proxybusobject_ref)
    return result
}

/**
 * 
 * @param {PSTR} authMechanism 
 * @param {PSTR} password 
 * @returns {QStatus} 
 */
export alljoyn_passwordmanager_setcredentials(authMechanism, password) {
    authMechanism := authMechanism is String ? StrPtr(authMechanism) : authMechanism
    password := password is String ? StrPtr(password) : password

    result := DllCall("MSAJApi.dll\alljoyn_passwordmanager_setcredentials", "ptr", authMechanism, "ptr", password, QStatus)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export alljoyn_securityapplicationproxy_getpermissionmanagementsessionport() {
    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getpermissionmanagementsessionport", UInt16)
    return result
}

/**
 * 
 * @param {alljoyn_busattachment} bus 
 * @param {Pointer<Integer>} appBusName 
 * @param {Integer} sessionId 
 * @returns {alljoyn_securityapplicationproxy} 
 */
export alljoyn_securityapplicationproxy_create(bus, appBusName, sessionId) {
    appBusNameMarshal := appBusName is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_create", alljoyn_busattachment, bus, appBusNameMarshal, appBusName, "uint", sessionId, alljoyn_securityapplicationproxy)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_securityapplicationproxy_destroy(proxy) {
    DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_destroy", alljoyn_securityapplicationproxy, proxy)
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Integer>} caKey 
 * @param {Pointer<Integer>} identityCertificateChain 
 * @param {Pointer<Integer>} groupId 
 * @param {Pointer} groupSize 
 * @param {Pointer<Integer>} groupAuthority 
 * @param {Pointer<Pointer<Integer>>} manifestsXmls 
 * @param {Pointer} manifestsCount 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_claim(proxy, caKey, identityCertificateChain, groupId, groupSize, groupAuthority, manifestsXmls, manifestsCount) {
    caKeyMarshal := caKey is VarRef ? "char*" : "ptr"
    identityCertificateChainMarshal := identityCertificateChain is VarRef ? "char*" : "ptr"
    groupIdMarshal := groupId is VarRef ? "char*" : "ptr"
    groupAuthorityMarshal := groupAuthority is VarRef ? "char*" : "ptr"
    manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_claim", alljoyn_securityapplicationproxy, proxy, caKeyMarshal, caKey, identityCertificateChainMarshal, identityCertificateChain, groupIdMarshal, groupId, "ptr", groupSize, groupAuthorityMarshal, groupAuthority, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Pointer<Integer>>} manifestTemplateXml 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_getmanifesttemplate(proxy, manifestTemplateXml) {
    manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getmanifesttemplate", alljoyn_securityapplicationproxy, proxy, manifestTemplateXmlMarshal, manifestTemplateXml, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} manifestTemplateXml 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_securityapplicationproxy_manifesttemplate_destroy(manifestTemplateXml) {
    manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "char*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_manifesttemplate_destroy", manifestTemplateXmlMarshal, manifestTemplateXml)
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<alljoyn_applicationstate>} applicationState 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_getapplicationstate(proxy, applicationState) {
    applicationStateMarshal := applicationState is VarRef ? "int*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getapplicationstate", alljoyn_securityapplicationproxy, proxy, applicationStateMarshal, applicationState, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Integer>} capabilities 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_getclaimcapabilities(proxy, capabilities) {
    capabilitiesMarshal := capabilities is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getclaimcapabilities", alljoyn_securityapplicationproxy, proxy, capabilitiesMarshal, capabilities, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Integer>} additionalInfo 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo(proxy, additionalInfo) {
    additionalInfoMarshal := additionalInfo is VarRef ? "ushort*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo", alljoyn_securityapplicationproxy, proxy, additionalInfoMarshal, additionalInfo, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Pointer<Integer>>} policyXml 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_getpolicy(proxy, policyXml) {
    policyXmlMarshal := policyXml is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getpolicy", alljoyn_securityapplicationproxy, proxy, policyXmlMarshal, policyXml, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Pointer<Integer>>} policyXml 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_getdefaultpolicy(proxy, policyXml) {
    policyXmlMarshal := policyXml is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getdefaultpolicy", alljoyn_securityapplicationproxy, proxy, policyXmlMarshal, policyXml, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} policyXml 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_securityapplicationproxy_policy_destroy(policyXml) {
    policyXmlMarshal := policyXml is VarRef ? "char*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_policy_destroy", policyXmlMarshal, policyXml)
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Integer>} policyXml 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_updatepolicy(proxy, policyXml) {
    policyXmlMarshal := policyXml is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_updatepolicy", alljoyn_securityapplicationproxy, proxy, policyXmlMarshal, policyXml, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Integer>} identityCertificateChain 
 * @param {Pointer<Pointer<Integer>>} manifestsXmls 
 * @param {Pointer} manifestsCount 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_updateidentity(proxy, identityCertificateChain, manifestsXmls, manifestsCount) {
    identityCertificateChainMarshal := identityCertificateChain is VarRef ? "char*" : "ptr"
    manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_updateidentity", alljoyn_securityapplicationproxy, proxy, identityCertificateChainMarshal, identityCertificateChain, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Integer>} membershipCertificateChain 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_installmembership(proxy, membershipCertificateChain) {
    membershipCertificateChainMarshal := membershipCertificateChain is VarRef ? "char*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_installmembership", alljoyn_securityapplicationproxy, proxy, membershipCertificateChainMarshal, membershipCertificateChain, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_reset(proxy) {
    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_reset", alljoyn_securityapplicationproxy, proxy, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_resetpolicy(proxy) {
    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_resetpolicy", alljoyn_securityapplicationproxy, proxy, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_startmanagement(proxy) {
    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_startmanagement", alljoyn_securityapplicationproxy, proxy, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_endmanagement(proxy) {
    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_endmanagement", alljoyn_securityapplicationproxy, proxy, QStatus)
    return result
}

/**
 * 
 * @param {alljoyn_securityapplicationproxy} proxy 
 * @param {Pointer<Pointer<Integer>>} eccPublicKey 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_geteccpublickey(proxy, eccPublicKey) {
    eccPublicKeyMarshal := eccPublicKey is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_geteccpublickey", alljoyn_securityapplicationproxy, proxy, eccPublicKeyMarshal, eccPublicKey, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} eccPublicKey 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_securityapplicationproxy_eccpublickey_destroy(eccPublicKey) {
    eccPublicKeyMarshal := eccPublicKey is VarRef ? "char*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_eccpublickey_destroy", eccPublicKeyMarshal, eccPublicKey)
}

/**
 * 
 * @param {Pointer<Integer>} unsignedManifestXml 
 * @param {Pointer<Integer>} identityCertificatePem 
 * @param {Pointer<Integer>} signingPrivateKeyPem 
 * @param {Pointer<Pointer<Integer>>} signedManifestXml 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_signmanifest(unsignedManifestXml, identityCertificatePem, signingPrivateKeyPem, signedManifestXml) {
    unsignedManifestXmlMarshal := unsignedManifestXml is VarRef ? "char*" : "ptr"
    identityCertificatePemMarshal := identityCertificatePem is VarRef ? "char*" : "ptr"
    signingPrivateKeyPemMarshal := signingPrivateKeyPem is VarRef ? "char*" : "ptr"
    signedManifestXmlMarshal := signedManifestXml is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_signmanifest", unsignedManifestXmlMarshal, unsignedManifestXml, identityCertificatePemMarshal, identityCertificatePem, signingPrivateKeyPemMarshal, signingPrivateKeyPem, signedManifestXmlMarshal, signedManifestXml, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} signedManifestXml 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_securityapplicationproxy_manifest_destroy(signedManifestXml) {
    signedManifestXmlMarshal := signedManifestXml is VarRef ? "char*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_manifest_destroy", signedManifestXmlMarshal, signedManifestXml)
}

/**
 * 
 * @param {Pointer<Integer>} unsignedManifestXml 
 * @param {Pointer<Integer>} identityCertificatePem 
 * @param {Pointer<Pointer<Integer>>} digest 
 * @param {Pointer<Pointer>} digestSize 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_computemanifestdigest(unsignedManifestXml, identityCertificatePem, digest, digestSize) {
    unsignedManifestXmlMarshal := unsignedManifestXml is VarRef ? "char*" : "ptr"
    identityCertificatePemMarshal := identityCertificatePem is VarRef ? "char*" : "ptr"
    digestMarshal := digest is VarRef ? "ptr*" : "ptr"
    digestSizeMarshal := digestSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_computemanifestdigest", unsignedManifestXmlMarshal, unsignedManifestXml, identityCertificatePemMarshal, identityCertificatePem, digestMarshal, digest, digestSizeMarshal, digestSize, QStatus)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} digest 
 * @returns {String} Nothing - always returns an empty string
 */
export alljoyn_securityapplicationproxy_digest_destroy(digest) {
    digestMarshal := digest is VarRef ? "char*" : "ptr"

    DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_digest_destroy", digestMarshal, digest)
}

/**
 * 
 * @param {Pointer<Integer>} unsignedManifestXml 
 * @param {Pointer<Integer>} identityCertificatePem 
 * @param {Pointer<Integer>} signature 
 * @param {Pointer} signatureSize 
 * @param {Pointer<Pointer<Integer>>} signedManifestXml 
 * @returns {QStatus} 
 */
export alljoyn_securityapplicationproxy_setmanifestsignature(unsignedManifestXml, identityCertificatePem, signature, signatureSize, signedManifestXml) {
    unsignedManifestXmlMarshal := unsignedManifestXml is VarRef ? "char*" : "ptr"
    identityCertificatePemMarshal := identityCertificatePem is VarRef ? "char*" : "ptr"
    signatureMarshal := signature is VarRef ? "char*" : "ptr"
    signedManifestXmlMarshal := signedManifestXml is VarRef ? "ptr*" : "ptr"

    result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_setmanifestsignature", unsignedManifestXmlMarshal, unsignedManifestXml, identityCertificatePemMarshal, identityCertificatePem, signatureMarshal, signature, "ptr", signatureSize, signedManifestXmlMarshal, signedManifestXml, QStatus)
    return result
}

;@endregion Functions
