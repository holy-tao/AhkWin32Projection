#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatesresults-get_lastsearchsuccessdate
     */
    get_LastSearchSuccessDate(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatesresults-get_lastinstallationsuccessdate
     */
    get_LastInstallationSuccessDate(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }
}
