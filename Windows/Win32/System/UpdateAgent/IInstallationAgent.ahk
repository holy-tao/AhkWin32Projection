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
     * 
     * @param {BSTR} installationResultCookie 
     * @param {Integer} hresult 
     * @param {Pointer<IStringCollection>} extendedReportingData 
     * @returns {HRESULT} 
     */
    RecordInstallationResult(installationResultCookie, hresult, extendedReportingData) {
        installationResultCookie := installationResultCookie is String ? BSTR.Alloc(installationResultCookie).Value : installationResultCookie

        result := ComCall(7, this, "ptr", installationResultCookie, "int", hresult, "ptr", extendedReportingData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
