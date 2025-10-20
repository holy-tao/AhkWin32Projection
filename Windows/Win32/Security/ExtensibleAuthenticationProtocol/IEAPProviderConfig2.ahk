#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEAPProviderConfig.ahk

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class IEAPProviderConfig2 extends IEAPProviderConfig{
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
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} hWnd 
     * @param {Pointer<Byte>} pConfigDataIn 
     * @param {Integer} dwSizeOfConfigDataIn 
     * @param {Pointer<Byte>} ppConfigDataOut 
     * @param {Pointer<UInt32>} pdwSizeOfConfigDataOut 
     * @returns {HRESULT} 
     */
    ServerInvokeConfigUI2(dwEapTypeId, uConnectionParam, hWnd, pConfigDataIn, dwSizeOfConfigDataIn, ppConfigDataOut, pdwSizeOfConfigDataOut) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(8, this, "uint", dwEapTypeId, "ptr", uConnectionParam, "ptr", hWnd, "char*", pConfigDataIn, "uint", dwSizeOfConfigDataIn, "char*", ppConfigDataOut, "uint*", pdwSizeOfConfigDataOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer<Byte>} ppConfigDataOut 
     * @param {Pointer<UInt32>} pdwSizeOfConfigDataOut 
     * @returns {HRESULT} 
     */
    GetGlobalConfig(dwEapTypeId, ppConfigDataOut, pdwSizeOfConfigDataOut) {
        result := ComCall(9, this, "uint", dwEapTypeId, "char*", ppConfigDataOut, "uint*", pdwSizeOfConfigDataOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
