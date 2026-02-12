#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectInputJoyConfig8::OpenConfigKey method opens IDirectInputJoyConfig the registry key associated with a joystick configuration.
 * @see https://learn.microsoft.com/windows/win32/api//content/dinputd/nf-dinputd-idirectinputjoyconfig-openconfigkey
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class IDirectInputJoyConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputJoyConfig
     * @type {Guid}
     */
    static IID => Guid("{1de12ab1-c9f5-11cf-bfc7-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Acquire", "Unacquire", "SetCooperativeLevel", "SendNotify", "EnumTypes", "GetTypeInfo", "SetTypeInfo", "DeleteType", "GetConfig", "SetConfig", "DeleteConfig", "GetUserValues", "SetUserValues", "AddNewHardware", "OpenTypeKey", "OpenConfigKey"]

    /**
     * Acquires a handle to preexisting credentials of a security principal that is using Schannel.
     * @remarks
     * The **AcquireCredentialsHandle (Schannel)** function returns a handle to the credentials of a principal, such as a user or client, as used by a specific [constrained delegation](../secgloss/s-gly.md). This can be the handle to preexisting credentials, or the function can create a new set of credentials and return it. This handle can be used in subsequent calls to the [AcceptSecurityContext (Schannel)](acceptsecuritycontext--schannel.md) and [InitializeSecurityContext (Schannel)](initializesecuritycontext--schannel.md) functions.
     * 
     * In general, **AcquireCredentialsHandle (Schannel)** does not allow a process to obtain a handle to the credentials of other users logged on to the same computer. However, a caller with **SE\_TCB\_NAME** [privilege](../secgloss/s-gly.md) has the option of specifying the [logon identifier](../secgloss/l-gly.md) (LUID) of any existing logon session token to get a handle to that session's credentials. Typically, this is used by kernel-mode modules that must act on behalf of a logged-on user.
     * 
     * A package might call the function in *pGetKeyFn* provided by the RPC run-time transport. If the transport does not support the notion of callback to retrieve credentials, this parameter must be `NULL`.
     * 
     * For kernel mode callers, the following differences must be noted:
     * 
     * - The two string parameters must be [Unicode](../secgloss/u-gly.md) strings.
     * - The buffer values must be allocated in process virtual memory, not from the pool.
     * 
     * When you have finished using the returned credentials, free the memory used by the credentials by calling the [FreeCredentialsHandle](/windows/win32/api/sspi/nf-sspi-freecredentialshandle) function.
     * @returns {HRESULT} If the function succeeds, the function returns `SEC_E_OK`.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * | Return code | Description |
     * |--------|--------|
     * | **SEC\_E\_INSUFFICIENT\_MEMORY** | There is not enough memory available to complete the requested action. |
     * | **SEC\_E\_INTERNAL\_ERROR** | An error occurred that did not map to an SSPI error code. |
     * | **SEC\_E\_NO\_CREDENTIALS** | No credentials are available in the [*constrained delegation*](../secgloss/s-gly.md). |
     * | **SEC\_E\_NOT\_OWNER** | The caller of the function does not have the necessary credentials. |
     * | **SEC\_E\_SECPKG\_NOT\_FOUND** | The requested [*security package*](../secgloss/s-gly.md) does not exist. |
     * | **SEC\_E\_UNKNOWN\_CREDENTIALS** | The credentials supplied to the package were not recognized. |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecAuthN/acquirecredentialshandle--schannel
     */
    Acquire() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unacquire() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetCooperativeLevel(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(5, this, "ptr", param0, "uint", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sends the specified message to a window or windows. (SendNotifyMessageW)
     * @remarks
     * If you send a message in the range below <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-user">WM_USER</a> to the asynchronous message functions (<a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-postmessagea">PostMessage</a>, <b>SendNotifyMessage</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessagecallbacka">SendMessageCallback</a>), its message parameters cannot include pointers. Otherwise, the operation will fail. The functions will return before the receiving thread has had a chance to process the message and the sender will free the memory before it is used.
     * 
     * Applications that need to communicate using <b>HWND_BROADCAST</b> should use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to obtain a unique message for inter-application communication.
     * 
     * The system only does marshalling for system messages (those in the range 0 to (<a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-user">WM_USER</a>-1)). To send other messages (those &gt;= <b>WM_USER</b>) to another process, you must do custom marshalling.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winuser.h header defines SendNotifyMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-sendnotifymessagew
     */
    SendNotify() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<LPDIJOYTYPECALLBACK>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {HRESULT} 
     */
    EnumTypes(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", param0, param1Marshal, param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Pointer<DIJOYTYPEINFO>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    GetTypeInfo(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(8, this, "ptr", param0, "ptr", param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Pointer<DIJOYTYPEINFO>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    SetTypeInfo(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(9, this, "ptr", param0, "ptr", param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @returns {HRESULT} 
     */
    DeleteType(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(10, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Read the active configuration of the collector.
     * @param {Integer} param0 
     * @param {Pointer<DIJOYCONFIG>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} <dl> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 0
     * 
     * Failure
     * 
     * </dd> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 1
     * 
     * Success
     * 
     * </dd> </dl>
     * @see https://learn.microsoft.com/windows/win32/ktop-src/BEvtColProv/control-getconfiguration
     */
    GetConfig(param0, param1, param2) {
        result := ComCall(11, this, "uint", param0, "ptr", param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Set the new active configuration of the collector.
     * @param {Integer} param0 
     * @param {Pointer<DIJOYCONFIG>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} <dl> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 0
     * 
     * Failure
     * 
     * </dd> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 1
     * 
     * Success
     * 
     * </dd> </dl>
     * @see https://learn.microsoft.com/windows/win32/ktop-src/BEvtColProv/control-setconfiguration
     */
    SetConfig(param0, param1, param2) {
        result := ComCall(12, this, "uint", param0, "ptr", param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    DeleteConfig(param0) {
        result := ComCall(13, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIJOYUSERVALUES>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    GetUserValues(param0, param1) {
        result := ComCall(14, this, "ptr", param0, "uint", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIJOYUSERVALUES>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetUserValues(param0, param1) {
        result := ComCall(15, this, "ptr", param0, "uint", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Pointer<Guid>} param1 
     * @returns {HRESULT} 
     */
    AddNewHardware(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(16, this, "ptr", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Integer} param1 
     * @param {Pointer<HKEY>} param2 
     * @returns {HRESULT} 
     */
    OpenTypeKey(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(17, this, "ptr", param0, "uint", param1, "ptr", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDirectInputJoyConfig8::OpenConfigKey method opens IDirectInputJoyConfig the registry key associated with a joystick configuration.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<HKEY>} param2 
     * @returns {HRESULT} Returns DI_OK if successful; otherwise, returns one of the following COM error values: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_NOTACQUIRED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Joystick configuration has not been acquired. You must call <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire">IDirectInputJoyConfig8::Acquire</a> before you can open a joystick type configuration key for writing. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_INVALIDPARAM </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters was invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_NOTFOUND </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application attempted to open the configuration key for reading, but no configuration key for the joystick had been created. Applications should proceed as if the key were empty. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIN32, ErrorCode) </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Win32 error code if access to the key is denied because of inappropriate registry permissions or some other external factor. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/dinputd/nf-dinputd-idirectinputjoyconfig-openconfigkey
     */
    OpenConfigKey(param0, param1, param2) {
        result := ComCall(18, this, "uint", param0, "uint", param1, "ptr", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
