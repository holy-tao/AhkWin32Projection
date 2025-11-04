#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEAPProviderConfig2.ahk

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class IEAPProviderConfig3 extends IEAPProviderConfig2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEAPProviderConfig3
     * @type {Guid}
     */
    static IID => Guid("{b78ecd12-68bb-4f86-9bf0-8438dd3be982}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ServerInvokeCertificateConfigUI"]

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hWnd 
     * @param {Pointer<Integer>} pConfigDataIn 
     * @param {Integer} dwSizeOfConfigDataIn 
     * @param {Pointer<Pointer<Integer>>} ppConfigDataOut 
     * @param {Pointer<Integer>} pdwSizeOfConfigDataOut 
     * @param {Pointer} uReserved 
     * @returns {HRESULT} 
     */
    ServerInvokeCertificateConfigUI(dwEapTypeId, uConnectionParam, hWnd, pConfigDataIn, dwSizeOfConfigDataIn, ppConfigDataOut, pdwSizeOfConfigDataOut, uReserved) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        pConfigDataInMarshal := pConfigDataIn is VarRef ? "char*" : "ptr"
        ppConfigDataOutMarshal := ppConfigDataOut is VarRef ? "ptr*" : "ptr"
        pdwSizeOfConfigDataOutMarshal := pdwSizeOfConfigDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hWnd, pConfigDataInMarshal, pConfigDataIn, "uint", dwSizeOfConfigDataIn, ppConfigDataOutMarshal, ppConfigDataOut, pdwSizeOfConfigDataOutMarshal, pdwSizeOfConfigDataOut, "ptr", uReserved, "HRESULT")
        return result
    }
}
