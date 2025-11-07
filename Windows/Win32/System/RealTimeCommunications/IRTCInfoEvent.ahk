#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCSession2.ahk
#Include .\IRTCParticipant.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {IRTCSession2} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession2(ppSession)
    }

    /**
     * 
     * @returns {IRTCParticipant} 
     */
    get_Participant() {
        result := ComCall(8, this, "ptr*", &ppParticipant := 0, "HRESULT")
        return IRTCParticipant(ppParticipant)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Info() {
        pbstrInfo := BSTR()
        result := ComCall(9, this, "ptr", pbstrInfo, "HRESULT")
        return pbstrInfo
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_InfoHeader() {
        pbstrInfoHeader := BSTR()
        result := ComCall(10, this, "ptr", pbstrInfoHeader, "HRESULT")
        return pbstrInfoHeader
    }
}
