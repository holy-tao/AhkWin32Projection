#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemSessionParticipant.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionParticipantAddedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionParticipantAddedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d35a57d8-c9a1-4bb7-b6b0-79bb91adf93d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Participant"]

    /**
     * @type {RemoteSystemSessionParticipant} 
     */
    Participant {
        get => this.get_Participant()
    }

    /**
     * 
     * @returns {RemoteSystemSessionParticipant} 
     */
    get_Participant() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSessionParticipant(value)
    }
}
