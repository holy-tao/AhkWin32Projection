#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostType4.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostType5 extends IDebugHostType4{
    /**
     * The interface identifier for IDebugHostType5
     * @type {Guid}
     */
    static IID => Guid("{db6716ce-8ee8-4c86-89db-a658915c87f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * 
     * @param {Pointer<IDebugHostType>} pOtherType 
     * @param {Pointer<Boolean>} pIsBase 
     * @returns {HRESULT} 
     */
    IsBaseTypeOf(pOtherType, pIsBase) {
        result := ComCall(38, this, "ptr", pOtherType, "int*", pIsBase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
