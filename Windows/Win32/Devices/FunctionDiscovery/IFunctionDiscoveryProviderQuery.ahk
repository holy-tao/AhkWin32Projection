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
     * 
     * @param {Pointer<BOOL>} pisInstanceQuery 
     * @param {Pointer<UInt16>} ppszConstraintValue 
     * @returns {HRESULT} 
     */
    IsInstanceQuery(pisInstanceQuery, ppszConstraintValue) {
        result := ComCall(3, this, "ptr", pisInstanceQuery, "ushort*", ppszConstraintValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pisSubcategoryQuery 
     * @param {Pointer<UInt16>} ppszConstraintValue 
     * @returns {HRESULT} 
     */
    IsSubcategoryQuery(pisSubcategoryQuery, ppszConstraintValue) {
        result := ComCall(4, this, "ptr", pisSubcategoryQuery, "ushort*", ppszConstraintValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IProviderQueryConstraintCollection>} ppIProviderQueryConstraints 
     * @returns {HRESULT} 
     */
    GetQueryConstraints(ppIProviderQueryConstraints) {
        result := ComCall(5, this, "ptr", ppIProviderQueryConstraints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IProviderPropertyConstraintCollection>} ppIProviderPropertyConstraints 
     * @returns {HRESULT} 
     */
    GetPropertyConstraints(ppIProviderPropertyConstraints) {
        result := ComCall(6, this, "ptr", ppIProviderPropertyConstraints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
