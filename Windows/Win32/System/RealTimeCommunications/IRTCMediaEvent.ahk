#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RTC_MEDIA_EVENT_TYPE.ahk
#Include ..\Com\IDispatch.ahk
#Include .\RTC_MEDIA_EVENT_REASON.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class IRTCMediaEvent extends IDispatch {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCMediaEvent
     * @type {Guid}
     */
    static IID => Guid("{099944fb-bcda-453e-8c41-e13da2adf7f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaType", "get_EventType", "get_EventReason"]

    /**
     * @type {Integer} 
     */
    MediaType {
        get => this.get_MediaType()
    }

    /**
     * @type {RTC_MEDIA_EVENT_TYPE} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * @type {RTC_MEDIA_EVENT_REASON} 
     */
    EventReason {
        get => this.get_EventReason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaType() {
        result := ComCall(7, this, "int*", &pMediaType := 0, "HRESULT")
        return pMediaType
    }

    /**
     * 
     * @returns {RTC_MEDIA_EVENT_TYPE} 
     */
    get_EventType() {
        result := ComCall(8, this, "int*", &penEventType := 0, "HRESULT")
        return penEventType
    }

    /**
     * 
     * @returns {RTC_MEDIA_EVENT_REASON} 
     */
    get_EventReason() {
        result := ComCall(9, this, "int*", &penEventReason := 0, "HRESULT")
        return penEventReason
    }
}
