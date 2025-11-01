#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a group of IFunctionInstance objects returned as the result of a query or get instance request.
 * @remarks
 * 
  * The <b>IFunctionInstanceCollection</b> interface allows a client program to enumerate a collection of  <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> objects.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollection
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionInstanceCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionInstanceCollection
     * @type {Guid}
     */
    static IID => Guid("{f0a3d895-855c-42a2-948d-2f97d450ecb1}")

    /**
     * The class identifier for FunctionInstanceCollection
     * @type {Guid}
     */
    static CLSID => Guid("{ba818ce5-b55f-443f-ad39-2fe89be6191f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "Get", "Item", "Add", "Remove", "Delete", "DeleteAll"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-getcount
     */
    GetCount(pdwCount) {
        result := ComCall(3, this, "uint*", pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszInstanceIdentity 
     * @param {Pointer<Integer>} pdwIndex 
     * @param {Pointer<IFunctionInstance>} ppIFunctionInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-get
     */
    Get(pszInstanceIdentity, pdwIndex, ppIFunctionInstance) {
        pszInstanceIdentity := pszInstanceIdentity is String ? StrPtr(pszInstanceIdentity) : pszInstanceIdentity

        result := ComCall(4, this, "ptr", pszInstanceIdentity, "uint*", pdwIndex, "ptr*", ppIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IFunctionInstance>} ppIFunctionInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-item
     */
    Item(dwIndex, ppIFunctionInstance) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", ppIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFunctionInstance} pIFunctionInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-add
     */
    Add(pIFunctionInstance) {
        result := ComCall(6, this, "ptr", pIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IFunctionInstance>} ppIFunctionInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-remove
     */
    Remove(dwIndex, ppIFunctionInstance) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", ppIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-delete
     */
    Delete(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-deleteall
     */
    DeleteAll() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
