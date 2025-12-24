#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMCodecInfo2.ahk

/**
 * The IWMCodecInfo3 interface retrieves properties from a codec.You can retrieve a pointer to IWMCodecInfo3 with a call to the QueryInterface method of any other interface of the profile manager object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmcodecinfo3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMCodecInfo3 extends IWMCodecInfo2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecInfo3
     * @type {Guid}
     */
    static IID => Guid("{7e51f487-4d93-4f98-8ab4-27d0565adc51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodecFormatProp", "GetCodecProp", "SetCodecEnumerationSetting", "GetCodecEnumerationSetting"]

    /**
     * The GetCodecFormatProp method retrieves a property from one format of a codec.
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
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the name of the property to retrieve.
     * 
     * Currently only one codec format property is supported; it is listed in the following table. The format property determines the data type and value of the property; this information is included in the table.
     * 
     * <table>
     * <tr>
     * <th>Global constant
     *                 </th>
     * <th>Data type
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>g_wszSpeechCaps</td>
     * <td><b>WMT_TYPE_DWORD</b></td>
     * <td>The value is one from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_musicspeech_class_mode">WMT_MUSICSPEECH_CLASS_MODE</a> enumeration type indicating the supported mode of the format. This property applies only to the Windows Media Audio 9 Voice codec.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pType Pointer to a variable that will receive a member of the <b>WMT_ATTR_DATATYPE</b> enumeration type. This value specifies the type of information returned to the buffer pointed to by <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a buffer that will receive the value of the property. The data returned is of a type specified by <i>pType</i>.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> value specifying the length of the buffer pointed to by <i>pValue</i>.
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
     * <i>pszName</i> or <i>pType</i> or <i>pdwSize</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * <i>guidType</i> specifies an invalid input type.
     * 
     * OR
     * 
     * <i>pszName</i> specifies an invalid property name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmcodecinfo3-getcodecformatprop
     */
    GetCodecFormatProp(guidType, dwCodecIndex, dwFormatIndex, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", guidType, "uint", dwCodecIndex, "uint", dwFormatIndex, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    /**
     * The GetCodecProp method retrieves a codec property.
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
     * @param {PWSTR} pszName Pointer to a <b>null</b>-terminated string containing the name of the property to retrieve.
     * 
     * The following table lists the codec properties you can retrieve. The property dictates the data type and value; this information is also included in the table.
     * 
     * <table>
     * <tr>
     * <th>Global constant
     *                 </th>
     * <th>Data type
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>g_wszComplexityMax</td>
     * <td><b>WMT_TYPE_DWORD</b></td>
     * <td>The value is the maximum complexity value for the codec. Codec complexity applies only to video codecs. The range of complexity values is from 0 to this value.</td>
     * </tr>
     * <tr>
     * <td>g_wszComplexityOffline</td>
     * <td><b>WMT_TYPE_DWORD</b></td>
     * <td>The value is the suggested complexity value for the codec when encoding files for local playback. Codec complexity applies only to video codecs. The range of complexity values is from 0 to the value retrieved with g_wszComplexityMax.</td>
     * </tr>
     * <tr>
     * <td>g_wszComplexityLive</td>
     * <td><b>WMT_TYPE_DWORD</b></td>
     * <td>The value is the suggested complexity value for the codec when encoding files for streaming playback. Codec complexity applies only to video codecs. The range of complexity values is from 0 to the value retrieved with g_wszComplexityMax.</td>
     * </tr>
     * <tr>
     * <td>g_wszIsVBRSupported</td>
     * <td><b>WMT_TYPE_BOOL</b></td>
     * <td>The value indicates whether the codec supports VBR.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pType Pointer to a variable that will receive a member of the <b>WMT_ATTR_DATATYPE</b> enumeration type. This value specifies the type of information returned to the buffer at <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a buffer that will receive the value of the property. The data returned is of a type specified by <i>pType</i>.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> value specifying the length of the buffer at <i>pValue</i>.
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
     * <i>pszName</i> or <i>pType</i> or <i>pdwSize</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * <i>guidType</i> specifies an invalid input type.
     * 
     * OR
     * 
     * <i>pszName</i> specifies an invalid property name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmcodecinfo3-getcodecprop
     */
    GetCodecProp(guidType, dwCodecIndex, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", guidType, "uint", dwCodecIndex, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    /**
     * The SetCodecEnumerationSetting method sets the value of one codec enumeration setting. Codec enumeration settings dictate the codec formats that can be enumerated by the methods of IWMCodecInfo.
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
     * @param {PWSTR} pszName Pointer to a wide-character null-terminated string containing the name of the enumeration setting. Use one of the following constants.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>g_wszVBREnabled</td>
     * <td>Use to enumerate the supported codec formats that use variable bit rate (VBR) encoding.The value returned in <i>pValue</i> is a <b>BOOL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>g_wszNumPasses</td>
     * <td>Use to enumerate the supported codec formats that use a number of passes equal to the value in <i>pValue</i>.The value returned in <i>pValue</i> is a <b>DWORD</b> specifying the number of passes.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Type A <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> value specifying the data type of the value in <i>pValue</i>.
     * @param {Pointer<Integer>} pValue A pointer to a <b>BYTE</b> array containing the setting value.
     * @param {Integer} dwSize <b>DWORD</b> containing the size of the <i>pValue</i> <b>BYTE</b> array.
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
     * The method succeeded; the feature is supported by the codec.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_UNSUPPORTED_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration setting specified is not valid for the codec.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmcodecinfo3-setcodecenumerationsetting
     */
    SetCodecEnumerationSetting(guidType, dwCodecIndex, pszName, Type, pValue, dwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "ptr", guidType, "uint", dwCodecIndex, "ptr", pszName, "int", Type, pValueMarshal, pValue, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * The GetCodecEnumerationSetting method retrieves the current value for one codec enumeration setting.
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
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the name of the enumeration setting. Use one of the following constants.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>g_wszVBREnabled</td>
     * <td>Use to enumerate the supported codec formats that use variable bit rate (VBR) encoding.The value returned in <i>pValue</i> is a <b></b>BOOL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>g_wszNumPasses</td>
     * <td>Use to enumerate the supported codec formats that use a number of passes equal to the value in <i>pValue</i>.The value returned in <i>pValue</i> is a <b>DWORD</b> specifying the number of passes.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pType Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration value specifying the data type of the value returned in <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a <b>BYTE</b> array containing the codec enumeration data. The data type and meaning of the data returned in this array depends on the setting specified by <i>pszName</i>. You can set this value to <b>NULL</b> to retrieve the required size of the array in <i>pdwSize</i>.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> containing the size of the setting value in bytes. If you set <i>pValue</i> to <b>NULL</b>, this value will be set to the size required to hold the setting value.
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
     * <dt><b>NS_E_UNSUPPORTED_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration setting specified is not valid for the codec.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmcodecinfo3-getcodecenumerationsetting
     */
    GetCodecEnumerationSetting(guidType, dwCodecIndex, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", guidType, "uint", dwCodecIndex, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }
}
