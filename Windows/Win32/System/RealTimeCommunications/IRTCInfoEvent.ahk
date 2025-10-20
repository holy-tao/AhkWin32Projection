#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCInfoEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCInfoEvent
     * @type {Guid}
     */
    static IID => Guid("{4e1d68ae-1912-4f49-b2c3-594fadfd425f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_Participant", "get_Info", "get_InfoHeader"]

    /**
     * 
     * @param {Pointer<IRTCSession2>} ppSession 
     * @returns {HRESULT} 
     */
    get_Session(ppSession) {
        result := ComCall(7, this, "ptr*", ppSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCParticipant>} ppParticipant 
     * @returns {HRESULT} 
     */
    get_Participant(ppParticipant) {
        result := ComCall(8, this, "ptr*", ppParticipant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrInfo 
     * @returns {HRESULT} 
     */
    get_Info(pbstrInfo) {
        result := ComCall(9, this, "ptr", pbstrInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrInfoHeader 
     * @returns {HRESULT} 
     */
    get_InfoHeader(pbstrInfoHeader) {
        result := ComCall(10, this, "ptr", pbstrInfoHeader, "HRESULT")
        return result
    }
}
