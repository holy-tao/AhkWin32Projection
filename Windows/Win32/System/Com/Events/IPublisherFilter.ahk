#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IUnknown.ahk

/**
 * Acts as a callback interface so that event publishers can control which subscribers receive event notifications or the order in which subscribers are notified.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ipublisherfilter
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IPublisherFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPublisherFilter
     * @type {Guid}
     */
    static IID => Guid("{465e5cc0-7b26-11d1-88fb-0080c7d771bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "PrepareToFire"]

    /**
     * Associates an event method with a collection of subscription objects.
     * @param {BSTR} methodName The name of the event method associated with the publisher filter.
     * @param {IDispatch} dispUserDefined A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventsystem">IEventSystem</a> interface on an event system object or to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventcontrol">IEventControl</a> interface on an event class object.
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
     * The publisher filter was successfully initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_S_SOME_SUBSCRIBERS_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was able to invoke some, but not all, of the subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_ALL_SUBSCRIBERS_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was unable to invoke any of the subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_S_NOSUBSCRIBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was published but there were no subscribers.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_USER_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user-supplied component or subscriber raised an exception.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_TOO_MANY_METHODS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An interface has too many methods from which to fire events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_MISSING_EVENTCLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A subscription cannot be stored unless the event class for the subscription already exists.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_COMPLUS_NOT_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * COM+ is required for this operation, but it is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ipublisherfilter-initialize
     */
    Initialize(methodName, dispUserDefined) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName

        result := ComCall(3, this, "ptr", methodName, "ptr", dispUserDefined, "HRESULT")
        return result
    }

    /**
     * Prepares a publisher filter to begin firing a filtered list of subscriptions using a provided firing control. The firing control is contained in the event class object.
     * @param {BSTR} methodName The name of the event method to be fired.
     * @param {IFiringControl} firingControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ifiringcontrol">IFiringControl</a> interface on the firing control object.
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
     * The event class object is ready to fire the event.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_S_SOME_SUBSCRIBERS_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was able to invoke some, but not all, of the subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_ALL_SUBSCRIBERS_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was unable to invoke any of the subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_S_NOSUBSCRIBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was published but there were no subscribers.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_USER_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user-supplied component or subscriber raised an exception.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_TOO_MANY_METHODS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An interface has too many methods from which to fire events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_MISSING_EVENTCLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A subscription cannot be stored unless the event class for the subscription already exists.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_COMPLUS_NOT_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * COM+ is required for this operation, but it is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ipublisherfilter-preparetofire
     */
    PrepareToFire(methodName, firingControl) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName

        result := ComCall(4, this, "ptr", methodName, "ptr", firingControl, "HRESULT")
        return result
    }
}
