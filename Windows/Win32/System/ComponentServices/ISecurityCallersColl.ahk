#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISecurityIdentityColl.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides access to information about individual callers in a collection of callers.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-isecuritycallerscoll
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves the number of callers in the security callers collection.
     * @returns {Integer} The number of callers in the security callers collection.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallerscoll-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * Retrieves a specified caller in the security callers collection.
     * @remarks
     * The security callers collection represents a chain of callers that cross security boundaries. These callers are also known as upstream callers.
     * 
     * Each item in this collection is a <a href="https://docs.microsoft.com/windows/desktop/cossdk/securityidentity">SecurityIdentity</a> object. To obtain an item in this collection, use the Item property of the <a href="https://docs.microsoft.com/windows/desktop/cossdk/securitycallers">SecurityCallers</a> collection object, specifying an integer index value between 0 and the number of callers, minus 1, in the collection. To retrieve the direct caller, this index value should be 0, and to retrieve the original caller, the index can be either -1 or the number of callers minus 1.
     * @param {Integer} lIndex The name of the caller to retrieve. See Remarks for information about the available callers.
     * @returns {ISecurityIdentityColl} A reference to the retrieved caller.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallerscoll-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &pObj := 0, "HRESULT")
        return ISecurityIdentityColl(pObj)
    }

    /**
     * Retrieves an enumerator for the security callers collection.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallerscoll-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }
}
