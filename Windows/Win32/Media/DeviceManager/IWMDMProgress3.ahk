#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMProgress2.ahk

/**
 * The optional, application-implemented IWMDMProgress3 interface extends IWMDMProgress2 by providing additional input parameters to specify which event is being monitored, and to allow for context-specific information.Applications that implement this callback interface should provide an implementation for methods corresponding to IWMDMProgress and IWMDMProgress2 for backward compatibility, in addition to the new methods.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmprogress3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMProgress3 extends IWMDMProgress2{
    /**
     * The interface identifier for IWMDMProgress3
     * @type {Guid}
     */
    static IID => Guid("{21de01cb-3bb4-4929-b21a-17af3f80f658}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Guid>} EventId 
     * @param {Integer} dwEstimatedTicks 
     * @param {Pointer<OPAQUECOMMAND>} pContext 
     * @returns {HRESULT} 
     */
    Begin3(EventId, dwEstimatedTicks, pContext) {
        result := ComCall(7, this, "ptr", EventId, "uint", dwEstimatedTicks, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} EventId 
     * @param {Integer} dwTranspiredTicks 
     * @param {Pointer<OPAQUECOMMAND>} pContext 
     * @returns {HRESULT} 
     */
    Progress3(EventId, dwTranspiredTicks, pContext) {
        result := ComCall(8, this, "ptr", EventId, "uint", dwTranspiredTicks, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} EventId 
     * @param {HRESULT} hrCompletionCode 
     * @param {Pointer<OPAQUECOMMAND>} pContext 
     * @returns {HRESULT} 
     */
    End3(EventId, hrCompletionCode, pContext) {
        result := ComCall(9, this, "ptr", EventId, "int", hrCompletionCode, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
