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
     * @returns {Pointer} 
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pszMachineName, dwEapTypeId) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName

        result := ComCall(3, this, "ptr", pszMachineName, "uint", dwEapTypeId, "ptr*", &puConnectionParam := 0, "HRESULT")
        return puConnectionParam
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
        ppConnectionDataOutMarshal := ppConnectionDataOut is VarRef ? "ptr*" : "ptr"
        pdwSizeOfConnectionDataOutMarshal := pdwSizeOfConnectionDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hwndParent, "uint", dwFlags, pConnectionDataInMarshal, pConnectionDataIn, "uint", dwSizeOfConnectionDataIn, ppConnectionDataOutMarshal, ppConnectionDataOut, pdwSizeOfConnectionDataOutMarshal, pdwSizeOfConnectionDataOut, "HRESULT")
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
        ppUserDataOutMarshal := ppUserDataOut is VarRef ? "ptr*" : "ptr"
        pdwSizeOfUserDataOutMarshal := pdwSizeOfUserDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hwndParent, "uint", dwFlags, pConnectionDataInMarshal, pConnectionDataIn, "uint", dwSizeOfConnectionDataIn, pUserDataInMarshal, pUserDataIn, "uint", dwSizeOfUserDataIn, ppUserDataOutMarshal, ppUserDataOut, pdwSizeOfUserDataOutMarshal, pdwSizeOfUserDataOut, "HRESULT")
        return result
    }
}
