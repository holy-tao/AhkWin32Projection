#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCProfile2.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCRoamingEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCRoamingEvent
     * @type {Guid}
     */
    static IID => Guid("{79960a6b-0cb1-4dc8-a805-7318e99902e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "get_Profile", "get_StatusCode", "get_StatusText"]

    /**
     * 
     * @returns {Integer} 
     */
    get_EventType() {
        result := ComCall(7, this, "int*", &pEventType := 0, "HRESULT")
        return pEventType
    }

    /**
     * 
     * @returns {IRTCProfile2} 
     */
    get_Profile() {
        result := ComCall(8, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile2(ppProfile)
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
