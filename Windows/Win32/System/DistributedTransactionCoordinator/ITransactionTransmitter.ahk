#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionTransmitter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionTransmitter
     * @type {Guid}
     */
    static IID => Guid("{59313e01-b36c-11cf-a539-00aa006887c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Set", "GetPropagationTokenSize", "MarshalPropagationToken", "UnmarshalReturnToken", "Reset"]

    /**
     * 
     * @param {ITransaction} pTransaction 
     * @returns {HRESULT} 
     */
    Set(pTransaction) {
        result := ComCall(3, this, "ptr", pTransaction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbToken 
     * @returns {HRESULT} 
     */
    GetPropagationTokenSize(pcbToken) {
        result := ComCall(4, this, "uint*", pcbToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbToken 
     * @param {Pointer<Integer>} rgbToken 
     * @param {Pointer<Integer>} pcbUsed 
     * @returns {HRESULT} 
     */
    MarshalPropagationToken(cbToken, rgbToken, pcbUsed) {
        result := ComCall(5, this, "uint", cbToken, "char*", rgbToken, "uint*", pcbUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbReturnToken 
     * @param {Pointer<Integer>} rgbReturnToken 
     * @returns {HRESULT} 
     */
    UnmarshalReturnToken(cbReturnToken, rgbReturnToken) {
        result := ComCall(6, this, "uint", cbReturnToken, "char*", rgbReturnToken, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
