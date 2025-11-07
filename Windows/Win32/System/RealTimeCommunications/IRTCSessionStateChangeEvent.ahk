#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCSession.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionStateChangeEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionStateChangeEvent
     * @type {Guid}
     */
    static IID => Guid("{b5bad703-5952-48b3-9321-7f4500521506}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_State", "get_StatusCode", "get_StatusText"]

    /**
     * 
     * @returns {IRTCSession} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession(ppSession)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(8, this, "int*", &penState := 0, "HRESULT")
        return penState
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
