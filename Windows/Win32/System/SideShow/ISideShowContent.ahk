#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowContent extends IUnknown{
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
     * 
     * @param {Pointer<ISideShowCapabilities>} in_pICapabilities 
     * @param {Pointer<UInt32>} out_pdwSize 
     * @param {Pointer<Byte>} out_ppbData 
     * @returns {HRESULT} 
     */
    GetContent(in_pICapabilities, out_pdwSize, out_ppbData) {
        result := ComCall(3, this, "ptr", in_pICapabilities, "uint*", out_pdwSize, "char*", out_ppbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} out_pcontentId 
     * @returns {HRESULT} 
     */
    get_ContentId(out_pcontentId) {
        result := ComCall(4, this, "uint*", out_pcontentId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} out_pfDifferentiateContent 
     * @returns {HRESULT} 
     */
    get_DifferentiateContent(out_pfDifferentiateContent) {
        result := ComCall(5, this, "ptr", out_pfDifferentiateContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
