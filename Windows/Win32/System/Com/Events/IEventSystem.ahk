#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IUnknown.ahk
#Include ..\IDispatch.ahk

/**
 * Provides access to the event data store.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventsystem
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventSystem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventSystem
     * @type {Guid}
     */
    static IID => Guid("{4e14fb9f-2e22-11d1-9964-00c04fbbb345}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Query", "Store", "Remove", "get_EventObjectChangeEventClassID", "QueryS", "RemoveS"]

    /**
     * @type {BSTR} 
     */
    EventObjectChangeEventClassID {
        get => this.get_EventObjectChangeEventClassID()
    }

    /**
     * Retrieves a collection of subscription or event objects from the event data store.
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
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventsystem-query
     */
    Query(progID, queryCriteria, errorIndex) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        errorIndexMarshal := errorIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", progID, "ptr", queryCriteria, errorIndexMarshal, errorIndex, "ptr*", &ppInterface := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventsystem-store
     */
    Store(ProgID, pInterface) {
        ProgID := ProgID is String ? BSTR.Alloc(ProgID).Value : ProgID

        result := ComCall(8, this, "ptr", ProgID, "ptr", pInterface, "HRESULT")
        return result
    }

    /**
     * Removes one or more subscription or event objects from the event data store.
     * @param {BSTR} progID 
     * @param {BSTR} queryCriteria The query criteria. For details on forming a valid expression for this parameter, see the Remarks section below.
     * @returns {Integer} The location, expressed as an offset, of an error in the <i>queryCriteria</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventsystem-remove
     */
    Remove(progID, queryCriteria) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(9, this, "ptr", progID, "ptr", queryCriteria, "int*", &errorIndex := 0, "HRESULT")
        return errorIndex
    }

    /**
     * Retrieves the CLSID of an event class object that notifies the caller of changes to the event store.
     * @remarks
     * 
     * Subscriptions can use the <b>EventObjectChangeEventClassID</b> property to obtain a pointer to an event class object that notifies them when subscribers or events are modified or when they are added to or deleted from the event store. Subscribers to these events must implement the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectchange">IEventObjectChange</a> interface.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventsystem-get_eventobjectchangeeventclassid
     */
    get_EventObjectChangeEventClassID() {
        pbstrEventClassID := BSTR()
        result := ComCall(10, this, "ptr", pbstrEventClassID, "HRESULT")
        return pbstrEventClassID
    }

    /**
     * Retrieves a collection of subscription or event objects from the event data store.
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
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventsystem-querys
     */
    QueryS(progID, queryCriteria) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(11, this, "ptr", progID, "ptr", queryCriteria, "ptr*", &ppInterface := 0, "HRESULT")
        return IUnknown(ppInterface)
    }

    /**
     * Removes one or more subscription or event objects from the event data store.
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
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventsystem-removes
     */
    RemoveS(progID, queryCriteria) {
        progID := progID is String ? BSTR.Alloc(progID).Value : progID
        queryCriteria := queryCriteria is String ? BSTR.Alloc(queryCriteria).Value : queryCriteria

        result := ComCall(12, this, "ptr", progID, "ptr", queryCriteria, "HRESULT")
        return result
    }
}
