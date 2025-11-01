#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk

/**
 * The ITCallInfo2 interface is an extension of the ITCallInfo interface. ITCallInfo2 provides additional methods that allow an application to set event filtering on a per-call basis.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallinfo2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallInfo2 extends ITCallInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallInfo2
     * @type {Guid}
     */
    static IID => Guid("{94d70ca6-7ab0-4daa-81ca-b8f8643faec1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventFilter", "put_EventFilter"]

    /**
     * 
     * @param {Integer} TapiEvent 
     * @param {Integer} lSubEvent 
     * @param {Pointer<VARIANT_BOOL>} pEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo2-get_eventfilter
     */
    get_EventFilter(TapiEvent, lSubEvent, pEnable) {
        result := ComCall(20, this, "int", TapiEvent, "int", lSubEvent, "ptr", pEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} TapiEvent 
     * @param {Integer} lSubEvent 
     * @param {VARIANT_BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo2-put_eventfilter
     */
    put_EventFilter(TapiEvent, lSubEvent, bEnable) {
        result := ComCall(21, this, "int", TapiEvent, "int", lSubEvent, "short", bEnable, "HRESULT")
        return result
    }
}
