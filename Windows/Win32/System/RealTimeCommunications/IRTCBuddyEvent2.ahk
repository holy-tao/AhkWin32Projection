#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCBuddyEvent.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCBuddyEvent2 extends IRTCBuddyEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCBuddyEvent2
     * @type {Guid}
     */
    static IID => Guid("{484a7f1e-73f0-4990-bfc2-60bc3978a720}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "get_StatusCode", "get_StatusText"]

    /**
     * @type {Integer} 
     */
    EventType {
        get => this.get_EventType()
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
     * @returns {Integer} 
     */
    get_EventType() {
        result := ComCall(8, this, "int*", &pEventType := 0, "HRESULT")
        return pEventType
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
