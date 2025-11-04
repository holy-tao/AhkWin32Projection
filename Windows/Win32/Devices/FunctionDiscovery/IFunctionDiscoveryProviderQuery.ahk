#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is passed to all IFunctionDiscoveryProvider::Query method calls and contains query definition information. Providers should use this to determine what the constraints are for each query request they receive.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryproviderquery
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionDiscoveryProviderQuery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionDiscoveryProviderQuery
     * @type {Guid}
     */
    static IID => Guid("{6876ea98-baec-46db-bc20-75a76e267a3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsInstanceQuery", "IsSubcategoryQuery", "GetQueryConstraints", "GetPropertyConstraints"]

    /**
     * 
     * @param {Pointer<BOOL>} pisInstanceQuery 
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-isinstancequery
     */
    IsInstanceQuery(pisInstanceQuery, ppszConstraintValue) {
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pisInstanceQuery, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pisSubcategoryQuery 
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-issubcategoryquery
     */
    IsSubcategoryQuery(pisSubcategoryQuery, ppszConstraintValue) {
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pisSubcategoryQuery, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IProviderQueryConstraintCollection>} ppIProviderQueryConstraints 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-getqueryconstraints
     */
    GetQueryConstraints(ppIProviderQueryConstraints) {
        result := ComCall(5, this, "ptr*", ppIProviderQueryConstraints, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IProviderPropertyConstraintCollection>} ppIProviderPropertyConstraints 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-getpropertyconstraints
     */
    GetPropertyConstraints(ppIProviderPropertyConstraints) {
        result := ComCall(6, this, "ptr*", ppIProviderPropertyConstraints, "HRESULT")
        return result
    }
}
