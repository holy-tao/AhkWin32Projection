#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMImageInfo interface retrieves images stored in ID3v2 &#0034;APIC&#0034; (attached picture) frames in a file.
 * @remarks
 * 
 * If retrieving this interface from the metadata editor, you must wait until after the file has been opened to call <b>QueryInterface</b>. If you try to <b>QueryInterface</b> for <b>IWMImageInfo</b> before receiving the WMT_OPENED message in your <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> method, the call will fail.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmimageinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMImageInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMImageInfo
     * @type {Guid}
     */
    static IID => Guid("{9f0aa3b6-7267-4d89-88f2-ba915aa5c4c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImageCount", "GetImage"]

    /**
     * The GetImageCount method retrieves the number of images stored in a file using ID3v2 &#0034;APIC&#0034; frames. Images stored in the file using attributes in the Windows Media namespace, or any images stored in custom attributes, are not included in this count.
     * @returns {Integer} Pointer to the number of images.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmimageinfo-getimagecount
     */
    GetImageCount() {
        result := ComCall(3, this, "uint*", &pcImages := 0, "HRESULT")
        return pcImages
    }

    /**
     * The GetImage method retrieves an image stored in a file as an ID3v2 &#0034;APIC&#0034; metadata frame.
     * @param {Integer} wIndex <b>WORD</b> containing the image index. This is a number between zero, and one less than the image count retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmimageinfo-getimagecount">IWMImageInfo::GetImageCount</a>.
     * @param {Pointer<Integer>} pcchMIMEType Pointer to a <b>WORD</b> containing the length, in wide characters, of <i>pwszMIMEType</i>, including the terminating <b>NULL</b> character. On the first call to this method, pass <b>NULL</b> as <i>pwszMIMEType</i> to retrieve the required number of characters.
     * @param {PWSTR} pwszMIMEType Pointer to a wide-character <b>null</b>-terminated string containing the MIME Type associated with the image. Set to <b>NULL</b> on the first call and <i>pcchMIMEType</i> will be set to the number of wide characters, including the terminating <b>NULL</b>, in this string.
     * @param {Pointer<Integer>} pcchDescription Pointer to a <b>WORD</b> containing the length, in wide characters, of <i>pwszDescription</i>, including the terminating <b>NULL</b> character. On the first call to this method, pass <b>NULL</b> as <i>pwszDescription</i> to retrieve the required number of characters.
     * @param {PWSTR} pwszDescription Pointer to a wide-character <b>null</b>-terminated string containing the image description. Set to <b>NULL</b> on the first call and <i>pcchDescription</i> will be set to the number of wide characters, including the terminating <b>NULL</b>, in this string.
     * @param {Pointer<Integer>} pImageType 
     * @param {Pointer<Integer>} pcbImageData Pointer to a <b>DWORD</b> containing the length, in bytes, of the image pointed to by <i>pbImageData</i>. On the first call to this method, pass <b>NULL</b> as <i>pbImageData</i> to retrieve the required number of bytes.
     * @param {Pointer<Integer>} pbImageData Pointer to a <b>BYTE</b> buffer containing the image data. Set to <b>NULL</b> on the first call and <i>pcbImageData</i> will be set to the number of bytes in the buffer.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the following parameters is <b>NULL</b>.
     * 
     * <i>pcchMIMEType</i>
     * 
     * <b><i></i></b>
     * 
     * <i>pcbImageData</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the ID3 frames that should be in the file cannot be accessed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value referenced by one of the following parameters is less than the required buffer size for the corresponding output parameter.
     * 
     * <i>pcchMIMEType</i>
     * 
     * <i>pcchDescription</i>
     * 
     * <i>pcbImageData</i>
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmimageinfo-getimage
     */
    GetImage(wIndex, pcchMIMEType, pwszMIMEType, pcchDescription, pwszDescription, pImageType, pcbImageData, pbImageData) {
        pwszMIMEType := pwszMIMEType is String ? StrPtr(pwszMIMEType) : pwszMIMEType
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        pcchMIMETypeMarshal := pcchMIMEType is VarRef ? "ushort*" : "ptr"
        pcchDescriptionMarshal := pcchDescription is VarRef ? "ushort*" : "ptr"
        pImageTypeMarshal := pImageType is VarRef ? "ushort*" : "ptr"
        pcbImageDataMarshal := pcbImageData is VarRef ? "uint*" : "ptr"
        pbImageDataMarshal := pbImageData is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", wIndex, pcchMIMETypeMarshal, pcchMIMEType, "ptr", pwszMIMEType, pcchDescriptionMarshal, pcchDescription, "ptr", pwszDescription, pImageTypeMarshal, pImageType, pcbImageDataMarshal, pcbImageData, pbImageDataMarshal, pbImageData, "HRESULT")
        return result
    }
}
