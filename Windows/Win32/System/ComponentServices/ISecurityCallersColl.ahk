#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides access to information about individual callers in a collection of callers.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isecuritycallerscoll
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISecurityCallersColl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityCallersColl
     * @type {Guid}
     */
    static IID => Guid("{cafc823d-b441-11d1-b82b-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallerscoll-get_count
     */
    get_Count(plCount) {
        result := ComCall(7, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<ISecurityIdentityColl>} pObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallerscoll-get_item
     */
    get_Item(lIndex, pObj) {
        result := ComCall(8, this, "int", lIndex, "ptr*", pObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallerscoll-get__newenum
     */
    get__NewEnum(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
