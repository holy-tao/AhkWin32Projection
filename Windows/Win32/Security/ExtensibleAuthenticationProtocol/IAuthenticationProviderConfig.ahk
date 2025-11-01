#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class IAuthenticationProviderConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAuthenticationProviderConfig
     * @type {Guid}
     */
    static IID => Guid("{66a2db17-d706-11d0-a37b-00c04fc9da04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Uninitialize", "Configure", "Activate", "Deactivate"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pszMachineName 
     * @param {Pointer<Pointer>} puConnectionParam 
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
    Initialize(pszMachineName, puConnectionParam) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName

        puConnectionParamMarshal := puConnectionParam is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pszMachineName, puConnectionParamMarshal, puConnectionParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} uConnectionParam 
     * @returns {HRESULT} 
     */
    Uninitialize(uConnectionParam) {
        result := ComCall(4, this, "ptr", uConnectionParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hWnd 
     * @param {Integer} dwFlags 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} 
     */
    Configure(uConnectionParam, hWnd, dwFlags, uReserved1, uReserved2) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(5, this, "ptr", uConnectionParam, "ptr", hWnd, "uint", dwFlags, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} uConnectionParam 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} 
     */
    Activate(uConnectionParam, uReserved1, uReserved2) {
        result := ComCall(6, this, "ptr", uConnectionParam, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} uConnectionParam 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} 
     */
    Deactivate(uConnectionParam, uReserved1, uReserved2) {
        result := ComCall(7, this, "ptr", uConnectionParam, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }
}
