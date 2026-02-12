#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamConfig.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMCodecInfo interface retrieves the number and types of codecs available.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmcodecinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMCodecInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecInfo
     * @type {Guid}
     */
    static IID => Guid("{a970f41e-34de-4a98-b3ba-e4b3ca7528f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodecInfoCount", "GetCodecFormatCount", "GetCodecFormat"]

    /**
     * The GetCodecInfoCount method retrieves the number of supported codecs for a specified major type of digital media (audio or video).
     * @remarks
     * Use this method along with <b>GetCodecFormatCount</b> and <b>GetCodecFormat</b> to enumerate through the supported codecs for each media type, and the supported formats for each codec.
     * 
     * The Windows Media Format SDK provides codecs only for audio and video. If you specify another major type, this method will return an error.
     * @param {Pointer<Guid>} guidType <b>GUID</b> identifying the major type of digital media. This must be one of the following constants.
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
     * @returns {Integer} Pointer to a count of supported codecs.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecinfocount
     */
    GetCodecInfoCount(guidType) {
        result := ComCall(3, this, "ptr", guidType, "uint*", &pcCodecs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcCodecs
    }

    /**
     * The GetCodecFormatCount method retrieves the number of formats supported by the specified codec. Each codec format is a stream configuration that is valid for use with the codec.
     * @remarks
     * Use this method along with <b>GetCodecFormat</b> to enumerate the formats supported by the codec.
     * 
     * The Windows Media Format SDK provides codecs only for audio and video. If you specify another major type, this method will return an error.
     * 
     * You do not need to call this method for the Windows Media Video codecs; each video codec supports only a single format. For more information see <a href="https://docs.microsoft.com/windows/desktop/wmformat/configuring-video-streams">Configuring Video Streams</a>.
     * @param {Pointer<Guid>} guidType <b>GUID</b> identifying the major type of digital media. This must be one of the following constants.
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
     * @param {Integer} dwCodecIndex <b>DWORD</b> containing the codec index ranging from zero to one less than the number of supported codecs of the type specified by <i>guidType</i>. To retrieve the number of individual codecs supporting a major media type, use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecinfocount">IWMCodecInfo::GetCodecInfoCount</a> method.
     * @returns {Integer} Pointer to a count of the formats supported by the codec.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecformatcount
     */
    GetCodecFormatCount(guidType, dwCodecIndex) {
        result := ComCall(4, this, "ptr", guidType, "uint", dwCodecIndex, "uint*", &pcFormat := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcFormat
    }

    /**
     * The GetCodecFormat method retrieves one format supported by a specified codec. This method retrieves a pointer to the IWMStreamConfig interface of a stream configuration object containing the stream settings for the supported format.
     * @remarks
     * Use this method along with <b>GetCodecFormatCount</b> to enumerate the formats supported by the codec.
     * 
     * The codec format describes the characteristics of the compressed data stream in the file, and has no direct correlation to the uncompressed format of the input media or the output media. The format of input media data is determined at the time of encoding, using the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setinputprops">IWMWriter::SetInputProps</a> method. The format of output media data is determined at the time of decoding, using the <b>SetOutputProps</b> method of either the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreader">IWMReader</a> interface or the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmsyncreader">IWMSyncReader</a> interface.
     * 
     * The Windows Media Format SDK provides codecs only for audio and video. If you specify another major type, this method will return an error.
     * 
     * The Windows Media Video codecs all support a single format that you must complete with your desired settings. When obtaining a video format, you can always use format index 1. For more information see <a href="https://docs.microsoft.com/windows/desktop/wmformat/configuring-video-streams">Configuring Video Streams</a>.
     * @param {Pointer<Guid>} guidType <b>GUID</b> identifying the major type of digital media. This must be one of the following constants.
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
     * @returns {IWMStreamConfig} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamconfig">IWMStreamConfig</a> interface of a stream configuration object containing the settings of the specified format.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecformat
     */
    GetCodecFormat(guidType, dwCodecIndex, dwFormatIndex) {
        result := ComCall(5, this, "ptr", guidType, "uint", dwCodecIndex, "uint", dwFormatIndex, "ptr*", &ppIStreamConfig := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMStreamConfig(ppIStreamConfig)
    }
}
