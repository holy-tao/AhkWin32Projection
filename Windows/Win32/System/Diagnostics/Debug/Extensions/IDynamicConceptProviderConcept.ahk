#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDynamicConceptProviderConcept extends IUnknown{
    /**
     * The interface identifier for IDynamicConceptProviderConcept
     * @type {Guid}
     */
    static IID => Guid("{95a7f7dd-602e-483f-9d06-a15c0ee13174}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<Guid>} conceptId 
     * @param {Pointer<IUnknown>} conceptInterface 
     * @param {Pointer<IKeyStore>} conceptMetadata 
     * @param {Pointer<Boolean>} hasConcept 
     * @returns {HRESULT} 
     */
    GetConcept(contextObject, conceptId, conceptInterface, conceptMetadata, hasConcept) {
        result := ComCall(3, this, "ptr", contextObject, "ptr", conceptId, "ptr", conceptInterface, "ptr", conceptMetadata, "int*", hasConcept, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<Guid>} conceptId 
     * @param {Pointer<IUnknown>} conceptInterface 
     * @param {Pointer<IKeyStore>} conceptMetadata 
     * @returns {HRESULT} 
     */
    SetConcept(contextObject, conceptId, conceptInterface, conceptMetadata) {
        result := ComCall(4, this, "ptr", contextObject, "ptr", conceptId, "ptr", conceptInterface, "ptr", conceptMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} parentModel 
     * @returns {HRESULT} 
     */
    NotifyParent(parentModel) {
        result := ComCall(5, this, "ptr", parentModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} parentModel 
     * @returns {HRESULT} 
     */
    NotifyParentChange(parentModel) {
        result := ComCall(6, this, "ptr", parentModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyDestruct() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
