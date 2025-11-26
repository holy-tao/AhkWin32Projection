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
 * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iatsc_eit-getrecorddescriptorbytag">IATSC_EIT::GetRecordDescriptorByTag</a> and pass in the caption service descriptor tag (0x86). If the descriptor is present, the method returns an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> pointer.</li>
 * <li>Query the returned <b>IGenericDescriptor</b> pointer for the <b>ICaptionServiceDescriptor</b> interface.</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nn-atscpsipparser-icaptionservicedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ICaptionServiceDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICaptionServiceDescriptor
     * @type {Guid}
     */
    static IID => Guid("{40834007-6834-46f0-bd45-d5f6a6be258c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberOfServices", "GetLanguageCode", "GetCaptionServiceNumber", "GetCCType", "GetEasyReader", "GetWideAspectRatio"]

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the number of caption services.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getnumberofservices
     */
    GetNumberOfServices() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} bIndex Zero-based index of the caption service. To get the number of caption services, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getnumberofservices">ICaptionServiceDescriptor::GetNumberOfServices</a>.
     * @returns {Integer} Address of a 3-byte array that receives the ISO-639 language code.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getlanguagecode
     */
    GetLanguageCode(bIndex) {
        result := ComCall(4, this, "char", bIndex, "char*", &LangCode := 0, "HRESULT")
        return LangCode
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} bIndex Zero-based index of the caption service. To get the number of caption services, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getnumberofservices">ICaptionServiceDescriptor::GetNumberOfServices</a>.
     * @returns {Integer} Receives the caption_service_number field.
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getcaptionservicenumber
     */
    GetCaptionServiceNumber(bIndex) {
        result := ComCall(5, this, "char", bIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} bIndex Zero-based index of the caption service. To get the number of caption services, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getnumberofservices">ICaptionServiceDescriptor::GetNumberOfServices</a>.
     * @returns {Integer} Receives the cc_type flag:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>The caption service contains line-21 captions.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>The caption service contains DTVCC captions.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getcctype
     */
    GetCCType(bIndex) {
        result := ComCall(6, this, "char", bIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} bIndex Zero-based index of the caption service. To get the number of caption services, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getnumberofservices">ICaptionServiceDescriptor::GetNumberOfServices</a>.
     * @returns {Integer} Receives the easy_reader flag:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>The caption service does not contain "Easy Reader" captions.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>The caption service contains "Easy Reader" captions.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-geteasyreader
     */
    GetEasyReader(bIndex) {
        result := ComCall(7, this, "char", bIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} bIndex Zero-based index of the caption service. To get the number of caption services, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getnumberofservices">ICaptionServiceDescriptor::GetNumberOfServices</a>.
     * @returns {Integer} Receives the wide_aspect_ratio:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>The caption service is formatted for a 4:3 aspect ratio.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>The caption service is formatted for a 16:9 aspect ratio.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nf-atscpsipparser-icaptionservicedescriptor-getwideaspectratio
     */
    GetWideAspectRatio(bIndex) {
        result := ComCall(8, this, "char", bIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }
}
