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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_Enabled(pbEnabled) {
        result := ComCall(11, this, "ptr", pbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_Enabled(bEnabled) {
        result := ComCall(12, this, "short", bEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulComponents 
     * @returns {HRESULT} 
     */
    get_Components(pulComponents) {
        result := ComCall(13, this, "uint*", pulComponents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulComponents 
     * @returns {HRESULT} 
     */
    put_Components(ulComponents) {
        result := ComCall(14, this, "uint", ulComponents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
