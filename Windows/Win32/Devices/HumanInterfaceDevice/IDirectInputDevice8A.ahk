#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectInputEffect.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset ANSI
 */
class IDirectInputDevice8A extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputDevice8A
     * @type {Guid}
     */
    static IID => Guid("{54d41080-dc15-4833-a41b-748f73a38179}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "EnumObjects", "GetProperty", "SetProperty", "Acquire", "Unacquire", "GetDeviceState", "GetDeviceData", "SetDataFormat", "SetEventNotification", "SetCooperativeLevel", "GetObjectInfo", "GetDeviceInfo", "RunControlPanel", "Initialize", "CreateEffect", "EnumEffects", "GetEffectInfo", "GetForceFeedbackState", "SendForceFeedbackCommand", "EnumCreatedEffectObjects", "Escape", "Poll", "SendDeviceData", "EnumEffectsInFile", "WriteEffectToFile", "BuildActionMap", "SetActionMap", "GetImageInfo"]

    /**
     * Retrieves the length of a monitor's capabilities string.
     * @remarks
     * This function usually returns quickly, but sometimes it can take several seconds to complete.
     * @param {Pointer<DIDEVCAPS>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-getcapabilitiesstringlength
     */
    GetCapabilities(param0) {
        result := ComCall(3, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The EnumObjects function enumerates the pens or brushes available for the specified device context (DC).
     * @param {Pointer<LPDIENUMDEVICEOBJECTSCALLBACKA>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} If the function succeeds, the return value is the last value returned by the callback function. Its meaning is user-defined.
     * 
     * If the objects cannot be enumerated (for example, there are too many objects), the function returns zero without calling the callback function.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-enumobjects
     */
    EnumObjects(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", param0, param1Marshal, param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<DIPROPHEADER>} param1 
     * @returns {HRESULT} If the function is successful, the return value is the handle to the property.
     * 
     * If the function is unsuccessful, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/getproperty
     */
    GetProperty(param0, param1) {
        result := ComCall(5, this, "ptr", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets Interaction Context object properties.
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<DIPROPHEADER>} param1 
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext
     */
    SetProperty(param0, param1) {
        result := ComCall(6, this, "ptr", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

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
        result := ComCall(7, this, "int")
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
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @returns {HRESULT} 
     */
    GetDeviceState(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "uint", param0, param1Marshal, param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DIDEVICEOBJECTDATA>} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    GetDeviceData(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", param0, "ptr", param1, param2Marshal, param2, "uint", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIDATAFORMAT>} param0 
     * @returns {HRESULT} 
     */
    SetDataFormat(param0) {
        result := ComCall(11, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @returns {HRESULT} 
     */
    SetEventNotification(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(12, this, "ptr", param0, "int")
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

        result := ComCall(13, this, "ptr", param0, "uint", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIDEVICEOBJECTINSTANCEA>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    GetObjectInfo(param0, param1, param2) {
        result := ComCall(14, this, "ptr", param0, "uint", param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIDEVICEINSTANCEA>} param0 
     * @returns {HRESULT} 
     */
    GetDeviceInfo(param0) {
        result := ComCall(15, this, "ptr", param0, "int")
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
    RunControlPanel(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(16, this, "ptr", param0, "uint", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {HINSTANCE} param0 
     * @param {Integer} param1 
     * @param {Pointer<Guid>} param2 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/roapi/nf-roapi-initialize
     */
    Initialize(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(17, this, "ptr", param0, "uint", param1, "ptr", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<DIEFFECT>} param1 
     * @param {IUnknown} param3 
     * @returns {IDirectInputEffect} 
     */
    CreateEffect(param0, param1, param3) {
        result := ComCall(18, this, "ptr", param0, "ptr", param1, "ptr*", &param2 := 0, "ptr", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectInputEffect(param2)
    }

    /**
     * 
     * @param {Pointer<LPDIENUMEFFECTSCALLBACKA>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    EnumEffects(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(19, this, "ptr", param0, param1Marshal, param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIEFFECTINFOA>} param0 
     * @param {Pointer<Guid>} param1 
     * @returns {HRESULT} 
     */
    GetEffectInfo(param0, param1) {
        result := ComCall(20, this, "ptr", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetForceFeedbackState(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, param0Marshal, param0, "int")
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
    SendForceFeedbackCommand(param0) {
        result := ComCall(22, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<LPDIENUMCREATEDEFFECTOBJECTSCALLBACK>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    EnumCreatedEffectObjects(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(23, this, "ptr", param0, param1Marshal, param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The effect of passing 0 for <i>cbInput</i> will depend on the value of <i>nEscape</i> and on the driver that is handling the escape.
     * 
     * Of the original printer escapes, only the following can be used.
     * 
     * <table>
     * <tr>
     * <th>Escape</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * QUERYESCSUPPORT
     * 
     * </td>
     * <td>
     * Determines whether a particular escape is implemented by the device driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PASSTHROUGH
     * 
     * </td>
     * <td>
     * Allows the application to send data directly to a printer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For information about printer escapes, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extescape">ExtEscape</a>.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startpage">StartPage</a> function to prepare the printer driver to receive data.
     * @param {Pointer<DIEFFESCAPE>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero, except with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-escape
     */
    Escape(param0) {
        result := ComCall(24, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Poll() {
        result := ComCall(25, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DIDEVICEOBJECTDATA>} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    SendDeviceData(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "uint", param0, "ptr", param1, param2Marshal, param2, "uint", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} param0 
     * @param {Pointer<LPDIENUMEFFECTSINFILECALLBACK>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    EnumEffectsInFile(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0

        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(27, this, "ptr", param0, "ptr", param1, param2Marshal, param2, "uint", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} param0 
     * @param {Integer} param1 
     * @param {Pointer<DIFILEEFFECT>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    WriteEffectToFile(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(28, this, "ptr", param0, "uint", param1, "ptr", param2, "uint", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIACTIONFORMATA>} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    BuildActionMap(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        result := ComCall(29, this, "ptr", param0, "ptr", param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIACTIONFORMATA>} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    SetActionMap(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        result := ComCall(30, this, "ptr", param0, "ptr", param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIDEVICEIMAGEINFOHEADERA>} param0 
     * @returns {HRESULT} 
     */
    GetImageInfo(param0) {
        result := ComCall(31, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
