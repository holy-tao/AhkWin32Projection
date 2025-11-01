#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetProtocolSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocolSink
     * @type {Guid}
     */
    static IID => Guid("{79eac9e5-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Switch", "ReportProgress", "ReportData", "ReportResult"]

    /**
     * 
     * @param {Pointer<PROTOCOLDATA>} pProtocolData 
     * @returns {HRESULT} 
     */
    Switch(pProtocolData) {
        result := ComCall(3, this, "ptr", pProtocolData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStatusCode 
     * @param {PWSTR} szStatusText 
     * @returns {HRESULT} 
     */
    ReportProgress(ulStatusCode, szStatusText) {
        szStatusText := szStatusText is String ? StrPtr(szStatusText) : szStatusText

        result := ComCall(4, this, "uint", ulStatusCode, "ptr", szStatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfBSCF 
     * @param {Integer} ulProgress 
     * @param {Integer} ulProgressMax 
     * @returns {HRESULT} 
     */
    ReportData(grfBSCF, ulProgress, ulProgressMax) {
        result := ComCall(5, this, "uint", grfBSCF, "uint", ulProgress, "uint", ulProgressMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrResult 
     * @param {Integer} dwError 
     * @param {PWSTR} szResult 
     * @returns {HRESULT} 
     */
    ReportResult(hrResult, dwError, szResult) {
        szResult := szResult is String ? StrPtr(szResult) : szResult

        result := ComCall(6, this, "int", hrResult, "uint", dwError, "ptr", szResult, "HRESULT")
        return result
    }
}
