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
class IRTCSessionOperationCompleteEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionOperationCompleteEvent
     * @type {Guid}
     */
    static IID => Guid("{a6bff4c0-f7c8-4d3c-9a41-3550f78a95b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_Cookie", "get_StatusCode", "get_StatusText"]

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
     * @returns {Pointer} 
     */
    get_Cookie() {
        result := ComCall(8, this, "ptr*", &plCookie := 0, "HRESULT")
        return plCookie
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
