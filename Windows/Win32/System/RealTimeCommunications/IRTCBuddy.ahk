#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCPresenceContact.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\RTC_PRESENCE_STATUS.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class IRTCBuddy extends IRTCPresenceContact {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCBuddy
     * @type {Guid}
     */
    static IID => Guid("{fcb136c8-7b90-4e0c-befe-56edf0ba6f1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Notes"]

    /**
     * @type {RTC_PRESENCE_STATUS} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {BSTR} 
     */
    Notes {
        get => this.get_Notes()
    }

    /**
     * 
     * @returns {RTC_PRESENCE_STATUS} 
     */
    get_Status() {
        result := ComCall(11, this, "int*", &penStatus := 0, "HRESULT")
        return penStatus
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Notes() {
        pbstrNotes := BSTR({Value: 0}, True)
        result := ComCall(12, this, "ptr", pbstrNotes, "HRESULT")
        return pbstrNotes
    }
}
