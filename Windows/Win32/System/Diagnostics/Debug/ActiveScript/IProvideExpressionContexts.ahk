#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IProvideExpressionContexts extends IUnknown{
    /**
     * The interface identifier for IProvideExpressionContexts
     * @type {Guid}
     */
    static IID => Guid("{51973c41-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumDebugExpressionContexts>} ppedec 
     * @returns {HRESULT} 
     */
    EnumExpressionContexts(ppedec) {
        result := ComCall(3, this, "ptr", ppedec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
