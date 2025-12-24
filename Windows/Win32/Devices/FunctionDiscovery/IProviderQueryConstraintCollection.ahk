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
     * Gets the number of items in the collection.
     * @returns {Integer} The number of items.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the value of the specified query constraint, by name.
     * @param {PWSTR} pszConstraintName The constraint name.
     * @returns {Pointer<Integer>} The constraint value.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-get
     */
    Get(pszConstraintName) {
        pszConstraintName := pszConstraintName is String ? StrPtr(pszConstraintName) : pszConstraintName

        result := ComCall(4, this, "ptr", pszConstraintName, "ptr*", &ppszConstraintValue := 0, "HRESULT")
        return ppszConstraintValue
    }

    /**
     * Gets the name and value of the specified query constraint, by index.
     * @param {Integer} dwIndex The index of the item in the collection.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintName The constraint name.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue The constraint value.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pszConstraintName</i> or <i>ppszConstraintValue</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-item
     */
    Item(dwIndex, ppszConstraintName, ppszConstraintValue) {
        ppszConstraintNameMarshal := ppszConstraintName is VarRef ? "ptr*" : "ptr"
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", dwIndex, ppszConstraintNameMarshal, ppszConstraintName, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * Gets the name and value of the next query constraint in the collection.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintName The constraint name.
     * @param {Pointer<Pointer<Integer>>} ppszConstraintValue The constraint value.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-next
     */
    Next(ppszConstraintName, ppszConstraintValue) {
        ppszConstraintNameMarshal := ppszConstraintName is VarRef ? "ptr*" : "ptr"
        ppszConstraintValueMarshal := ppszConstraintValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, ppszConstraintNameMarshal, ppszConstraintName, ppszConstraintValueMarshal, ppszConstraintValue, "HRESULT")
        return result
    }

    /**
     * Skips the next item in the collection.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-skip
     */
    Skip() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Resets the current index to the start of the collection.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderqueryconstraintcollection-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
