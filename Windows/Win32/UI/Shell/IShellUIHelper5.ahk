#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellUIHelper4.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellUIHelper5 extends IShellUIHelper4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellUIHelper5
     * @type {Guid}
     */
    static IID => Guid("{a2a08b09-103d-4d3f-b91c-ea455ca82efa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 67

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["msProvisionNetworks", "msReportSafeUrl", "msSiteModeRefreshBadge", "msSiteModeClearBadge", "msDiagnoseConnectionUILess", "msLaunchNetworkClientHelp", "msChangeDefaultBrowser"]

    /**
     * 
     * @param {BSTR} bstrProvisioningXml 
     * @param {Pointer<VARIANT>} puiResult 
     * @returns {HRESULT} 
     */
    msProvisionNetworks(bstrProvisioningXml, puiResult) {
        bstrProvisioningXml := bstrProvisioningXml is String ? BSTR.Alloc(bstrProvisioningXml).Value : bstrProvisioningXml

        result := ComCall(67, this, "ptr", bstrProvisioningXml, "ptr", puiResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msReportSafeUrl() {
        result := ComCall(68, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeRefreshBadge() {
        result := ComCall(69, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeClearBadge() {
        result := ComCall(70, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msDiagnoseConnectionUILess() {
        result := ComCall(71, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msLaunchNetworkClientHelp() {
        result := ComCall(72, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fChange 
     * @returns {HRESULT} 
     */
    msChangeDefaultBrowser(fChange) {
        result := ComCall(73, this, "short", fChange, "HRESULT")
        return result
    }
}
