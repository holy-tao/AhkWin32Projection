#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * The Microsoft WinSNMP implementation calls the SNMPAPI_CALLBACK function to notify a WinSNMP session that an SNMP message or asynchronous event is available.
 * @remarks
 * When the implementation is executing the retransmission policy for the WinSNMP application and a transmission time-out occurs, the implementation informs the session of the error. In this situation the value of the <i>wParam</i> parameter would be SNMPAPI_TL_TIMEOUT. For a list of other transport layer errors, see the reference pages for the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpregister">SnmpRegister</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpsendmsg">SnmpSendMsg</a>, and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> functions.
 * @see https://learn.microsoft.com/windows/win32/api/winsnmp/nc-winsnmp-snmpapi_callback
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SNMPAPI_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is SNMPAPI_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} hSession Handle to the WinSNMP session.
     * @param {HWND} _hWnd Handle to a window of the WinSNMP application to notify when an asynchronous request completes, or when trap notification occurs. This parameter does not have significance for the WinSNMP session, but the implementation always passes the value to the callback function.
     * @param {Integer} wMsg Specifies an unsigned integer that identifies the notification message to send to the WinSNMP application window. This parameter does not have significance for the WinSNMP session, but the implementation always passes the value to the callback function.
     * @param {WPARAM} _wParam Specifies an application-defined 32-bit value that identifies the type of notification. If this parameter is equal to zero, an SNMP message is available for the session. The application should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmprecvmsg">SnmpRecvMsg</a> function to retrieve the message. If this parameter is not equal to zero, it indicates an asynchronous event notification for the session. For additional information, see the following Remarks section.
     * @param {LPARAM} _lParam Specifies an application-defined 32-bit value that specifies the request identifier of the PDU being processed.
     * @param {Pointer<Void>} lpClientData If the <i>lpClientData</i> parameter was not <b>NULL</b> on the call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpcreatesession">SnmpCreateSession</a> function for this session, this parameter is a pointer to application-defined data.
     * @returns {Integer} The function must return SNMPAPI_SUCCESS to continue execution of the application. If the function returns any other value, the implementation responds as if the application called the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsnmp/nf-winsnmp-snmpclose">SnmpClose</a> function for the indicated session.
     */
    Call(hSession, _hWnd, wMsg, _wParam, _lParam, lpClientData) {
        lpClientDataMarshal := lpClientData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, hSession, HWND, _hWnd, UInt32, wMsg, WPARAM, _wParam, LPARAM, _lParam, lpClientDataMarshal, lpClientData, UInt32)
        return result
    }

    /**
     * A SNMPAPI_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SNMPAPI_CALLBACK {
        /**
         * Creates a SNMPAPI_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, HWND, UInt32, WPARAM, LPARAM, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, HWND, UInt32, WPARAM, LPARAM, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
