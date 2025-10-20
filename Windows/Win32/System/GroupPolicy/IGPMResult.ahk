#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMResult interface contains methods to retrieve status message information while performing various types of GPO processing operations such as restore, import, copy and backup.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmresult
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMResult
     * @type {Guid}
     */
    static IID => Guid("{86dff7e9-f76f-42ab-9570-cebc6be8a52d}")

    /**
     * The class identifier for GPMResult
     * @type {Guid}
     */
    static CLSID => Guid("{92101ac0-9287-4206-a3b2-4bdb73d225f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Result", "OverallStatus"]

    /**
     * 
     * @param {Pointer<IGPMStatusMsgCollection>} ppIGPMStatusMsgCollection 
     * @returns {HRESULT} 
     */
    get_Status(ppIGPMStatusMsgCollection) {
        result := ComCall(7, this, "ptr*", ppIGPMStatusMsgCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarResult 
     * @returns {HRESULT} 
     */
    get_Result(pvarResult) {
        result := ComCall(8, this, "ptr", pvarResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmresult-overallstatus
     */
    OverallStatus() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
