#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InstalledClassicAppInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment.Preview
 * @version WindowsRuntime 1.4
 */
class IClassicAppManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClassicAppManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{e2fad668-882c-4f33-b035-0df7b90d67e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindInstalledApp"]

    /**
     * 
     * @param {HSTRING} appUninstallKey 
     * @returns {InstalledClassicAppInfo} 
     */
    FindInstalledApp(appUninstallKey) {
        if(appUninstallKey is String) {
            pin := HSTRING.Create(appUninstallKey)
            appUninstallKey := pin.Value
        }
        appUninstallKey := appUninstallKey is Win32Handle ? NumGet(appUninstallKey, "ptr") : appUninstallKey

        result := ComCall(6, this, "ptr", appUninstallKey, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InstalledClassicAppInfo(result_)
    }
}
