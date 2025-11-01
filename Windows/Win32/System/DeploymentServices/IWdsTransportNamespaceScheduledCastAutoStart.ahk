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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinimumClients", "put_MinimumClients", "get_StartTime", "put_StartTime"]

    /**
     * 
     * @param {Pointer<Integer>} pulMinimumClients 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcastautostart-get_minimumclients
     */
    get_MinimumClients(pulMinimumClients) {
        pulMinimumClientsMarshal := pulMinimumClients is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, pulMinimumClientsMarshal, pulMinimumClients, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulMinimumClients 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcastautostart-put_minimumclients
     */
    put_MinimumClients(ulMinimumClients) {
        result := ComCall(30, this, "uint", ulMinimumClients, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pStartTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcastautostart-get_starttime
     */
    get_StartTime(pStartTime) {
        pStartTimeMarshal := pStartTime is VarRef ? "double*" : "ptr"

        result := ComCall(31, this, pStartTimeMarshal, pStartTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} StartTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcastautostart-put_starttime
     */
    put_StartTime(StartTime) {
        result := ComCall(32, this, "double", StartTime, "HRESULT")
        return result
    }
}
