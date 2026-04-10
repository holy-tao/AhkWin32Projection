#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include .\IRTCSession2.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class IRTCSessionReferStatusEvent extends IDispatch {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionReferStatusEvent
     * @type {Guid}
     */
    static IID => Guid("{3d8fc2cd-5d76-44ab-bb68-2a80353b34a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_ReferStatus", "get_StatusCode", "get_StatusText"]

    /**
     * @type {IRTCSession2} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {RTC_SESSION_REFER_STATUS} 
     */
    ReferStatus {
        get => this.get_ReferStatus()
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * @type {BSTR} 
     */
    StatusText {
        get => this.get_StatusText()
    }

    /**
     * 
     * @returns {IRTCSession2} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession2(ppSession)
    }

    /**
     * 
     * @returns {RTC_SESSION_REFER_STATUS} 
     */
    get_ReferStatus() {
        result := ComCall(8, this, "int*", &penReferStatus := 0, "HRESULT")
        return penReferStatus
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(9, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StatusText() {
        pbstrStatusText := BSTR()
        result := ComCall(10, this, "ptr", pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }
}
