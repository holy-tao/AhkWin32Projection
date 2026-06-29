#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the event data store.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ieventsystem
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IEventSystem extends IDispatch {
    /**
     * The interface identifier for IEventSystem
     * @type {Guid}
     */
    static IID := Guid("{4e14fb9f-2e22-11d1-9964-00c04fbbb345}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventSystem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Query                             : IntPtr
        Store                             : IntPtr
        Remove                            : IntPtr
        get_EventObjectChangeEventClassID : IntPtr
        QueryS                            : IntPtr
        RemoveS                           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventSystem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    EventObjectChangeEventClassID {
        get => this.get_EventObjectChangeEventClassID()
    }

    /**
     * Retrieves a collection of subscription or event objects from the event data store. (IEventSystem.Query)
     * @remarks
     * The caller is responsible for freeing memory allocated through the <i>ppInterface</i> parameter. 
     * 
     * 
     * 
     * The query criteria specified by the <i>queryCriteria</i> parameter can be "ALL", to specify a request for all subscription objects, or a Boolean expression denoting one or more conditions a subscription object must meet to be included in the query result. Valid expressions are of the following form:
     * 
     * [NOT] <i>propertyname</i><i>relationalOperator</i><i>value</i>. Valid relational operators are as follows: 
     * 
     * ==, =, !=, &lt;&gt;, ~=. Valid values are "<i>string</i>", '<i>string</i>', {<i>GUID</i>}, <b>TRUE</b>, <b>FALSE</b>, <b>NULL</b>.
     * 
     * Individual Boolean expressions can be joined with AND or OR. Expressions can be nested in parentheses to enforce a specific order of evaluation.
     * 
     * Following are some examples of valid query criteria:
     * 
     * "EventClassID == {F89859D1-6565-11D1-88C8-0080C7D771BF}"
     * 
     * "EventClassID == {F89859D1-6565-11D1-88C8-0080C7D771BF} AND MethodName = 'StockPriceChange'"
     * @param {BSTR} progID 
     * @param {BSTR} queryCriteria The query criteria. For details on forming a valid expression for this parameter, see the Remarks section below.
     * @param {Pointer<Integer>} errorIndex The location, expressed as an offset, of an error in the <i>queryCriteria</i> parameter.
     * @returns {IUnknown} Address of a pointer to the object obtained as a result of the query. This parameter cannot be <b>NULL</b>. Depending on the object specified by the <i>progID</i> parameter, this is a pointer to one of the following interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventclass">IEventClass</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventsubscription">IEventSubscription</a>
     * </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsystem-query
     */
    Query(progID, queryCriteria, errorIndex) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        errorIndexMarshal := errorIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, BSTR, progID, BSTR, queryCriteria, errorIndexMarshal, errorIndex, "ptr*", &ppInterface := 0, "HRESULT")
        return IUnknown(ppInterface)
    }

    /**
     * Creates or modifies an event or subscription object within the event system.
     * @param {BSTR} ProgID The ProgID of the event object to be added. This must be a valid event object class identifier. The possible values are PROGID_EventSubscription and PROGID_EventClass.
     * @param {IUnknown} pInterface A pointer to the object to be added. Depending on the object specified by the <i>ProgID</i> parameter, this is a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventsubscription">IEventSubscription</a> or <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventclass">IEventClass</a> interface.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
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
     * <dt><b>EVENT_E_INVALID_PER_USER_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The owner SID on a per-user subscription does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsystem-store
     */
    Store(ProgID, pInterface) {
        ProgID := ProgID is String ? BSTR.Alloc(ProgID).Value : ProgID

        result := ComCall(8, this, BSTR, ProgID, "ptr", pInterface, "HRESULT")
        return result
    }

    /**
     * Removes one or more subscription or event objects from the event data store. (IEventSystem.Remove)
     * @remarks
     * The query criteria specified by the <i>queryCriteria</i> parameter can be "ALL", to specify a request for all subscription objects, or a Boolean expression denoting one or more conditions a subscription object must meet to be included in the query result. Valid expressions are of the following form:
     * 
     * [NOT] <i>propertyname</i><i>relationalOperator</i><i>value</i>. Valid relational operators are as follows: 
     * 
     * ==, =, !=, &lt;&gt;, ~=. Valid values are "<i>string</i>", '<i>string</i>', {<i>GUID</i>}, <b>TRUE</b>, <b>FALSE</b>, <b>NULL</b>.
     * 
     * Individual Boolean expressions can be joined with AND or OR. Expressions can be nested in parentheses to enforce a specific order of evaluation.
     * 
     * Following are some examples of valid query criteria:
     * 
     * "EventClassID == {F89859D1-6565-11D1-88C8-0080C7D771BF}"
     * 
     * "EventClassID == {F89859D1-6565-11D1-88C8-0080C7D771BF} AND MethodName = 'StockPriceChange'"
     * @param {BSTR} progID 
     * @param {BSTR} queryCriteria The query criteria. For details on forming a valid expression for this parameter, see the Remarks section below.
     * @returns {Integer} The location, expressed as an offset, of an error in the <i>queryCriteria</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsystem-remove
     */
    Remove(progID, queryCriteria) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(9, this, BSTR, progID, BSTR, queryCriteria, "int*", &errorIndex := 0, "HRESULT")
        return errorIndex
    }

    /**
     * Retrieves the CLSID of an event class object that notifies the caller of changes to the event store.
     * @remarks
     * Subscriptions can use the <b>EventObjectChangeEventClassID</b> property to obtain a pointer to an event class object that notifies them when subscribers or events are modified or when they are added to or deleted from the event store. Subscribers to these events must implement the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectchange">IEventObjectChange</a> interface.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsystem-get_eventobjectchangeeventclassid
     */
    get_EventObjectChangeEventClassID() {
        pbstrEventClassID := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrEventClassID, "HRESULT")
        return pbstrEventClassID
    }

    /**
     * Retrieves a collection of subscription or event objects from the event data store. (IEventSystem.QueryS)
     * @remarks
     * The caller is responsible for freeing memory allocated through the <i>ppInterface</i> parameter. 
     * 
     * 
     * 
     * The query criteria specified by the <i>queryCriteria</i> parameter can be "ALL", to specify a request for all subscription objects, or a Boolean expression denoting one or more conditions a subscription object must meet to be included in the query result. Valid expressions are of the following form:
     * 
     * [NOT] <i>propertyname</i><i>relationalOperator</i><i>value</i>. Valid relational operators are as follows: 
     * 
     * ==, =, !=, &lt;&gt;, ~=. Valid values are "<i>string</i>", '<i>string</i>', {<i>GUID</i>}, <b>TRUE</b>, <b>FALSE</b>, <b>NULL</b>.
     * 
     * Individual Boolean expressions can be joined with AND or OR. Expressions can be nested in parentheses to enforce a specific order of evaluation.
     * 
     * Following are some examples of valid query criteria:
     * 
     * "EventClassID == {F89859D1-6565-11D1-88C8-0080C7D771BF}"
     * 
     * "EventClassID == {F89859D1-6565-11D1-88C8-0080C7D771BF} AND MethodName = 'StockPriceChange'"
     * @param {BSTR} progID 
     * @param {BSTR} queryCriteria The query criteria. For details on forming a valid expression for this parameter, see the Remarks section below.
     * @returns {IUnknown} Address of a pointer to the object obtained as a result of the query. This parameter cannot be <b>NULL</b>. Depending on the object specified by the <i>progID</i> parameter, this is a pointer to one of the following interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventclass">IEventClass</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventsubscription">IEventSubscription</a>
     * </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsystem-querys
     */
    QueryS(progID, queryCriteria) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(11, this, BSTR, progID, BSTR, queryCriteria, "ptr*", &ppInterface := 0, "HRESULT")
        return IUnknown(ppInterface)
    }

    /**
     * Removes one or more subscription or event objects from the event data store. (IEventSystem.RemoveS)
     * @remarks
     * The query criteria specified by the <i>queryCriteria</i> parameter can be "ALL", to specify a request for all subscription objects, or a Boolean expression denoting one or more conditions a subscription object must meet to be included in the query result. Valid expressions are of the following form:
     * 
     * [NOT] <i>propertyname</i><i>relationalOperator</i><i>value</i>. Valid relational operators are as follows: 
     * 
     * ==, =, !=, &lt;&gt;, ~=. Valid values are "<i>string</i>", '<i>string</i>', {<i>GUID</i>}, <b>TRUE</b>, <b>FALSE</b>, <b>NULL</b>.
     * 
     * Individual Boolean expressions can be joined with AND or OR. Expressions can be nested in parentheses to enforce a specific order of evaluation.
     * 
     * Following are some examples of valid query criteria:
     * 
     * "EventClassID == {F89859D1-6565-11D1-88C8-0080C7D771BF}"
     * 
     * "EventClassID == {F89859D1-6565-11D1-88C8-0080C7D771BF} AND MethodName = 'StockPriceChange'"
     * @param {BSTR} progID 
     * @param {BSTR} queryCriteria The query criteria. For details on forming a valid expression for this parameter, see the Remarks section below.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
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
     * <dt><b>EVENT_E_QUERYSYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A syntax error occurred while trying to evaluate a query string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_QUERYFIELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid field name was used in a query string.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_NOT_ALL_REMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all of the requested objects could be removed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsystem-removes
     */
    RemoveS(progID, queryCriteria) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(12, this, BSTR, progID, BSTR, queryCriteria, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventSystem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Query := CallbackCreate(GetMethod(implObj, "Query"), flags, 5)
        this.vtbl.Store := CallbackCreate(GetMethod(implObj, "Store"), flags, 3)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 4)
        this.vtbl.get_EventObjectChangeEventClassID := CallbackCreate(GetMethod(implObj, "get_EventObjectChangeEventClassID"), flags, 2)
        this.vtbl.QueryS := CallbackCreate(GetMethod(implObj, "QueryS"), flags, 4)
        this.vtbl.RemoveS := CallbackCreate(GetMethod(implObj, "RemoveS"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Query)
        CallbackFree(this.vtbl.Store)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.get_EventObjectChangeEventClassID)
        CallbackFree(this.vtbl.QueryS)
        CallbackFree(this.vtbl.RemoveS)
    }
}
