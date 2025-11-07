#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelConcept extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeObject", "GetName"]

    /**
     * 
     * @param {IModelObject} modelObject 
     * @param {IDebugHostTypeSignature} matchingTypeSignature 
     * @param {IDebugHostSymbolEnumerator} wildcardMatches 
     * @returns {HRESULT} 
     */
    InitializeObject(modelObject, matchingTypeSignature, wildcardMatches) {
        result := ComCall(3, this, "ptr", modelObject, "ptr", matchingTypeSignature, "ptr", wildcardMatches, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetName() {
        modelName := BSTR()
        result := ComCall(4, this, "ptr", modelName, "HRESULT")
        return modelName
    }
}
