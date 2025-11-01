#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDeconstructableConcept extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConstructableModelName", "GetConstructorArgumentCount", "GetConstructorArguments"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<BSTR>} constructableModelName 
     * @returns {HRESULT} 
     */
    GetConstructableModelName(contextObject, constructableModelName) {
        result := ComCall(3, this, "ptr", contextObject, "ptr", constructableModelName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<Integer>} argCount 
     * @returns {HRESULT} 
     */
    GetConstructorArgumentCount(contextObject, argCount) {
        result := ComCall(4, this, "ptr", contextObject, "uint*", argCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Integer} argCount 
     * @param {Pointer<IModelObject>} constructorArguments 
     * @returns {HRESULT} 
     */
    GetConstructorArguments(contextObject, argCount, constructorArguments) {
        result := ComCall(5, this, "ptr", contextObject, "uint", argCount, "ptr*", constructorArguments, "HRESULT")
        return result
    }
}
