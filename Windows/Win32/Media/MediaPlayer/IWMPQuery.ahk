#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPQuery interface represents a compound query.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpquery
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPQuery extends IDispatch {
    /**
     * The interface identifier for IWMPQuery
     * @type {Guid}
     */
    static IID := Guid("{a00918f3-a6b0-4bfb-9189-fd834c7bc5a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPQuery interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        addCondition   : IntPtr
        beginNextGroup : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPQuery.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpquery-addcondition
     */
    addCondition(bstrAttribute, bstrOperator, bstrValue) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrOperator := bstrOperator is String ? BSTR.Alloc(bstrOperator).Value : bstrOperator
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(7, this, BSTR, bstrAttribute, BSTR, bstrOperator, BSTR, bstrValue, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpquery-beginnextgroup
     */
    beginNextGroup() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPQuery.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.addCondition := CallbackCreate(GetMethod(implObj, "addCondition"), flags, 4)
        this.vtbl.beginNextGroup := CallbackCreate(GetMethod(implObj, "beginNextGroup"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.addCondition)
        CallbackFree(this.vtbl.beginNextGroup)
    }
}
