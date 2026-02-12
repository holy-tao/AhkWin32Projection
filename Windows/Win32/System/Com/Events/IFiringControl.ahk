#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IDispatch.ahk

/**
 * Fires an event to a single subscription.
 * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nn-eventsys-ifiringcontrol
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IFiringControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFiringControl
     * @type {Guid}
     */
    static IID => Guid("{e0498c93-4efe-11d1-9971-00c04fbbb345}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FireSubscription"]

    /**
     * Fires an event to a single subscriber.
     * @remarks
     * The <b>FireSubscription</b> method fires an event to the subscriber associated with the subscription object identified by the <i>subscription</i> parameter. A publisher filter typically iterates through a filtered list of subscriptions and calls <b>FireSubscription</b> for each associated subscriber. All standard delivery processing is done by the event object for the subscription, including the following: 
     * 
     * 
     * 
     * <ul>
     * <li>Any standard parameter filtering.
     * </li>
     * <li>Activating the subscriber object (optional, for persistent subscriptions).
     * </li>
     * <li>Depending on parameter filtering, invoking the event method that originally caused entry into the publisher filter on the subscriber.
     * </li>
     * </ul>
     * @param {IEventSubscription} subscription A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventsubscription">IEventSubscription</a> interface on a subscription object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ifiringcontrol-firesubscription
     */
    FireSubscription(subscription) {
        result := ComCall(7, this, "ptr", subscription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
