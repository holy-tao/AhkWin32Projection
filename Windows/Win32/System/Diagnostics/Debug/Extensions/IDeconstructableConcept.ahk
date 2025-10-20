#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDeconstructableConcept extends IUnknown{
    /**
     * The interface identifier for IDeconstructableConcept
     * @type {Guid}
     */
    static IID => Guid("{f798139e-1b2c-4077-8d87-9fa5d044f3eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<BSTR>} constructableModelName 
     * @returns {HRESULT} 
     */
    GetConstructableModelName(contextObject, constructableModelName) {
        result := ComCall(3, this, "ptr", contextObject, "ptr", constructableModelName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<UInt64>} argCount 
     * @returns {HRESULT} 
     */
    GetConstructorArgumentCount(contextObject, argCount) {
        result := ComCall(4, this, "ptr", contextObject, "uint*", argCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Integer} argCount 
     * @param {Pointer<IModelObject>} constructorArguments 
     * @returns {HRESULT} 
     */
    GetConstructorArguments(contextObject, argCount, constructorArguments) {
        result := ComCall(5, this, "ptr", contextObject, "uint", argCount, "ptr", constructorArguments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
