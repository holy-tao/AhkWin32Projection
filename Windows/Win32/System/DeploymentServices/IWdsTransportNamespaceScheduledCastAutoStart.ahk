#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportNamespaceScheduledCast.ahk

/**
 * An administrator can specify criteria that starts transmission on an object of an IWdsTransportNamespaceScheduledCastAutoStart interface automatically. Applications can continue to join sessions of the namespace object until these criteria are reached.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespacescheduledcastautostart
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportNamespaceScheduledCastAutoStart extends IWdsTransportNamespaceScheduledCast{
    /**
     * The interface identifier for IWdsTransportNamespaceScheduledCastAutoStart
     * @type {Guid}
     */
    static IID => Guid("{d606af3d-ea9c-4219-961e-7491d618d9b9}")

    /**
     * The class identifier for WdsTransportNamespaceScheduledCastAutoStart
     * @type {Guid}
     */
    static CLSID => Guid("{a1107052-122c-4b81-9b7c-386e6855383f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * 
     * @param {Pointer<UInt32>} pulMinimumClients 
     * @returns {HRESULT} 
     */
    get_MinimumClients(pulMinimumClients) {
        result := ComCall(29, this, "uint*", pulMinimumClients, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulMinimumClients 
     * @returns {HRESULT} 
     */
    put_MinimumClients(ulMinimumClients) {
        result := ComCall(30, this, "uint", ulMinimumClients, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pStartTime 
     * @returns {HRESULT} 
     */
    get_StartTime(pStartTime) {
        result := ComCall(31, this, "double*", pStartTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} StartTime 
     * @returns {HRESULT} 
     */
    put_StartTime(StartTime) {
        result := ComCall(32, this, "double", StartTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
