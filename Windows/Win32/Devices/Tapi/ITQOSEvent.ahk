#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITQOSEvent interface contains methods that retrieve the description of quality of service (QOS) events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itqosevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITQOSEvent extends IDispatch{
    /**
     * The interface identifier for ITQOSEvent
     * @type {Guid}
     */
    static IID => Guid("{cfa3357c-ad77-11d1-bb68-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCall 
     * @returns {HRESULT} 
     */
    get_Call(ppCall) {
        result := ComCall(7, this, "ptr", ppCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pQosEvent 
     * @returns {HRESULT} 
     */
    get_Event(pQosEvent) {
        result := ComCall(8, this, "int*", pQosEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMediaType 
     * @returns {HRESULT} 
     */
    get_MediaType(plMediaType) {
        result := ComCall(9, this, "int*", plMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
