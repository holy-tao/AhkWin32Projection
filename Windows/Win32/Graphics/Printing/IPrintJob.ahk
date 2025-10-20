#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintJob extends IUnknown{
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
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulID 
     * @returns {HRESULT} 
     */
    get_Id(pulID) {
        result := ComCall(4, this, "uint*", pulID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulPages 
     * @returns {HRESULT} 
     */
    get_PrintedPages(pulPages) {
        result := ComCall(5, this, "uint*", pulPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulPages 
     * @returns {HRESULT} 
     */
    get_TotalPages(pulPages) {
        result := ComCall(6, this, "uint*", pulPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    get_Status(pStatus) {
        result := ComCall(7, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pSubmissionTime 
     * @returns {HRESULT} 
     */
    get_SubmissionTime(pSubmissionTime) {
        result := ComCall(8, this, "double*", pSubmissionTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestCancel() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
