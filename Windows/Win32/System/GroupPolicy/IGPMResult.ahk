#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGPMStatusMsgCollection.ahk
#Include ..\Variant\VARIANT.ahk
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
     * @type {IGPMStatusMsgCollection} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {VARIANT} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * 
     * @returns {IGPMStatusMsgCollection} 
     */
    get_Status() {
        result := ComCall(7, this, "ptr*", &ppIGPMStatusMsgCollection := 0, "HRESULT")
        return IGPMStatusMsgCollection(ppIGPMStatusMsgCollection)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Result() {
        pvarResult := VARIANT()
        result := ComCall(8, this, "ptr", pvarResult, "HRESULT")
        return pvarResult
    }

    /**
     * Returns the overall status of a GPMC operation, such as a copy, restore, backup, or import. If no error occurred during the operation, the method returns a success code; otherwise the method returns a failure code.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmresult-overallstatus
     */
    OverallStatus() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
