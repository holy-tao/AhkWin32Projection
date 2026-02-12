#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemSessionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionRemovedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionRemovedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{af82914e-39a1-4dea-9d63-43798d5bbbd0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SessionInfo"]

    /**
     * @type {RemoteSystemSessionInfo} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
    }

    /**
     * 
     * @returns {RemoteSystemSessionInfo} 
     */
    get_SessionInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSessionInfo(value)
    }
}
