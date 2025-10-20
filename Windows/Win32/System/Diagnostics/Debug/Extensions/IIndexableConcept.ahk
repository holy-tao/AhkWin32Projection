#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IIndexableConcept extends IUnknown{
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
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<UInt64>} dimensionality 
     * @returns {HRESULT} 
     */
    GetDimensionality(contextObject, dimensionality) {
        result := ComCall(3, this, "ptr", contextObject, "uint*", dimensionality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Integer} indexerCount 
     * @param {Pointer<IModelObject>} indexers 
     * @param {Pointer<IModelObject>} object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetAt(contextObject, indexerCount, indexers, object, metadata) {
        result := ComCall(4, this, "ptr", contextObject, "uint", indexerCount, "ptr", indexers, "ptr", object, "ptr", metadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Integer} indexerCount 
     * @param {Pointer<IModelObject>} indexers 
     * @param {Pointer<IModelObject>} value 
     * @returns {HRESULT} 
     */
    SetAt(contextObject, indexerCount, indexers, value) {
        result := ComCall(5, this, "ptr", contextObject, "uint", indexerCount, "ptr", indexers, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
