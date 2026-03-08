#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IEventObjectCollection.ahk
#Include ..\IUnknown.ahk

/**
 * Controls the behavior of an event object, the object that fires an event to its subscribers. (IMultiInterfaceEventControl)
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-imultiinterfaceeventcontrol
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IMultiInterfaceEventControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiInterfaceEventControl
     * @type {Guid}
     */
    static IID => Guid("{0343e2f5-86f6-11d1-b760-00c04fb926af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMultiInterfacePublisherFilter", "GetSubscriptions", "SetDefaultQuery", "get_AllowInprocActivation", "put_AllowInprocActivation", "get_FireInParallel", "put_FireInParallel"]

    /**
     * @type {BOOL} 
     */
    AllowInprocActivation {
        get => this.get_AllowInprocActivation()
        set => this.put_AllowInprocActivation(value)
    }

    /**
     * @type {BOOL} 
     */
    FireInParallel {
        get => this.get_FireInParallel()
        set => this.put_FireInParallel(value)
    }

    /**
     * Assigns a publisher filter to an event method at run time.
     * @remarks
     * An event publisher can install a publisher filter at run time to fire an event only to subscribers that meet the criteria specified in the filter.
     * @param {IMultiInterfacePublisherFilter} classFilter A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-imultiinterfacepublisherfilter">IMultiInterfacePublisherFilter</a> interface on the publisher filter associated with the specified method.
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
     * <dt><b>EVENT_E_INTERNALEXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception was raised.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_INTERNALERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected internal error was detected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-setmultiinterfacepublisherfilter
     */
    SetMultiInterfacePublisherFilter(classFilter) {
        result := ComCall(3, this, "ptr", classFilter, "HRESULT")
        return result
    }

    /**
     * Retrieves the collection of subscription objects associated with an event method.
     * @remarks
     * This method is a more specialized form of the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsystem-query">IEventSystem::Query</a> method. In addition to obtaining only subscription objects, a collection obtained by calling <b>GetSubscriptions</b> is automatically updated whenever the subscription collection changes.
     * 
     * The query criteria specified by the <i>optionalCriteria</i> parameter can be "ALL", to specify a request for all subscription objects, or a Boolean expression denoting one or more conditions a subscription object must meet to be included in the query result. Valid expressions are of the following form:
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
     * @param {Pointer<Guid>} eventIID The interface identifier of the firing interface.
     * @param {BSTR} bstrMethodName The event method associated with the subscription collection.
     * @param {BSTR} optionalCriteria A string specifying the query criteria. If this parameter is <b>NULL</b>, the default query specified by the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-setdefaultquery">SetDefaultQuery</a> method is used. For details on forming a valid expression for this parameter, see the Remarks section below.
     * @param {Pointer<Integer>} optionalErrorIndex The location, expressed as an offset, of an error in the <i>optionalCriteria</i> parameter. This parameter cannot be <b>NULL</b>.
     * @returns {IEventObjectCollection} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a> interface on a collection object that enumerates the subscriptions associated with the event object.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-getsubscriptions
     */
    GetSubscriptions(eventIID, bstrMethodName, optionalCriteria, optionalErrorIndex) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName
        optionalCriteria := optionalCriteria is String ? BSTR.Alloc(optionalCriteria).Value : optionalCriteria

        optionalErrorIndexMarshal := optionalErrorIndex is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", eventIID, "ptr", bstrMethodName, "ptr", optionalCriteria, optionalErrorIndexMarshal, optionalErrorIndex, "ptr*", &ppCollection := 0, "HRESULT")
        return IEventObjectCollection(ppCollection)
    }

    /**
     * Establishes a default query to be used when a publisher filter is not associated with an event method.
     * @remarks
     * This method is a more specialized form of the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsystem-query">IEventSystem::Query</a> method. In addition to obtaining only subscription objects, a collection obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-getsubscriptions">GetSubscriptions</a> is automatically updated whenever the subscription collection changes.
     * 
     * The query criteria specified by the <i>bstrCriteria</i> parameter can be "ALL", to specify a request for all subscription objects, or a Boolean expression denoting one or more conditions a subscription object must meet to be included in the query result. Valid expressions are of the following form:
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
     * @param {Pointer<Guid>} eventIID The interface identifier of the firing interface.
     * @param {BSTR} bstrMethodName The name of the method to which the default query is assigned.
     * @param {BSTR} bstrCriteria A string specifying the query criteria. This parameter cannot be <b>NULL</b>. For details on forming a valid expression for this parameter, see the Remarks section below.
     * @returns {Integer} The location, expressed as an offset, of an error in the <i>bstrCriteria</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-setdefaultquery
     */
    SetDefaultQuery(eventIID, bstrMethodName, bstrCriteria) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName
        bstrCriteria := bstrCriteria is String ? BSTR.Alloc(bstrCriteria).Value : bstrCriteria

        result := ComCall(5, this, "ptr", eventIID, "ptr", bstrMethodName, "ptr", bstrCriteria, "int*", &errorIndex := 0, "HRESULT")
        return errorIndex
    }

    /**
     * Indicates whether subscribers can be activated in the publisher's process. (IMultiInterfaceEventControl.get_AllowInprocActivation)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-get_allowinprocactivation
     */
    get_AllowInprocActivation() {
        result := ComCall(6, this, "int*", &pfAllowInprocActivation := 0, "HRESULT")
        return pfAllowInprocActivation
    }

    /**
     * Indicates whether subscribers can be activated in the publisher's process. (IMultiInterfaceEventControl.put_AllowInprocActivation)
     * @param {BOOL} fAllowInprocActivation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-put_allowinprocactivation
     */
    put_AllowInprocActivation(fAllowInprocActivation) {
        result := ComCall(7, this, "int", fAllowInprocActivation, "HRESULT")
        return result
    }

    /**
     * Indicates whether events can be delivered to two or more subscribers in parallel. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-get_fireinparallel
     */
    get_FireInParallel() {
        result := ComCall(8, this, "int*", &pfFireInParallel := 0, "HRESULT")
        return pfFireInParallel
    }

    /**
     * Indicates whether events can be delivered to two or more subscribers in parallel. (Put)
     * @param {BOOL} fFireInParallel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-put_fireinparallel
     */
    put_FireInParallel(fFireInParallel) {
        result := ComCall(9, this, "int", fFireInParallel, "HRESULT")
        return result
    }
}
