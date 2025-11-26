#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPQuery interface represents a compound query.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpquery
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPQuery extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPQuery
     * @type {Guid}
     */
    static IID => Guid("{a00918f3-a6b0-4bfb-9189-fd834c7bc5a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["addCondition", "beginNextGroup"]

    /**
     * The addCondition method adds a condition to the compound query using AND logic.
     * @param {BSTR} bstrAttribute String containing the attribute name.
     * @param {BSTR} bstrOperator String containing the operator. See Remarks for supported values.
     * @param {BSTR} bstrValue String containing the attribute value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpquery-addcondition
     */
    addCondition(bstrAttribute, bstrOperator, bstrValue) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrOperator := bstrOperator is String ? BSTR.Alloc(bstrOperator).Value : bstrOperator
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(7, this, "ptr", bstrAttribute, "ptr", bstrOperator, "ptr", bstrValue, "HRESULT")
        return result
    }

    /**
     * The beginNextGroup method begins a new condition group.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpquery-beginnextgroup
     */
    beginNextGroup() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
