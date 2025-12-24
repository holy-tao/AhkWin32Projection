#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Represents a description of a media format.
 * @remarks
 * 
 * To create a new media type, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
 *       
 * 
 * All of the information in a media type is stored as attributes. To clone a media type, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-copyallitems">IMFAttributes::CopyAllItems</a>.
 *       
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmediatype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaType extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaType
     * @type {Guid}
     */
    static IID => Guid("{44ae0fa8-ea31-4109-8d2e-4cae4997c555}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMajorType", "IsCompressedFormat", "IsEqual", "GetRepresentation", "FreeRepresentation"]

    /**
     * Gets the major type of the format.
     * @returns {Guid} Receives the major type <b>GUID</b>. The major type describes the broad category of the format, such as audio or video. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediatype-getmajortype
     */
    GetMajorType() {
        pguidMajorType := Guid()
        result := ComCall(33, this, "ptr", pguidMajorType, "HRESULT")
        return pguidMajorType
    }

    /**
     * Queries whether the media type is a temporally compressed format.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the format uses temporal compression, or <b>FALSE</b> if the format does not use temporal compression.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediatype-iscompressedformat
     */
    IsCompressedFormat() {
        result := ComCall(34, this, "int*", &pfCompressed := 0, "HRESULT")
        return pfCompressed
    }

    /**
     * Compares two media types and determines whether they are identical. If they are not identical, the method indicates how the two formats differ.
     * @param {IMFMediaType} pIMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to compare.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags, indicating the degree of similarity between the two media types. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_MEDIATYPE_EQUAL_MAJOR_TYPES"></a><a id="mf_mediatype_equal_major_types"></a><dl>
     * <dt><b>MF_MEDIATYPE_EQUAL_MAJOR_TYPES</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The major types are the same. The major type is specified by the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-major-type-attribute">MF_MT_MAJOR_TYPE</a> attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_MEDIATYPE_EQUAL_FORMAT_TYPES"></a><a id="mf_mediatype_equal_format_types"></a><dl>
     * <dt><b>MF_MEDIATYPE_EQUAL_FORMAT_TYPES</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subtypes are the same, or neither media type has a subtype. The subtype is specified by the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-subtype-attribute">MF_MT_SUBTYPE</a> attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_MEDIATYPE_EQUAL_FORMAT_DATA"></a><a id="mf_mediatype_equal_format_data"></a><dl>
     * <dt><b>MF_MEDIATYPE_EQUAL_FORMAT_DATA</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attributes in one of the media types are a  subset of the attributes in the other, and the values of these attributes match, excluding the value of the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-user-data-attribute">MF_MT_USER_DATA</a>, <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-rate-range-min">MF_MT_FRAME_RATE_RANGE_MIN</a>,  and <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-rate-range-max">MF_MT_FRAME_RATE_RANGE_MAX</a> attributes.
     * 
     * Specifically, the method takes the media type with the smaller number of attributes and checks whether each attribute from that type is present in the other media type and has the same value (not including <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-user-data-attribute">MF_MT_USER_DATA</a>, <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-rate-range-min">MF_MT_FRAME_RATE_RANGE_MIN</a>,  and <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-rate-range-max">MF_MT_FRAME_RATE_RANGE_MAX</a>). 
     * 
     * To perform other comparisons, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-compare">IMFAttributes::Compare</a> method. For example, the <b>Compare</b> method can test for identical attributes, or test the intersection of the two attribute sets. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attributes_match_type">MF_ATTRIBUTES_MATCH_TYPE</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_MEDIATYPE_EQUAL_FORMAT_USER_DATA"></a><a id="mf_mediatype_equal_format_user_data"></a><dl>
     * <dt><b>MF_MEDIATYPE_EQUAL_FORMAT_USER_DATA</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user data is identical, or neither media type contains user data. User data is specified by the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-user-data-attribute">MF_MT_USER_DATA</a> attribute.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediatype-isequal
     */
    IsEqual(pIMediaType) {
        result := ComCall(35, this, "ptr", pIMediaType, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Retrieves an alternative representation of the media type. Currently only the DirectShow AM_MEDIA_TYPE structure is supported.
     * @param {Guid} guidRepresentation GUID that specifies the representation to retrieve. The following values are defined.
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_MEDIA_TYPE_REPRESENTATION"></a><a id="am_media_type_representation"></a><dl>
     * <dt><b>AM_MEDIA_TYPE_REPRESENTATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Convert the media type to a DirectShow <b>AM_MEDIA_TYPE</b> structure. The method selects the most appropriate format structure (<b>pbFormat</b>).
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_MFVideoFormat"></a><a id="format_mfvideoformat"></a><a id="FORMAT_MFVIDEOFORMAT"></a><dl>
     * <dt><b>FORMAT_MFVideoFormat</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Convert the media type to a DirectShow <b>AM_MEDIA_TYPE</b> structure with an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> format structure.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_VideoInfo"></a><a id="format_videoinfo"></a><a id="FORMAT_VIDEOINFO"></a><dl>
     * <dt><b>FORMAT_VideoInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Convert the media type to a DirectShow <b>AM_MEDIA_TYPE</b> structure with a <b>VIDEOINFOHEADER</b> format structure.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_VideoInfo2"></a><a id="format_videoinfo2"></a><a id="FORMAT_VIDEOINFO2"></a><dl>
     * <dt><b>FORMAT_VideoInfo2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Convert the media type to a DirectShow <b>AM_MEDIA_TYPE</b> structure with a <b>VIDEOINFOHEADER2</b> format structure.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Pointer<Void>} Receives a pointer to a structure that contains the representation. The method allocates the memory for the structure. The caller must release the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediatype-freerepresentation">IMFMediaType::FreeRepresentation</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediatype-getrepresentation
     */
    GetRepresentation(guidRepresentation) {
        result := ComCall(36, this, "ptr", guidRepresentation, "ptr*", &ppvRepresentation := 0, "HRESULT")
        return ppvRepresentation
    }

    /**
     * Frees memory that was allocated by the IMFMediaType::GetRepresentation method.
     * @param {Guid} guidRepresentation GUID that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediatype-getrepresentation">GetRepresentation</a> method.
     * @param {Pointer<Void>} pvRepresentation Pointer to the buffer that was returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediatype-getrepresentation">GetRepresentation</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediatype-freerepresentation
     */
    FreeRepresentation(guidRepresentation, pvRepresentation) {
        pvRepresentationMarshal := pvRepresentation is VarRef ? "ptr" : "ptr"

        result := ComCall(37, this, "ptr", guidRepresentation, pvRepresentationMarshal, pvRepresentation, "HRESULT")
        return result
    }
}
