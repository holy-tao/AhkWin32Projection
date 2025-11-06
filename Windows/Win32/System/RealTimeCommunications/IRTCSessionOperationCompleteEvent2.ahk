#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCParticipant.ahk
#Include .\IRTCSessionOperationCompleteEvent.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionOperationCompleteEvent2 extends IRTCSessionOperationCompleteEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionOperationCompleteEvent2
     * @type {Guid}
     */
    static IID => Guid("{f6fc2a9b-d5bc-4241-b436-1b8460c13832}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Participant", "GetRemoteSessionDescription"]

    /**
     * 
     * @returns {IRTCParticipant} 
     */
    get_Participant() {
        result := ComCall(11, this, "ptr*", &ppParticipant := 0, "HRESULT")
        return IRTCParticipant(ppParticipant)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContentType 
     * @param {Pointer<BSTR>} pbstrSessionDescription 
     * @returns {HRESULT} 
     */
    GetRemoteSessionDescription(pbstrContentType, pbstrSessionDescription) {
        result := ComCall(12, this, "ptr", pbstrContentType, "ptr", pbstrSessionDescription, "HRESULT")
        return result
    }
}
