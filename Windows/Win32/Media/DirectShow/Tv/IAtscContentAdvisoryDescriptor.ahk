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
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetRatingRegionCount(pbVal) {
        result := ComCall(5, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetRecordRatingRegion(bIndex, pbVal) {
        result := ComCall(6, this, "char", bIndex, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetRecordRatedDimensions(bIndex, pbVal) {
        result := ComCall(7, this, "char", bIndex, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bIndexOuter 
     * @param {Integer} bIndexInner 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetRecordRatingDimension(bIndexOuter, bIndexInner, pbVal) {
        result := ComCall(8, this, "char", bIndexOuter, "char", bIndexInner, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bIndexOuter 
     * @param {Integer} bIndexInner 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetRecordRatingValue(bIndexOuter, bIndexInner, pbVal) {
        result := ComCall(9, this, "char", bIndexOuter, "char", bIndexInner, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Byte>} pbLength 
     * @param {Pointer<Byte>} ppText 
     * @returns {HRESULT} 
     */
    GetRecordRatingDescriptionText(bIndex, pbLength, ppText) {
        result := ComCall(10, this, "char", bIndex, "char*", pbLength, "char*", ppText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
