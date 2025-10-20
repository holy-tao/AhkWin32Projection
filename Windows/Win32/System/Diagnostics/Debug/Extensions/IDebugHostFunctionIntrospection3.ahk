#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostFunctionIntrospection2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionIntrospection3 extends IDebugHostFunctionIntrospection2{
    /**
     * The interface identifier for IDebugHostFunctionIntrospection3
     * @type {Guid}
     */
    static IID => Guid("{a24e286b-891a-40fc-8a3a-89b66eddce57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<Boolean>} pIsNoReturnFunction 
     * @returns {HRESULT} 
     */
    IsNoReturnFunction(pIsNoReturnFunction) {
        result := ComCall(8, this, "int*", pIsNoReturnFunction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
