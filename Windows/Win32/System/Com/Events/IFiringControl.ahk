#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IDispatch.ahk

/**
 * Fires an event to a single subscription.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ifiringcontrol
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
     * @param {IEventSubscription} subscription A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventsubscription">IEventSubscription</a> interface on a subscription object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ifiringcontrol-firesubscription
     */
    FireSubscription(subscription) {
        result := ComCall(7, this, "ptr", subscription, "HRESULT")
        return result
    }
}
