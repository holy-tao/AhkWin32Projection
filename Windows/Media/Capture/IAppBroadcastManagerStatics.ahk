#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppBroadcastGlobalSettings.ahk
#Include .\AppBroadcastProviderSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{364e018b-1e4e-411f-ab3e-92959844c156}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGlobalSettings", "ApplyGlobalSettings", "GetProviderSettings", "ApplyProviderSettings"]

    /**
     * 
     * @returns {AppBroadcastGlobalSettings} 
     */
    GetGlobalSettings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastGlobalSettings(value)
    }

    /**
     * 
     * @param {AppBroadcastGlobalSettings} value 
     * @returns {HRESULT} 
     */
    ApplyGlobalSettings(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppBroadcastProviderSettings} 
     */
    GetProviderSettings() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastProviderSettings(value)
    }

    /**
     * 
     * @param {AppBroadcastProviderSettings} value 
     * @returns {HRESULT} 
     */
    ApplyProviderSettings(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
