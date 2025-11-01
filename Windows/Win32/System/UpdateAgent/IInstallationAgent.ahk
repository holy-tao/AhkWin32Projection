#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Records the result for an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationagent
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationAgent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallationAgent
     * @type {Guid}
     */
    static IID => Guid("{925cbc18-a2ea-4648-bf1c-ec8badcfe20a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RecordInstallationResult"]

    /**
     * 
     * @param {BSTR} installationResultCookie 
     * @param {Integer} hresult 
     * @param {IStringCollection} extendedReportingData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationagent-recordinstallationresult
     */
    RecordInstallationResult(installationResultCookie, hresult, extendedReportingData) {
        installationResultCookie := installationResultCookie is String ? BSTR.Alloc(installationResultCookie).Value : installationResultCookie

        result := ComCall(7, this, "ptr", installationResultCookie, "int", hresult, "ptr", extendedReportingData, "HRESULT")
        return result
    }
}
