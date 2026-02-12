#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RemoteDesktopConnectionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class IRemoteDesktopConnectionInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDesktopConnectionInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{4a7dc5a1-3368-5a75-bb78-807df7ebc439}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForLaunchUri"]

    /**
     * 
     * @param {Uri} launchUri 
     * @param {WindowId} windowId_ 
     * @returns {RemoteDesktopConnectionInfo} 
     */
    GetForLaunchUri(launchUri, windowId_) {
        windowId_ := windowId_ is Win32Handle ? NumGet(windowId_, "ptr") : windowId_

        result := ComCall(6, this, "ptr", launchUri, "ptr", windowId_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteDesktopConnectionInfo(result_)
    }
}
