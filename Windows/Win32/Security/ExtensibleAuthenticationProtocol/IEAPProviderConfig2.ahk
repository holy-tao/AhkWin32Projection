#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEAPProviderConfig.ahk

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class IEAPProviderConfig2 extends IEAPProviderConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEAPProviderConfig2
     * @type {Guid}
     */
    static IID => Guid("{d565917a-85c4-4466-856e-671c3742ea9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ServerInvokeConfigUI2", "GetGlobalConfig"]

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hWnd 
     * @param {Pointer<Integer>} pConfigDataIn 
     * @param {Integer} dwSizeOfConfigDataIn 
     * @param {Pointer<Pointer<Integer>>} ppConfigDataOut 
     * @param {Pointer<Integer>} pdwSizeOfConfigDataOut 
     * @returns {HRESULT} 
     */
    ServerInvokeConfigUI2(dwEapTypeId, uConnectionParam, hWnd, pConfigDataIn, dwSizeOfConfigDataIn, ppConfigDataOut, pdwSizeOfConfigDataOut) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        pConfigDataInMarshal := pConfigDataIn is VarRef ? "char*" : "ptr"
        ppConfigDataOutMarshal := ppConfigDataOut is VarRef ? "ptr*" : "ptr"
        pdwSizeOfConfigDataOutMarshal := pdwSizeOfConfigDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hWnd, pConfigDataInMarshal, pConfigDataIn, "uint", dwSizeOfConfigDataIn, ppConfigDataOutMarshal, ppConfigDataOut, pdwSizeOfConfigDataOutMarshal, pdwSizeOfConfigDataOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer<Pointer<Integer>>} ppConfigDataOut 
     * @param {Pointer<Integer>} pdwSizeOfConfigDataOut 
     * @returns {HRESULT} 
     */
    GetGlobalConfig(dwEapTypeId, ppConfigDataOut, pdwSizeOfConfigDataOut) {
        ppConfigDataOutMarshal := ppConfigDataOut is VarRef ? "ptr*" : "ptr"
        pdwSizeOfConfigDataOutMarshal := pdwSizeOfConfigDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", dwEapTypeId, ppConfigDataOutMarshal, ppConfigDataOut, pdwSizeOfConfigDataOutMarshal, pdwSizeOfConfigDataOut, "HRESULT")
        return result
    }
}
