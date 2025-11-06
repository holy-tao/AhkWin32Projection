#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFunctionInstanceCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements the asynchronous query for a collection of function instances based on category and subcategory.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollectionquery-execute">Execute</a> method must be invoked by the client program before any data can be retrieved from the query object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollectionquery
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionInstanceCollectionQuery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionInstanceCollectionQuery
     * @type {Guid}
     */
    static IID => Guid("{57cc6fd2-c09a-4289-bb72-25f04142058e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddQueryConstraint", "AddPropertyConstraint", "Execute"]

    /**
     * 
     * @param {PWSTR} pszConstraintName 
     * @param {PWSTR} pszConstraintValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollectionquery-addqueryconstraint
     */
    AddQueryConstraint(pszConstraintName, pszConstraintValue) {
        pszConstraintName := pszConstraintName is String ? StrPtr(pszConstraintName) : pszConstraintName
        pszConstraintValue := pszConstraintValue is String ? StrPtr(pszConstraintValue) : pszConstraintValue

        result := ComCall(3, this, "ptr", pszConstraintName, "ptr", pszConstraintValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<PROPVARIANT>} pv 
     * @param {Integer} enumPropertyConstraint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollectionquery-addpropertyconstraint
     */
    AddPropertyConstraint(Key, pv, enumPropertyConstraint) {
        result := ComCall(4, this, "ptr", Key, "ptr", pv, "int", enumPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IFunctionInstanceCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollectionquery-execute
     */
    Execute() {
        result := ComCall(5, this, "ptr*", &ppIFunctionInstanceCollection := 0, "HRESULT")
        return IFunctionInstanceCollection(ppIFunctionInstanceCollection)
    }
}
