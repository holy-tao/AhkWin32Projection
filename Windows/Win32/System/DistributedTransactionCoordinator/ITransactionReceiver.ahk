#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionReceiver extends IUnknown{
    /**
     * The interface identifier for ITransactionReceiver
     * @type {Guid}
     */
    static IID => Guid("{59313e03-b36c-11cf-a539-00aa006887c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cbToken 
     * @param {Pointer<Byte>} rgbToken 
     * @param {Pointer<ITransaction>} ppTransaction 
     * @returns {HRESULT} 
     */
    UnmarshalPropagationToken(cbToken, rgbToken, ppTransaction) {
        result := ComCall(3, this, "uint", cbToken, "char*", rgbToken, "ptr", ppTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbReturnToken 
     * @returns {HRESULT} 
     */
    GetReturnTokenSize(pcbReturnToken) {
        result := ComCall(4, this, "uint*", pcbReturnToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbReturnToken 
     * @param {Pointer<Byte>} rgbReturnToken 
     * @param {Pointer<UInt32>} pcbUsed 
     * @returns {HRESULT} 
     */
    MarshalReturnToken(cbReturnToken, rgbReturnToken, pcbUsed) {
        result := ComCall(5, this, "uint", cbReturnToken, "char*", rgbReturnToken, "uint*", pcbUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
