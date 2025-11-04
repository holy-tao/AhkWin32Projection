#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowContent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowContent
     * @type {Guid}
     */
    static IID => Guid("{c18552ed-74ff-4fec-be07-4cfed29d4887}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContent", "get_ContentId", "get_DifferentiateContent"]

    /**
     * 
     * @param {ISideShowCapabilities} in_pICapabilities 
     * @param {Pointer<Integer>} out_pdwSize 
     * @param {Pointer<Pointer<Integer>>} out_ppbData 
     * @returns {HRESULT} 
     */
    GetContent(in_pICapabilities, out_pdwSize, out_ppbData) {
        out_pdwSizeMarshal := out_pdwSize is VarRef ? "uint*" : "ptr"
        out_ppbDataMarshal := out_ppbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", in_pICapabilities, out_pdwSizeMarshal, out_pdwSize, out_ppbDataMarshal, out_ppbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} out_pcontentId 
     * @returns {HRESULT} 
     */
    get_ContentId(out_pcontentId) {
        out_pcontentIdMarshal := out_pcontentId is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, out_pcontentIdMarshal, out_pcontentId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} out_pfDifferentiateContent 
     * @returns {HRESULT} 
     */
    get_DifferentiateContent(out_pfDifferentiateContent) {
        result := ComCall(5, this, "ptr", out_pfDifferentiateContent, "HRESULT")
        return result
    }
}
