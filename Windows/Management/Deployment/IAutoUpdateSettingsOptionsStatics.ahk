#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AutoUpdateSettingsOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IAutoUpdateSettingsOptionsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutoUpdateSettingsOptionsStatics
     * @type {Guid}
     */
    static IID => Guid("{887b337d-0c05-54d0-bd49-3bb7a2c084cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromAppInstallerInfo"]

    /**
     * 
     * @param {AppInstallerInfo} appInstallerInfo_ 
     * @returns {AutoUpdateSettingsOptions} 
     */
    CreateFromAppInstallerInfo(appInstallerInfo_) {
        result := ComCall(6, this, "ptr", appInstallerInfo_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutoUpdateSettingsOptions(result_)
    }
}
