#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RemoteDesktopConnectionRemoteInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class IRemoteDesktopConnectionRemoteInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDesktopConnectionRemoteInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{b590e64a-e4c9-53e8-b83d-a0db3676246a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSwitchSupported", "GetForLaunchUri"]

    /**
     * 
     * @returns {Boolean} 
     */
    IsSwitchSupported() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Uri} launchUri 
     * @returns {RemoteDesktopConnectionRemoteInfo} 
     */
    GetForLaunchUri(launchUri) {
        result := ComCall(7, this, "ptr", launchUri, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteDesktopConnectionRemoteInfo(result_)
    }
}
