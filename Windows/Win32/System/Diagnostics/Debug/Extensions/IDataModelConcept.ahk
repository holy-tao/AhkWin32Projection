#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelConcept extends IUnknown{
    /**
     * The interface identifier for IDataModelConcept
     * @type {Guid}
     */
    static IID => Guid("{fcb98d1d-1114-4fbf-b24c-effcb5def0d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IModelObject>} modelObject 
     * @param {Pointer<IDebugHostTypeSignature>} matchingTypeSignature 
     * @param {Pointer<IDebugHostSymbolEnumerator>} wildcardMatches 
     * @returns {HRESULT} 
     */
    InitializeObject(modelObject, matchingTypeSignature, wildcardMatches) {
        result := ComCall(3, this, "ptr", modelObject, "ptr", matchingTypeSignature, "ptr", wildcardMatches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} modelName 
     * @returns {HRESULT} 
     */
    GetName(modelName) {
        result := ComCall(4, this, "ptr", modelName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
