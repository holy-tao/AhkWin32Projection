#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(3, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(4, this, "uint*", &pulID := 0, "HRESULT")
        return pulID
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrintedPages() {
        result := ComCall(5, this, "uint*", &pulPages := 0, "HRESULT")
        return pulPages
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalPages() {
        result := ComCall(6, this, "uint*", &pulPages := 0, "HRESULT")
        return pulPages
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(7, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SubmissionTime() {
        result := ComCall(8, this, "double*", &pSubmissionTime := 0, "HRESULT")
        return pSubmissionTime
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
