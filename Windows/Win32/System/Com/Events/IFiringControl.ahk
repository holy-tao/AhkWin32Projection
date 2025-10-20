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
     * 
     * @param {Pointer<IEventSubscription>} subscription 
     * @returns {HRESULT} 
     */
    FireSubscription(subscription) {
        result := ComCall(7, this, "ptr", subscription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
