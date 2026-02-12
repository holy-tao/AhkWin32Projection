#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemConnectionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemConnectionInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemConnectionInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{ac831e2d-66c5-56d7-a4ce-705d94925ad6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreateFromAppServiceConnection"]

    /**
     * 
     * @param {AppServiceConnection} connection_ 
     * @returns {RemoteSystemConnectionInfo} 
     */
    TryCreateFromAppServiceConnection(connection_) {
        result := ComCall(6, this, "ptr", connection_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemConnectionInfo(result_)
    }
}
