#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IDialEngine extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialEngine
     * @type {Guid}
     */
    static IID => Guid("{39fd782b-7905-40d5-9148-3c9b190423d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetProperty", "SetProperty", "Dial", "HangUp", "GetConnectedState", "GetConnectHandle"]

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
     * @param {PWSTR} pwzConnectoid 
     * @param {IDialEventSink} pIDES 
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
    Initialize(pwzConnectoid, pIDES) {
        pwzConnectoid := pwzConnectoid is String ? StrPtr(pwzConnectoid) : pwzConnectoid

        result := ComCall(3, this, "ptr", pwzConnectoid, "ptr", pIDES, "int")
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
     * @param {PWSTR} pwzProperty 
     * @param {PWSTR} pwzValue 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} If the function is successful, the return value is the handle to the property.
     * 
     * If the function is unsuccessful, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/getproperty
     */
    GetProperty(pwzProperty, pwzValue, dwBufSize) {
        pwzProperty := pwzProperty is String ? StrPtr(pwzProperty) : pwzProperty
        pwzValue := pwzValue is String ? StrPtr(pwzValue) : pwzValue

        result := ComCall(4, this, "ptr", pwzProperty, "ptr", pwzValue, "uint", dwBufSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets Interaction Context object properties.
     * @param {PWSTR} pwzProperty 
     * @param {PWSTR} pwzValue 
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext
     */
    SetProperty(pwzProperty, pwzValue) {
        pwzProperty := pwzProperty is String ? StrPtr(pwzProperty) : pwzProperty
        pwzValue := pwzValue is String ? StrPtr(pwzValue) : pwzValue

        result := ComCall(5, this, "ptr", pwzProperty, "ptr", pwzValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the current status of the application on the remote device.
     * @returns {HRESULT} The app status, a value from [DialAppStateDetails](dialappstatedetails.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialapp.getappstateasync
     */
    Dial() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HangUp() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetConnectedState() {
        result := ComCall(8, this, "uint*", &pdwState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwState
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetConnectHandle() {
        result := ComCall(9, this, "ptr*", &pdwHandle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwHandle
    }
}
