#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQPrivateEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQPrivateEvent
     * @type {Guid}
     */
    static IID => Guid("{d7ab3341-c9d3-11d1-bb47-0080c7c5a2c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Hwnd", "FireArrivedEvent", "FireArrivedErrorEvent"]

    /**
     * @type {Integer} 
     */
    Hwnd {
        get => this.get_Hwnd()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hwnd() {
        result := ComCall(7, this, "int*", &phwnd := 0, "HRESULT")
        return phwnd
    }

    /**
     * 
     * @param {IMSMQQueue} pq 
     * @param {Integer} msgcursor 
     * @returns {HRESULT} 
     */
    FireArrivedEvent(pq, msgcursor) {
        result := ComCall(8, this, "ptr", pq, "int", msgcursor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSMQQueue} pq 
     * @param {HRESULT} hrStatus 
     * @param {Integer} msgcursor 
     * @returns {HRESULT} 
     */
    FireArrivedErrorEvent(pq, hrStatus, msgcursor) {
        result := ComCall(9, this, "ptr", pq, "int", hrStatus, "int", msgcursor, "HRESULT")
        return result
    }
}
