#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEAPProviderConfig2.ahk

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class IEAPProviderConfig3 extends IEAPProviderConfig2{
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
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hWnd 
     * @param {Pointer<Byte>} pConfigDataIn 
     * @param {Integer} dwSizeOfConfigDataIn 
     * @param {Pointer<Byte>} ppConfigDataOut 
     * @param {Pointer<UInt32>} pdwSizeOfConfigDataOut 
     * @param {Pointer} uReserved 
     * @returns {HRESULT} 
     */
    ServerInvokeCertificateConfigUI(dwEapTypeId, uConnectionParam, hWnd, pConfigDataIn, dwSizeOfConfigDataIn, ppConfigDataOut, pdwSizeOfConfigDataOut, uReserved) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(10, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hWnd, "char*", pConfigDataIn, "uint", dwSizeOfConfigDataIn, "char*", ppConfigDataOut, "uint*", pdwSizeOfConfigDataOut, "ptr", uReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
