#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IProviderQueryConstraintCollection.ahk
#Include .\IProviderPropertyConstraintCollection.ahk
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
     * Determines whether a query is for a single function instance or multiple function instances.
     * @param {Pointer<BOOL>} pisInstanceQuery If this parameter is <b>TRUE</b>, there is a provider instance identifier constraint in the query constraints collection.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue The value of the provider instance identifier constraint.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-isinstancequery
     */
    IsInstanceQuery(pisInstanceQuery, ppszConstraintValue) {
        pisInstanceQueryMarshal := pisInstanceQuery is VarRef ? "int*" : "ptr"
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pisInstanceQueryMarshal, pisInstanceQuery, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * Determines whether a query is for function instances in a specific subcategory.
     * @param {Pointer<BOOL>} pisSubcategoryQuery If this parameter is <b>TRUE</b>, there is a subcategory constraint in the query constraints collection.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue The value of the subcategory constraint.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-issubcategoryquery
     */
    IsSubcategoryQuery(pisSubcategoryQuery, ppszConstraintValue) {
        pisSubcategoryQueryMarshal := pisSubcategoryQuery is VarRef ? "int*" : "ptr"
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pisSubcategoryQueryMarshal, pisSubcategoryQuery, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the current query constraints.
     * @returns {IProviderQueryConstraintCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderqueryconstraintcollection">IProviderQueryConstraintCollection</a> interface pointer that receives the collection of query constraints.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-getqueryconstraints
     */
    GetQueryConstraints() {
        result := ComCall(5, this, "ptr*", &ppIProviderQueryConstraints := 0, "HRESULT")
        return IProviderQueryConstraintCollection(ppIProviderQueryConstraints)
    }

    /**
     * Retrieves the current property constraints.
     * @returns {IProviderPropertyConstraintCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderpropertyconstraintcollection">IProviderPropertyConstraintCollection</a> interface pointer that receives the collection of property constraints.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-getpropertyconstraints
     */
    GetPropertyConstraints() {
        result := ComCall(6, this, "ptr*", &ppIProviderPropertyConstraints := 0, "HRESULT")
        return IProviderPropertyConstraintCollection(ppIProviderPropertyConstraints)
    }
}
