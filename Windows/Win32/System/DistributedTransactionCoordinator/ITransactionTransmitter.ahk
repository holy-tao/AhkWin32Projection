#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionTransmitter extends IUnknown{
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
     * 
     * @param {Pointer<ITransaction>} pTransaction 
     * @returns {HRESULT} 
     */
    Set(pTransaction) {
        result := ComCall(3, this, "ptr", pTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbToken 
     * @returns {HRESULT} 
     */
    GetPropagationTokenSize(pcbToken) {
        result := ComCall(4, this, "uint*", pcbToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbToken 
     * @param {Pointer<Byte>} rgbToken 
     * @param {Pointer<UInt32>} pcbUsed 
     * @returns {HRESULT} 
     */
    MarshalPropagationToken(cbToken, rgbToken, pcbUsed) {
        result := ComCall(5, this, "uint", cbToken, "char*", rgbToken, "uint*", pcbUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbReturnToken 
     * @param {Pointer<Byte>} rgbReturnToken 
     * @returns {HRESULT} 
     */
    UnmarshalReturnToken(cbReturnToken, rgbReturnToken) {
        result := ComCall(6, this, "uint", cbReturnToken, "char*", rgbReturnToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
