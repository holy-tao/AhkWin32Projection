#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemConnectionRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemConnectionRequestStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemConnectionRequestStatics
     * @type {Guid}
     */
    static IID => Guid("{86ca143d-8214-425c-8932-db49032d1306}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForApp"]

    /**
     * 
     * @param {RemoteSystemApp} remoteSystemApp_ 
     * @returns {RemoteSystemConnectionRequest} 
     */
    CreateForApp(remoteSystemApp_) {
        result := ComCall(6, this, "ptr", remoteSystemApp_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemConnectionRequest(result_)
    }
}
