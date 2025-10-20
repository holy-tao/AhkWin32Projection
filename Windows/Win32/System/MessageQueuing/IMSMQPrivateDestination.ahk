#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQPrivateDestination extends IDispatch{
    /**
     * The interface identifier for IMSMQPrivateDestination
     * @type {Guid}
     */
    static IID => Guid("{eba96b17-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT>} pvarHandle 
     * @returns {HRESULT} 
     */
    get_Handle(pvarHandle) {
        result := ComCall(7, this, "ptr", pvarHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varHandle 
     * @returns {HRESULT} 
     */
    put_Handle(varHandle) {
        result := ComCall(8, this, "ptr", varHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
