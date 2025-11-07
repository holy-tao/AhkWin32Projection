#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAutomaticUpdatesSettings.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the functionality of Automatic Updates.
 * @remarks
 * 
 * You can create an instance of this interface by using the AutomaticUpdates coclass. Use the Microsoft.Update.AutoUpdate program identifier to create the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iautomaticupdates
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IAutomaticUpdates extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomaticUpdates
     * @type {Guid}
     */
    static IID => Guid("{673425bf-c082-4c7c-bdfd-569464b8e0ce}")

    /**
     * The class identifier for AutomaticUpdates
     * @type {Guid}
     */
    static CLSID => Guid("{bfe18e9c-6d87-4450-b37c-e02f0b373803}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DetectNow", "Pause", "Resume", "ShowSettingsDialog", "get_Settings", "get_ServiceEnabled", "EnableService"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdates-detectnow
     */
    DetectNow() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdates-pause
     */
    Pause() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdates-resume
     */
    Resume() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdates-showsettingsdialog
     */
    ShowSettingsDialog() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAutomaticUpdatesSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdates-get_settings
     */
    get_Settings() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IAutomaticUpdatesSettings(retval)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdates-get_serviceenabled
     */
    get_ServiceEnabled() {
        result := ComCall(12, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdates-enableservice
     */
    EnableService() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
