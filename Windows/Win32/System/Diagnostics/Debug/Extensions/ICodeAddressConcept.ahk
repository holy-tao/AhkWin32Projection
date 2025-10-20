#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class ICodeAddressConcept extends IUnknown{
    /**
     * The interface identifier for ICodeAddressConcept
     * @type {Guid}
     */
    static IID => Guid("{c7371568-5c78-4a00-a4ab-6ef8823184cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IModelObject>} pContextObject 
     * @param {Pointer<IDebugHostSymbol>} ppSymbol 
     * @returns {HRESULT} 
     */
    GetContainingSymbol(pContextObject, ppSymbol) {
        result := ComCall(3, this, "ptr", pContextObject, "ptr", ppSymbol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
