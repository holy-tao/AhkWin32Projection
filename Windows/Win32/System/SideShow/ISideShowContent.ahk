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
     * @type {Integer} 
     */
    ContentId {
        get => this.get_ContentId()
    }

    /**
     * @type {BOOL} 
     */
    DifferentiateContent {
        get => this.get_DifferentiateContent()
    }

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
     * @returns {Integer} 
     */
    get_ContentId() {
        result := ComCall(4, this, "uint*", &out_pcontentId := 0, "HRESULT")
        return out_pcontentId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_DifferentiateContent() {
        result := ComCall(5, this, "int*", &out_pfDifferentiateContent := 0, "HRESULT")
        return out_pfDifferentiateContent
    }
}
