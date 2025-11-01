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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pwzConnectoid, pIDES) {
        pwzConnectoid := pwzConnectoid is String ? StrPtr(pwzConnectoid) : pwzConnectoid

        result := ComCall(3, this, "ptr", pwzConnectoid, "ptr", pIDES, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzProperty 
     * @param {PWSTR} pwzValue 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    GetProperty(pwzProperty, pwzValue, dwBufSize) {
        pwzProperty := pwzProperty is String ? StrPtr(pwzProperty) : pwzProperty
        pwzValue := pwzValue is String ? StrPtr(pwzValue) : pwzValue

        result := ComCall(4, this, "ptr", pwzProperty, "ptr", pwzValue, "uint", dwBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzProperty 
     * @param {PWSTR} pwzValue 
     * @returns {HRESULT} 
     */
    SetProperty(pwzProperty, pwzValue) {
        pwzProperty := pwzProperty is String ? StrPtr(pwzProperty) : pwzProperty
        pwzValue := pwzValue is String ? StrPtr(pwzValue) : pwzValue

        result := ComCall(5, this, "ptr", pwzProperty, "ptr", pwzValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Dial() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HangUp() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwState 
     * @returns {HRESULT} 
     */
    GetConnectedState(pdwState) {
        result := ComCall(8, this, "uint*", pdwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pdwHandle 
     * @returns {HRESULT} 
     */
    GetConnectHandle(pdwHandle) {
        result := ComCall(9, this, "ptr*", pdwHandle, "HRESULT")
        return result
    }
}
