#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class AllJoyn {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static QCC_TRUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QCC_FALSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_NO_REPLY_EXPECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_AUTO_START => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_ALLOW_REMOTE_MSG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_SESSIONLESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_GLOBAL_BROADCAST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_ENCRYPTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_TRAFFIC_TYPE_MESSAGES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_TRAFFIC_TYPE_RAW_UNRELIABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_TRAFFIC_TYPE_RAW_RELIABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_PROXIMITY_ANY => 255

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_PROXIMITY_PHYSICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_PROXIMITY_NETWORK => 2

    /**
     * @type {String}
     */
    static ALLJOYN_NAMED_PIPE_CONNECT_SPEC => "npipe:"

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_READ_READY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_WRITE_READY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_DISCONNECTED => 4

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_LITTLE_ENDIAN => 0x6C

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_BIG_ENDIAN => 0x42

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_DEFAULT_TIMEOUT => 25000

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_PASSWORD => 1

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_USER_NAME => 2

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_CERT_CHAIN => 4

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_PRIVATE_KEY => 8

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_LOGON_ENTRY => 16

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_EXPIRATION => 32

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_NEW_PASSWORD => 4097

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_ONE_TIME_PWD => 8193

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_PROP_ACCESS_READ => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_PROP_ACCESS_WRITE => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_PROP_ACCESS_RW => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_NO_REPLY => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_DEPRECATED => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_SESSIONCAST => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_SESSIONLESS => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_UNICAST => 0x10

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_GLOBAL_BROADCAST => 0x20
;@endregion Constants

