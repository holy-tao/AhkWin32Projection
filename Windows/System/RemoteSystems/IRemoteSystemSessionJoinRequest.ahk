#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemSessionParticipant.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionJoinRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionJoinRequest
     * @type {Guid}
     */
    static IID => Guid("{20600068-7994-4331-86d1-d89d882585ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Participant", "Accept"]

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

    /**
     * Creates a default instance of [AcceptedVoipPhoneCallOptions](./acceptedvoipphonecalloptions.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.#ctor
     */
    Accept() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
