#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemSessionInvitation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionInvitationReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionInvitationReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{5e964a2d-a10d-4edb-8dea-54d20ac19543}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Invitation"]

    /**
     * @type {RemoteSystemSessionInvitation} 
     */
    Invitation {
        get => this.get_Invitation()
    }

    /**
     * 
     * @returns {RemoteSystemSessionInvitation} 
     */
    get_Invitation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSessionInvitation(value)
    }
}
