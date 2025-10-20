#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is accessible to the provider through IFunctionDiscoveryProviderQuery::GetPropertyConstraints.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderpropertyconstraintcollection
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IProviderPropertyConstraintCollection extends IUnknown{
    /**
     * The interface identifier for IProviderPropertyConstraintCollection
     * @type {Guid}
     */
    static IID => Guid("{f4fae42f-5778-4a13-8540-b5fd8c1398dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<PROPVARIANT>} pPropVar 
     * @param {Pointer<UInt32>} pdwPropertyConstraint 
     * @returns {HRESULT} 
     */
    Get(Key, pPropVar, pdwPropertyConstraint) {
        result := ComCall(4, this, "ptr", Key, "ptr", pPropVar, "uint*", pdwPropertyConstraint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<PROPVARIANT>} pPropVar 
     * @param {Pointer<UInt32>} pdwPropertyConstraint 
     * @returns {HRESULT} 
     */
    Item(dwIndex, pKey, pPropVar, pdwPropertyConstraint) {
        result := ComCall(5, this, "uint", dwIndex, "ptr", pKey, "ptr", pPropVar, "uint*", pdwPropertyConstraint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<PROPVARIANT>} pPropVar 
     * @param {Pointer<UInt32>} pdwPropertyConstraint 
     * @returns {HRESULT} 
     */
    Next(pKey, pPropVar, pdwPropertyConstraint) {
        result := ComCall(6, this, "ptr", pKey, "ptr", pPropVar, "uint*", pdwPropertyConstraint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Skip() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
