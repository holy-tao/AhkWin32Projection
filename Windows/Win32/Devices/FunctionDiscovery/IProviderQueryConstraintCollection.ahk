#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is accessible to the provider through the IFunctionDiscoveryProviderQuery::GetQueryConstraints method.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderqueryconstraintcollection
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IProviderQueryConstraintCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProviderQueryConstraintCollection
     * @type {Guid}
     */
    static IID => Guid("{9c243e11-3261-4bcd-b922-84a873d460ae}")

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
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-getcount
     */
    GetCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszConstraintName 
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-get
     */
    Get(pszConstraintName, ppszConstraintValue) {
        pszConstraintName := pszConstraintName is String ? StrPtr(pszConstraintName) : pszConstraintName

        result := ComCall(4, this, "ptr", pszConstraintName, "ptr*", ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Pointer<Integer>>} ppszConstraintName 
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-item
     */
    Item(dwIndex, ppszConstraintName, ppszConstraintValue) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", ppszConstraintName, "ptr*", ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppszConstraintName 
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-next
     */
    Next(ppszConstraintName, ppszConstraintValue) {
        result := ComCall(6, this, "ptr*", ppszConstraintName, "ptr*", ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-skip
     */
    Skip() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
