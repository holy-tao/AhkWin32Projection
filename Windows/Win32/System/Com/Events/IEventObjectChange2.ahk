#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Notifies subscribers of changes to the event store while including partition and application ID information.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventobjectchange2
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventObjectChange2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventObjectChange2
     * @type {Guid}
     */
    static IID => Guid("{7701a9c3-bd68-438f-83e0-67bf4f53a422}")

    /**
     * The class identifier for EventObjectChange2
     * @type {Guid}
     */
    static CLSID => Guid("{bb07bacd-cd56-4e63-a8ff-cbf0355fb9f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ChangedSubscription", "ChangedEventClass"]

    /**
     * Indicates that a subscription object has been added, modified, or deleted.
     * @param {Pointer<COMEVENTSYSCHANGEINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/eventsys/ns-eventsys-comeventsyschangeinfo">COMEVENTSYSCHANGEINFO</a> structure.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventobjectchange2-changedsubscription
     */
    ChangedSubscription(pInfo) {
        result := ComCall(3, this, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * Indicates that an event class object has been added, modified, or deleted.
     * @param {Pointer<COMEVENTSYSCHANGEINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/eventsys/ns-eventsys-comeventsyschangeinfo">COMEVENTSYSCHANGEINFO</a> structure.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventobjectchange2-changedeventclass
     */
    ChangedEventClass(pInfo) {
        result := ComCall(4, this, "ptr", pInfo, "HRESULT")
        return result
    }
}
