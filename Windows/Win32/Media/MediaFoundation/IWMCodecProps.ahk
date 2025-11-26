#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that retrieve format-specific codec properties.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcodecprops
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecProps extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecProps
     * @type {Guid}
     */
    static IID => Guid("{2573e11a-f01a-4fdd-a98d-63b8e0ba9589}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormatProp", "GetCodecProp"]

    /**
     * Retrieves a format property for an output media type. Use this method to get information about enumerated audio formats.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt Pointer to the output media type.
     * @param {PWSTR} pszName Wide-character, null-terminated string containing the property name. The properties listed in the following table are supported only through the IWMCodecProps interface.
     * 
     * <table>
     * <tr>
     * <th>Property name constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="g_wszSpeechFormatCaps"></a><a id="g_wszspeechformatcaps"></a><a id="G_WSZSPEECHFORMATCAPS"></a><dl>
     * <dt><b>g_wszSpeechFormatCaps</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves the speech modes available for the format (used only by the Windows Media Audio 9 Voice codec). Value contains flags identical to the values used to specify the mode for <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-wmavoice-enc-musicspeechclassmodeproperty">MFPKEY_WMAVOICE_ENC_MusicSpeechClassMode</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The properties in the following list are also supported. They are used with <b>IPropertyBag</b> for video. 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-vbrenabledproperty">MFPKEY_VBRENABLED</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-vbrqualityproperty">MFPKEY_VBRQUALITY</a>
     * </li>
     * </ul>
     * @param {Pointer<Integer>} pType Address of a variable that receives the data type of the property value.
     * @param {Pointer<Integer>} pValue Address of the byte buffer that receives the property value.
     * @param {Pointer<Integer>} pdwSize Pointer to the size of the value buffer, in bytes. If pValue is <b>NULL</b>, the method will set this value to the size required.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcodecprops-getformatprop
     */
    GetFormatProp(pmt, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pmt, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    /**
     * Retrieves a codec property specific to an output format.
     * @param {Integer} dwFormat The output format to which the property applies. Set this value to the FOURCC value of the desired video format.
     * @param {PWSTR} pszName Wide-character, null-terminated string containing the property name. The properties listed in the following table are supported only through the IWMCodecProps interface.
     * 
     * <table>
     * <tr>
     * <th>Property name constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="g_wszWMCPCodecName"></a><a id="g_wszwmcpcodecname"></a><a id="G_WSZWMCPCODECNAME"></a><dl>
     * <dt><b>g_wszWMCPCodecName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves the name of the codec that is associated with the format (or FOURCC). This is an alternative to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-iwmcodecstrings">IWMCodecStrings</a> interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="g_wszWMCPSupportedVBRModes"></a><a id="g_wszwmcpsupportedvbrmodes"></a><a id="G_WSZWMCPSUPPORTEDVBRMODES"></a><dl>
     * <dt><b>g_wszWMCPSupportedVBRModes</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves the encoding modes supported by the codec. The value returned contains one or more of the following flags: 
     * 
     * <ul>
     * <li>WM_CODEC_ONEPASS_CBR </li>
     * <li>WM_CODEC_ONEPASS_VBR</li>
     * <li>WM_CODEC_TWOPASS_CBR</li>
     * <li>WM_CODEC_TWOPASS_VBR_UNCONSTRAINED </li>
     * <li>WM_CODEC_TWOPASS_VBR_PEAKCONSTRAINED </li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pType Address of a variable that receives the data type of the property value.
     * @param {Pointer<Integer>} pValue Address of the byte buffer that receives the property value.
     * @param {Pointer<Integer>} pdwSize Pointer to the size of the value buffer, in bytes. If pValue is <b>NULL</b>, the method will set this value to the size required.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcodecprops-getcodecprop
     */
    GetCodecProp(dwFormat, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwFormat, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }
}
