#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IConstructableConcept extends IUnknown{
    /**
     * The interface identifier for IConstructableConcept
     * @type {Guid}
     */
    static IID => Guid("{1a9409f1-f0e0-4b48-9a4e-5783548fb57a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} argCount 
     * @param {Pointer<IModelObject>} ppArguments 
     * @param {Pointer<IModelObject>} ppInstance 
     * @returns {HRESULT} 
     */
    CreateInstance(argCount, ppArguments, ppInstance) {
        result := ComCall(3, this, "uint", argCount, "ptr", ppArguments, "ptr", ppInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
