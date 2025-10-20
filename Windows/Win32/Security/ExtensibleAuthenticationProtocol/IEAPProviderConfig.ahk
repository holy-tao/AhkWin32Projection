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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pszMachineName 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer<UIntPtr>} puConnectionParam 
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

        result := ComCall(3, this, "ptr", pszMachineName, "uint", dwEapTypeId, "ptr*", puConnectionParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @returns {HRESULT} 
     */
    Uninitialize(dwEapTypeId, uConnectionParam) {
        result := ComCall(4, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    ServerInvokeConfigUI(dwEapTypeId, uConnectionParam, hWnd, uReserved1, uReserved2) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(5, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hWnd, "ptr", uReserved1, "ptr", uReserved2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {Pointer<Byte>} pConnectionDataIn 
     * @param {Integer} dwSizeOfConnectionDataIn 
     * @param {Pointer<Byte>} ppConnectionDataOut 
     * @param {Pointer<UInt32>} pdwSizeOfConnectionDataOut 
     * @returns {HRESULT} 
     */
    RouterInvokeConfigUI(dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, ppConnectionDataOut, pdwSizeOfConnectionDataOut) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hwndParent, "uint", dwFlags, "char*", pConnectionDataIn, "uint", dwSizeOfConnectionDataIn, "char*", ppConnectionDataOut, "uint*", pdwSizeOfConnectionDataOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {Pointer<Byte>} pConnectionDataIn 
     * @param {Integer} dwSizeOfConnectionDataIn 
     * @param {Pointer<Byte>} pUserDataIn 
     * @param {Integer} dwSizeOfUserDataIn 
     * @param {Pointer<Byte>} ppUserDataOut 
     * @param {Pointer<UInt32>} pdwSizeOfUserDataOut 
     * @returns {HRESULT} 
     */
    RouterInvokeCredentialsUI(dwEapTypeId, uConnectionParam, hwndParent, dwFlags, pConnectionDataIn, dwSizeOfConnectionDataIn, pUserDataIn, dwSizeOfUserDataIn, ppUserDataOut, pdwSizeOfUserDataOut) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(7, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hwndParent, "uint", dwFlags, "char*", pConnectionDataIn, "uint", dwSizeOfConnectionDataIn, "char*", pUserDataIn, "uint", dwSizeOfUserDataIn, "char*", ppUserDataOut, "uint*", pdwSizeOfUserDataOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
