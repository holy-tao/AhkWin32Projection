#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines methods for silent web account provider operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.iwebaccountprovidersilentreportoperation
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountProviderSilentReportOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProviderSilentReportOperation
     * @type {Guid}
     */
    static IID => Guid("{e0b545f8-3b0f-44da-924c-7b18baaa62a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportUserInteractionRequired", "ReportUserInteractionRequiredWithError"]

    /**
     * Informs the activating app a token could not be obtained silently and that user interaction is required to continue the operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.iwebaccountprovidersilentreportoperation.reportuserinteractionrequired
     */
    ReportUserInteractionRequired() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Informs the activating app a token could not be obtained silently and that user interaction is required to continue the operation.
     * @param {WebProviderError} value The error that has occurred.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.iwebaccountprovidersilentreportoperation.reportuserinteractionrequired
     */
    ReportUserInteractionRequiredWithError(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
