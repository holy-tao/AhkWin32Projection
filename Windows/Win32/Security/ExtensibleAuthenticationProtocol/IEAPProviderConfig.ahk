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
     * The system calls the Initialize method to initialize an EAP configuration session with the specified computer.
     * @param {PWSTR} pszMachineName Pointer to a null-terminated string that contains the name of the computer on which to configure EAP. String length is not limited.
     * @param {Integer} dwEapTypeId Specifies the EAP for which to initialize a configuration session.
     * @returns {Pointer} Pointer to an unsigned integer variable. On successful return, the value of this variable identifies this configuration session.
     * @see https://docs.microsoft.com/windows/win32/api//rrascfg/nf-rrascfg-ieapproviderconfig-initialize
     */
    Initialize(pszMachineName, dwEapTypeId) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName

        result := ComCall(3, this, "ptr", pszMachineName, "uint", dwEapTypeId, "ptr*", &puConnectionParam := 0, "HRESULT")
        return puConnectionParam
    }

    /**
     * The system calls the Uninitialize method to shut down the specified EAP configuration session.
     * @param {Integer} dwEapTypeId Specifies the EAP for which to shut down the configuration session.
     * @param {Pointer} uConnectionParam Specifies the configuration session to shut down.
     * @returns {HRESULT} If the function succeeds, the return value should be <b>S_OK</b>.
     * 
     * If the function fails, the return value should be one of the following codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-specific error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because it was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rrascfg/nf-rrascfg-ieapproviderconfig-uninitialize
     */
    Uninitialize(dwEapTypeId, uConnectionParam) {
        result := ComCall(4, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "HRESULT")
        return result
    }

    /**
     * The system calls the ServerInvokeConfigUI method to invoke the configuration user interface for EAP authentication between a remote access client and server.
     * @param {Integer} dwEapTypeId Specifies the EAP for which to invoke the configuration user interface.
     * @param {Pointer} uConnectionParam Specifies the configuration session for which to invoke the user interface.
     * @param {HWND} hWnd Handle to the parent window for the configuration user interface.
     * @param {Pointer} uReserved1 This parameter is reserved and should be zero.
     * @param {Pointer} uReserved2 This parameter is reserved and should be zero.
     * @returns {HRESULT} If the function succeeds, the return value should be <b>S_OK</b>.
     * 
     * If the function fails, the return value should be one of the following codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-specific error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because it was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rrascfg/nf-rrascfg-ieapproviderconfig-serverinvokeconfigui
     */
    ServerInvokeConfigUI(dwEapTypeId, uConnectionParam, hWnd, uReserved1, uReserved2) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(5, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hWnd, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }

    /**
     * The system calls the RouterInvokeConfigUI method to invoke the configuration user interface for EAP authentication between two routers.
     * @param {Integer} dwEapTypeId Specifies the EAP for which to invoke the configuration user interface.
     * @param {Pointer} uConnectionParam Specifies the configuration session for which to invoke the user interface.
     * @param {HWND} hwndParent Handle to the parent window for the configuration user interface.
     * @param {Integer} dwFlags Specifies the RAS_EAP_FLAG_ROUTER flag. This is the only valid flag for this parameter. It indicates that authentication is between two routers. This parameter always includes this flag.
     * @param {Pointer<Integer>} pConnectionDataIn Pointer to the current configuration data for the interface.
     * @param {Integer} dwSizeOfConnectionDataIn Specifies the size of the current configuration data pointed to by the <i>pConnectionDataIn</i> parameter.
     * @param {Pointer<Pointer<Integer>>} ppConnectionDataOut Pointer to a pointer to a buffer that contains the new configuration data for the interface.
     * @param {Pointer<Integer>} pdwSizeOfConnectionDataOut Pointer to a <b>DWORD</b> variable to receive the size of the new configuration data.
     * @returns {HRESULT} If the function succeeds, the return value should be <b>S_OK</b>.
     * 
     * If the function fails, the return value should be one of the following codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-specific error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because it was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rrascfg/nf-rrascfg-ieapproviderconfig-routerinvokeconfigui
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
     * The system calls the RouterInvokeCredentialsUI method to invoke the credentials user interface for EAP authentication between two routers.
     * @param {Integer} dwEapTypeId Specifies the EAP for which to invoke the configuration user interface.
     * @param {Pointer} uConnectionParam Specifies the configuration session for which to invoke the user interface.
     * @param {HWND} hwndParent Handle to the parent window for the configuration user interface.
     * @param {Integer} dwFlags Specifies the RAS_EAP_FLAG_ROUTER flag. This is the only valid flag for this parameter. It indicates that authentication is between two routers. This parameter always includes this flag.
     * @param {Pointer<Integer>} pConnectionDataIn Pointer to the current configuration data for the interface.
     * @param {Integer} dwSizeOfConnectionDataIn Specifies the size of the current configuration data pointed to by the <i>pConnectionDataIn</i> parameter.
     * @param {Pointer<Integer>} pUserDataIn Pointer to the current credential data for the interface.
     * @param {Integer} dwSizeOfUserDataIn Specifies the size of the current credentials data.
     * @param {Pointer<Pointer<Integer>>} ppUserDataOut Pointer to a pointer to a buffer to receive the new credentials data for the interface.
     * @param {Pointer<Integer>} pdwSizeOfUserDataOut Pointer to a <b>DWORD</b> variable to receive the size of the new credentials data.
     * @returns {HRESULT} If the function succeeds, the return value should be <b>S_OK</b>.
     * 
     * If the function fails, the return value should be one of the following codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-specific error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because it was unable to allocate the required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rrascfg/nf-rrascfg-ieapproviderconfig-routerinvokecredentialsui
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