;@region Methods
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
    static AllJoynConnectToBus(connectionSpec) {
        connectionSpec := connectionSpec is String ? StrPtr(connectionSpec) : connectionSpec

        A_LastError := 0

        result := DllCall("MSAJApi.dll\AllJoynConnectToBus", "ptr", connectionSpec, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError)
        }

        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
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
    static AllJoynCloseBusHandle(busHandle) {
        busHandle := busHandle is Win32Handle ? NumGet(busHandle, "ptr") : busHandle

        A_LastError := 0

        result := DllCall("MSAJApi.dll\AllJoynCloseBusHandle", "ptr", busHandle, "int")
        if(!result && A_LastError) {
            throw OSError(A_LastError)
        }

        return result
    }

    /**
     * Sends data to the bus via named pipe. The caller of this API is responsible to check if the bytesTransferred is less than the requested bytes and call this API again to resend the rest of the data.
     * @param {HANDLE} connectedBusHandle Pipe handle.
     * @param {Pointer} _buffer 
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
    static AllJoynSendToBus(connectedBusHandle, _buffer, bytesToWrite, bytesTransferred, reserved) {
        connectedBusHandle := connectedBusHandle is Win32Handle ? NumGet(connectedBusHandle, "ptr") : connectedBusHandle

        bytesTransferredMarshal := bytesTransferred is VarRef ? "uint*" : "ptr"
        reservedMarshal := reserved is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("MSAJApi.dll\AllJoynSendToBus", "ptr", connectedBusHandle, "ptr", _buffer, "uint", bytesToWrite, bytesTransferredMarshal, bytesTransferred, reservedMarshal, reserved, "int")
        if(!result && A_LastError) {
            throw OSError(A_LastError)
        }

        return result
    }

    /**
     * Receives data from the bus via named pipe.
     * @param {HANDLE} connectedBusHandle Pipe handle.
     * @param {Pointer} _buffer 
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
    static AllJoynReceiveFromBus(connectedBusHandle, _buffer, bytesToRead, bytesTransferred, reserved) {
        connectedBusHandle := connectedBusHandle is Win32Handle ? NumGet(connectedBusHandle, "ptr") : connectedBusHandle

        bytesTransferredMarshal := bytesTransferred is VarRef ? "uint*" : "ptr"
        reservedMarshal := reserved is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("MSAJApi.dll\AllJoynReceiveFromBus", "ptr", connectedBusHandle, "ptr", _buffer, "uint", bytesToRead, bytesTransferredMarshal, bytesTransferred, reservedMarshal, reserved, "int")
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
    static AllJoynEventSelect(connectedBusHandle, eventHandle, eventTypes) {
        connectedBusHandle := connectedBusHandle is Win32Handle ? NumGet(connectedBusHandle, "ptr") : connectedBusHandle
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        A_LastError := 0

        result := DllCall("MSAJApi.dll\AllJoynEventSelect", "ptr", connectedBusHandle, "ptr", eventHandle, "uint", eventTypes, "int")
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
    static AllJoynEnumEvents(connectedBusHandle, eventToReset, eventTypes) {
        connectedBusHandle := connectedBusHandle is Win32Handle ? NumGet(connectedBusHandle, "ptr") : connectedBusHandle
        eventToReset := eventToReset is Win32Handle ? NumGet(eventToReset, "ptr") : eventToReset

        eventTypesMarshal := eventTypes is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("MSAJApi.dll\AllJoynEnumEvents", "ptr", connectedBusHandle, "ptr", eventToReset, eventTypesMarshal, eventTypes, "int")
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
    static AllJoynCreateBus(outBufferSize, inBufferSize, lpSecurityAttributes) {
        result := DllCall("MSAJApi.dll\AllJoynCreateBus", "uint", outBufferSize, "uint", inBufferSize, "ptr", lpSecurityAttributes, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {HANDLE} serverBusHandle 
     * @param {HANDLE} abortEvent 
     * @returns {Integer} 
     */
    static AllJoynAcceptBusConnection(serverBusHandle, abortEvent) {
        serverBusHandle := serverBusHandle is Win32Handle ? NumGet(serverBusHandle, "ptr") : serverBusHandle
        abortEvent := abortEvent is Win32Handle ? NumGet(abortEvent, "ptr") : abortEvent

        result := DllCall("MSAJApi.dll\AllJoynAcceptBusConnection", "ptr", serverBusHandle, "ptr", abortEvent, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static alljoyn_unity_deferred_callbacks_process() {
        result := DllCall("MSAJApi.dll\alljoyn_unity_deferred_callbacks_process", "int")
        return result
    }

    /**
     * 
     * @param {Integer} mainthread_only 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_unity_set_deferred_callback_mainthread_only(mainthread_only) {
        DllCall("MSAJApi.dll\alljoyn_unity_set_deferred_callback_mainthread_only", "int", mainthread_only)
    }

    /**
     * 
     * @param {Integer} _status 
     * @returns {PSTR} 
     */
    static QCC_StatusText(_status) {
        result := DllCall("MSAJApi.dll\QCC_StatusText", "int", _status, "ptr")
        return result
    }

    /**
     * 
     * @returns {alljoyn_msgarg} 
     */
    static alljoyn_msgarg_create() {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_create", "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} signature 
     * @returns {alljoyn_msgarg} 
     */
    static alljoyn_msgarg_create_and_set(signature) {
        signature := signature is String ? StrPtr(signature) : signature

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_create_and_set", "ptr", signature, "CDecl ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_msgarg_destroy(arg) {
        DllCall("MSAJApi.dll\alljoyn_msgarg_destroy", "ptr", arg)
    }

    /**
     * 
     * @param {Pointer} _size 
     * @returns {alljoyn_msgarg} 
     */
    static alljoyn_msgarg_array_create(_size) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_create", "ptr", _size, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} index 
     * @returns {alljoyn_msgarg} 
     */
    static alljoyn_msgarg_array_element(arg, index) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_element", "ptr", arg, "ptr", index, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} signature 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set(arg, signature) {
        signature := signature is String ? StrPtr(signature) : signature

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set", "ptr", arg, "ptr", signature, "CDecl int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} signature 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get(arg, signature) {
        signature := signature is String ? StrPtr(signature) : signature

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get", "ptr", arg, "ptr", signature, "CDecl int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} source 
     * @returns {alljoyn_msgarg} 
     */
    static alljoyn_msgarg_copy(source) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_copy", "ptr", source, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} destination 
     * @param {alljoyn_msgarg} source 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_msgarg_clone(destination, source) {
        DllCall("MSAJApi.dll\alljoyn_msgarg_clone", "ptr", destination, "ptr", source)
    }

    /**
     * 
     * @param {alljoyn_msgarg} lhv 
     * @param {alljoyn_msgarg} rhv 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_equal(lhv, rhv) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_equal", "ptr", lhv, "ptr", rhv, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} args 
     * @param {Pointer<Pointer>} numArgs 
     * @param {PSTR} signature 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_array_set(args, numArgs, signature) {
        signature := signature is String ? StrPtr(signature) : signature

        numArgsMarshal := numArgs is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_set", "ptr", args, numArgsMarshal, numArgs, "ptr", signature, "CDecl int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} args 
     * @param {Pointer} numArgs 
     * @param {PSTR} signature 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_array_get(args, numArgs, signature) {
        signature := signature is String ? StrPtr(signature) : signature

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_get", "ptr", args, "ptr", numArgs, "ptr", signature, "CDecl int")
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
    static alljoyn_msgarg_tostring(arg, str, buf, indent) {
        str := str is String ? StrPtr(str) : str

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_tostring", "ptr", arg, "ptr", str, "ptr", buf, "ptr", indent, "ptr")
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
    static alljoyn_msgarg_array_tostring(args, numArgs, str, buf, indent) {
        str := str is String ? StrPtr(str) : str

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_tostring", "ptr", args, "ptr", numArgs, "ptr", str, "ptr", buf, "ptr", indent, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} str 
     * @param {Pointer} buf 
     * @returns {Pointer} 
     */
    static alljoyn_msgarg_signature(arg, str, buf) {
        str := str is String ? StrPtr(str) : str

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_signature", "ptr", arg, "ptr", str, "ptr", buf, "ptr")
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
    static alljoyn_msgarg_array_signature(values, numValues, str, buf) {
        str := str is String ? StrPtr(str) : str

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_signature", "ptr", values, "ptr", numValues, "ptr", str, "ptr", buf, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} signature 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_hassignature(arg, signature) {
        signature := signature is String ? StrPtr(signature) : signature

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_hassignature", "ptr", arg, "ptr", signature, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} elemSig 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_getdictelement(arg, elemSig) {
        elemSig := elemSig is String ? StrPtr(elemSig) : elemSig

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_getdictelement", "ptr", arg, "ptr", elemSig, "CDecl int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_gettype(arg) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_gettype", "ptr", arg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_msgarg_clear(arg) {
        DllCall("MSAJApi.dll\alljoyn_msgarg_clear", "ptr", arg)
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_msgarg_stabilize(arg) {
        DllCall("MSAJApi.dll\alljoyn_msgarg_stabilize", "ptr", arg)
    }

    /**
     * 
     * @param {alljoyn_msgarg} args 
     * @param {Pointer} argOffset 
     * @param {Pointer<Pointer>} numArgs 
     * @param {PSTR} signature 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_array_set_offset(args, argOffset, numArgs, signature) {
        signature := signature is String ? StrPtr(signature) : signature

        numArgsMarshal := numArgs is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_array_set_offset", "ptr", args, "ptr", argOffset, numArgsMarshal, numArgs, "ptr", signature, "CDecl int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} signature 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_and_stabilize(arg, signature) {
        signature := signature is String ? StrPtr(signature) : signature

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_and_stabilize", "ptr", arg, "ptr", signature, "CDecl int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Integer} y 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_uint8(arg, y) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint8", "ptr", arg, "char", y, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Integer} b 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_bool(arg, b) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_bool", "ptr", arg, "int", b, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Integer} n 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_int16(arg, n) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int16", "ptr", arg, "short", n, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Integer} q 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_uint16(arg, q) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint16", "ptr", arg, "ushort", q, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Integer} i 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_int32(arg, i) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int32", "ptr", arg, "int", i, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Integer} u 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_uint32(arg, u) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint32", "ptr", arg, "uint", u, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Integer} x 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_int64(arg, x) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int64", "ptr", arg, "int64", x, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Integer} t 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_uint64(arg, t) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint64", "ptr", arg, "uint", t, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Float} d 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_double(arg, d) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_double", "ptr", arg, "double", d, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} s 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_string(arg, s) {
        s := s is String ? StrPtr(s) : s

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_string", "ptr", arg, "ptr", s, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} o 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_objectpath(arg, o) {
        o := o is String ? StrPtr(o) : o

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_objectpath", "ptr", arg, "ptr", o, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} g 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_signature(arg, g) {
        g := g is String ? StrPtr(g) : g

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_signature", "ptr", arg, "ptr", g, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Integer>} y 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_uint8(arg, y) {
        yMarshal := y is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint8", "ptr", arg, yMarshal, y, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Integer>} b 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_bool(arg, b) {
        bMarshal := b is VarRef ? "int*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_bool", "ptr", arg, bMarshal, b, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Integer>} n 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_int16(arg, n) {
        nMarshal := n is VarRef ? "short*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int16", "ptr", arg, nMarshal, n, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Integer>} q 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_uint16(arg, q) {
        qMarshal := q is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint16", "ptr", arg, qMarshal, q, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Integer>} i 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_int32(arg, i) {
        iMarshal := i is VarRef ? "int*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int32", "ptr", arg, iMarshal, i, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Integer>} u 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_uint32(arg, u) {
        uMarshal := u is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint32", "ptr", arg, uMarshal, u, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Integer>} x 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_int64(arg, x) {
        xMarshal := x is VarRef ? "int64*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int64", "ptr", arg, xMarshal, x, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Integer>} t 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_uint64(arg, t) {
        tMarshal := t is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint64", "ptr", arg, tMarshal, t, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Float>} d 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_double(arg, d) {
        dMarshal := d is VarRef ? "double*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_double", "ptr", arg, dMarshal, d, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer<Integer>>} s 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_string(arg, s) {
        sMarshal := s is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_string", "ptr", arg, sMarshal, s, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer<Integer>>} o 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_objectpath(arg, o) {
        oMarshal := o is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_objectpath", "ptr", arg, oMarshal, o, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer<Integer>>} g 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_signature(arg, g) {
        gMarshal := g is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_signature", "ptr", arg, gMarshal, g, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {alljoyn_msgarg} v 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_variant(arg, v) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_variant", "ptr", arg, "ptr", v, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Integer>} ay 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_uint8_array(arg, length, ay) {
        ayMarshal := ay is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint8_array", "ptr", arg, "ptr", length, ayMarshal, ay, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Integer>} ab 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_bool_array(arg, length, ab) {
        abMarshal := ab is VarRef ? "int*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_bool_array", "ptr", arg, "ptr", length, abMarshal, ab, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Integer>} an 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_int16_array(arg, length, an) {
        anMarshal := an is VarRef ? "short*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int16_array", "ptr", arg, "ptr", length, anMarshal, an, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Integer>} aq 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_uint16_array(arg, length, aq) {
        aqMarshal := aq is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint16_array", "ptr", arg, "ptr", length, aqMarshal, aq, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Integer>} ai 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_int32_array(arg, length, ai) {
        aiMarshal := ai is VarRef ? "int*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int32_array", "ptr", arg, "ptr", length, aiMarshal, ai, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Integer>} au 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_uint32_array(arg, length, au) {
        auMarshal := au is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint32_array", "ptr", arg, "ptr", length, auMarshal, au, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Integer>} ax 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_int64_array(arg, length, ax) {
        axMarshal := ax is VarRef ? "int64*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_int64_array", "ptr", arg, "ptr", length, axMarshal, ax, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Integer>} at 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_uint64_array(arg, length, at) {
        atMarshal := at is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_uint64_array", "ptr", arg, "ptr", length, atMarshal, at, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Float>} ad 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_double_array(arg, length, ad) {
        adMarshal := ad is VarRef ? "double*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_double_array", "ptr", arg, "ptr", length, adMarshal, ad, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Pointer<Integer>>} _as 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_string_array(arg, length, _as) {
        _asMarshal := _as is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_string_array", "ptr", arg, "ptr", length, _asMarshal, _as, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Pointer<Integer>>} ao 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_objectpath_array(arg, length, ao) {
        aoMarshal := ao is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_objectpath_array", "ptr", arg, "ptr", length, aoMarshal, ao, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} length 
     * @param {Pointer<Pointer<Integer>>} ag 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_set_signature_array(arg, length, ag) {
        agMarshal := ag is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_set_signature_array", "ptr", arg, "ptr", length, agMarshal, ag, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<Integer>} ay 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_uint8_array(arg, length, ay) {
        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        ayMarshal := ay is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint8_array", "ptr", arg, lengthMarshal, length, ayMarshal, ay, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<Integer>} ab 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_bool_array(arg, length, ab) {
        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        abMarshal := ab is VarRef ? "int*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_bool_array", "ptr", arg, lengthMarshal, length, abMarshal, ab, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<Integer>} an 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_int16_array(arg, length, an) {
        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        anMarshal := an is VarRef ? "short*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int16_array", "ptr", arg, lengthMarshal, length, anMarshal, an, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<Integer>} aq 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_uint16_array(arg, length, aq) {
        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        aqMarshal := aq is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint16_array", "ptr", arg, lengthMarshal, length, aqMarshal, aq, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<Integer>} ai 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_int32_array(arg, length, ai) {
        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        aiMarshal := ai is VarRef ? "int*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int32_array", "ptr", arg, lengthMarshal, length, aiMarshal, ai, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<Integer>} au 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_uint32_array(arg, length, au) {
        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        auMarshal := au is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint32_array", "ptr", arg, lengthMarshal, length, auMarshal, au, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<Integer>} ax 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_int64_array(arg, length, ax) {
        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        axMarshal := ax is VarRef ? "int64*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_int64_array", "ptr", arg, lengthMarshal, length, axMarshal, ax, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<Integer>} at 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_uint64_array(arg, length, at) {
        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        atMarshal := at is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_uint64_array", "ptr", arg, lengthMarshal, length, atMarshal, at, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<Float>} ad 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_double_array(arg, length, ad) {
        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        adMarshal := ad is VarRef ? "double*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_double_array", "ptr", arg, lengthMarshal, length, adMarshal, ad, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} signature 
     * @param {Pointer<Pointer>} length 
     * @param {Pointer<alljoyn_msgarg>} av 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_get_variant_array(arg, signature, length, av) {
        signature := signature is String ? StrPtr(signature) : signature

        lengthMarshal := length is VarRef ? "ptr*" : "ptr"
        avMarshal := av is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_variant_array", "ptr", arg, "ptr", signature, lengthMarshal, length, avMarshal, av, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @returns {Pointer} 
     */
    static alljoyn_msgarg_get_array_numberofelements(arg) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_array_numberofelements", "ptr", arg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} index 
     * @param {Pointer<alljoyn_msgarg>} element 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_msgarg_get_array_element(arg, index, element) {
        elementMarshal := element is VarRef ? "ptr*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_msgarg_get_array_element", "ptr", arg, "ptr", index, elementMarshal, element)
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} index 
     * @returns {PSTR} 
     */
    static alljoyn_msgarg_get_array_elementsignature(arg, index) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_get_array_elementsignature", "ptr", arg, "ptr", index, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @returns {alljoyn_msgarg} 
     */
    static alljoyn_msgarg_getkey(arg) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_getkey", "ptr", arg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @returns {alljoyn_msgarg} 
     */
    static alljoyn_msgarg_getvalue(arg) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_getvalue", "ptr", arg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {alljoyn_msgarg} key 
     * @param {alljoyn_msgarg} value 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_setdictentry(arg, key, value) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_setdictentry", "ptr", arg, "ptr", key, "ptr", value, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {alljoyn_msgarg} struct_members 
     * @param {Pointer} num_members 
     * @returns {Integer} 
     */
    static alljoyn_msgarg_setstruct(arg, struct_members, num_members) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_setstruct", "ptr", arg, "ptr", struct_members, "ptr", num_members, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @returns {Pointer} 
     */
    static alljoyn_msgarg_getnummembers(arg) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_getnummembers", "ptr", arg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {Pointer} index 
     * @returns {alljoyn_msgarg} 
     */
    static alljoyn_msgarg_getmember(arg, index) {
        result := DllCall("MSAJApi.dll\alljoyn_msgarg_getmember", "ptr", arg, "ptr", index, "ptr")
        return result
    }

    /**
     * 
     * @returns {alljoyn_aboutdata} 
     */
    static alljoyn_aboutdata_create_empty() {
        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_create_empty", "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} defaultLanguage 
     * @returns {alljoyn_aboutdata} 
     */
    static alljoyn_aboutdata_create(defaultLanguage) {
        defaultLanguage := defaultLanguage is String ? StrPtr(defaultLanguage) : defaultLanguage

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_create", "ptr", defaultLanguage, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} language 
     * @returns {alljoyn_aboutdata} 
     */
    static alljoyn_aboutdata_create_full(arg, language) {
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_create_full", "ptr", arg, "ptr", language, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_aboutdata_destroy(data) {
        DllCall("MSAJApi.dll\alljoyn_aboutdata_destroy", "ptr", data)
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} aboutDataXml 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_createfromxml(data, aboutDataXml) {
        aboutDataXml := aboutDataXml is String ? StrPtr(aboutDataXml) : aboutDataXml

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_createfromxml", "ptr", data, "ptr", aboutDataXml, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_isvalid(data, language) {
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_isvalid", "ptr", data, "ptr", language, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {alljoyn_msgarg} arg 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_createfrommsgarg(data, arg, language) {
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_createfrommsgarg", "ptr", data, "ptr", arg, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Integer>} appId 
     * @param {Pointer} num 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setappid(data, appId, num) {
        appIdMarshal := appId is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setappid", "ptr", data, appIdMarshal, appId, "ptr", num, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} appId 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setappid_fromstring(data, appId) {
        appId := appId is String ? StrPtr(appId) : appId

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setappid_fromstring", "ptr", data, "ptr", appId, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} appId 
     * @param {Pointer<Pointer>} num 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getappid(data, appId, num) {
        appIdMarshal := appId is VarRef ? "ptr*" : "ptr"
        numMarshal := num is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getappid", "ptr", data, appIdMarshal, appId, numMarshal, num, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} defaultLanguage 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setdefaultlanguage(data, defaultLanguage) {
        defaultLanguage := defaultLanguage is String ? StrPtr(defaultLanguage) : defaultLanguage

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdefaultlanguage", "ptr", data, "ptr", defaultLanguage, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} defaultLanguage 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getdefaultlanguage(data, defaultLanguage) {
        defaultLanguageMarshal := defaultLanguage is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdefaultlanguage", "ptr", data, defaultLanguageMarshal, defaultLanguage, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} deviceName 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setdevicename(data, deviceName, language) {
        deviceName := deviceName is String ? StrPtr(deviceName) : deviceName
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdevicename", "ptr", data, "ptr", deviceName, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} deviceName 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getdevicename(data, deviceName, language) {
        language := language is String ? StrPtr(language) : language

        deviceNameMarshal := deviceName is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdevicename", "ptr", data, deviceNameMarshal, deviceName, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} deviceId 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setdeviceid(data, deviceId) {
        deviceId := deviceId is String ? StrPtr(deviceId) : deviceId

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdeviceid", "ptr", data, "ptr", deviceId, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} deviceId 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getdeviceid(data, deviceId) {
        deviceIdMarshal := deviceId is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdeviceid", "ptr", data, deviceIdMarshal, deviceId, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} appName 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setappname(data, appName, language) {
        appName := appName is String ? StrPtr(appName) : appName
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setappname", "ptr", data, "ptr", appName, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} appName 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getappname(data, appName, language) {
        language := language is String ? StrPtr(language) : language

        appNameMarshal := appName is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getappname", "ptr", data, appNameMarshal, appName, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} manufacturer 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setmanufacturer(data, manufacturer, language) {
        manufacturer := manufacturer is String ? StrPtr(manufacturer) : manufacturer
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setmanufacturer", "ptr", data, "ptr", manufacturer, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} manufacturer 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getmanufacturer(data, manufacturer, language) {
        language := language is String ? StrPtr(language) : language

        manufacturerMarshal := manufacturer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getmanufacturer", "ptr", data, manufacturerMarshal, manufacturer, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} modelNumber 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setmodelnumber(data, modelNumber) {
        modelNumber := modelNumber is String ? StrPtr(modelNumber) : modelNumber

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setmodelnumber", "ptr", data, "ptr", modelNumber, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} modelNumber 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getmodelnumber(data, modelNumber) {
        modelNumberMarshal := modelNumber is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getmodelnumber", "ptr", data, modelNumberMarshal, modelNumber, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setsupportedlanguage(data, language) {
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setsupportedlanguage", "ptr", data, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} languageTags 
     * @param {Pointer} num 
     * @returns {Pointer} 
     */
    static alljoyn_aboutdata_getsupportedlanguages(data, languageTags, num) {
        languageTagsMarshal := languageTags is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getsupportedlanguages", "ptr", data, languageTagsMarshal, languageTags, "ptr", num, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} description 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setdescription(data, description, language) {
        description := description is String ? StrPtr(description) : description
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdescription", "ptr", data, "ptr", description, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} description 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getdescription(data, description, language) {
        language := language is String ? StrPtr(language) : language

        descriptionMarshal := description is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdescription", "ptr", data, descriptionMarshal, description, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} dateOfManufacture 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setdateofmanufacture(data, dateOfManufacture) {
        dateOfManufacture := dateOfManufacture is String ? StrPtr(dateOfManufacture) : dateOfManufacture

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setdateofmanufacture", "ptr", data, "ptr", dateOfManufacture, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} dateOfManufacture 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getdateofmanufacture(data, dateOfManufacture) {
        dateOfManufactureMarshal := dateOfManufacture is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getdateofmanufacture", "ptr", data, dateOfManufactureMarshal, dateOfManufacture, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} softwareVersion 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setsoftwareversion(data, softwareVersion) {
        softwareVersion := softwareVersion is String ? StrPtr(softwareVersion) : softwareVersion

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setsoftwareversion", "ptr", data, "ptr", softwareVersion, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} softwareVersion 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getsoftwareversion(data, softwareVersion) {
        softwareVersionMarshal := softwareVersion is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getsoftwareversion", "ptr", data, softwareVersionMarshal, softwareVersion, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} ajSoftwareVersion 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getajsoftwareversion(data, ajSoftwareVersion) {
        ajSoftwareVersionMarshal := ajSoftwareVersion is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getajsoftwareversion", "ptr", data, ajSoftwareVersionMarshal, ajSoftwareVersion, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} hardwareVersion 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_sethardwareversion(data, hardwareVersion) {
        hardwareVersion := hardwareVersion is String ? StrPtr(hardwareVersion) : hardwareVersion

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_sethardwareversion", "ptr", data, "ptr", hardwareVersion, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} hardwareVersion 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_gethardwareversion(data, hardwareVersion) {
        hardwareVersionMarshal := hardwareVersion is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_gethardwareversion", "ptr", data, hardwareVersionMarshal, hardwareVersion, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} supportUrl 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setsupporturl(data, supportUrl) {
        supportUrl := supportUrl is String ? StrPtr(supportUrl) : supportUrl

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setsupporturl", "ptr", data, "ptr", supportUrl, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} supportUrl 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getsupporturl(data, supportUrl) {
        supportUrlMarshal := supportUrl is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getsupporturl", "ptr", data, supportUrlMarshal, supportUrl, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} name 
     * @param {alljoyn_msgarg} value 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_setfield(data, name, value, language) {
        name := name is String ? StrPtr(name) : name
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_setfield", "ptr", data, "ptr", name, "ptr", value, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} name 
     * @param {Pointer<alljoyn_msgarg>} value 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getfield(data, name, value, language) {
        name := name is String ? StrPtr(name) : name
        language := language is String ? StrPtr(language) : language

        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getfield", "ptr", data, "ptr", name, valueMarshal, value, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {Pointer<Pointer<Integer>>} fields 
     * @param {Pointer} num_fields 
     * @returns {Pointer} 
     */
    static alljoyn_aboutdata_getfields(data, fields, num_fields) {
        fieldsMarshal := fields is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getfields", "ptr", data, fieldsMarshal, fields, "ptr", num_fields, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {alljoyn_msgarg} msgArg 
     * @param {PSTR} language 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getaboutdata(data, msgArg, language) {
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getaboutdata", "ptr", data, "ptr", msgArg, "ptr", language, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {alljoyn_msgarg} msgArg 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_getannouncedaboutdata(data, msgArg) {
        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getannouncedaboutdata", "ptr", data, "ptr", msgArg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} fieldName 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_isfieldrequired(data, fieldName) {
        fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_isfieldrequired", "ptr", data, "ptr", fieldName, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} fieldName 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_isfieldannounced(data, fieldName) {
        fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_isfieldannounced", "ptr", data, "ptr", fieldName, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} fieldName 
     * @returns {Integer} 
     */
    static alljoyn_aboutdata_isfieldlocalized(data, fieldName) {
        fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_isfieldlocalized", "ptr", data, "ptr", fieldName, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdata} data 
     * @param {PSTR} fieldName 
     * @returns {PSTR} 
     */
    static alljoyn_aboutdata_getfieldsignature(data, fieldName) {
        fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

        result := DllCall("MSAJApi.dll\alljoyn_aboutdata_getfieldsignature", "ptr", data, "ptr", fieldName, "ptr")
        return result
    }

    /**
     * 
     * @returns {alljoyn_abouticon} 
     */
    static alljoyn_abouticon_create() {
        result := DllCall("MSAJApi.dll\alljoyn_abouticon_create", "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_abouticon} icon 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_abouticon_destroy(icon) {
        DllCall("MSAJApi.dll\alljoyn_abouticon_destroy", "ptr", icon)
    }

    /**
     * 
     * @param {alljoyn_abouticon} icon 
     * @param {Pointer<Pointer<Integer>>} data 
     * @param {Pointer<Pointer>} _size 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_abouticon_getcontent(icon, data, _size) {
        dataMarshal := data is VarRef ? "ptr*" : "ptr"
        _sizeMarshal := _size is VarRef ? "ptr*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_abouticon_getcontent", "ptr", icon, dataMarshal, data, _sizeMarshal, _size)
    }

    /**
     * 
     * @param {alljoyn_abouticon} icon 
     * @param {PSTR} type 
     * @param {Pointer<Integer>} data 
     * @param {Pointer} csize 
     * @param {Integer} ownsData 
     * @returns {Integer} 
     */
    static alljoyn_abouticon_setcontent(icon, type, data, csize, ownsData) {
        type := type is String ? StrPtr(type) : type

        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_abouticon_setcontent", "ptr", icon, "ptr", type, dataMarshal, data, "ptr", csize, "char", ownsData, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_abouticon} icon 
     * @param {Pointer<Pointer<Integer>>} type 
     * @param {Pointer<Pointer<Integer>>} url 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_abouticon_geturl(icon, type, url) {
        typeMarshal := type is VarRef ? "ptr*" : "ptr"
        urlMarshal := url is VarRef ? "ptr*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_abouticon_geturl", "ptr", icon, typeMarshal, type, urlMarshal, url)
    }

    /**
     * 
     * @param {alljoyn_abouticon} icon 
     * @param {PSTR} type 
     * @param {PSTR} url 
     * @returns {Integer} 
     */
    static alljoyn_abouticon_seturl(icon, type, url) {
        type := type is String ? StrPtr(type) : type
        url := url is String ? StrPtr(url) : url

        result := DllCall("MSAJApi.dll\alljoyn_abouticon_seturl", "ptr", icon, "ptr", type, "ptr", url, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_abouticon} icon 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_abouticon_clear(icon) {
        DllCall("MSAJApi.dll\alljoyn_abouticon_clear", "ptr", icon)
    }

    /**
     * 
     * @param {alljoyn_abouticon} icon 
     * @param {alljoyn_msgarg} arg 
     * @returns {Integer} 
     */
    static alljoyn_abouticon_setcontent_frommsgarg(icon, arg) {
        result := DllCall("MSAJApi.dll\alljoyn_abouticon_setcontent_frommsgarg", "ptr", icon, "ptr", arg, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getdefaultclaimcapabilities() {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getdefaultclaimcapabilities", "ushort")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Integer>} state 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getapplicationstate(configurator, state) {
        stateMarshal := state is VarRef ? "int*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getapplicationstate", "ptr", configurator, stateMarshal, state, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Integer} state 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_setapplicationstate(configurator, state) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_setapplicationstate", "ptr", configurator, "int", state, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Pointer<Integer>>} publicKey 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getpublickey(configurator, publicKey) {
        publicKeyMarshal := publicKey is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getpublickey", "ptr", configurator, publicKeyMarshal, publicKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} publicKey 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_permissionconfigurator_publickey_destroy(publicKey) {
        publicKeyMarshal := publicKey is VarRef ? "char*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_publickey_destroy", publicKeyMarshal, publicKey)
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Pointer<Integer>>} manifestTemplateXml 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getmanifesttemplate(configurator, manifestTemplateXml) {
        manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getmanifesttemplate", "ptr", configurator, manifestTemplateXmlMarshal, manifestTemplateXml, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} manifestTemplateXml 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_permissionconfigurator_manifesttemplate_destroy(manifestTemplateXml) {
        manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "char*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_manifesttemplate_destroy", manifestTemplateXmlMarshal, manifestTemplateXml)
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Integer>} manifestTemplateXml 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_setmanifesttemplatefromxml(configurator, manifestTemplateXml) {
        manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_setmanifesttemplatefromxml", "ptr", configurator, manifestTemplateXmlMarshal, manifestTemplateXml, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Integer>} claimCapabilities 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getclaimcapabilities(configurator, claimCapabilities) {
        claimCapabilitiesMarshal := claimCapabilities is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getclaimcapabilities", "ptr", configurator, claimCapabilitiesMarshal, claimCapabilities, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Integer} claimCapabilities 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_setclaimcapabilities(configurator, claimCapabilities) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_setclaimcapabilities", "ptr", configurator, "ushort", claimCapabilities, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Integer>} additionalInfo 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo(configurator, additionalInfo) {
        additionalInfoMarshal := additionalInfo is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo", "ptr", configurator, additionalInfoMarshal, additionalInfo, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Integer} additionalInfo 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo(configurator, additionalInfo) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo", "ptr", configurator, "ushort", additionalInfo, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_reset(configurator) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_reset", "ptr", configurator, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_claim(configurator, caKey, identityCertificateChain, groupId, groupSize, groupAuthority, manifestsXmls, manifestsCount) {
        caKeyMarshal := caKey is VarRef ? "char*" : "ptr"
        identityCertificateChainMarshal := identityCertificateChain is VarRef ? "char*" : "ptr"
        groupIdMarshal := groupId is VarRef ? "char*" : "ptr"
        groupAuthorityMarshal := groupAuthority is VarRef ? "char*" : "ptr"
        manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_claim", "ptr", configurator, caKeyMarshal, caKey, identityCertificateChainMarshal, identityCertificateChain, groupIdMarshal, groupId, "ptr", groupSize, groupAuthorityMarshal, groupAuthority, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Integer>} identityCertificateChain 
     * @param {Pointer<Pointer<Integer>>} manifestsXmls 
     * @param {Pointer} manifestsCount 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_updateidentity(configurator, identityCertificateChain, manifestsXmls, manifestsCount) {
        identityCertificateChainMarshal := identityCertificateChain is VarRef ? "char*" : "ptr"
        manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_updateidentity", "ptr", configurator, identityCertificateChainMarshal, identityCertificateChain, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Pointer<Integer>>} identityCertificateChain 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getidentity(configurator, identityCertificateChain) {
        identityCertificateChainMarshal := identityCertificateChain is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getidentity", "ptr", configurator, identityCertificateChainMarshal, identityCertificateChain, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} certificateChain 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_permissionconfigurator_certificatechain_destroy(certificateChain) {
        certificateChainMarshal := certificateChain is VarRef ? "char*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_certificatechain_destroy", certificateChainMarshal, certificateChain)
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<alljoyn_manifestarray>} manifestArray 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getmanifests(configurator, manifestArray) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getmanifests", "ptr", configurator, "ptr", manifestArray, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<alljoyn_manifestarray>} manifestArray 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_permissionconfigurator_manifestarray_cleanup(manifestArray) {
        DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_manifestarray_cleanup", "ptr", manifestArray)
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Pointer<Integer>>} manifestsXmls 
     * @param {Pointer} manifestsCount 
     * @param {Integer} append 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_installmanifests(configurator, manifestsXmls, manifestsCount, append) {
        manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_installmanifests", "ptr", configurator, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, "int", append, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<alljoyn_certificateid>} certificateId 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getidentitycertificateid(configurator, certificateId) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getidentitycertificateid", "ptr", configurator, "ptr", certificateId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<alljoyn_certificateid>} certificateId 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_permissionconfigurator_certificateid_cleanup(certificateId) {
        DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_certificateid_cleanup", "ptr", certificateId)
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Integer>} policyXml 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_updatepolicy(configurator, policyXml) {
        policyXmlMarshal := policyXml is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_updatepolicy", "ptr", configurator, policyXmlMarshal, policyXml, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Pointer<Integer>>} policyXml 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getpolicy(configurator, policyXml) {
        policyXmlMarshal := policyXml is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getpolicy", "ptr", configurator, policyXmlMarshal, policyXml, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Pointer<Integer>>} policyXml 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getdefaultpolicy(configurator, policyXml) {
        policyXmlMarshal := policyXml is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getdefaultpolicy", "ptr", configurator, policyXmlMarshal, policyXml, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} policyXml 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_permissionconfigurator_policy_destroy(policyXml) {
        policyXmlMarshal := policyXml is VarRef ? "char*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_policy_destroy", policyXmlMarshal, policyXml)
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_resetpolicy(configurator) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_resetpolicy", "ptr", configurator, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<alljoyn_certificateidarray>} certificateIds 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_getmembershipsummaries(configurator, certificateIds) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_getmembershipsummaries", "ptr", configurator, "ptr", certificateIds, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<alljoyn_certificateidarray>} certificateIdArray 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_permissionconfigurator_certificateidarray_cleanup(certificateIdArray) {
        DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_certificateidarray_cleanup", "ptr", certificateIdArray)
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @param {Pointer<Integer>} membershipCertificateChain 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_installmembership(configurator, membershipCertificateChain) {
        membershipCertificateChainMarshal := membershipCertificateChain is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_installmembership", "ptr", configurator, membershipCertificateChainMarshal, membershipCertificateChain, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_removemembership(configurator, serial, serialLen, issuerPublicKey, issuerAki, issuerAkiLen) {
        serialMarshal := serial is VarRef ? "char*" : "ptr"
        issuerPublicKeyMarshal := issuerPublicKey is VarRef ? "char*" : "ptr"
        issuerAkiMarshal := issuerAki is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_removemembership", "ptr", configurator, serialMarshal, serial, "ptr", serialLen, issuerPublicKeyMarshal, issuerPublicKey, issuerAkiMarshal, issuerAki, "ptr", issuerAkiLen, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_startmanagement(configurator) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_startmanagement", "ptr", configurator, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurator} configurator 
     * @returns {Integer} 
     */
    static alljoyn_permissionconfigurator_endmanagement(configurator) {
        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurator_endmanagement", "ptr", configurator, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<alljoyn_applicationstatelistener_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_applicationstatelistener} 
     */
    static alljoyn_applicationstatelistener_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_applicationstatelistener_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_applicationstatelistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_applicationstatelistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_applicationstatelistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {Pointer<alljoyn_keystorelistener_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_keystorelistener} 
     */
    static alljoyn_keystorelistener_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_keystorelistener_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<alljoyn_keystorelistener_with_synchronization_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_keystorelistener} 
     */
    static alljoyn_keystorelistener_with_synchronization_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_keystorelistener_with_synchronization_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_keystorelistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_keystorelistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_keystorelistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_keystorelistener} listener 
     * @param {alljoyn_keystore} keyStore 
     * @param {PSTR} source 
     * @param {PSTR} password 
     * @returns {Integer} 
     */
    static alljoyn_keystorelistener_putkeys(listener, keyStore, source, password) {
        source := source is String ? StrPtr(source) : source
        password := password is String ? StrPtr(password) : password

        result := DllCall("MSAJApi.dll\alljoyn_keystorelistener_putkeys", "ptr", listener, "ptr", keyStore, "ptr", source, "ptr", password, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_keystorelistener} listener 
     * @param {alljoyn_keystore} keyStore 
     * @param {PSTR} sink 
     * @param {Pointer<Pointer>} sink_sz 
     * @returns {Integer} 
     */
    static alljoyn_keystorelistener_getkeys(listener, keyStore, sink, sink_sz) {
        sink := sink is String ? StrPtr(sink) : sink

        sink_szMarshal := sink_sz is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_keystorelistener_getkeys", "ptr", listener, "ptr", keyStore, "ptr", sink, sink_szMarshal, sink_sz, "int")
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
    static alljoyn_sessionopts_create(traffic, isMultipoint, proximity, transports) {
        result := DllCall("MSAJApi.dll\alljoyn_sessionopts_create", "char", traffic, "int", isMultipoint, "char", proximity, "ushort", transports, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_sessionopts} opts 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_sessionopts_destroy(opts) {
        DllCall("MSAJApi.dll\alljoyn_sessionopts_destroy", "ptr", opts)
    }

    /**
     * 
     * @param {alljoyn_sessionopts} opts 
     * @returns {Integer} 
     */
    static alljoyn_sessionopts_get_traffic(opts) {
        result := DllCall("MSAJApi.dll\alljoyn_sessionopts_get_traffic", "ptr", opts, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_sessionopts} opts 
     * @param {Integer} traffic 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_sessionopts_set_traffic(opts, traffic) {
        DllCall("MSAJApi.dll\alljoyn_sessionopts_set_traffic", "ptr", opts, "char", traffic)
    }

    /**
     * 
     * @param {alljoyn_sessionopts} opts 
     * @returns {Integer} 
     */
    static alljoyn_sessionopts_get_multipoint(opts) {
        result := DllCall("MSAJApi.dll\alljoyn_sessionopts_get_multipoint", "ptr", opts, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_sessionopts} opts 
     * @param {Integer} isMultipoint 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_sessionopts_set_multipoint(opts, isMultipoint) {
        DllCall("MSAJApi.dll\alljoyn_sessionopts_set_multipoint", "ptr", opts, "int", isMultipoint)
    }

    /**
     * 
     * @param {alljoyn_sessionopts} opts 
     * @returns {Integer} 
     */
    static alljoyn_sessionopts_get_proximity(opts) {
        result := DllCall("MSAJApi.dll\alljoyn_sessionopts_get_proximity", "ptr", opts, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_sessionopts} opts 
     * @param {Integer} proximity 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_sessionopts_set_proximity(opts, proximity) {
        DllCall("MSAJApi.dll\alljoyn_sessionopts_set_proximity", "ptr", opts, "char", proximity)
    }

    /**
     * 
     * @param {alljoyn_sessionopts} opts 
     * @returns {Integer} 
     */
    static alljoyn_sessionopts_get_transports(opts) {
        result := DllCall("MSAJApi.dll\alljoyn_sessionopts_get_transports", "ptr", opts, "ushort")
        return result
    }

    /**
     * 
     * @param {alljoyn_sessionopts} opts 
     * @param {Integer} transports 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_sessionopts_set_transports(opts, transports) {
        DllCall("MSAJApi.dll\alljoyn_sessionopts_set_transports", "ptr", opts, "ushort", transports)
    }

    /**
     * 
     * @param {alljoyn_sessionopts} one 
     * @param {alljoyn_sessionopts} other 
     * @returns {Integer} 
     */
    static alljoyn_sessionopts_iscompatible(one, other) {
        result := DllCall("MSAJApi.dll\alljoyn_sessionopts_iscompatible", "ptr", one, "ptr", other, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_sessionopts} one 
     * @param {alljoyn_sessionopts} other 
     * @returns {Integer} 
     */
    static alljoyn_sessionopts_cmp(one, other) {
        result := DllCall("MSAJApi.dll\alljoyn_sessionopts_cmp", "ptr", one, "ptr", other, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {alljoyn_message} 
     */
    static alljoyn_message_create(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_message_create", "ptr", bus, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_message_destroy(_msg) {
        DllCall("MSAJApi.dll\alljoyn_message_destroy", "ptr", _msg)
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_isbroadcastsignal(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_isbroadcastsignal", "ptr", _msg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_isglobalbroadcast(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_isglobalbroadcast", "ptr", _msg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_issessionless(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_issessionless", "ptr", _msg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_getflags(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getflags", "ptr", _msg, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @param {Pointer<Integer>} tillExpireMS 
     * @returns {Integer} 
     */
    static alljoyn_message_isexpired(_msg, tillExpireMS) {
        tillExpireMSMarshal := tillExpireMS is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_message_isexpired", "ptr", _msg, tillExpireMSMarshal, tillExpireMS, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_isunreliable(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_isunreliable", "ptr", _msg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_isencrypted(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_isencrypted", "ptr", _msg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {PSTR} 
     */
    static alljoyn_message_getauthmechanism(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getauthmechanism", "ptr", _msg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_gettype(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_gettype", "ptr", _msg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @param {Pointer<Pointer>} numArgs 
     * @param {Pointer<alljoyn_msgarg>} args 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_message_getargs(_msg, numArgs, args) {
        numArgsMarshal := numArgs is VarRef ? "ptr*" : "ptr"
        argsMarshal := args is VarRef ? "ptr*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_message_getargs", "ptr", _msg, numArgsMarshal, numArgs, argsMarshal, args)
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @param {Pointer} argN 
     * @returns {alljoyn_msgarg} 
     */
    static alljoyn_message_getarg(_msg, argN) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getarg", "ptr", _msg, "ptr", argN, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @param {PSTR} signature 
     * @returns {Integer} 
     */
    static alljoyn_message_parseargs(_msg, signature) {
        signature := signature is String ? StrPtr(signature) : signature

        result := DllCall("MSAJApi.dll\alljoyn_message_parseargs", "ptr", _msg, "ptr", signature, "CDecl int")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_getcallserial(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getcallserial", "ptr", _msg, "uint")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {PSTR} 
     */
    static alljoyn_message_getsignature(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getsignature", "ptr", _msg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {PSTR} 
     */
    static alljoyn_message_getobjectpath(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getobjectpath", "ptr", _msg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {PSTR} 
     */
    static alljoyn_message_getinterface(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getinterface", "ptr", _msg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {PSTR} 
     */
    static alljoyn_message_getmembername(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getmembername", "ptr", _msg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_getreplyserial(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getreplyserial", "ptr", _msg, "uint")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {PSTR} 
     */
    static alljoyn_message_getsender(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getsender", "ptr", _msg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {PSTR} 
     */
    static alljoyn_message_getreceiveendpointname(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getreceiveendpointname", "ptr", _msg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {PSTR} 
     */
    static alljoyn_message_getdestination(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getdestination", "ptr", _msg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     * @deprecated 
     */
    static alljoyn_message_getcompressiontoken(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getcompressiontoken", "ptr", _msg, "uint")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_getsessionid(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_getsessionid", "ptr", _msg, "uint")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @param {PSTR} errorMessage 
     * @param {Pointer<Pointer>} errorMessage_size 
     * @returns {PSTR} 
     */
    static alljoyn_message_geterrorname(_msg, errorMessage, errorMessage_size) {
        errorMessage := errorMessage is String ? StrPtr(errorMessage) : errorMessage

        errorMessage_sizeMarshal := errorMessage_size is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_message_geterrorname", "ptr", _msg, "ptr", errorMessage, errorMessage_sizeMarshal, errorMessage_size, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @param {PSTR} str 
     * @param {Pointer} buf 
     * @returns {Pointer} 
     */
    static alljoyn_message_tostring(_msg, str, buf) {
        str := str is String ? StrPtr(str) : str

        result := DllCall("MSAJApi.dll\alljoyn_message_tostring", "ptr", _msg, "ptr", str, "ptr", buf, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @param {PSTR} str 
     * @param {Pointer} buf 
     * @returns {Pointer} 
     */
    static alljoyn_message_description(_msg, str, buf) {
        str := str is String ? StrPtr(str) : str

        result := DllCall("MSAJApi.dll\alljoyn_message_description", "ptr", _msg, "ptr", str, "ptr", buf, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_message_gettimestamp(_msg) {
        result := DllCall("MSAJApi.dll\alljoyn_message_gettimestamp", "ptr", _msg, "uint")
        return result
    }

    /**
     * 
     * @param {alljoyn_message} one 
     * @param {alljoyn_message} other 
     * @returns {Integer} 
     */
    static alljoyn_message_eql(one, other) {
        result := DllCall("MSAJApi.dll\alljoyn_message_eql", "ptr", one, "ptr", other, "int")
        return result
    }

    /**
     * 
     * @param {Integer} endian 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_message_setendianess(endian) {
        DllCall("MSAJApi.dll\alljoyn_message_setendianess", "char", endian)
    }

    /**
     * 
     * @param {alljoyn_authlistener} listener 
     * @param {Pointer<Void>} authContext 
     * @param {Integer} accept 
     * @param {alljoyn_credentials} credentials 
     * @returns {Integer} 
     */
    static alljoyn_authlistener_requestcredentialsresponse(listener, authContext, accept, credentials) {
        authContextMarshal := authContext is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_authlistener_requestcredentialsresponse", "ptr", listener, authContextMarshal, authContext, "int", accept, "ptr", credentials, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_authlistener} listener 
     * @param {Pointer<Void>} authContext 
     * @param {Integer} accept 
     * @returns {Integer} 
     */
    static alljoyn_authlistener_verifycredentialsresponse(listener, authContext, accept) {
        authContextMarshal := authContext is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_authlistener_verifycredentialsresponse", "ptr", listener, authContextMarshal, authContext, "int", accept, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<alljoyn_authlistener_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_authlistener} 
     */
    static alljoyn_authlistener_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_authlistener_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<alljoyn_authlistenerasync_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_authlistener} 
     */
    static alljoyn_authlistenerasync_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_authlistenerasync_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_authlistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_authlistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_authlistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_authlistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_authlistenerasync_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_authlistenerasync_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_authlistener} listener 
     * @param {Pointer<Integer>} sharedSecret 
     * @param {Pointer} sharedSecretSize 
     * @returns {Integer} 
     */
    static alljoyn_authlistener_setsharedsecret(listener, sharedSecret, sharedSecretSize) {
        sharedSecretMarshal := sharedSecret is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_authlistener_setsharedsecret", "ptr", listener, sharedSecretMarshal, sharedSecret, "ptr", sharedSecretSize, "int")
        return result
    }

    /**
     * 
     * @returns {alljoyn_credentials} 
     */
    static alljoyn_credentials_create() {
        result := DllCall("MSAJApi.dll\alljoyn_credentials_create", "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_credentials_destroy(cred) {
        DllCall("MSAJApi.dll\alljoyn_credentials_destroy", "ptr", cred)
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @param {Integer} creds 
     * @returns {Integer} 
     */
    static alljoyn_credentials_isset(cred, creds) {
        result := DllCall("MSAJApi.dll\alljoyn_credentials_isset", "ptr", cred, "ushort", creds, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @param {PSTR} pwd 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_credentials_setpassword(cred, pwd) {
        pwd := pwd is String ? StrPtr(pwd) : pwd

        DllCall("MSAJApi.dll\alljoyn_credentials_setpassword", "ptr", cred, "ptr", pwd)
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @param {PSTR} userName 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_credentials_setusername(cred, userName) {
        userName := userName is String ? StrPtr(userName) : userName

        DllCall("MSAJApi.dll\alljoyn_credentials_setusername", "ptr", cred, "ptr", userName)
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @param {PSTR} certChain 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_credentials_setcertchain(cred, certChain) {
        certChain := certChain is String ? StrPtr(certChain) : certChain

        DllCall("MSAJApi.dll\alljoyn_credentials_setcertchain", "ptr", cred, "ptr", certChain)
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @param {PSTR} pk 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_credentials_setprivatekey(cred, pk) {
        pk := pk is String ? StrPtr(pk) : pk

        DllCall("MSAJApi.dll\alljoyn_credentials_setprivatekey", "ptr", cred, "ptr", pk)
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @param {PSTR} logonEntry 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_credentials_setlogonentry(cred, logonEntry) {
        logonEntry := logonEntry is String ? StrPtr(logonEntry) : logonEntry

        DllCall("MSAJApi.dll\alljoyn_credentials_setlogonentry", "ptr", cred, "ptr", logonEntry)
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @param {Integer} expiration 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_credentials_setexpiration(cred, expiration) {
        DllCall("MSAJApi.dll\alljoyn_credentials_setexpiration", "ptr", cred, "uint", expiration)
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @returns {PSTR} 
     */
    static alljoyn_credentials_getpassword(cred) {
        result := DllCall("MSAJApi.dll\alljoyn_credentials_getpassword", "ptr", cred, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @returns {PSTR} 
     */
    static alljoyn_credentials_getusername(cred) {
        result := DllCall("MSAJApi.dll\alljoyn_credentials_getusername", "ptr", cred, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @returns {PSTR} 
     */
    static alljoyn_credentials_getcertchain(cred) {
        result := DllCall("MSAJApi.dll\alljoyn_credentials_getcertchain", "ptr", cred, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @returns {PSTR} 
     */
    static alljoyn_credentials_getprivateKey(cred) {
        result := DllCall("MSAJApi.dll\alljoyn_credentials_getprivateKey", "ptr", cred, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @returns {PSTR} 
     */
    static alljoyn_credentials_getlogonentry(cred) {
        result := DllCall("MSAJApi.dll\alljoyn_credentials_getlogonentry", "ptr", cred, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @returns {Integer} 
     */
    static alljoyn_credentials_getexpiration(cred) {
        result := DllCall("MSAJApi.dll\alljoyn_credentials_getexpiration", "ptr", cred, "uint")
        return result
    }

    /**
     * 
     * @param {alljoyn_credentials} cred 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_credentials_clear(cred) {
        DllCall("MSAJApi.dll\alljoyn_credentials_clear", "ptr", cred)
    }

    /**
     * 
     * @param {Pointer<alljoyn_buslistener_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_buslistener} 
     */
    static alljoyn_buslistener_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_buslistener_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_buslistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_buslistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_buslistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_interfacedescription_member} member 
     * @returns {Pointer} 
     */
    static alljoyn_interfacedescription_member_getannotationscount(member) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getannotationscount", "ptr", member, "ptr")
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
    static alljoyn_interfacedescription_member_getannotationatindex(member, index, name, name_size, value, value_size) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        name_sizeMarshal := name_size is VarRef ? "ptr*" : "ptr"
        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getannotationatindex", "ptr", member, "ptr", index, "ptr", name, name_sizeMarshal, name_size, "ptr", value, value_sizeMarshal, value_size)
    }

    /**
     * 
     * @param {alljoyn_interfacedescription_member} member 
     * @param {PSTR} name 
     * @param {PSTR} value 
     * @param {Pointer<Pointer>} value_size 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_member_getannotation(member, name, value, value_size) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getannotation", "ptr", member, "ptr", name, "ptr", value, value_sizeMarshal, value_size, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription_member} member 
     * @param {PSTR} argName 
     * @returns {Pointer} 
     */
    static alljoyn_interfacedescription_member_getargannotationscount(member, argName) {
        argName := argName is String ? StrPtr(argName) : argName

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getargannotationscount", "ptr", member, "ptr", argName, "ptr")
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
    static alljoyn_interfacedescription_member_getargannotationatindex(member, argName, index, name, name_size, value, value_size) {
        argName := argName is String ? StrPtr(argName) : argName
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        name_sizeMarshal := name_size is VarRef ? "ptr*" : "ptr"
        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getargannotationatindex", "ptr", member, "ptr", argName, "ptr", index, "ptr", name, name_sizeMarshal, name_size, "ptr", value, value_sizeMarshal, value_size)
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
    static alljoyn_interfacedescription_member_getargannotation(member, argName, name, value, value_size) {
        argName := argName is String ? StrPtr(argName) : argName
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_getargannotation", "ptr", member, "ptr", argName, "ptr", name, "ptr", value, value_sizeMarshal, value_size, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription_property} _property 
     * @returns {Pointer} 
     */
    static alljoyn_interfacedescription_property_getannotationscount(_property) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_property_getannotationscount", "ptr", _property, "ptr")
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
    static alljoyn_interfacedescription_property_getannotationatindex(_property, index, name, name_size, value, value_size) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        name_sizeMarshal := name_size is VarRef ? "ptr*" : "ptr"
        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_interfacedescription_property_getannotationatindex", "ptr", _property, "ptr", index, "ptr", name, name_sizeMarshal, name_size, "ptr", value, value_sizeMarshal, value_size)
    }

    /**
     * 
     * @param {alljoyn_interfacedescription_property} _property 
     * @param {PSTR} name 
     * @param {PSTR} value 
     * @param {Pointer<Pointer>} value_size 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_property_getannotation(_property, name, value, value_size) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_property_getannotation", "ptr", _property, "ptr", name, "ptr", value, value_sizeMarshal, value_size, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_interfacedescription_activate(iface) {
        DllCall("MSAJApi.dll\alljoyn_interfacedescription_activate", "ptr", iface)
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} name 
     * @param {PSTR} value 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_addannotation(iface, name, value) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addannotation", "ptr", iface, "ptr", name, "ptr", value, "int")
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
    static alljoyn_interfacedescription_getannotation(iface, name, value, value_size) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getannotation", "ptr", iface, "ptr", name, "ptr", value, value_sizeMarshal, value_size, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Pointer} 
     */
    static alljoyn_interfacedescription_getannotationscount(iface) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getannotationscount", "ptr", iface, "ptr")
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
    static alljoyn_interfacedescription_getannotationatindex(iface, index, name, name_size, value, value_size) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        name_sizeMarshal := name_size is VarRef ? "ptr*" : "ptr"
        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_interfacedescription_getannotationatindex", "ptr", iface, "ptr", index, "ptr", name, name_sizeMarshal, name_size, "ptr", value, value_sizeMarshal, value_size)
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} name 
     * @param {Pointer<alljoyn_interfacedescription_member>} member 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_getmember(iface, name, member) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmember", "ptr", iface, "ptr", name, "ptr", member, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {Integer} type 
     * @param {PSTR} name 
     * @param {PSTR} inputSig 
     * @param {PSTR} outSig 
     * @param {PSTR} argNames 
     * @param {Integer} annotation 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_addmember(iface, type, name, inputSig, outSig, argNames, annotation) {
        name := name is String ? StrPtr(name) : name
        inputSig := inputSig is String ? StrPtr(inputSig) : inputSig
        outSig := outSig is String ? StrPtr(outSig) : outSig
        argNames := argNames is String ? StrPtr(argNames) : argNames

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addmember", "ptr", iface, "int", type, "ptr", name, "ptr", inputSig, "ptr", outSig, "ptr", argNames, "char", annotation, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} member 
     * @param {PSTR} name 
     * @param {PSTR} value 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_addmemberannotation(iface, member, name, value) {
        member := member is String ? StrPtr(member) : member
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addmemberannotation", "ptr", iface, "ptr", member, "ptr", name, "ptr", value, "int")
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
    static alljoyn_interfacedescription_getmemberannotation(iface, member, name, value, value_size) {
        member := member is String ? StrPtr(member) : member
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmemberannotation", "ptr", iface, "ptr", member, "ptr", name, "ptr", value, value_sizeMarshal, value_size, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {Pointer<alljoyn_interfacedescription_member>} members 
     * @param {Pointer} numMembers 
     * @returns {Pointer} 
     */
    static alljoyn_interfacedescription_getmembers(iface, members, numMembers) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmembers", "ptr", iface, "ptr", members, "ptr", numMembers, "ptr")
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
    static alljoyn_interfacedescription_hasmember(iface, name, inSig, outSig) {
        name := name is String ? StrPtr(name) : name
        inSig := inSig is String ? StrPtr(inSig) : inSig
        outSig := outSig is String ? StrPtr(outSig) : outSig

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_hasmember", "ptr", iface, "ptr", name, "ptr", inSig, "ptr", outSig, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_addmethod(iface, name, inputSig, outSig, argNames, annotation, accessPerms) {
        name := name is String ? StrPtr(name) : name
        inputSig := inputSig is String ? StrPtr(inputSig) : inputSig
        outSig := outSig is String ? StrPtr(outSig) : outSig
        argNames := argNames is String ? StrPtr(argNames) : argNames
        accessPerms := accessPerms is String ? StrPtr(accessPerms) : accessPerms

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addmethod", "ptr", iface, "ptr", name, "ptr", inputSig, "ptr", outSig, "ptr", argNames, "char", annotation, "ptr", accessPerms, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} name 
     * @param {Pointer<alljoyn_interfacedescription_member>} member 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_getmethod(iface, name, member) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmethod", "ptr", iface, "ptr", name, "ptr", member, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_addsignal(iface, name, sig, argNames, annotation, accessPerms) {
        name := name is String ? StrPtr(name) : name
        sig := sig is String ? StrPtr(sig) : sig
        argNames := argNames is String ? StrPtr(argNames) : argNames
        accessPerms := accessPerms is String ? StrPtr(accessPerms) : accessPerms

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addsignal", "ptr", iface, "ptr", name, "ptr", sig, "ptr", argNames, "char", annotation, "ptr", accessPerms, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} name 
     * @param {Pointer<alljoyn_interfacedescription_member>} member 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_getsignal(iface, name, member) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getsignal", "ptr", iface, "ptr", name, "ptr", member, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} name 
     * @param {Pointer<alljoyn_interfacedescription_property>} _property 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_getproperty(iface, name, _property) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getproperty", "ptr", iface, "ptr", name, "ptr", _property, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {Pointer<alljoyn_interfacedescription_property>} props 
     * @param {Pointer} numProps 
     * @returns {Pointer} 
     */
    static alljoyn_interfacedescription_getproperties(iface, props, numProps) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getproperties", "ptr", iface, "ptr", props, "ptr", numProps, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} name 
     * @param {PSTR} signature 
     * @param {Integer} access 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_addproperty(iface, name, signature, access) {
        name := name is String ? StrPtr(name) : name
        signature := signature is String ? StrPtr(signature) : signature

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addproperty", "ptr", iface, "ptr", name, "ptr", signature, "char", access, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} _property 
     * @param {PSTR} name 
     * @param {PSTR} value 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_addpropertyannotation(iface, _property, name, value) {
        _property := _property is String ? StrPtr(_property) : _property
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addpropertyannotation", "ptr", iface, "ptr", _property, "ptr", name, "ptr", value, "int")
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
    static alljoyn_interfacedescription_getpropertyannotation(iface, _property, name, value, str_size) {
        _property := _property is String ? StrPtr(_property) : _property
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        str_sizeMarshal := str_size is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getpropertyannotation", "ptr", iface, "ptr", _property, "ptr", name, "ptr", value, str_sizeMarshal, str_size, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} name 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_hasproperty(iface, name) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_hasproperty", "ptr", iface, "ptr", name, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_hasproperties(iface) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_hasproperties", "ptr", iface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {PSTR} 
     */
    static alljoyn_interfacedescription_getname(iface) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getname", "ptr", iface, "ptr")
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
    static alljoyn_interfacedescription_introspect(iface, str, buf, indent) {
        str := str is String ? StrPtr(str) : str

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_introspect", "ptr", iface, "ptr", str, "ptr", buf, "ptr", indent, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_issecure(iface) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_issecure", "ptr", iface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_getsecuritypolicy(iface) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getsecuritypolicy", "ptr", iface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} language 
     * @returns {String} Nothing - always returns an empty string
     * @deprecated 
     */
    static alljoyn_interfacedescription_setdescriptionlanguage(iface, language) {
        language := language is String ? StrPtr(language) : language

        DllCall("MSAJApi.dll\alljoyn_interfacedescription_setdescriptionlanguage", "ptr", iface, "ptr", language)
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {Pointer<Pointer<Integer>>} languages 
     * @param {Pointer} _size 
     * @returns {Pointer} 
     * @deprecated 
     */
    static alljoyn_interfacedescription_getdescriptionlanguages(iface, languages, _size) {
        languagesMarshal := languages is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getdescriptionlanguages", "ptr", iface, languagesMarshal, languages, "ptr", _size, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} languages 
     * @param {Pointer} languagesSize 
     * @returns {Pointer} 
     */
    static alljoyn_interfacedescription_getdescriptionlanguages2(iface, languages, languagesSize) {
        languages := languages is String ? StrPtr(languages) : languages

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getdescriptionlanguages2", "ptr", iface, "ptr", languages, "ptr", languagesSize, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} description 
     * @returns {String} Nothing - always returns an empty string
     * @deprecated 
     */
    static alljoyn_interfacedescription_setdescription(iface, description) {
        description := description is String ? StrPtr(description) : description

        DllCall("MSAJApi.dll\alljoyn_interfacedescription_setdescription", "ptr", iface, "ptr", description)
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} description 
     * @param {PSTR} languageTag 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_setdescriptionforlanguage(iface, description, languageTag) {
        description := description is String ? StrPtr(description) : description
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setdescriptionforlanguage", "ptr", iface, "ptr", description, "ptr", languageTag, "int")
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
    static alljoyn_interfacedescription_getdescriptionforlanguage(iface, description, maxLanguageLength, languageTag) {
        description := description is String ? StrPtr(description) : description
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getdescriptionforlanguage", "ptr", iface, "ptr", description, "ptr", maxLanguageLength, "ptr", languageTag, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} member 
     * @param {PSTR} description 
     * @returns {Integer} 
     * @deprecated 
     */
    static alljoyn_interfacedescription_setmemberdescription(iface, member, description) {
        member := member is String ? StrPtr(member) : member
        description := description is String ? StrPtr(description) : description

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setmemberdescription", "ptr", iface, "ptr", member, "ptr", description, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} member 
     * @param {PSTR} description 
     * @param {PSTR} languageTag 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_setmemberdescriptionforlanguage(iface, member, description, languageTag) {
        member := member is String ? StrPtr(member) : member
        description := description is String ? StrPtr(description) : description
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setmemberdescriptionforlanguage", "ptr", iface, "ptr", member, "ptr", description, "ptr", languageTag, "int")
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
    static alljoyn_interfacedescription_getmemberdescriptionforlanguage(iface, member, description, maxLanguageLength, languageTag) {
        member := member is String ? StrPtr(member) : member
        description := description is String ? StrPtr(description) : description
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmemberdescriptionforlanguage", "ptr", iface, "ptr", member, "ptr", description, "ptr", maxLanguageLength, "ptr", languageTag, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} member 
     * @param {PSTR} argName 
     * @param {PSTR} description 
     * @returns {Integer} 
     * @deprecated 
     */
    static alljoyn_interfacedescription_setargdescription(iface, member, argName, description) {
        member := member is String ? StrPtr(member) : member
        argName := argName is String ? StrPtr(argName) : argName
        description := description is String ? StrPtr(description) : description

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setargdescription", "ptr", iface, "ptr", member, "ptr", argName, "ptr", description, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} member 
     * @param {PSTR} arg 
     * @param {PSTR} description 
     * @param {PSTR} languageTag 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_setargdescriptionforlanguage(iface, member, arg, description, languageTag) {
        member := member is String ? StrPtr(member) : member
        arg := arg is String ? StrPtr(arg) : arg
        description := description is String ? StrPtr(description) : description
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setargdescriptionforlanguage", "ptr", iface, "ptr", member, "ptr", arg, "ptr", description, "ptr", languageTag, "int")
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
    static alljoyn_interfacedescription_getargdescriptionforlanguage(iface, member, arg, description, maxLanguageLength, languageTag) {
        member := member is String ? StrPtr(member) : member
        arg := arg is String ? StrPtr(arg) : arg
        description := description is String ? StrPtr(description) : description
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getargdescriptionforlanguage", "ptr", iface, "ptr", member, "ptr", arg, "ptr", description, "ptr", maxLanguageLength, "ptr", languageTag, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} name 
     * @param {PSTR} description 
     * @returns {Integer} 
     * @deprecated 
     */
    static alljoyn_interfacedescription_setpropertydescription(iface, name, description) {
        name := name is String ? StrPtr(name) : name
        description := description is String ? StrPtr(description) : description

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setpropertydescription", "ptr", iface, "ptr", name, "ptr", description, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} name 
     * @param {PSTR} description 
     * @param {PSTR} languageTag 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_setpropertydescriptionforlanguage(iface, name, description, languageTag) {
        name := name is String ? StrPtr(name) : name
        description := description is String ? StrPtr(description) : description
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_setpropertydescriptionforlanguage", "ptr", iface, "ptr", name, "ptr", description, "ptr", languageTag, "int")
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
    static alljoyn_interfacedescription_getpropertydescriptionforlanguage(iface, _property, description, maxLanguageLength, languageTag) {
        _property := _property is String ? StrPtr(_property) : _property
        description := description is String ? StrPtr(description) : description
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getpropertydescriptionforlanguage", "ptr", iface, "ptr", _property, "ptr", description, "ptr", maxLanguageLength, "ptr", languageTag, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {Pointer<alljoyn_interfacedescription_translation_callback_ptr>} translationCallback 
     * @returns {String} Nothing - always returns an empty string
     * @deprecated 
     */
    static alljoyn_interfacedescription_setdescriptiontranslationcallback(iface, translationCallback) {
        DllCall("MSAJApi.dll\alljoyn_interfacedescription_setdescriptiontranslationcallback", "ptr", iface, "ptr", translationCallback)
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Pointer<alljoyn_interfacedescription_translation_callback_ptr>} 
     * @deprecated 
     */
    static alljoyn_interfacedescription_getdescriptiontranslationcallback(iface) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getdescriptiontranslationcallback", "ptr", iface, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_hasdescription(iface) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_hasdescription", "ptr", iface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} iface 
     * @param {PSTR} member 
     * @param {PSTR} argName 
     * @param {PSTR} name 
     * @param {PSTR} value 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_addargannotation(iface, member, argName, name, value) {
        member := member is String ? StrPtr(member) : member
        argName := argName is String ? StrPtr(argName) : argName
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_addargannotation", "ptr", iface, "ptr", member, "ptr", argName, "ptr", name, "ptr", value, "int")
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
    static alljoyn_interfacedescription_getmemberargannotation(iface, member, argName, name, value, value_size) {
        member := member is String ? StrPtr(member) : member
        argName := argName is String ? StrPtr(argName) : argName
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        value_sizeMarshal := value_size is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_getmemberargannotation", "ptr", iface, "ptr", member, "ptr", argName, "ptr", name, "ptr", value, value_sizeMarshal, value_size, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription} one 
     * @param {alljoyn_interfacedescription} other 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_eql(one, other) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_eql", "ptr", one, "ptr", other, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription_member} one 
     * @param {alljoyn_interfacedescription_member} other 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_member_eql(one, other) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_member_eql", "ptr", one, "ptr", other, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_interfacedescription_property} one 
     * @param {alljoyn_interfacedescription_property} other 
     * @returns {Integer} 
     */
    static alljoyn_interfacedescription_property_eql(one, other) {
        result := DllCall("MSAJApi.dll\alljoyn_interfacedescription_property_eql", "ptr", one, "ptr", other, "int")
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
    static alljoyn_busobject_create(_path, isPlaceholder, callbacks_in, context_in) {
        _path := _path is String ? StrPtr(_path) : _path

        context_inMarshal := context_in is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busobject_create", "ptr", _path, "int", isPlaceholder, "ptr", callbacks_in, context_inMarshal, context_in, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busobject_destroy(bus) {
        DllCall("MSAJApi.dll\alljoyn_busobject_destroy", "ptr", bus)
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @returns {PSTR} 
     */
    static alljoyn_busobject_getpath(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_getpath", "ptr", bus, "ptr")
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
    static alljoyn_busobject_emitpropertychanged(bus, ifcName, propName, _val, id) {
        ifcName := ifcName is String ? StrPtr(ifcName) : ifcName
        propName := propName is String ? StrPtr(propName) : propName

        DllCall("MSAJApi.dll\alljoyn_busobject_emitpropertychanged", "ptr", bus, "ptr", ifcName, "ptr", propName, "ptr", _val, "uint", id)
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
    static alljoyn_busobject_emitpropertieschanged(bus, ifcName, propNames, numProps, id) {
        ifcName := ifcName is String ? StrPtr(ifcName) : ifcName

        propNamesMarshal := propNames is VarRef ? "ptr*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_busobject_emitpropertieschanged", "ptr", bus, "ptr", ifcName, propNamesMarshal, propNames, "ptr", numProps, "uint", id)
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {PSTR} _buffer 
     * @param {Pointer} bufferSz 
     * @returns {Pointer} 
     */
    static alljoyn_busobject_getname(bus, _buffer, bufferSz) {
        _buffer := _buffer is String ? StrPtr(_buffer) : _buffer

        result := DllCall("MSAJApi.dll\alljoyn_busobject_getname", "ptr", bus, "ptr", _buffer, "ptr", bufferSz, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Integer} 
     */
    static alljoyn_busobject_addinterface(bus, iface) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_addinterface", "ptr", bus, "ptr", iface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {alljoyn_interfacedescription_member} member 
     * @param {Pointer<alljoyn_messagereceiver_methodhandler_ptr>} handler 
     * @param {Pointer<Void>} _context 
     * @returns {Integer} 
     */
    static alljoyn_busobject_addmethodhandler(bus, member, handler, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busobject_addmethodhandler", "ptr", bus, "ptr", member, "ptr", handler, _contextMarshal, _context, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {Pointer<alljoyn_busobject_methodentry>} entries 
     * @param {Pointer} numEntries 
     * @returns {Integer} 
     */
    static alljoyn_busobject_addmethodhandlers(bus, entries, numEntries) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_addmethodhandlers", "ptr", bus, "ptr", entries, "ptr", numEntries, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {alljoyn_message} _msg 
     * @param {alljoyn_msgarg} args 
     * @param {Pointer} numArgs 
     * @returns {Integer} 
     */
    static alljoyn_busobject_methodreply_args(bus, _msg, args, numArgs) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_methodreply_args", "ptr", bus, "ptr", _msg, "ptr", args, "ptr", numArgs, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {alljoyn_message} _msg 
     * @param {PSTR} error 
     * @param {PSTR} errorMessage 
     * @returns {Integer} 
     */
    static alljoyn_busobject_methodreply_err(bus, _msg, error, errorMessage) {
        error := error is String ? StrPtr(error) : error
        errorMessage := errorMessage is String ? StrPtr(errorMessage) : errorMessage

        result := DllCall("MSAJApi.dll\alljoyn_busobject_methodreply_err", "ptr", bus, "ptr", _msg, "ptr", error, "ptr", errorMessage, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {alljoyn_message} _msg 
     * @param {Integer} _status 
     * @returns {Integer} 
     */
    static alljoyn_busobject_methodreply_status(bus, _msg, _status) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_methodreply_status", "ptr", bus, "ptr", _msg, "int", _status, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @returns {alljoyn_busattachment} 
     */
    static alljoyn_busobject_getbusattachment(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_getbusattachment", "ptr", bus, "ptr")
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
     * @returns {Integer} 
     */
    static alljoyn_busobject_signal(bus, destination, sessionId, signal, args, numArgs, timeToLive, flags, _msg) {
        destination := destination is String ? StrPtr(destination) : destination

        result := DllCall("MSAJApi.dll\alljoyn_busobject_signal", "ptr", bus, "ptr", destination, "uint", sessionId, "ptr", signal, "ptr", args, "ptr", numArgs, "ushort", timeToLive, "char", flags, "ptr", _msg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {Integer} serialNumber 
     * @returns {Integer} 
     */
    static alljoyn_busobject_cancelsessionlessmessage_serial(bus, serialNumber) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_cancelsessionlessmessage_serial", "ptr", bus, "uint", serialNumber, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {alljoyn_message} _msg 
     * @returns {Integer} 
     */
    static alljoyn_busobject_cancelsessionlessmessage(bus, _msg) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_cancelsessionlessmessage", "ptr", bus, "ptr", _msg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @returns {Integer} 
     */
    static alljoyn_busobject_issecure(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_issecure", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {Pointer<Pointer<Integer>>} interfaces 
     * @param {Pointer} numInterfaces 
     * @returns {Pointer} 
     */
    static alljoyn_busobject_getannouncedinterfacenames(bus, interfaces, numInterfaces) {
        interfacesMarshal := interfaces is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busobject_getannouncedinterfacenames", "ptr", bus, interfacesMarshal, interfaces, "ptr", numInterfaces, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {alljoyn_interfacedescription} iface 
     * @param {Integer} isAnnounced 
     * @returns {Integer} 
     */
    static alljoyn_busobject_setannounceflag(bus, iface, isAnnounced) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_setannounceflag", "ptr", bus, "ptr", iface, "int", isAnnounced, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busobject} bus 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Integer} 
     */
    static alljoyn_busobject_addinterface_announced(bus, iface) {
        result := DllCall("MSAJApi.dll\alljoyn_busobject_addinterface_announced", "ptr", bus, "ptr", iface, "int")
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
    static alljoyn_proxybusobject_create(bus, service, _path, sessionId) {
        service := service is String ? StrPtr(service) : service
        _path := _path is String ? StrPtr(_path) : _path

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_create", "ptr", bus, "ptr", service, "ptr", _path, "uint", sessionId, "ptr")
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
    static alljoyn_proxybusobject_create_secure(bus, service, _path, sessionId) {
        service := service is String ? StrPtr(service) : service
        _path := _path is String ? StrPtr(_path) : _path

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_create_secure", "ptr", bus, "ptr", service, "ptr", _path, "uint", sessionId, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_proxybusobject_destroy(proxyObj) {
        DllCall("MSAJApi.dll\alljoyn_proxybusobject_destroy", "ptr", proxyObj)
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_addinterface(proxyObj, iface) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_addinterface", "ptr", proxyObj, "ptr", iface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} name 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_addinterface_by_name(proxyObj, name) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_addinterface_by_name", "ptr", proxyObj, "ptr", name, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {Pointer<alljoyn_proxybusobject>} children 
     * @param {Pointer} numChildren 
     * @returns {Pointer} 
     */
    static alljoyn_proxybusobject_getchildren(proxyObj, children, numChildren) {
        childrenMarshal := children is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getchildren", "ptr", proxyObj, childrenMarshal, children, "ptr", numChildren, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} _path 
     * @returns {alljoyn_proxybusobject} 
     */
    static alljoyn_proxybusobject_getchild(proxyObj, _path) {
        _path := _path is String ? StrPtr(_path) : _path

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getchild", "ptr", proxyObj, "ptr", _path, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {alljoyn_proxybusobject} child 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_addchild(proxyObj, child) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_addchild", "ptr", proxyObj, "ptr", child, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} _path 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_removechild(proxyObj, _path) {
        _path := _path is String ? StrPtr(_path) : _path

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_removechild", "ptr", proxyObj, "ptr", _path, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_introspectremoteobject(proxyObj) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_introspectremoteobject", "ptr", proxyObj, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {Pointer<alljoyn_proxybusobject_listener_introspectcb_ptr>} callback 
     * @param {Pointer<Void>} _context 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_introspectremoteobjectasync(proxyObj, callback, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_introspectremoteobjectasync", "ptr", proxyObj, "ptr", callback, _contextMarshal, _context, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} iface 
     * @param {PSTR} _property 
     * @param {alljoyn_msgarg} value 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_getproperty(proxyObj, iface, _property, value) {
        iface := iface is String ? StrPtr(iface) : iface
        _property := _property is String ? StrPtr(_property) : _property

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getproperty", "ptr", proxyObj, "ptr", iface, "ptr", _property, "ptr", value, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_getpropertyasync(proxyObj, iface, _property, callback, timeout, _context) {
        iface := iface is String ? StrPtr(iface) : iface
        _property := _property is String ? StrPtr(_property) : _property

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getpropertyasync", "ptr", proxyObj, "ptr", iface, "ptr", _property, "ptr", callback, "uint", timeout, _contextMarshal, _context, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} iface 
     * @param {alljoyn_msgarg} values 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_getallproperties(proxyObj, iface, values) {
        iface := iface is String ? StrPtr(iface) : iface

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getallproperties", "ptr", proxyObj, "ptr", iface, "ptr", values, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} iface 
     * @param {Pointer<alljoyn_proxybusobject_listener_getallpropertiescb_ptr>} callback 
     * @param {Integer} timeout 
     * @param {Pointer<Void>} _context 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_getallpropertiesasync(proxyObj, iface, callback, timeout, _context) {
        iface := iface is String ? StrPtr(iface) : iface

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getallpropertiesasync", "ptr", proxyObj, "ptr", iface, "ptr", callback, "uint", timeout, _contextMarshal, _context, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} iface 
     * @param {PSTR} _property 
     * @param {alljoyn_msgarg} value 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_setproperty(proxyObj, iface, _property, value) {
        iface := iface is String ? StrPtr(iface) : iface
        _property := _property is String ? StrPtr(_property) : _property

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_setproperty", "ptr", proxyObj, "ptr", iface, "ptr", _property, "ptr", value, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_registerpropertieschangedlistener(proxyObj, iface, _properties, numProperties, callback, _context) {
        iface := iface is String ? StrPtr(iface) : iface

        _propertiesMarshal := _properties is VarRef ? "ptr*" : "ptr"
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_registerpropertieschangedlistener", "ptr", proxyObj, "ptr", iface, _propertiesMarshal, _properties, "ptr", numProperties, "ptr", callback, _contextMarshal, _context, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} iface 
     * @param {Pointer<alljoyn_proxybusobject_listener_propertieschanged_ptr>} callback 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_unregisterpropertieschangedlistener(proxyObj, iface, callback) {
        iface := iface is String ? StrPtr(iface) : iface

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_unregisterpropertieschangedlistener", "ptr", proxyObj, "ptr", iface, "ptr", callback, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_setpropertyasync(proxyObj, iface, _property, value, callback, timeout, _context) {
        iface := iface is String ? StrPtr(iface) : iface
        _property := _property is String ? StrPtr(_property) : _property

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_setpropertyasync", "ptr", proxyObj, "ptr", iface, "ptr", _property, "ptr", value, "ptr", callback, "uint", timeout, _contextMarshal, _context, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_methodcall(proxyObj, ifaceName, methodName, args, numArgs, replyMsg, timeout, flags) {
        ifaceName := ifaceName is String ? StrPtr(ifaceName) : ifaceName
        methodName := methodName is String ? StrPtr(methodName) : methodName

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcall", "ptr", proxyObj, "ptr", ifaceName, "ptr", methodName, "ptr", args, "ptr", numArgs, "ptr", replyMsg, "uint", timeout, "char", flags, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_methodcall_member(proxyObj, method, args, numArgs, replyMsg, timeout, flags) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcall_member", "ptr", proxyObj, "ptr", method, "ptr", args, "ptr", numArgs, "ptr", replyMsg, "uint", timeout, "char", flags, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_methodcall_noreply(proxyObj, ifaceName, methodName, args, numArgs, flags) {
        ifaceName := ifaceName is String ? StrPtr(ifaceName) : ifaceName
        methodName := methodName is String ? StrPtr(methodName) : methodName

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcall_noreply", "ptr", proxyObj, "ptr", ifaceName, "ptr", methodName, "ptr", args, "ptr", numArgs, "char", flags, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {alljoyn_interfacedescription_member} method 
     * @param {alljoyn_msgarg} args 
     * @param {Pointer} numArgs 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_methodcall_member_noreply(proxyObj, method, args, numArgs, flags) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcall_member_noreply", "ptr", proxyObj, "ptr", method, "ptr", args, "ptr", numArgs, "char", flags, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_methodcallasync(proxyObj, ifaceName, methodName, replyFunc, args, numArgs, _context, timeout, flags) {
        ifaceName := ifaceName is String ? StrPtr(ifaceName) : ifaceName
        methodName := methodName is String ? StrPtr(methodName) : methodName

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcallasync", "ptr", proxyObj, "ptr", ifaceName, "ptr", methodName, "ptr", replyFunc, "ptr", args, "ptr", numArgs, _contextMarshal, _context, "uint", timeout, "char", flags, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_methodcallasync_member(proxyObj, method, replyFunc, args, numArgs, _context, timeout, flags) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_methodcallasync_member", "ptr", proxyObj, "ptr", method, "ptr", replyFunc, "ptr", args, "ptr", numArgs, _contextMarshal, _context, "uint", timeout, "char", flags, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} xml 
     * @param {PSTR} identifier 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_parsexml(proxyObj, xml, identifier) {
        xml := xml is String ? StrPtr(xml) : xml
        identifier := identifier is String ? StrPtr(identifier) : identifier

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_parsexml", "ptr", proxyObj, "ptr", xml, "ptr", identifier, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {Integer} forceAuth 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_secureconnection(proxyObj, forceAuth) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_secureconnection", "ptr", proxyObj, "int", forceAuth, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {Integer} forceAuth 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_secureconnectionasync(proxyObj, forceAuth) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_secureconnectionasync", "ptr", proxyObj, "int", forceAuth, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} iface 
     * @returns {alljoyn_interfacedescription} 
     */
    static alljoyn_proxybusobject_getinterface(proxyObj, iface) {
        iface := iface is String ? StrPtr(iface) : iface

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getinterface", "ptr", proxyObj, "ptr", iface, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {Pointer<alljoyn_interfacedescription>} ifaces 
     * @param {Pointer} numIfaces 
     * @returns {Pointer} 
     */
    static alljoyn_proxybusobject_getinterfaces(proxyObj, ifaces, numIfaces) {
        ifacesMarshal := ifaces is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getinterfaces", "ptr", proxyObj, ifacesMarshal, ifaces, "ptr", numIfaces, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @returns {PSTR} 
     */
    static alljoyn_proxybusobject_getpath(proxyObj) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getpath", "ptr", proxyObj, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @returns {PSTR} 
     */
    static alljoyn_proxybusobject_getservicename(proxyObj) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getservicename", "ptr", proxyObj, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @returns {PSTR} 
     */
    static alljoyn_proxybusobject_getuniquename(proxyObj) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getuniquename", "ptr", proxyObj, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_getsessionid(proxyObj) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_getsessionid", "ptr", proxyObj, "uint")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @param {PSTR} iface 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_implementsinterface(proxyObj, iface) {
        iface := iface is String ? StrPtr(iface) : iface

        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_implementsinterface", "ptr", proxyObj, "ptr", iface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} source 
     * @returns {alljoyn_proxybusobject} 
     */
    static alljoyn_proxybusobject_copy(source) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_copy", "ptr", source, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_isvalid(proxyObj) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_isvalid", "ptr", proxyObj, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @returns {Integer} 
     */
    static alljoyn_proxybusobject_issecure(proxyObj) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_issecure", "ptr", proxyObj, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxyObj 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_proxybusobject_enablepropertycaching(proxyObj) {
        DllCall("MSAJApi.dll\alljoyn_proxybusobject_enablepropertycaching", "ptr", proxyObj)
    }

    /**
     * 
     * @param {Pointer<alljoyn_permissionconfigurationlistener_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_permissionconfigurationlistener} 
     */
    static alljoyn_permissionconfigurationlistener_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_permissionconfigurationlistener_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_permissionconfigurationlistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_permissionconfigurationlistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_permissionconfigurationlistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {Pointer<alljoyn_sessionlistener_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_sessionlistener} 
     */
    static alljoyn_sessionlistener_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_sessionlistener_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_sessionlistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_sessionlistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_sessionlistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {Pointer<alljoyn_sessionportlistener_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_sessionportlistener} 
     */
    static alljoyn_sessionportlistener_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_sessionportlistener_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_sessionportlistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_sessionportlistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_sessionportlistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {Pointer<alljoyn_aboutlistener_callback>} callback 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_aboutlistener} 
     */
    static alljoyn_aboutlistener_create(callback, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutlistener_create", "ptr", callback, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutlistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_aboutlistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_aboutlistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {PSTR} applicationName 
     * @param {Integer} allowRemoteMessages 
     * @returns {alljoyn_busattachment} 
     */
    static alljoyn_busattachment_create(applicationName, allowRemoteMessages) {
        applicationName := applicationName is String ? StrPtr(applicationName) : applicationName

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_create", "ptr", applicationName, "int", allowRemoteMessages, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} applicationName 
     * @param {Integer} allowRemoteMessages 
     * @param {Integer} concurrency 
     * @returns {alljoyn_busattachment} 
     */
    static alljoyn_busattachment_create_concurrency(applicationName, allowRemoteMessages, concurrency) {
        applicationName := applicationName is String ? StrPtr(applicationName) : applicationName

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_create_concurrency", "ptr", applicationName, "int", allowRemoteMessages, "uint", concurrency, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busattachment_destroy(bus) {
        DllCall("MSAJApi.dll\alljoyn_busattachment_destroy", "ptr", bus)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_start(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_start", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_stop(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_stop", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_join(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_join", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_getconcurrency(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getconcurrency", "ptr", bus, "uint")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {PSTR} 
     */
    static alljoyn_busattachment_getconnectspec(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getconnectspec", "ptr", bus, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busattachment_enableconcurrentcallbacks(bus) {
        DllCall("MSAJApi.dll\alljoyn_busattachment_enableconcurrentcallbacks", "ptr", bus)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @param {Pointer<alljoyn_interfacedescription>} iface 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_createinterface(bus, name, iface) {
        name := name is String ? StrPtr(name) : name

        ifaceMarshal := iface is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_createinterface", "ptr", bus, "ptr", name, ifaceMarshal, iface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @param {Pointer<alljoyn_interfacedescription>} iface 
     * @param {Integer} secPolicy 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_createinterface_secure(bus, name, iface, secPolicy) {
        name := name is String ? StrPtr(name) : name

        ifaceMarshal := iface is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_createinterface_secure", "ptr", bus, "ptr", name, ifaceMarshal, iface, "int", secPolicy, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} connectSpec 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_connect(bus, connectSpec) {
        connectSpec := connectSpec is String ? StrPtr(connectSpec) : connectSpec

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_connect", "ptr", bus, "ptr", connectSpec, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_buslistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busattachment_registerbuslistener(bus, listener) {
        DllCall("MSAJApi.dll\alljoyn_busattachment_registerbuslistener", "ptr", bus, "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_buslistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busattachment_unregisterbuslistener(bus, listener) {
        DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterbuslistener", "ptr", bus, "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} namePrefix 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_findadvertisedname(bus, namePrefix) {
        namePrefix := namePrefix is String ? StrPtr(namePrefix) : namePrefix

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_findadvertisedname", "ptr", bus, "ptr", namePrefix, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} namePrefix 
     * @param {Integer} transports 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_findadvertisednamebytransport(bus, namePrefix, transports) {
        namePrefix := namePrefix is String ? StrPtr(namePrefix) : namePrefix

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_findadvertisednamebytransport", "ptr", bus, "ptr", namePrefix, "ushort", transports, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} namePrefix 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_cancelfindadvertisedname(bus, namePrefix) {
        namePrefix := namePrefix is String ? StrPtr(namePrefix) : namePrefix

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_cancelfindadvertisedname", "ptr", bus, "ptr", namePrefix, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} namePrefix 
     * @param {Integer} transports 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_cancelfindadvertisednamebytransport(bus, namePrefix, transports) {
        namePrefix := namePrefix is String ? StrPtr(namePrefix) : namePrefix

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_cancelfindadvertisednamebytransport", "ptr", bus, "ptr", namePrefix, "ushort", transports, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @param {Integer} transports 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_advertisename(bus, name, transports) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_advertisename", "ptr", bus, "ptr", name, "ushort", transports, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @param {Integer} transports 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_canceladvertisename(bus, name, transports) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_canceladvertisename", "ptr", bus, "ptr", name, "ushort", transports, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @returns {alljoyn_interfacedescription} 
     */
    static alljoyn_busattachment_getinterface(bus, name) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getinterface", "ptr", bus, "ptr", name, "ptr")
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
     * @returns {Integer} 
     */
    static alljoyn_busattachment_joinsession(bus, sessionHost, sessionPort, listener, sessionId, opts) {
        sessionHost := sessionHost is String ? StrPtr(sessionHost) : sessionHost

        sessionIdMarshal := sessionId is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_joinsession", "ptr", bus, "ptr", sessionHost, "ushort", sessionPort, "ptr", listener, sessionIdMarshal, sessionId, "ptr", opts, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_busattachment_joinsessionasync(bus, sessionHost, sessionPort, listener, opts, callback, _context) {
        sessionHost := sessionHost is String ? StrPtr(sessionHost) : sessionHost

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_joinsessionasync", "ptr", bus, "ptr", sessionHost, "ushort", sessionPort, "ptr", listener, "ptr", opts, "ptr", callback, _contextMarshal, _context, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_busobject} obj 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_registerbusobject(bus, obj) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_registerbusobject", "ptr", bus, "ptr", obj, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_busobject} obj 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_registerbusobject_secure(bus, obj) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_registerbusobject_secure", "ptr", bus, "ptr", obj, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_busobject} _object 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busattachment_unregisterbusobject(bus, _object) {
        DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterbusobject", "ptr", bus, "ptr", _object)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} requestedName 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_requestname(bus, requestedName, flags) {
        requestedName := requestedName is String ? StrPtr(requestedName) : requestedName

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_requestname", "ptr", bus, "ptr", requestedName, "uint", flags, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_releasename(bus, name) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_releasename", "ptr", bus, "ptr", name, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<Integer>} sessionPort 
     * @param {alljoyn_sessionopts} opts 
     * @param {alljoyn_sessionportlistener} listener 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_bindsessionport(bus, sessionPort, opts, listener) {
        sessionPortMarshal := sessionPort is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_bindsessionport", "ptr", bus, sessionPortMarshal, sessionPort, "ptr", opts, "ptr", listener, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Integer} sessionPort 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_unbindsessionport(bus, sessionPort) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_unbindsessionport", "ptr", bus, "ushort", sessionPort, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} authMechanisms 
     * @param {alljoyn_authlistener} listener 
     * @param {PSTR} keyStoreFileName 
     * @param {Integer} isShared 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_enablepeersecurity(bus, authMechanisms, listener, keyStoreFileName, isShared) {
        authMechanisms := authMechanisms is String ? StrPtr(authMechanisms) : authMechanisms
        keyStoreFileName := keyStoreFileName is String ? StrPtr(keyStoreFileName) : keyStoreFileName

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_enablepeersecurity", "ptr", bus, "ptr", authMechanisms, "ptr", listener, "ptr", keyStoreFileName, "int", isShared, "int")
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
     * @returns {Integer} 
     */
    static alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener(bus, authMechanisms, authListener, keyStoreFileName, isShared, permissionConfigurationListener) {
        authMechanisms := authMechanisms is String ? StrPtr(authMechanisms) : authMechanisms
        keyStoreFileName := keyStoreFileName is String ? StrPtr(keyStoreFileName) : keyStoreFileName

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener", "ptr", bus, "ptr", authMechanisms, "ptr", authListener, "ptr", keyStoreFileName, "int", isShared, "ptr", permissionConfigurationListener, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_ispeersecurityenabled(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_ispeersecurityenabled", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} xml 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_createinterfacesfromxml(bus, xml) {
        xml := xml is String ? StrPtr(xml) : xml

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_createinterfacesfromxml", "ptr", bus, "ptr", xml, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<alljoyn_interfacedescription>} ifaces 
     * @param {Pointer} numIfaces 
     * @returns {Pointer} 
     */
    static alljoyn_busattachment_getinterfaces(bus, ifaces, numIfaces) {
        ifacesMarshal := ifaces is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getinterfaces", "ptr", bus, ifacesMarshal, ifaces, "ptr", numIfaces, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_interfacedescription} iface 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_deleteinterface(bus, iface) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_deleteinterface", "ptr", bus, "ptr", iface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_isstarted(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_isstarted", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_isstopping(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_isstopping", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_isconnected(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_isconnected", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} unused 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_disconnect(bus, unused) {
        unused := unused is String ? StrPtr(unused) : unused

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_disconnect", "ptr", bus, "ptr", unused, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {alljoyn_proxybusobject} 
     */
    static alljoyn_busattachment_getdbusproxyobj(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getdbusproxyobj", "ptr", bus, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {alljoyn_proxybusobject} 
     */
    static alljoyn_busattachment_getalljoynproxyobj(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getalljoynproxyobj", "ptr", bus, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {alljoyn_proxybusobject} 
     */
    static alljoyn_busattachment_getalljoyndebugobj(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getalljoyndebugobj", "ptr", bus, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {PSTR} 
     */
    static alljoyn_busattachment_getuniquename(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getuniquename", "ptr", bus, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {PSTR} 
     */
    static alljoyn_busattachment_getglobalguidstring(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getglobalguidstring", "ptr", bus, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<alljoyn_messagereceiver_signalhandler_ptr>} signal_handler 
     * @param {alljoyn_interfacedescription_member} member 
     * @param {PSTR} srcPath 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_registersignalhandler(bus, signal_handler, member, srcPath) {
        srcPath := srcPath is String ? StrPtr(srcPath) : srcPath

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_registersignalhandler", "ptr", bus, "ptr", signal_handler, "ptr", member, "ptr", srcPath, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<alljoyn_messagereceiver_signalhandler_ptr>} signal_handler 
     * @param {alljoyn_interfacedescription_member} member 
     * @param {PSTR} matchRule 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_registersignalhandlerwithrule(bus, signal_handler, member, matchRule) {
        matchRule := matchRule is String ? StrPtr(matchRule) : matchRule

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_registersignalhandlerwithrule", "ptr", bus, "ptr", signal_handler, "ptr", member, "ptr", matchRule, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<alljoyn_messagereceiver_signalhandler_ptr>} signal_handler 
     * @param {alljoyn_interfacedescription_member} member 
     * @param {PSTR} srcPath 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_unregistersignalhandler(bus, signal_handler, member, srcPath) {
        srcPath := srcPath is String ? StrPtr(srcPath) : srcPath

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_unregistersignalhandler", "ptr", bus, "ptr", signal_handler, "ptr", member, "ptr", srcPath, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<alljoyn_messagereceiver_signalhandler_ptr>} signal_handler 
     * @param {alljoyn_interfacedescription_member} member 
     * @param {PSTR} matchRule 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_unregistersignalhandlerwithrule(bus, signal_handler, member, matchRule) {
        matchRule := matchRule is String ? StrPtr(matchRule) : matchRule

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_unregistersignalhandlerwithrule", "ptr", bus, "ptr", signal_handler, "ptr", member, "ptr", matchRule, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_unregisterallhandlers(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterallhandlers", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_keystorelistener} listener 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_registerkeystorelistener(bus, listener) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_registerkeystorelistener", "ptr", bus, "ptr", listener, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_reloadkeystore(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_reloadkeystore", "ptr", bus, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busattachment_clearkeystore(bus) {
        DllCall("MSAJApi.dll\alljoyn_busattachment_clearkeystore", "ptr", bus)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} guid 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_clearkeys(bus, guid) {
        guid := guid is String ? StrPtr(guid) : guid

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_clearkeys", "ptr", bus, "ptr", guid, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} guid 
     * @param {Integer} timeout 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_setkeyexpiration(bus, guid, timeout) {
        guid := guid is String ? StrPtr(guid) : guid

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_setkeyexpiration", "ptr", bus, "ptr", guid, "uint", timeout, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} guid 
     * @param {Pointer<Integer>} timeout 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_getkeyexpiration(bus, guid, timeout) {
        guid := guid is String ? StrPtr(guid) : guid

        timeoutMarshal := timeout is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getkeyexpiration", "ptr", bus, "ptr", guid, timeoutMarshal, timeout, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} authMechanism 
     * @param {PSTR} userName 
     * @param {PSTR} password 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_addlogonentry(bus, authMechanism, userName, password) {
        authMechanism := authMechanism is String ? StrPtr(authMechanism) : authMechanism
        userName := userName is String ? StrPtr(userName) : userName
        password := password is String ? StrPtr(password) : password

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_addlogonentry", "ptr", bus, "ptr", authMechanism, "ptr", userName, "ptr", password, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} rule 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_addmatch(bus, rule) {
        rule := rule is String ? StrPtr(rule) : rule

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_addmatch", "ptr", bus, "ptr", rule, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} rule 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_removematch(bus, rule) {
        rule := rule is String ? StrPtr(rule) : rule

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_removematch", "ptr", bus, "ptr", rule, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Integer} sessionId 
     * @param {alljoyn_sessionlistener} listener 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_setsessionlistener(bus, sessionId, listener) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_setsessionlistener", "ptr", bus, "uint", sessionId, "ptr", listener, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Integer} sessionId 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_leavesession(bus, sessionId) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_leavesession", "ptr", bus, "uint", sessionId, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @param {Integer} forceAuth 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_secureconnection(bus, name, forceAuth) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_secureconnection", "ptr", bus, "ptr", name, "int", forceAuth, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @param {Integer} forceAuth 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_secureconnectionasync(bus, name, forceAuth) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_secureconnectionasync", "ptr", bus, "ptr", name, "int", forceAuth, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Integer} sessionId 
     * @param {PSTR} memberName 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_removesessionmember(bus, sessionId, memberName) {
        memberName := memberName is String ? StrPtr(memberName) : memberName

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_removesessionmember", "ptr", bus, "uint", sessionId, "ptr", memberName, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Integer} sessionid 
     * @param {Pointer<Integer>} linkTimeout 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_setlinktimeout(bus, sessionid, linkTimeout) {
        linkTimeoutMarshal := linkTimeout is VarRef ? "uint*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_setlinktimeout", "ptr", bus, "uint", sessionid, linkTimeoutMarshal, linkTimeout, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Integer} sessionid 
     * @param {Integer} linkTimeout 
     * @param {Pointer<alljoyn_busattachment_setlinktimeoutcb_ptr>} callback 
     * @param {Pointer<Void>} _context 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_setlinktimeoutasync(bus, sessionid, linkTimeout, callback, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_setlinktimeoutasync", "ptr", bus, "uint", sessionid, "uint", linkTimeout, "ptr", callback, _contextMarshal, _context, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @param {Pointer<Integer>} hasOwner 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_namehasowner(bus, name, hasOwner) {
        name := name is String ? StrPtr(name) : name

        hasOwnerMarshal := hasOwner is VarRef ? "int*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_namehasowner", "ptr", bus, "ptr", name, hasOwnerMarshal, hasOwner, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @param {PSTR} guid 
     * @param {Pointer<Pointer>} guidSz 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_getpeerguid(bus, name, guid, guidSz) {
        name := name is String ? StrPtr(name) : name
        guid := guid is String ? StrPtr(guid) : guid

        guidSzMarshal := guidSz is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getpeerguid", "ptr", bus, "ptr", name, "ptr", guid, guidSzMarshal, guidSz, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} module 
     * @param {Integer} level 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_setdaemondebug(bus, module, level) {
        module := module is String ? StrPtr(module) : module

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_setdaemondebug", "ptr", bus, "ptr", module, "uint", level, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_gettimestamp() {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_gettimestamp", "uint")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} name 
     * @param {Integer} timeout 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_ping(bus, name, timeout) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_ping", "ptr", bus, "ptr", name, "uint", timeout, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_aboutlistener} aboutListener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busattachment_registeraboutlistener(bus, aboutListener) {
        DllCall("MSAJApi.dll\alljoyn_busattachment_registeraboutlistener", "ptr", bus, "ptr", aboutListener)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_aboutlistener} aboutListener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busattachment_unregisteraboutlistener(bus, aboutListener) {
        DllCall("MSAJApi.dll\alljoyn_busattachment_unregisteraboutlistener", "ptr", bus, "ptr", aboutListener)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_busattachment_unregisterallaboutlisteners(bus) {
        DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterallaboutlisteners", "ptr", bus)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<Pointer<Integer>>} implementsInterfaces 
     * @param {Pointer} numberInterfaces 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_whoimplements_interfaces(bus, implementsInterfaces, numberInterfaces) {
        implementsInterfacesMarshal := implementsInterfaces is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_whoimplements_interfaces", "ptr", bus, implementsInterfacesMarshal, implementsInterfaces, "ptr", numberInterfaces, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} implementsInterface 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_whoimplements_interface(bus, implementsInterface) {
        implementsInterface := implementsInterface is String ? StrPtr(implementsInterface) : implementsInterface

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_whoimplements_interface", "ptr", bus, "ptr", implementsInterface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<Pointer<Integer>>} implementsInterfaces 
     * @param {Pointer} numberInterfaces 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_cancelwhoimplements_interfaces(bus, implementsInterfaces, numberInterfaces) {
        implementsInterfacesMarshal := implementsInterfaces is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_cancelwhoimplements_interfaces", "ptr", bus, implementsInterfacesMarshal, implementsInterfaces, "ptr", numberInterfaces, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} implementsInterface 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_cancelwhoimplements_interface(bus, implementsInterface) {
        implementsInterface := implementsInterface is String ? StrPtr(implementsInterface) : implementsInterface

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_cancelwhoimplements_interface", "ptr", bus, "ptr", implementsInterface, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {alljoyn_permissionconfigurator} 
     */
    static alljoyn_busattachment_getpermissionconfigurator(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_getpermissionconfigurator", "ptr", bus, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_applicationstatelistener} listener 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_registerapplicationstatelistener(bus, listener) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_registerapplicationstatelistener", "ptr", bus, "ptr", listener, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_applicationstatelistener} listener 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_unregisterapplicationstatelistener(bus, listener) {
        result := DllCall("MSAJApi.dll\alljoyn_busattachment_unregisterapplicationstatelistener", "ptr", bus, "ptr", listener, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} applicationName 
     * @returns {Integer} 
     */
    static alljoyn_busattachment_deletedefaultkeystore(applicationName) {
        applicationName := applicationName is String ? StrPtr(applicationName) : applicationName

        result := DllCall("MSAJApi.dll\alljoyn_busattachment_deletedefaultkeystore", "ptr", applicationName, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {alljoyn_abouticon} icon 
     * @returns {alljoyn_abouticonobj} 
     */
    static alljoyn_abouticonobj_create(bus, icon) {
        result := DllCall("MSAJApi.dll\alljoyn_abouticonobj_create", "ptr", bus, "ptr", icon, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_abouticonobj} icon 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_abouticonobj_destroy(icon) {
        DllCall("MSAJApi.dll\alljoyn_abouticonobj_destroy", "ptr", icon)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} busName 
     * @param {Integer} sessionId 
     * @returns {alljoyn_abouticonproxy} 
     */
    static alljoyn_abouticonproxy_create(bus, busName, sessionId) {
        busName := busName is String ? StrPtr(busName) : busName

        result := DllCall("MSAJApi.dll\alljoyn_abouticonproxy_create", "ptr", bus, "ptr", busName, "uint", sessionId, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_abouticonproxy} proxy 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_abouticonproxy_destroy(proxy) {
        DllCall("MSAJApi.dll\alljoyn_abouticonproxy_destroy", "ptr", proxy)
    }

    /**
     * 
     * @param {alljoyn_abouticonproxy} proxy 
     * @param {alljoyn_abouticon} icon 
     * @returns {Integer} 
     */
    static alljoyn_abouticonproxy_geticon(proxy, icon) {
        result := DllCall("MSAJApi.dll\alljoyn_abouticonproxy_geticon", "ptr", proxy, "ptr", icon, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_abouticonproxy} proxy 
     * @param {Pointer<Integer>} _version 
     * @returns {Integer} 
     */
    static alljoyn_abouticonproxy_getversion(proxy, _version) {
        _versionMarshal := _version is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_abouticonproxy_getversion", "ptr", proxy, _versionMarshal, _version, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<alljoyn_aboutdatalistener_callbacks>} callbacks 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_aboutdatalistener} 
     */
    static alljoyn_aboutdatalistener_create(callbacks, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutdatalistener_create", "ptr", callbacks, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutdatalistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_aboutdatalistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_aboutdatalistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Integer} isAnnounced 
     * @returns {alljoyn_aboutobj} 
     */
    static alljoyn_aboutobj_create(bus, isAnnounced) {
        result := DllCall("MSAJApi.dll\alljoyn_aboutobj_create", "ptr", bus, "int", isAnnounced, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutobj} obj 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_aboutobj_destroy(obj) {
        DllCall("MSAJApi.dll\alljoyn_aboutobj_destroy", "ptr", obj)
    }

    /**
     * 
     * @param {alljoyn_aboutobj} obj 
     * @param {Integer} sessionPort 
     * @param {alljoyn_aboutdata} aboutData 
     * @returns {Integer} 
     */
    static alljoyn_aboutobj_announce(obj, sessionPort, aboutData) {
        result := DllCall("MSAJApi.dll\alljoyn_aboutobj_announce", "ptr", obj, "ushort", sessionPort, "ptr", aboutData, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutobj} obj 
     * @param {Integer} sessionPort 
     * @param {alljoyn_aboutdatalistener} aboutListener 
     * @returns {Integer} 
     */
    static alljoyn_aboutobj_announce_using_datalistener(obj, sessionPort, aboutListener) {
        result := DllCall("MSAJApi.dll\alljoyn_aboutobj_announce_using_datalistener", "ptr", obj, "ushort", sessionPort, "ptr", aboutListener, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutobj} obj 
     * @returns {Integer} 
     */
    static alljoyn_aboutobj_unannounce(obj) {
        result := DllCall("MSAJApi.dll\alljoyn_aboutobj_unannounce", "ptr", obj, "int")
        return result
    }

    /**
     * 
     * @returns {alljoyn_aboutobjectdescription} 
     */
    static alljoyn_aboutobjectdescription_create() {
        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_create", "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_msgarg} arg 
     * @returns {alljoyn_aboutobjectdescription} 
     */
    static alljoyn_aboutobjectdescription_create_full(arg) {
        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_create_full", "ptr", arg, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutobjectdescription} description 
     * @param {alljoyn_msgarg} arg 
     * @returns {Integer} 
     */
    static alljoyn_aboutobjectdescription_createfrommsgarg(description, arg) {
        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_createfrommsgarg", "ptr", description, "ptr", arg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutobjectdescription} description 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_aboutobjectdescription_destroy(description) {
        DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_destroy", "ptr", description)
    }

    /**
     * 
     * @param {alljoyn_aboutobjectdescription} description 
     * @param {Pointer<Pointer<Integer>>} paths 
     * @param {Pointer} numPaths 
     * @returns {Pointer} 
     */
    static alljoyn_aboutobjectdescription_getpaths(description, paths, numPaths) {
        pathsMarshal := paths is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_getpaths", "ptr", description, pathsMarshal, paths, "ptr", numPaths, "ptr")
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
    static alljoyn_aboutobjectdescription_getinterfaces(description, _path, interfaces, numInterfaces) {
        _path := _path is String ? StrPtr(_path) : _path

        interfacesMarshal := interfaces is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_getinterfaces", "ptr", description, "ptr", _path, interfacesMarshal, interfaces, "ptr", numInterfaces, "ptr")
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
    static alljoyn_aboutobjectdescription_getinterfacepaths(description, interfaceName, paths, numPaths) {
        interfaceName := interfaceName is String ? StrPtr(interfaceName) : interfaceName

        pathsMarshal := paths is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_getinterfacepaths", "ptr", description, "ptr", interfaceName, pathsMarshal, paths, "ptr", numPaths, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutobjectdescription} description 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_aboutobjectdescription_clear(description) {
        DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_clear", "ptr", description)
    }

    /**
     * 
     * @param {alljoyn_aboutobjectdescription} description 
     * @param {PSTR} _path 
     * @returns {Integer} 
     */
    static alljoyn_aboutobjectdescription_haspath(description, _path) {
        _path := _path is String ? StrPtr(_path) : _path

        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_haspath", "ptr", description, "ptr", _path, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutobjectdescription} description 
     * @param {PSTR} interfaceName 
     * @returns {Integer} 
     */
    static alljoyn_aboutobjectdescription_hasinterface(description, interfaceName) {
        interfaceName := interfaceName is String ? StrPtr(interfaceName) : interfaceName

        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_hasinterface", "ptr", description, "ptr", interfaceName, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutobjectdescription} description 
     * @param {PSTR} _path 
     * @param {PSTR} interfaceName 
     * @returns {Integer} 
     */
    static alljoyn_aboutobjectdescription_hasinterfaceatpath(description, _path, interfaceName) {
        _path := _path is String ? StrPtr(_path) : _path
        interfaceName := interfaceName is String ? StrPtr(interfaceName) : interfaceName

        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_hasinterfaceatpath", "ptr", description, "ptr", _path, "ptr", interfaceName, "char")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutobjectdescription} description 
     * @param {alljoyn_msgarg} msgArg 
     * @returns {Integer} 
     */
    static alljoyn_aboutobjectdescription_getmsgarg(description, msgArg) {
        result := DllCall("MSAJApi.dll\alljoyn_aboutobjectdescription_getmsgarg", "ptr", description, "ptr", msgArg, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {PSTR} busName 
     * @param {Integer} sessionId 
     * @returns {alljoyn_aboutproxy} 
     */
    static alljoyn_aboutproxy_create(bus, busName, sessionId) {
        busName := busName is String ? StrPtr(busName) : busName

        result := DllCall("MSAJApi.dll\alljoyn_aboutproxy_create", "ptr", bus, "ptr", busName, "uint", sessionId, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutproxy} proxy 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_aboutproxy_destroy(proxy) {
        DllCall("MSAJApi.dll\alljoyn_aboutproxy_destroy", "ptr", proxy)
    }

    /**
     * 
     * @param {alljoyn_aboutproxy} proxy 
     * @param {alljoyn_msgarg} objectDesc 
     * @returns {Integer} 
     */
    static alljoyn_aboutproxy_getobjectdescription(proxy, objectDesc) {
        result := DllCall("MSAJApi.dll\alljoyn_aboutproxy_getobjectdescription", "ptr", proxy, "ptr", objectDesc, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutproxy} proxy 
     * @param {PSTR} language 
     * @param {alljoyn_msgarg} data 
     * @returns {Integer} 
     */
    static alljoyn_aboutproxy_getaboutdata(proxy, language, data) {
        language := language is String ? StrPtr(language) : language

        result := DllCall("MSAJApi.dll\alljoyn_aboutproxy_getaboutdata", "ptr", proxy, "ptr", language, "ptr", data, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_aboutproxy} proxy 
     * @param {Pointer<Integer>} _version 
     * @returns {Integer} 
     */
    static alljoyn_aboutproxy_getversion(proxy, _version) {
        _versionMarshal := _version is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_aboutproxy_getversion", "ptr", proxy, _versionMarshal, _version, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<alljoyn_pinglistener_callback>} callback 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_pinglistener} 
     */
    static alljoyn_pinglistener_create(callback, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_pinglistener_create", "ptr", callback, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_pinglistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_pinglistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_pinglistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @returns {alljoyn_autopinger} 
     */
    static alljoyn_autopinger_create(bus) {
        result := DllCall("MSAJApi.dll\alljoyn_autopinger_create", "ptr", bus, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_autopinger} autopinger 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_autopinger_destroy(autopinger) {
        DllCall("MSAJApi.dll\alljoyn_autopinger_destroy", "ptr", autopinger)
    }

    /**
     * 
     * @param {alljoyn_autopinger} autopinger 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_autopinger_pause(autopinger) {
        DllCall("MSAJApi.dll\alljoyn_autopinger_pause", "ptr", autopinger)
    }

    /**
     * 
     * @param {alljoyn_autopinger} autopinger 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_autopinger_resume(autopinger) {
        DllCall("MSAJApi.dll\alljoyn_autopinger_resume", "ptr", autopinger)
    }

    /**
     * 
     * @param {alljoyn_autopinger} autopinger 
     * @param {PSTR} group 
     * @param {alljoyn_pinglistener} listener 
     * @param {Integer} pinginterval 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_autopinger_addpinggroup(autopinger, group, listener, pinginterval) {
        group := group is String ? StrPtr(group) : group

        DllCall("MSAJApi.dll\alljoyn_autopinger_addpinggroup", "ptr", autopinger, "ptr", group, "ptr", listener, "uint", pinginterval)
    }

    /**
     * 
     * @param {alljoyn_autopinger} autopinger 
     * @param {PSTR} group 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_autopinger_removepinggroup(autopinger, group) {
        group := group is String ? StrPtr(group) : group

        DllCall("MSAJApi.dll\alljoyn_autopinger_removepinggroup", "ptr", autopinger, "ptr", group)
    }

    /**
     * 
     * @param {alljoyn_autopinger} autopinger 
     * @param {PSTR} group 
     * @param {Integer} pinginterval 
     * @returns {Integer} 
     */
    static alljoyn_autopinger_setpinginterval(autopinger, group, pinginterval) {
        group := group is String ? StrPtr(group) : group

        result := DllCall("MSAJApi.dll\alljoyn_autopinger_setpinginterval", "ptr", autopinger, "ptr", group, "uint", pinginterval, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_autopinger} autopinger 
     * @param {PSTR} group 
     * @param {PSTR} destination 
     * @returns {Integer} 
     */
    static alljoyn_autopinger_adddestination(autopinger, group, destination) {
        group := group is String ? StrPtr(group) : group
        destination := destination is String ? StrPtr(destination) : destination

        result := DllCall("MSAJApi.dll\alljoyn_autopinger_adddestination", "ptr", autopinger, "ptr", group, "ptr", destination, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_autopinger} autopinger 
     * @param {PSTR} group 
     * @param {PSTR} destination 
     * @param {Integer} removeall 
     * @returns {Integer} 
     */
    static alljoyn_autopinger_removedestination(autopinger, group, destination, removeall) {
        group := group is String ? StrPtr(group) : group
        destination := destination is String ? StrPtr(destination) : destination

        result := DllCall("MSAJApi.dll\alljoyn_autopinger_removedestination", "ptr", autopinger, "ptr", group, "ptr", destination, "int", removeall, "int")
        return result
    }

    /**
     * 
     * @returns {PSTR} 
     */
    static alljoyn_getversion() {
        result := DllCall("MSAJApi.dll\alljoyn_getversion", "ptr")
        return result
    }

    /**
     * 
     * @returns {PSTR} 
     */
    static alljoyn_getbuildinfo() {
        result := DllCall("MSAJApi.dll\alljoyn_getbuildinfo", "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static alljoyn_getnumericversion() {
        result := DllCall("MSAJApi.dll\alljoyn_getnumericversion", "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static alljoyn_init() {
        result := DllCall("MSAJApi.dll\alljoyn_init", "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static alljoyn_shutdown() {
        result := DllCall("MSAJApi.dll\alljoyn_shutdown", "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static alljoyn_routerinit() {
        result := DllCall("MSAJApi.dll\alljoyn_routerinit", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} configXml 
     * @returns {Integer} 
     */
    static alljoyn_routerinitwithconfig(configXml) {
        configXmlMarshal := configXml is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_routerinitwithconfig", configXmlMarshal, configXml, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static alljoyn_routershutdown() {
        result := DllCall("MSAJApi.dll\alljoyn_routershutdown", "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} proxy 
     * @returns {alljoyn_proxybusobject_ref} 
     */
    static alljoyn_proxybusobject_ref_create(proxy) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_ref_create", "ptr", proxy, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject_ref} ref 
     * @returns {alljoyn_proxybusobject} 
     */
    static alljoyn_proxybusobject_ref_get(ref) {
        result := DllCall("MSAJApi.dll\alljoyn_proxybusobject_ref_get", "ptr", ref, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_proxybusobject_ref} ref 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_proxybusobject_ref_incref(ref) {
        DllCall("MSAJApi.dll\alljoyn_proxybusobject_ref_incref", "ptr", ref)
    }

    /**
     * 
     * @param {alljoyn_proxybusobject_ref} ref 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_proxybusobject_ref_decref(ref) {
        DllCall("MSAJApi.dll\alljoyn_proxybusobject_ref_decref", "ptr", ref)
    }

    /**
     * 
     * @param {Pointer<alljoyn_observerlistener_callback>} callback 
     * @param {Pointer<Void>} _context 
     * @returns {alljoyn_observerlistener} 
     */
    static alljoyn_observerlistener_create(callback, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_observerlistener_create", "ptr", callback, _contextMarshal, _context, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_observerlistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_observerlistener_destroy(listener) {
        DllCall("MSAJApi.dll\alljoyn_observerlistener_destroy", "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<Pointer<Integer>>} mandatoryInterfaces 
     * @param {Pointer} numMandatoryInterfaces 
     * @returns {alljoyn_observer} 
     */
    static alljoyn_observer_create(bus, mandatoryInterfaces, numMandatoryInterfaces) {
        mandatoryInterfacesMarshal := mandatoryInterfaces is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_observer_create", "ptr", bus, mandatoryInterfacesMarshal, mandatoryInterfaces, "ptr", numMandatoryInterfaces, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_observer} observer 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_observer_destroy(observer) {
        DllCall("MSAJApi.dll\alljoyn_observer_destroy", "ptr", observer)
    }

    /**
     * 
     * @param {alljoyn_observer} observer 
     * @param {alljoyn_observerlistener} listener 
     * @param {Integer} triggerOnExisting 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_observer_registerlistener(observer, listener, triggerOnExisting) {
        DllCall("MSAJApi.dll\alljoyn_observer_registerlistener", "ptr", observer, "ptr", listener, "int", triggerOnExisting)
    }

    /**
     * 
     * @param {alljoyn_observer} observer 
     * @param {alljoyn_observerlistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_observer_unregisterlistener(observer, listener) {
        DllCall("MSAJApi.dll\alljoyn_observer_unregisterlistener", "ptr", observer, "ptr", listener)
    }

    /**
     * 
     * @param {alljoyn_observer} observer 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_observer_unregisteralllisteners(observer) {
        DllCall("MSAJApi.dll\alljoyn_observer_unregisteralllisteners", "ptr", observer)
    }

    /**
     * 
     * @param {alljoyn_observer} observer 
     * @param {PSTR} uniqueBusName 
     * @param {PSTR} objectPath 
     * @returns {alljoyn_proxybusobject_ref} 
     */
    static alljoyn_observer_get(observer, uniqueBusName, objectPath) {
        uniqueBusName := uniqueBusName is String ? StrPtr(uniqueBusName) : uniqueBusName
        objectPath := objectPath is String ? StrPtr(objectPath) : objectPath

        result := DllCall("MSAJApi.dll\alljoyn_observer_get", "ptr", observer, "ptr", uniqueBusName, "ptr", objectPath, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_observer} observer 
     * @returns {alljoyn_proxybusobject_ref} 
     */
    static alljoyn_observer_getfirst(observer) {
        result := DllCall("MSAJApi.dll\alljoyn_observer_getfirst", "ptr", observer, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_observer} observer 
     * @param {alljoyn_proxybusobject_ref} proxyref 
     * @returns {alljoyn_proxybusobject_ref} 
     */
    static alljoyn_observer_getnext(observer, proxyref) {
        result := DllCall("MSAJApi.dll\alljoyn_observer_getnext", "ptr", observer, "ptr", proxyref, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} authMechanism 
     * @param {PSTR} password 
     * @returns {Integer} 
     */
    static alljoyn_passwordmanager_setcredentials(authMechanism, password) {
        authMechanism := authMechanism is String ? StrPtr(authMechanism) : authMechanism
        password := password is String ? StrPtr(password) : password

        result := DllCall("MSAJApi.dll\alljoyn_passwordmanager_setcredentials", "ptr", authMechanism, "ptr", password, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_getpermissionmanagementsessionport() {
        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getpermissionmanagementsessionport", "ushort")
        return result
    }

    /**
     * 
     * @param {alljoyn_busattachment} bus 
     * @param {Pointer<Integer>} appBusName 
     * @param {Integer} sessionId 
     * @returns {alljoyn_securityapplicationproxy} 
     */
    static alljoyn_securityapplicationproxy_create(bus, appBusName, sessionId) {
        appBusNameMarshal := appBusName is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_create", "ptr", bus, appBusNameMarshal, appBusName, "uint", sessionId, "ptr")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_securityapplicationproxy_destroy(proxy) {
        DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_destroy", "ptr", proxy)
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
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_claim(proxy, caKey, identityCertificateChain, groupId, groupSize, groupAuthority, manifestsXmls, manifestsCount) {
        caKeyMarshal := caKey is VarRef ? "char*" : "ptr"
        identityCertificateChainMarshal := identityCertificateChain is VarRef ? "char*" : "ptr"
        groupIdMarshal := groupId is VarRef ? "char*" : "ptr"
        groupAuthorityMarshal := groupAuthority is VarRef ? "char*" : "ptr"
        manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_claim", "ptr", proxy, caKeyMarshal, caKey, identityCertificateChainMarshal, identityCertificateChain, groupIdMarshal, groupId, "ptr", groupSize, groupAuthorityMarshal, groupAuthority, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Pointer<Integer>>} manifestTemplateXml 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_getmanifesttemplate(proxy, manifestTemplateXml) {
        manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getmanifesttemplate", "ptr", proxy, manifestTemplateXmlMarshal, manifestTemplateXml, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} manifestTemplateXml 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_securityapplicationproxy_manifesttemplate_destroy(manifestTemplateXml) {
        manifestTemplateXmlMarshal := manifestTemplateXml is VarRef ? "char*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_manifesttemplate_destroy", manifestTemplateXmlMarshal, manifestTemplateXml)
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Integer>} applicationState 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_getapplicationstate(proxy, applicationState) {
        applicationStateMarshal := applicationState is VarRef ? "int*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getapplicationstate", "ptr", proxy, applicationStateMarshal, applicationState, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Integer>} capabilities 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_getclaimcapabilities(proxy, capabilities) {
        capabilitiesMarshal := capabilities is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getclaimcapabilities", "ptr", proxy, capabilitiesMarshal, capabilities, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Integer>} additionalInfo 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo(proxy, additionalInfo) {
        additionalInfoMarshal := additionalInfo is VarRef ? "ushort*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo", "ptr", proxy, additionalInfoMarshal, additionalInfo, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Pointer<Integer>>} policyXml 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_getpolicy(proxy, policyXml) {
        policyXmlMarshal := policyXml is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getpolicy", "ptr", proxy, policyXmlMarshal, policyXml, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Pointer<Integer>>} policyXml 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_getdefaultpolicy(proxy, policyXml) {
        policyXmlMarshal := policyXml is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_getdefaultpolicy", "ptr", proxy, policyXmlMarshal, policyXml, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} policyXml 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_securityapplicationproxy_policy_destroy(policyXml) {
        policyXmlMarshal := policyXml is VarRef ? "char*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_policy_destroy", policyXmlMarshal, policyXml)
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Integer>} policyXml 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_updatepolicy(proxy, policyXml) {
        policyXmlMarshal := policyXml is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_updatepolicy", "ptr", proxy, policyXmlMarshal, policyXml, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Integer>} identityCertificateChain 
     * @param {Pointer<Pointer<Integer>>} manifestsXmls 
     * @param {Pointer} manifestsCount 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_updateidentity(proxy, identityCertificateChain, manifestsXmls, manifestsCount) {
        identityCertificateChainMarshal := identityCertificateChain is VarRef ? "char*" : "ptr"
        manifestsXmlsMarshal := manifestsXmls is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_updateidentity", "ptr", proxy, identityCertificateChainMarshal, identityCertificateChain, manifestsXmlsMarshal, manifestsXmls, "ptr", manifestsCount, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Integer>} membershipCertificateChain 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_installmembership(proxy, membershipCertificateChain) {
        membershipCertificateChainMarshal := membershipCertificateChain is VarRef ? "char*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_installmembership", "ptr", proxy, membershipCertificateChainMarshal, membershipCertificateChain, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_reset(proxy) {
        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_reset", "ptr", proxy, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_resetpolicy(proxy) {
        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_resetpolicy", "ptr", proxy, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_startmanagement(proxy) {
        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_startmanagement", "ptr", proxy, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_endmanagement(proxy) {
        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_endmanagement", "ptr", proxy, "int")
        return result
    }

    /**
     * 
     * @param {alljoyn_securityapplicationproxy} proxy 
     * @param {Pointer<Pointer<Integer>>} eccPublicKey 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_geteccpublickey(proxy, eccPublicKey) {
        eccPublicKeyMarshal := eccPublicKey is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_geteccpublickey", "ptr", proxy, eccPublicKeyMarshal, eccPublicKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} eccPublicKey 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_securityapplicationproxy_eccpublickey_destroy(eccPublicKey) {
        eccPublicKeyMarshal := eccPublicKey is VarRef ? "char*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_eccpublickey_destroy", eccPublicKeyMarshal, eccPublicKey)
    }

    /**
     * 
     * @param {Pointer<Integer>} unsignedManifestXml 
     * @param {Pointer<Integer>} identityCertificatePem 
     * @param {Pointer<Integer>} signingPrivateKeyPem 
     * @param {Pointer<Pointer<Integer>>} signedManifestXml 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_signmanifest(unsignedManifestXml, identityCertificatePem, signingPrivateKeyPem, signedManifestXml) {
        unsignedManifestXmlMarshal := unsignedManifestXml is VarRef ? "char*" : "ptr"
        identityCertificatePemMarshal := identityCertificatePem is VarRef ? "char*" : "ptr"
        signingPrivateKeyPemMarshal := signingPrivateKeyPem is VarRef ? "char*" : "ptr"
        signedManifestXmlMarshal := signedManifestXml is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_signmanifest", unsignedManifestXmlMarshal, unsignedManifestXml, identityCertificatePemMarshal, identityCertificatePem, signingPrivateKeyPemMarshal, signingPrivateKeyPem, signedManifestXmlMarshal, signedManifestXml, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} signedManifestXml 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_securityapplicationproxy_manifest_destroy(signedManifestXml) {
        signedManifestXmlMarshal := signedManifestXml is VarRef ? "char*" : "ptr"

        DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_manifest_destroy", signedManifestXmlMarshal, signedManifestXml)
    }

    /**
     * 
     * @param {Pointer<Integer>} unsignedManifestXml 
     * @param {Pointer<Integer>} identityCertificatePem 
     * @param {Pointer<Pointer<Integer>>} digest 
     * @param {Pointer<Pointer>} digestSize 
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_computemanifestdigest(unsignedManifestXml, identityCertificatePem, digest, digestSize) {
        unsignedManifestXmlMarshal := unsignedManifestXml is VarRef ? "char*" : "ptr"
        identityCertificatePemMarshal := identityCertificatePem is VarRef ? "char*" : "ptr"
        digestMarshal := digest is VarRef ? "ptr*" : "ptr"
        digestSizeMarshal := digestSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_computemanifestdigest", unsignedManifestXmlMarshal, unsignedManifestXml, identityCertificatePemMarshal, identityCertificatePem, digestMarshal, digest, digestSizeMarshal, digestSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} digest 
     * @returns {String} Nothing - always returns an empty string
     */
    static alljoyn_securityapplicationproxy_digest_destroy(digest) {
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
     * @returns {Integer} 
     */
    static alljoyn_securityapplicationproxy_setmanifestsignature(unsignedManifestXml, identityCertificatePem, signature, signatureSize, signedManifestXml) {
        unsignedManifestXmlMarshal := unsignedManifestXml is VarRef ? "char*" : "ptr"
        identityCertificatePemMarshal := identityCertificatePem is VarRef ? "char*" : "ptr"
        signatureMarshal := signature is VarRef ? "char*" : "ptr"
        signedManifestXmlMarshal := signedManifestXml is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSAJApi.dll\alljoyn_securityapplicationproxy_setmanifestsignature", unsignedManifestXmlMarshal, unsignedManifestXml, identityCertificatePemMarshal, identityCertificatePem, signatureMarshal, signature, "ptr", signatureSize, signedManifestXmlMarshal, signedManifestXml, "int")
        return result
    }

;@endregion Methods
}
