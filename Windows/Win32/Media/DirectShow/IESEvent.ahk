#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements a generic event interface that can deliver and encapsulate events that are raised by devices that work with the Protected Broadcast Driver Interface (PBDA).
 * @remarks
 * 
 * 
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESEvent)</c>.
 * 
 * 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesevent
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IESEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESEvent
     * @type {Guid}
     */
    static IID => Guid("{1f0e5357-af43-44e6-8547-654c645145d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventId", "GetEventType", "SetCompletionStatus", "GetData", "GetStringData"]

    /**
     * Gets the unique identifier from an event that is derived from the IESEvent interface. The event identifier is contained in an IESEvent object, which ispassed in a call to IESEventService::FireESEvent.
     * @returns {Integer} Receives the event identifier.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesevent-geteventid
     */
    GetEventId() {
        result := ComCall(3, this, "uint*", &pdwEventId := 0, "HRESULT")
        return pdwEventId
    }

    /**
     * Gets the GUID that identifies an event that is derived from the IESEvent interface. The GUID is contained in an IESEvent object, which ispassed in a call to IESEventService::FireESEvent.
     * @returns {Guid} Pointer to the GUID that uniquely identifies the event type.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesevent-geteventtype
     */
    GetEventType() {
        pguidEventType := Guid()
        result := ComCall(4, this, "ptr", pguidEventType, "HRESULT")
        return pguidEventType
    }

    /**
     * Sets the completion status for an event that is derived from the IESEvent interface.
     * @param {Integer} dwResult Completion status for the event.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesevent-setcompletionstatus
     */
    SetCompletionStatus(dwResult) {
        result := ComCall(5, this, "uint", dwResult, "HRESULT")
        return result
    }

    /**
     * Gets data from an event that is derived from the IESEvent interface. This method gets a byte array that contains the data in an IESEvent object, which is passed in a call to IESEventService::FireESEvent.
     * @returns {Pointer<SAFEARRAY>} Pointer to <b>SAFEARRAY</b> that receives the event data.
     *           The caller is responsible for freeing the <b>SAFEARRAY</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesevent-getdata
     */
    GetData() {
        result := ComCall(6, this, "ptr*", &pbData := 0, "HRESULT")
        return pbData
    }

    /**
     * Gets the data from an event that is derived from the IESEvent interface, in Unicode string format. The data is contained in an IESEvent object, which ispassed in a call to IESEventService::FireESEvent.
     * @returns {BSTR} Pointer to a buffer that receives the data that is passed with the <b>IESEvent</b> object, in Unicode string format. The caller must release this memory.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesevent-getstringdata
     */
    GetStringData() {
        pbstrData := BSTR()
        result := ComCall(7, this, "ptr", pbstrData, "HRESULT")
        return pbstrData
    }
}
