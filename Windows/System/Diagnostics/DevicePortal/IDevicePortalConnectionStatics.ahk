#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DevicePortalConnection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics.DevicePortal
 * @version WindowsRuntime 1.4
 */
class IDevicePortalConnectionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePortalConnectionStatics
     * @type {Guid}
     */
    static IID => Guid("{4bbe31e7-e9b9-4645-8fed-a53eea0edbd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForAppServiceConnection"]

    /**
     * 
     * @param {AppServiceConnection} appServiceConnection_ 
     * @returns {DevicePortalConnection} 
     */
    GetForAppServiceConnection(appServiceConnection_) {
        result := ComCall(6, this, "ptr", appServiceConnection_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DevicePortalConnection(value)
    }
}
