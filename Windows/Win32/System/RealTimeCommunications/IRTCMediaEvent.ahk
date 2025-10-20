#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCMediaEvent extends IDispatch{
    /**
     * The interface identifier for IRTCMediaEvent
     * @type {Guid}
     */
    static IID => Guid("{099944fb-bcda-453e-8c41-e13da2adf7f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pMediaType 
     * @returns {HRESULT} 
     */
    get_MediaType(pMediaType) {
        result := ComCall(7, this, "int*", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penEventType 
     * @returns {HRESULT} 
     */
    get_EventType(penEventType) {
        result := ComCall(8, this, "int*", penEventType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penEventReason 
     * @returns {HRESULT} 
     */
    get_EventReason(penEventReason) {
        result := ComCall(9, this, "int*", penEventReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
