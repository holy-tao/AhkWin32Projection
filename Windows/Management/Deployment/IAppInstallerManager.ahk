#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IAppInstallerManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallerManager
     * @type {Guid}
     */
    static IID => Guid("{e7ee21c3-2103-53ee-9b18-68afeab0033d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAutoUpdateSettings", "ClearAutoUpdateSettings", "PauseAutoUpdatesUntil"]

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @param {AutoUpdateSettingsOptions} appInstallerInfo_ 
     * @returns {HRESULT} 
     */
    SetAutoUpdateSettings(packageFamilyName, appInstallerInfo_) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(6, this, "ptr", packageFamilyName, "ptr", appInstallerInfo_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @returns {HRESULT} 
     */
    ClearAutoUpdateSettings(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(7, this, "ptr", packageFamilyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @param {DateTime} dateTime_ 
     * @returns {HRESULT} 
     */
    PauseAutoUpdatesUntil(packageFamilyName, dateTime_) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(8, this, "ptr", packageFamilyName, "ptr", dateTime_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
