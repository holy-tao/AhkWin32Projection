#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQManagement.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQOutgoingQueueManagement extends IMSMQManagement{
    /**
     * The interface identifier for IMSMQOutgoingQueueManagement
     * @type {Guid}
     */
    static IID => Guid("{64c478fb-f9b0-4695-8a7f-439ac94326d3}")

    /**
     * The class identifier for MSMQOutgoingQueueManagement
     * @type {Guid}
     */
    static CLSID => Guid("{0188401c-247a-4fed-99c6-bf14119d7055}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * 
     * @param {Pointer<Int32>} plState 
     * @returns {HRESULT} 
     */
    get_State(plState) {
        result := ComCall(16, this, "int*", plState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvNextHops 
     * @returns {HRESULT} 
     */
    get_NextHops(pvNextHops) {
        result := ComCall(17, this, "ptr", pvNextHops, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    EodGetSendInfo(ppCollection) {
        result := ComCall(18, this, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EodResend() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
