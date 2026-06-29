#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\RTC_PRESENCE_PROPERTY.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\RTC_PRESENCE_STATUS.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class IRTCPresenceDevice extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCPresenceDevice
     * @type {Guid}
     */
    static IID => Guid("{bc6a90dd-ad9a-48da-9b0c-2515e38521ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Notes", "get_PresenceProperty", "GetPresenceData"]

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
        result := ComCall(3, this, "int*", &penStatus := 0, "HRESULT")
        return penStatus
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Notes() {
        pbstrNotes := BSTR({Value: 0}, True)
        result := ComCall(4, this, "ptr", pbstrNotes, "HRESULT")
        return pbstrNotes
    }

    /**
     * 
     * @param {RTC_PRESENCE_PROPERTY} enProperty 
     * @returns {BSTR} 
     */
    get_PresenceProperty(enProperty) {
        pbstrProperty := BSTR({Value: 0}, True)
        result := ComCall(5, this, "int", enProperty, "ptr", pbstrProperty, "HRESULT")
        return pbstrProperty
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNamespace 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    GetPresenceData(pbstrNamespace, pbstrData) {
        result := ComCall(6, this, "ptr", pbstrNamespace, "ptr", pbstrData, "HRESULT")
        return result
    }
}
