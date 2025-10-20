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
     * 
     * @param {Pointer<COMEVENTSYSCHANGEINFO>} pInfo 
     * @returns {HRESULT} 
     */
    ChangedSubscription(pInfo) {
        result := ComCall(3, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMEVENTSYSCHANGEINFO>} pInfo 
     * @returns {HRESULT} 
     */
    ChangedEventClass(pInfo) {
        result := ComCall(4, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
