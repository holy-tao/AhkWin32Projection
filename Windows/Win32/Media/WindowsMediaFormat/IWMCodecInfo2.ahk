#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamConfig.ahk
#Include .\IWMCodecInfo.ahk

/**
 * The IWMCodecInfo2 interface manages the retrieval of information about codecs. To access it, call QueryInterface on a profile manager object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmcodecinfo2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMCodecInfo2 extends IWMCodecInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecInfo2
     * @type {Guid}
     */
    static IID => Guid("{aa65e273-b686-4056-91ec-dd768d4df710}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodecName", "GetCodecFormatDesc"]

    /**
     * The GetCodecName method retrieves the name of a specified codec.
     * @param {Pointer<Guid>} guidType GUID identifying the major type of digital media. This must be one of the following constants.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMMEDIATYPE_Video</td>
     * <td>Specifies a video codec.</td>
     * </tr>
     * <tr>
     * <td>WMMEDIATYPE_Audio</td>
     * <td>Specifies an audio codec.</td>
     * </tr>
     * </table>
     * @param {Integer} dwCodecIndex <b>DWORD</b> containing the codec index ranging from zero to one less than the number of supported codecs of the type specified by <i>guidType</i>. To retrieve the number of individual codecs supporting a major type, use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecinfocount">IWMCodecInfo::GetCodecInfoCount</a> method.
     * @param {PWSTR} wszName Pointer to a wide-character <b>null</b>-terminated string that receives the codec name.
     * @param {Pointer<Integer>} pcchName On input, pointer to a <b>DWORD</b> containing the size, in wide characters, of the buffer <i>wszName</i>. On output, pointer to a variable containing the number of characters in <i>wszName</i>, including the terminating <b>null</b> character.
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
     * An invalid or <b>null</b> value has been passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmcodecinfo2-getcodecname
     */
    GetCodecName(guidType, dwCodecIndex, wszName, pcchName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", guidType, "uint", dwCodecIndex, "ptr", wszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * The GetCodecFormatDesc method retrieves a description of a specified codec format. This method also retrieves a stream configuration object containing the settings for the codec format.
     * @param {Pointer<Guid>} guidType GUID identifying the major type of digital media. This must be one of the following constants.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMMEDIATYPE_Video</td>
     * <td>Specifies a video codec.</td>
     * </tr>
     * <tr>
     * <td>WMMEDIATYPE_Audio</td>
     * <td>Specifies an audio codec.</td>
     * </tr>
     * </table>
     * @param {Integer} dwCodecIndex <b>DWORD</b> containing the codec index ranging from zero to one less than the number of supported codecs of the type specified by <i>guidType</i>. To retrieve the number of individual codecs supporting a major type, use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecinfocount">IWMCodecInfo::GetCodecInfoCount</a> method.
     * @param {Integer} dwFormatIndex <b>DWORD</b> containing the format index ranging from zero to one less than the number of supported formats. To retrieve the number of individual formats supported by a codec, use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecformatcount">IWMCodecInfo::GetCodecFormatCount</a> method.
     * @param {PWSTR} wszDesc Pointer to a wide-character <b>null</b>-terminated string containing the codec format description.
     * @param {Pointer<Integer>} pcchDesc On input, a pointer to the length of the <i>wszDesc</i> buffer. On output, a pointer to the length of the codec format description string, including the terminating <b>null</b> character.
     * @returns {IWMStreamConfig} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamconfig">IWMStreamConfig</a> interface of a stream configuration object containing the settings of the specified format. When calling <b>GetCodecFormatDesc</b> to retrieve the size of the description string, pass <b>NULL</b> for this parameter.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmcodecinfo2-getcodecformatdesc
     */
    GetCodecFormatDesc(guidType, dwCodecIndex, dwFormatIndex, wszDesc, pcchDesc) {
        wszDesc := wszDesc is String ? StrPtr(wszDesc) : wszDesc

        pcchDescMarshal := pcchDesc is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", guidType, "uint", dwCodecIndex, "uint", dwFormatIndex, "ptr*", &ppIStreamConfig := 0, "ptr", wszDesc, pcchDescMarshal, pcchDesc, "HRESULT")
        return IWMStreamConfig(ppIStreamConfig)
    }
}
