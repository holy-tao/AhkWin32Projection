#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IIterableConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIterableConcept
     * @type {Guid}
     */
    static IID => Guid("{f5d49d0c-0b02-4301-9c9b-b3a6037628f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultIndexDimensionality", "GetIterator"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<Integer>} dimensionality 
     * @returns {HRESULT} 
     */
    GetDefaultIndexDimensionality(contextObject, dimensionality) {
        result := ComCall(3, this, "ptr", contextObject, "uint*", dimensionality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<IModelIterator>} iterator 
     * @returns {HRESULT} 
     */
    GetIterator(contextObject, iterator) {
        result := ComCall(4, this, "ptr", contextObject, "ptr*", iterator, "HRESULT")
        return result
    }
}
