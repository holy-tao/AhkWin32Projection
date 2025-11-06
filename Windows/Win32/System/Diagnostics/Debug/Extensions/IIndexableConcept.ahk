#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IIndexableConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIndexableConcept
     * @type {Guid}
     */
    static IID => Guid("{d1fad99f-3f53-4457-850c-8051df2d3fb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDimensionality", "GetAt", "SetAt"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {Integer} 
     */
    GetDimensionality(contextObject) {
        result := ComCall(3, this, "ptr", contextObject, "uint*", &dimensionality := 0, "HRESULT")
        return dimensionality
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Integer} indexerCount 
     * @param {Pointer<IModelObject>} indexers 
     * @param {Pointer<IModelObject>} object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetAt(contextObject, indexerCount, indexers, object, metadata) {
        result := ComCall(4, this, "ptr", contextObject, "uint", indexerCount, "ptr*", indexers, "ptr*", object, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Integer} indexerCount 
     * @param {Pointer<IModelObject>} indexers 
     * @param {IModelObject} value 
     * @returns {HRESULT} 
     */
    SetAt(contextObject, indexerCount, indexers, value) {
        result := ComCall(5, this, "ptr", contextObject, "uint", indexerCount, "ptr*", indexers, "ptr", value, "HRESULT")
        return result
    }
}
