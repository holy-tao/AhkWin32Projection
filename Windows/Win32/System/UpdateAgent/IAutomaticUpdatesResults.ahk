#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the read-only properties that describe Automatic Updates.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iautomaticupdatesresults
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IAutomaticUpdatesResults extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomaticUpdatesResults
     * @type {Guid}
     */
    static IID => Guid("{e7a4d634-7942-4dd9-a111-82228ba33901}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LastSearchSuccessDate", "get_LastInstallationSuccessDate"]

    /**
     * @type {VARIANT} 
     */
    LastSearchSuccessDate {
        get => this.get_LastSearchSuccessDate()
    }

    /**
     * @type {VARIANT} 
     */
    LastInstallationSuccessDate {
        get => this.get_LastInstallationSuccessDate()
    }

    /**
     * Gets the last time and Coordinated Universal Time (UTC) date when AutomaticUpdates successfully searched for updates.
     * @remarks
     * 
     * Calls to <b>LastSearchSuccessDate</b> by public users do not update this property. Only the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdates">AutomaticUpdates</a> object will update this property.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatesresults-get_lastsearchsuccessdate
     */
    get_LastSearchSuccessDate() {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the last time and Coordinated Universal Time (UTC) date when Automatic Updates successfully installed any updates, even if some failures occurred.
     * @remarks
     * 
     * Calls to <b>LastInstallationSuccessDate</b> by public users do not update this property. Only the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdates">AutomaticUpdates</a> object will update this property.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatesresults-get_lastinstallationsuccessdate
     */
    get_LastInstallationSuccessDate() {
        retval := VARIANT()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }
}
