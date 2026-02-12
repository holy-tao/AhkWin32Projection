#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFASFProfile.ahk
#Include .\IMFPresentationDescriptor.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to work with the header section of files conforming to the Advanced Systems Format (ASF) specification.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmcontainer/nn-wmcontainer-imfasfcontentinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFContentInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFContentInfo
     * @type {Guid}
     */
    static IID => Guid("{b1dca5cd-d5da-4451-8e9e-db5c59914ead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHeaderSize", "ParseHeader", "GenerateHeader", "GetProfile", "SetProfile", "GeneratePresentationDescriptor", "GetEncodingConfigurationPropertyStore"]

    /**
     * Retrieves the size of the header section of an Advanced Systems Format (ASF) file.
     * @remarks
     * The header of an ASF file or stream can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-parseheader">IMFASFContentInfo::ParseHeader</a> method to populate the ContentInfo object with the header information.
     * @param {IMFMediaBuffer} pIStartOfContent The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of a buffer object containing the beginning of ASF content. The size of the valid data in the buffer must be at least MFASF_MIN_HEADER_BYTES in bytes.
     * @returns {Integer} Receives the size, in bytes, of the header section of the content. The value includes the size of the ASF Header Object plus the size of the header section of the Data Object. Therefore, the resulting value is the offset to the start of the data packets in the ASF Data Object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getheadersize
     */
    GetHeaderSize(pIStartOfContent) {
        result := ComCall(3, this, "ptr", pIStartOfContent, "uint*", &cbHeaderSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cbHeaderSize
    }

    /**
     * Parses the information in an ASF header and uses that information to set values in the ContentInfo object. You can pass the entire header in a single buffer or send it in several pieces.
     * @remarks
     * If you pass the header in pieces, the ContentInfo object will keep references to the buffer objects until the entire header is parsed. Therefore, do not write over the buffers passed into this method.
     * 
     * The start of the Header object has the following layout in memory:
     * 
     * <table>
     * <tr>
     * <th>Field Name</th>
     * <th>Size in bytes</th>
     * </tr>
     * <tr>
     * <td>Object ID</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>Object Size</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>Number of Header Objects</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>Reserved1</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>Reserved2</td>
     * <td>1</td>
     * </tr>
     * </table>
     *  
     * 
     * The first call to <b>ParseHeader</b> reads everything up to and including Rerserved2, so it requires a minimum of 30 bytes. (Note that the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getheadersize">IMFASFContentInfo::GetHeaderSize</a> method reads only the Object ID and Object Size fields, so that method requires a minimum of 24 bytes.)
     * @param {IMFMediaBuffer} pIHeaderBuffer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of a buffer object containing some or all of the header. The buffer must contain at least 30 bytes, which is the size of the Header Object, not including the objects contained in the Header Object (that is, everything up to and including the Reserved2 field in the Header Object).
     * @param {Integer} cbOffsetWithinHeader Offset, in bytes, of the first byte in the buffer relative to the beginning of the header.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header is completely parsed and validated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_ASF_INVALIDDATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input buffer does not contain valid ASF data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_S_ASF_PARSEINPROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded, but the header passed was incomplete. This is the successful return code for all calls but the last one when passing the header in pieces.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcontainer/nf-wmcontainer-imfasfcontentinfo-parseheader
     */
    ParseHeader(pIHeaderBuffer, cbOffsetWithinHeader) {
        result := ComCall(4, this, "ptr", pIHeaderBuffer, "uint", cbOffsetWithinHeader, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Encodes the data in the MFASFContentInfo object into a binary Advanced Systems Format (ASF) header.
     * @remarks
     * The size received in the <i>pcbHeader</i> parameter includes the padding size. The content information shrinks or expands the padding data depending on the size of the ASF Header Objects.
     * 
     * During this call, the stream properties are set based on the encoding properties of the profile. These properties are available through the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmetadata">IMFMetadata</a> interface.
     * @param {IMFMediaBuffer} pIHeader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the buffer object that will receive the encoded header. Set to <b>NULL</b> to retrieve the size of the header.
     * @returns {Integer} Size of the encoded ASF header in bytes. If <i>pIHeader</i> is <b>NULL</b>, this value is set to the buffer size required to hold the encoded header.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcontainer/nf-wmcontainer-imfasfcontentinfo-generateheader
     */
    GenerateHeader(pIHeader) {
        result := ComCall(5, this, "ptr", pIHeader, "uint*", &pcbHeader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbHeader
    }

    /**
     * Retrieves an Advanced Systems Format (ASF) profile that describes the ASF content.
     * @remarks
     * The profile is set by calling either <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-setprofile">IMFASFContentInfo::SetProfile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-parseheader">IMFASFContentInfo::ParseHeader</a>.
     * 
     * The ASF profile object returned by this method does not include any of the <b>MF_PD_ASF_xxx</b> attributes (see <a href="https://docs.microsoft.com/windows/desktop/medfound/presentation-descriptor-attributes">Presentation Descriptor Attributes</a>). To get these attributes, do the following:
     * 
     * <ol>
     * <li>
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-generatepresentationdescriptor">IMFASFContentInfo::GeneratePresentationDescriptor</a> to get the ASF presentation descriptor. You can query the presentation descriptor for the <b>MF_PD_ASF_xxx</b> attributes.
     * 
     * </li>
     * <li>
     * (Optional.) Call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-mfcreateasfprofilefrompresentationdescriptor">MFCreateASFProfileFromPresentationDescriptor</a> to convert the presentation descriptor into an ASF profile. The profile object created by this function contains the <b>MF_PD_ASF_xxx</b> attributes.
     * 
     * </li>
     * </ol>
     * An ASF profile is a template for file encoding, and is intended mainly for creating ASF content. If you are reading an existing ASF file, it is recommended that you use the presentation descriptor to get information about the file. One exception is that the profile contains the mutual exclusion and stream prioritization objects, which are not exposed directly from the presentation descriptor.
     * @returns {IMFASFProfile} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface pointer. The caller must release the interface. If the object does not have an ASF profile, this parameter receives the value <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getprofile
     */
    GetProfile() {
        result := ComCall(6, this, "ptr*", &ppIProfile := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFASFProfile(ppIProfile)
    }

    /**
     * Uses profile data from a profile object to configure settings in the ContentInfo object.
     * @remarks
     * If there is already information in the ContentInfo object when this method is called, it is replaced by the information from the profile object.
     * @param {IMFASFProfile} pIProfile The <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface of the profile object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcontainer/nf-wmcontainer-imfasfcontentinfo-setprofile
     */
    SetProfile(pIProfile) {
        result := ComCall(7, this, "ptr", pIProfile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a presentation descriptor for ASF content.
     * @returns {IMFPresentationDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcontainer/nf-wmcontainer-imfasfcontentinfo-generatepresentationdescriptor
     */
    GeneratePresentationDescriptor() {
        result := ComCall(8, this, "ptr*", &ppIPresentationDescriptor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFPresentationDescriptor(ppIPresentationDescriptor)
    }

    /**
     * Retrieves a property store that can be used to set encoding properties.
     * @param {Integer} wStreamNumber Stream number to configure. Set to zero to configure file-level encoding properties.
     * @returns {IPropertyStore} Receives a pointer to the <b>IPropertyStore</b> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getencodingconfigurationpropertystore
     */
    GetEncodingConfigurationPropertyStore(wStreamNumber) {
        result := ComCall(9, this, "ushort", wStreamNumber, "ptr*", &ppIStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertyStore(ppIStore)
    }
}
