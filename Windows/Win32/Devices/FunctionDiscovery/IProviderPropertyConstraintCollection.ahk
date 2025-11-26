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
     * Gets the number of items in the collection.
     * @returns {Integer} The number of items.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the name and value of the specified property constraint, by property key.
     * @param {Pointer<PROPERTYKEY>} Key The property key.
     * @param {Pointer<PROPVARIANT>} pPropVar A <b>VARIANT</b> used for the property key constraint value.
     * @param {Pointer<Integer>} pdwPropertyConstraint The type of constraint to apply.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully, but the property key was not found in the collection.
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
     * The <i>ppropVar</i> or <i>pdwPropertyConstraint</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-get
     */
    Get(Key, pPropVar, pdwPropertyConstraint) {
        pdwPropertyConstraintMarshal := pdwPropertyConstraint is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", Key, "ptr", pPropVar, pdwPropertyConstraintMarshal, pdwPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * Gets the name and value of the specified property constraint, by index.
     * @param {Integer} dwIndex The index of the item in the collection.
     * @param {Pointer<PROPERTYKEY>} pKey The property key.
     * @param {Pointer<PROPVARIANT>} pPropVar A <b>PROPVARIANT</b> used for the property constraint data.
     * @param {Pointer<Integer>} pdwPropertyConstraint The type of constraint to apply.
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
     * The <i>ppropVar</i> or <i>pdwPropertyConstraint</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-item
     */
    Item(dwIndex, pKey, pPropVar, pdwPropertyConstraint) {
        pdwPropertyConstraintMarshal := pdwPropertyConstraint is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwIndex, "ptr", pKey, "ptr", pPropVar, pdwPropertyConstraintMarshal, pdwPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * Gets the name and value of the next property constraint in the collection.
     * @param {Pointer<PROPERTYKEY>} pKey The property key.
     * @param {Pointer<PROPVARIANT>} pPropVar A <b>PROPVARIANT</b> used for the property constraint data.
     * @param {Pointer<Integer>} pdwPropertyConstraint The type of constraint to apply.
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
     * The <i>ppropVar</i> or <i>pdwPropertyConstraint</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-next
     */
    Next(pKey, pPropVar, pdwPropertyConstraint) {
        pdwPropertyConstraintMarshal := pdwPropertyConstraint is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pKey, "ptr", pPropVar, pdwPropertyConstraintMarshal, pdwPropertyConstraint, "HRESULT")
        return result
    }

    /**
     * Skips the next item in the collection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-skip
     */
    Skip() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Resets the current index to the start of the collection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderpropertyconstraintcollection-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
