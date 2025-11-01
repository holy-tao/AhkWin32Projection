#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDynamicConceptProviderConcept extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConcept", "SetConcept", "NotifyParent", "NotifyParentChange", "NotifyDestruct"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<Guid>} conceptId 
     * @param {Pointer<IUnknown>} conceptInterface 
     * @param {Pointer<IKeyStore>} conceptMetadata 
     * @param {Pointer<Boolean>} hasConcept 
     * @returns {HRESULT} 
     */
    GetConcept(contextObject, conceptId, conceptInterface, conceptMetadata, hasConcept) {
        hasConceptMarshal := hasConcept is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", contextObject, "ptr", conceptId, "ptr*", conceptInterface, "ptr*", conceptMetadata, hasConceptMarshal, hasConcept, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<Guid>} conceptId 
     * @param {IUnknown} conceptInterface 
     * @param {IKeyStore} conceptMetadata 
     * @returns {HRESULT} 
     */
    SetConcept(contextObject, conceptId, conceptInterface, conceptMetadata) {
        result := ComCall(4, this, "ptr", contextObject, "ptr", conceptId, "ptr", conceptInterface, "ptr", conceptMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} parentModel 
     * @returns {HRESULT} 
     */
    NotifyParent(parentModel) {
        result := ComCall(5, this, "ptr", parentModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} parentModel 
     * @returns {HRESULT} 
     */
    NotifyParentChange(parentModel) {
        result := ComCall(6, this, "ptr", parentModel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyDestruct() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
