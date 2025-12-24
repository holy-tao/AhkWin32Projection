#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPropertyVault interface provides methods to store and retrieve properties.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmpropertyvault
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMPropertyVault extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPropertyVault
     * @type {Guid}
     */
    static IID => Guid("{72995a79-5090-42a4-9c8c-d9d0b6d34be5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyCount", "GetPropertyByName", "SetProperty", "GetPropertyByIndex", "CopyPropertiesFrom", "Clear"]

    /**
     * The GetPropertyCount method retrieves a count of all the properties in the property vault.
     * @param {Pointer<Integer>} pdwCount Pointer to a <b>DWORD</b> that will receive the property count.
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
     * pdwCount is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpropertyvault-getpropertycount
     */
    GetPropertyCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * The GetPropertyByName method retrieves a property from the vault by its name.
     * @param {PWSTR} pszName Pointer to a <b>null</b>-terminated string containing the name of the property to be retrieved.
     * @param {Pointer<Integer>} pType Pointer to a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. This parameter specifies the type of data pointed to by <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a data buffer containing the value of the property. This value can be one of several types. The type of data that the buffer contains on output is specified by the value of <i>pType</i>.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> containing the size, in bytes, of the data at <i>pValue</i>.
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
     * <i>pszName</i> or <i>pdwSize</i> or <i>pType</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * <i>pszName</i> contains an invalid property name.
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
     * <i>pdwSize</i> specifies a size for <i>pValue</i> that is not large enough to hold the data.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpropertyvault-getpropertybyname
     */
    GetPropertyByName(pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    /**
     * The SetProperty method sets the values for a property. If the property named already exists in the property vault, SetProperty changes its value as specified. If the property named does not exist, SetProperty adds it to the property vault.
     * @param {PWSTR} pszName Pointer to a <b>null</b>-terminated string containing the name of the property to set.
     * 
     * The following table lists the property names supported by the <b>IWMPropertyVault</b> interface. The property used dictates the data type and meaning of the data pointed to by <i>pValue</i>; these values are also in the table. All of these values apply to stream configuration objects.
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
     * <td>g_wszOriginalSourceFormatTag</td>
     * <td><b>WMT_TYPE_WORD
     *                 </b></td>
     * <td>When transcoding with smart recompression, set to the <b>WAVEFORMATEX.wFormatTag</b> used in the original encoding.This value is now obsolete, use g_wszOriginalWaveFormat instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>g_wszOriginalWaveFormat</td>
     * <td><b>WMT_TYPE_BINARY
     *                 </b></td>
     * <td>When transcoding with smart recompression, set to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd757720(v=vs.85)">WAVEFORMATEX</a> structure used in the original encoding.</td>
     * </tr>
     * <tr>
     * <td>g_wszEDL</td>
     * <td><b>WMT_TYPE_STRING
     *                 </b></td>
     * <td>For Windows Media Audio 9 Voice streams, use to manually specify sections of the stream that contain music. This property should only be used if the automatic selection by the codec is creating a poor quality stream.</td>
     * </tr>
     * <tr>
     * <td>g_wszComplexity</td>
     * <td><b>WMT_TYPE_WORD
     *                 </b></td>
     * <td>Set to the complexity setting desired. You can find the complexity levels supported by a codec by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo3-getcodecprop">IWMCodecInfo3::GetCodecProp</a>.</td>
     * </tr>
     * <tr>
     * <td>g_wszDecoderComplexityRequested</td>
     * <td><b>WMT_TYPE_STRING
     *                 </b></td>
     * <td>Set to the string value of the device conformance template that you would like the stream to be encoded to. For audio there is only one string value, for video, us the two-letter designation before the ampersand. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/device-conformance-template-parameters">Device Conformance Template Parameters</a>.</td>
     * </tr>
     * <tr>
     * <td>g_wszPeakValue</td>
     * <td><b>WMT_TYPE_DWORD
     *                 </b></td>
     * <td>Set to the peak volume level by the audio codec. Used for normalization. Do not manually set.</td>
     * </tr>
     * <tr>
     * <td>g_wszAverageLevel</td>
     * <td><b>WMT_TYPE_DWORD
     *                 </b></td>
     * <td>Set to the average volume level by the audio codec. Used for normalization. Do not manually set.</td>
     * </tr>
     * <tr>
     * <td>g_wszFold6To2Channels3</td>
     * <td><b>WMT_TYPE_STRING
     *                 </b></td>
     * <td>Set to the value for 6 to 2 channel fold down. Use for multichannel audio.</td>
     * </tr>
     * <tr>
     * <td>g_wszFoldToChannelsTemplate</td>
     * <td><b>WMT_TYPE_STRING
     *                 </b></td>
     * <td>Template string to create other fold down values.</td>
     * </tr>
     * <tr>
     * <td>g_wszMusicSpeechClassMode</td>
     * <td><b>WMT_TYPE_STRING
     *                 </b></td>
     * <td>Set to the type of encoding you want to use with the Windows Media Audio 9 Voice codec. Can be set to:g_wszMusicClassMode
     * 
     * g_wszSpeechClassMode
     * 
     * g_wszMixedClassMode
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * In addition to the values in the table, the settings for variable bit rate encoding are set using this method. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/configuring-vbr-streams">Configuring VBR Streams</a>.
     * @param {Integer} pType Pointer to a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. This parameter specifies the type of data pointed to by <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a data buffer containing the value of the property. This value can be one of several types. The type of data that the buffer contains on output is specified by the value of <i>pType</i>.
     * @param {Integer} dwSize <b>DWORD</b> containing the size, in bytes, of the data at <i>pValue</i>.
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
     * <i>pszName</i> is <b>NULL</b> or points to a zero length string.
     * 
     * OR
     * 
     * The type specified at <i>pValue</i> does not agree with the size in bytes specified by <i>dwSize</i>.
     * 
     * OR
     * 
     * You are trying to delete a property that does not exist in the property vault.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method cannot allocate memory for a new property.
     * 
     * OR
     * 
     * The method cannot allocate memory for a new value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpropertyvault-setproperty
     */
    SetProperty(pszName, pType, pValue, dwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "ptr", pszName, "int", pType, pValueMarshal, pValue, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * The GetPropertyByIndex method retrieves a property from the vault by its index value.
     * @param {Integer} dwIndex <b>DWORD</b> containing the property index.
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the name of the property.
     * @param {Pointer<Integer>} pdwNameLen On input, a pointer to a <b>DWORD</b> containing the length, in wide characters, of the string at <i>pszName</i>. On output, specifies the number of characters, including the terminating <b>null</b> character, required to hold the property name.
     * @param {Pointer<Integer>} pType Pointer to a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. This parameter specifies the type of data pointed to by <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a data buffer containing the value of the property. This value can be one of several types. The type of data that the buffer contains on output is specified by the value of <i>pType</i>.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> containing the size, in bytes, of the data at <i>pValue</i>.
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
     * <i>pdwNameLen</i> or <i>pdwSize</i> or <i>pType</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * The index specified is not valid.
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
     * One of the buffers (<i>pszName</i> or <i>pValue</i>) is not big enough to hold the property information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpropertyvault-getpropertybyindex
     */
    GetPropertyByIndex(dwIndex, pszName, pdwNameLen, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pdwNameLenMarshal := pdwNameLen is VarRef ? "uint*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwIndex, "ptr", pszName, pdwNameLenMarshal, pdwNameLen, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    /**
     * The CopyPropertiesFrom method copies all of the properties from another property vault to this one.
     * @param {IWMPropertyVault} pIWMPropertyVault Pointer to an <b>IWMPropertyVault</b> interface.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate memory needed to copy.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpropertyvault-copypropertiesfrom
     */
    CopyPropertiesFrom(pIWMPropertyVault) {
        result := ComCall(7, this, "ptr", pIWMPropertyVault, "HRESULT")
        return result
    }

    /**
     * The Clear method removes all items from the property vault.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpropertyvault-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
