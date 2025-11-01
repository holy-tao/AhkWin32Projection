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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "Get", "Item", "Next", "Skip", "Reset"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-getcount
     */
    GetCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<PROPVARIANT>} pPropVar 
     * @param {Pointer<Integer>} pdwPropertyConstraint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-get
     */
    Get(Key, pPropVar, pdwPropertyConstraint) {
        pdwPropertyConstraintMarshal := pdwPropertyConstraint is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", Key, "ptr", pPropVar, pdwPropertyConstraintMarshal, pdwPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<PROPVARIANT>} pPropVar 
     * @param {Pointer<Integer>} pdwPropertyConstraint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-item
     */
    Item(dwIndex, pKey, pPropVar, pdwPropertyConstraint) {
        pdwPropertyConstraintMarshal := pdwPropertyConstraint is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwIndex, "ptr", pKey, "ptr", pPropVar, pdwPropertyConstraintMarshal, pdwPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<PROPVARIANT>} pPropVar 
     * @param {Pointer<Integer>} pdwPropertyConstraint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-next
     */
    Next(pKey, pPropVar, pdwPropertyConstraint) {
        pdwPropertyConstraintMarshal := pdwPropertyConstraint is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pKey, "ptr", pPropVar, pdwPropertyConstraintMarshal, pdwPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-skip
     */
    Skip() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
