#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IProviderQueryConstraintCollection.ahk" { IProviderQueryConstraintCollection }
#Import ".\IProviderPropertyConstraintCollection.ahk" { IProviderPropertyConstraintCollection }

/**
 * This interface is passed to all IFunctionDiscoveryProvider::Query method calls and contains query definition information. Providers should use this to determine what the constraints are for each query request they receive.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryproviderquery
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */
export default struct IFunctionDiscoveryProviderQuery extends IUnknown {
    /**
     * The interface identifier for IFunctionDiscoveryProviderQuery
     * @type {Guid}
     */
    static IID := Guid("{6876ea98-baec-46db-bc20-75a76e267a3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFunctionDiscoveryProviderQuery interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsInstanceQuery        : IntPtr
        IsSubcategoryQuery     : IntPtr
        GetQueryConstraints    : IntPtr
        GetPropertyConstraints : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFunctionDiscoveryProviderQuery.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether a query is for a single function instance or multiple function instances.
     * @param {Pointer<BOOL>} pisInstanceQuery If this parameter is <b>TRUE</b>, there is a provider instance identifier constraint in the query constraints collection.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue The value of the provider instance identifier constraint.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-isinstancequery
     */
    IsInstanceQuery(pisInstanceQuery, ppszConstraintValue) {
        pisInstanceQueryMarshal := pisInstanceQuery is VarRef ? "int*" : "ptr"
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pisInstanceQueryMarshal, pisInstanceQuery, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * Determines whether a query is for function instances in a specific subcategory.
     * @remarks
     * If the provider does not support subcategories, the provider should return an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollection">IFunctionInstanceCollection</a> with 0 instances in response to the query.
     * @param {Pointer<BOOL>} pisSubcategoryQuery If this parameter is <b>TRUE</b>, there is a subcategory constraint in the query constraints collection.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue The value of the subcategory constraint.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-issubcategoryquery
     */
    IsSubcategoryQuery(pisSubcategoryQuery, ppszConstraintValue) {
        pisSubcategoryQueryMarshal := pisSubcategoryQuery is VarRef ? "int*" : "ptr"
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pisSubcategoryQueryMarshal, pisSubcategoryQuery, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the current query constraints.
     * @remarks
     * Providers are expected to apply all query constraints when returning results. Providers should ignore any query constraints they do not recognize.
     * 
     * The provider should examine all constraints to determine the query to perform.
     * @returns {IProviderQueryConstraintCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderqueryconstraintcollection">IProviderQueryConstraintCollection</a> interface pointer that receives the collection of query constraints.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-getqueryconstraints
     */
    GetQueryConstraints() {
        result := ComCall(5, this, "ptr*", &ppIProviderQueryConstraints := 0, "HRESULT")
        return IProviderQueryConstraintCollection(ppIProviderQueryConstraints)
    }

    /**
     * Retrieves the current property constraints.
     * @remarks
     * Function Discovery will apply all property constraints to the results returned by the provider, but it is more efficient if the provider can apply the property constraints to the results.
     * 
     *   The provider should examine all constraints to determine the query to perform.
     * @returns {IProviderPropertyConstraintCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderpropertyconstraintcollection">IProviderPropertyConstraintCollection</a> interface pointer that receives the collection of property constraints.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderquery-getpropertyconstraints
     */
    GetPropertyConstraints() {
        result := ComCall(6, this, "ptr*", &ppIProviderPropertyConstraints := 0, "HRESULT")
        return IProviderPropertyConstraintCollection(ppIProviderPropertyConstraints)
    }

    Query(iid) {
        if (IFunctionDiscoveryProviderQuery.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsInstanceQuery := CallbackCreate(GetMethod(implObj, "IsInstanceQuery"), flags, 3)
        this.vtbl.IsSubcategoryQuery := CallbackCreate(GetMethod(implObj, "IsSubcategoryQuery"), flags, 3)
        this.vtbl.GetQueryConstraints := CallbackCreate(GetMethod(implObj, "GetQueryConstraints"), flags, 2)
        this.vtbl.GetPropertyConstraints := CallbackCreate(GetMethod(implObj, "GetPropertyConstraints"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsInstanceQuery)
        CallbackFree(this.vtbl.IsSubcategoryQuery)
        CallbackFree(this.vtbl.GetQueryConstraints)
        CallbackFree(this.vtbl.GetPropertyConstraints)
    }
}
