#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk
#Include .\IDataModelManager.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelManager2 extends IDataModelManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelManager2
     * @type {Guid}
     */
    static IID => Guid("{f412c5ea-2284-4622-a660-a697160d3312}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireSubNamespace", "CreateTypedIntrinsicObjectEx"]

    /**
     * 
     * @param {PWSTR} modelName 
     * @param {PWSTR} subNamespaceModelName 
     * @param {PWSTR} accessName 
     * @param {IKeyStore} metadata 
     * @returns {IModelObject} 
     */
    AcquireSubNamespace(modelName, subNamespaceModelName, accessName, metadata) {
        modelName := modelName is String ? StrPtr(modelName) : modelName
        subNamespaceModelName := subNamespaceModelName is String ? StrPtr(subNamespaceModelName) : subNamespaceModelName
        accessName := accessName is String ? StrPtr(accessName) : accessName

        result := ComCall(23, this, "ptr", modelName, "ptr", subNamespaceModelName, "ptr", accessName, "ptr", metadata, "ptr*", &namespaceModelObject := 0, "HRESULT")
        return IModelObject(namespaceModelObject)
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Pointer<VARIANT>} intrinsicData 
     * @param {IDebugHostType} type 
     * @returns {IModelObject} 
     */
    CreateTypedIntrinsicObjectEx(context, intrinsicData, type) {
        result := ComCall(24, this, "ptr", context, "ptr", intrinsicData, "ptr", type, "ptr*", &object := 0, "HRESULT")
        return IModelObject(object)
    }
}
