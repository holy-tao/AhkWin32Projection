#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * UI for EAP provider.
 * @see https://docs.microsoft.com/windows/win32/api//rrascfg/nn-rrascfg-ieapproviderconfig
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class IEAPProviderConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEAPProviderConfig
     * @type {Guid}
     */
    static IID => Guid("{66a2db19-d706-11d0-a37b-00c04fc9da04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Uninitialize", "ServerInvokeConfigUI", "RouterInvokeConfigUI", "RouterInvokeCredentialsUI"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pszMachineName 
     * @param {Integer} dwEapTypeId 
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
    Initialize(pszMachineName, dwEapTypeId, puConnectionParam) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName

        puConnectionParamMarshal := puConnectionParam is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pszMachineName, "uint", dwEapTypeId, puConnectionParamMarshal, puConnectionParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rrascfg/nf-rrascfg-ieapproviderconfig-uninitialize
     */
    Uninitialize(dwEapTypeId, uConnectionParam) {
        result := ComCall(4, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hWnd 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rrascfg/nf-rrascfg-ieapproviderconfig-serverinvokeconfigui
     */
    ServerInvokeConfigUI(dwEapTypeId, uConnectionParam, hWnd, uReserved1, uReserved2) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(5, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hWnd, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pConnectionDataIn 
     * @param {Integer} dwSizeOfConnectionDataIn 
     * @param {Pointer<Pointer<Integer>>} ppConnectionDataOut 
     * @param {Pointer<Integer>} pdwSizeOfConnectionDataOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rrascfg/nf-rrascfg-ieapproviderconfig-routerinvokeconfigui
     */
    RouterInvokeConfigUI(dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, ppConnectionDataOut, pdwSizeOfConnectionDataOut) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        pConnectionDataInMarshal := pConnectionDataIn is VarRef ? "char*" : "ptr"
        pdwSizeOfConnectionDataOutMarshal := pdwSizeOfConnectionDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hwndParent, "uint", dwFlags, pConnectionDataInMarshal, pConnectionDataIn, "uint", dwSizeOfConnectionDataIn, "ptr*", ppConnectionDataOut, pdwSizeOfConnectionDataOutMarshal, pdwSizeOfConnectionDataOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pConnectionDataIn 
     * @param {Integer} dwSizeOfConnectionDataIn 
     * @param {Pointer<Integer>} pUserDataIn 
     * @param {Integer} dwSizeOfUserDataIn 
     * @param {Pointer<Pointer<Integer>>} ppUserDataOut 
     * @param {Pointer<Integer>} pdwSizeOfUserDataOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rrascfg/nf-rrascfg-ieapproviderconfig-routerinvokecredentialsui
     */
    RouterInvokeCredentialsUI(dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, pUserDataIn, dwSizeOfUserDataIn, ppUserDataOut, pdwSizeOfUserDataOut) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        pConnectionDataInMarshal := pConnectionDataIn is VarRef ? "char*" : "ptr"
        pUserDataInMarshal := pUserDataIn is VarRef ? "char*" : "ptr"
        pdwSizeOfUserDataOutMarshal := pdwSizeOfUserDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hwndParent, "uint", dwFlags, pConnectionDataInMarshal, pConnectionDataIn, "uint", dwSizeOfConnectionDataIn, pUserDataInMarshal, pUserDataIn, "uint", dwSizeOfUserDataIn, "ptr*", ppUserDataOut, pdwSizeOfUserDataOutMarshal, pdwSizeOfUserDataOut, "HRESULT")
        return result
    }
}
