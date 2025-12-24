#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFunctionInstance.ahk
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
     * Gets the number of function instances in the collection.
     * @returns {Integer} The number of function instances.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the specified function instance and its index from the collection.
     * @param {PWSTR} pszInstanceIdentity The identifier of the function instance to be retrieved (see <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getid">GetID</a>).
     * @param {Pointer<Integer>} pdwIndex The index number.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer that receives the function instance.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-get
     */
    Get(pszInstanceIdentity, pdwIndex) {
        pszInstanceIdentity := pszInstanceIdentity is String ? StrPtr(pszInstanceIdentity) : pszInstanceIdentity

        pdwIndexMarshal := pdwIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszInstanceIdentity, pdwIndexMarshal, pdwIndex, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Gets the specified function instance, by index.
     * @param {Integer} dwIndex The zero-based index of the function instance to be retrieved.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer that receives the function instance.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-item
     */
    Item(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Adds a function instance to the collection.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface for the function instance to be added to the collection.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>pIFunctionInstance</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-add
     */
    Add(pIFunctionInstance) {
        result := ComCall(6, this, "ptr", pIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * Deletes the specified function instance and returns a pointer to the function instance being removed.
     * @param {Integer} dwIndex The index number within the collection.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer that receives the function instance.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-remove
     */
    Remove(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Removes the specified function instance from the collection.
     * @param {Integer} dwIndex The index number of the item to be removed from the collection.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>dwIndex</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-delete
     */
    Delete(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * Removes all function instances from the collection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollection-deleteall
     */
    DeleteAll() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
