#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPQuery interface represents a compound query.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpquery
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
     * @remarks
     * Conditions contained in a compound query are organized into condition groups. Multiple conditions within a condition group are always concatenated by using AND logic. Condition groups are always concatenated to each other by using OR logic. To start a new condition group, call <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpquery-beginnextgroup">IWMPQuery::beginNextGroup</a>.
     * 
     * Compound queries using <b>IWMPQuery</b> are not case sensitive.
     * 
     * A list of values for the <i>bstrAttribute</i> parameter can be found in the <a href="https://docs.microsoft.com/windows/desktop/WMP/alphabetical-attribute-reference">Alphabetical Attribute Reference</a> section.
     * 
     * The following table lists the supported values for <i>bstrOperator</i>.
     * 
     * <table>
     * <tr>
     * <th>String
     *             </th>
     * <th>Applies To
     *             </th>
     * </tr>
     * <tr>
     * <td>BeginsWith</td>
     * <td>Strings</td>
     * </tr>
     * <tr>
     * <td>Contains</td>
     * <td>Strings</td>
     * </tr>
     * <tr>
     * <td>Equals</td>
     * <td>All types</td>
     * </tr>
     * <tr>
     * <td>GreaterThan</td>
     * <td>Numbers, Dates</td>
     * </tr>
     * <tr>
     * <td>GreaterThanOrEquals</td>
     * <td>Numbers, Dates</td>
     * </tr>
     * <tr>
     * <td>LessThan</td>
     * <td>Numbers, Dates</td>
     * </tr>
     * <tr>
     * <td>LessThanOrEquals</td>
     * <td>Numbers, Dates</td>
     * </tr>
     * <tr>
     * <td>NotBeginsWith</td>
     * <td>Strings</td>
     * </tr>
     * <tr>
     * <td>NotContains</td>
     * <td>Strings</td>
     * </tr>
     * <tr>
     * <td>NotEquals</td>
     * <td>All types</td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpquery-addcondition
     */
    addCondition(bstrAttribute, bstrOperator, bstrValue) {
        if(bstrAttribute is String) {
            pin := BSTR.Alloc(bstrAttribute)
            bstrAttribute := pin.Value
        }
        if(bstrOperator is String) {
            pin := BSTR.Alloc(bstrOperator)
            bstrOperator := pin.Value
        }
        if(bstrValue is String) {
            pin := BSTR.Alloc(bstrValue)
            bstrValue := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrAttribute, "ptr", bstrOperator, "ptr", bstrValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The beginNextGroup method begins a new condition group.
     * @remarks
     * Beginning a new condition group implies that you have completed the current condition group. The new condition group is always concatenated to the previous condition group by using OR logic.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpquery-beginnextgroup
     */
    beginNextGroup() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
