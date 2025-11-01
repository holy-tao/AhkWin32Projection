#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDataModelManager2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelManager3 extends IDataModelManager2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelManager3
     * @type {Guid}
     */
    static IID => Guid("{8642daf8-6ef5-4753-b53f-d83a5cee8100}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireFilteredSubNamespace", "EnumerateNamedModels"]

    /**
     * 
     * @param {PWSTR} modelName 
     * @param {PWSTR} subNamespaceModelName 
     * @param {PWSTR} accessName 
     * @param {IKeyStore} metadata 
     * @param {IModelMethod} filter 
     * @param {Pointer<IModelObject>} namespaceModelObject 
     * @param {Pointer<IFilteredNamespacePropertyToken>} token 
     * @returns {HRESULT} 
     */
    AcquireFilteredSubNamespace(modelName, subNamespaceModelName, accessName, metadata, filter, namespaceModelObject, token) {
        modelName := modelName is String ? StrPtr(modelName) : modelName
        subNamespaceModelName := subNamespaceModelName is String ? StrPtr(subNamespaceModelName) : subNamespaceModelName
        accessName := accessName is String ? StrPtr(accessName) : accessName

        result := ComCall(25, this, "ptr", modelName, "ptr", subNamespaceModelName, "ptr", accessName, "ptr", metadata, "ptr", filter, "ptr*", namespaceModelObject, "ptr*", token, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INamedModelsEnumerator>} ppEnumerator 
     * @returns {HRESULT} 
     */
    EnumerateNamedModels(ppEnumerator) {
        result := ComCall(26, this, "ptr*", ppEnumerator, "HRESULT")
        return result
    }
}
