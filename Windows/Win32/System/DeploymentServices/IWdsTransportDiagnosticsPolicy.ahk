#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportCacheable.ahk

/**
 * Represents the diagnostics policy part of the WDS transport server's configuration.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportdiagnosticspolicy
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportDiagnosticsPolicy extends IWdsTransportCacheable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportDiagnosticsPolicy
     * @type {Guid}
     */
    static IID => Guid("{13b33efc-7856-4f61-9a59-8de67b6b87b6}")

    /**
     * The class identifier for WdsTransportDiagnosticsPolicy
     * @type {Guid}
     */
    static CLSID => Guid("{eb3333e1-a7ad-46f5-80d6-6b740204e509}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Enabled", "put_Enabled", "get_Components", "put_Components"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportdiagnosticspolicy-get_enabled
     */
    get_Enabled() {
        result := ComCall(11, this, "short*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportdiagnosticspolicy-put_enabled
     */
    put_Enabled(bEnabled) {
        result := ComCall(12, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportdiagnosticspolicy-get_components
     */
    get_Components() {
        result := ComCall(13, this, "uint*", &pulComponents := 0, "HRESULT")
        return pulComponents
    }

    /**
     * 
     * @param {Integer} ulComponents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportdiagnosticspolicy-put_components
     */
    put_Components(ulComponents) {
        result := ComCall(14, this, "uint", ulComponents, "HRESULT")
        return result
    }
}
