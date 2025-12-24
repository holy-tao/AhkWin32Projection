#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IMSMQCollection.ahk
#Include .\IMSMQManagement.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQOutgoingQueueManagement extends IMSMQManagement{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_State", "get_NextHops", "EodGetSendInfo", "Resume", "Pause", "EodResend"]

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {VARIANT} 
     */
    NextHops {
        get => this.get_NextHops()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(16, this, "int*", &plState := 0, "HRESULT")
        return plState
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_NextHops() {
        pvNextHops := VARIANT()
        result := ComCall(17, this, "ptr", pvNextHops, "HRESULT")
        return pvNextHops
    }

    /**
     * 
     * @returns {IMSMQCollection} 
     */
    EodGetSendInfo() {
        result := ComCall(18, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IMSMQCollection(ppCollection)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EodResend() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
