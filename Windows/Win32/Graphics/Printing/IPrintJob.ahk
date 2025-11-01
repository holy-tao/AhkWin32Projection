#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintJob extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintJob
     * @type {Guid}
     */
    static IID => Guid("{b771dab8-1282-41b7-858c-f206e4d20577}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Id", "get_PrintedPages", "get_TotalPages", "get_Status", "get_SubmissionTime", "RequestCancel"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulID 
     * @returns {HRESULT} 
     */
    get_Id(pulID) {
        pulIDMarshal := pulID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulIDMarshal, pulID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulPages 
     * @returns {HRESULT} 
     */
    get_PrintedPages(pulPages) {
        pulPagesMarshal := pulPages is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulPagesMarshal, pulPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulPages 
     * @returns {HRESULT} 
     */
    get_TotalPages(pulPages) {
        pulPagesMarshal := pulPages is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulPagesMarshal, pulPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     */
    get_Status(pStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pSubmissionTime 
     * @returns {HRESULT} 
     */
    get_SubmissionTime(pSubmissionTime) {
        pSubmissionTimeMarshal := pSubmissionTime is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, pSubmissionTimeMarshal, pSubmissionTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestCancel() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
