#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystem.ahk
#Include .\RemoteSystemSessionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionInvitation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionInvitation
     * @type {Guid}
     */
    static IID => Guid("{3e32cc91-51d7-4766-a121-25516c3b8294}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Sender", "get_SessionInfo"]

    /**
     * @type {RemoteSystem} 
     */
    Sender {
        get => this.get_Sender()
    }

    /**
     * @type {RemoteSystemSessionInfo} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
    }

    /**
     * 
     * @returns {RemoteSystem} 
     */
    get_Sender() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystem(value)
    }

    /**
     * 
     * @returns {RemoteSystemSessionInfo} 
     */
    get_SessionInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSessionInfo(value)
    }
}
