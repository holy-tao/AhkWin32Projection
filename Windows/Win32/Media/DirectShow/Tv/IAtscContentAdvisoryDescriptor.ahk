#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @remarks
 * 
  * To obtain a pointer to this interface, do the following:
  * 
  * <ol>
  * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatscpsipparser-geteit">IAtscPsipParser::GetEIT</a> to get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iatsc_eit">IATSC_EIT</a> interface.</li>
  * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecorddescriptorbytag">IATSC_EIT::GetRecordDescriptorByTag</a> and pass in the content advisory descriptor tag (0x87). If the descriptor is present, the method returns an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> pointer.</li>
  * <li>Query the returned <b>IGenericDescriptor</b> pointer for the <b>IAtscContentAdvisoryDescriptor</b> interface.</li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nn-atscpsipparser-iatsccontentadvisorydescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAtscContentAdvisoryDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAtscContentAdvisoryDescriptor
     * @type {Guid}
     */
    static IID => Guid("{ff76e60c-0283-43ea-ba32-b422238547ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetRatingRegionCount", "GetRecordRatingRegion", "GetRecordRatedDimensions", "GetRecordRatingDimension", "GetRecordRatingValue", "GetRecordRatingDescriptionText"]

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsccontentadvisorydescriptor-gettag
     */
    GetTag(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsccontentadvisorydescriptor-getlength
     */
    GetLength(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsccontentadvisorydescriptor-getratingregioncount
     */
    GetRatingRegionCount(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsccontentadvisorydescriptor-getrecordratingregion
     */
    GetRecordRatingRegion(bIndex, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "char", bIndex, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsccontentadvisorydescriptor-getrecordrateddimensions
     */
    GetRecordRatedDimensions(bIndex, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "char", bIndex, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndexOuter 
     * @param {Integer} bIndexInner 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsccontentadvisorydescriptor-getrecordratingdimension
     */
    GetRecordRatingDimension(bIndexOuter, bIndexInner, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "char", bIndexOuter, "char", bIndexInner, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndexOuter 
     * @param {Integer} bIndexInner 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsccontentadvisorydescriptor-getrecordratingvalue
     */
    GetRecordRatingValue(bIndexOuter, bIndexInner, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "char", bIndexOuter, "char", bIndexInner, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Integer>} pbLength 
     * @param {Pointer<Pointer<Integer>>} ppText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsccontentadvisorydescriptor-getrecordratingdescriptiontext
     */
    GetRecordRatingDescriptionText(bIndex, pbLength, ppText) {
        pbLengthMarshal := pbLength is VarRef ? "char*" : "ptr"
        ppTextMarshal := ppText is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "char", bIndex, pbLengthMarshal, pbLength, ppTextMarshal, ppText, "HRESULT")
        return result
    }
}
