#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced3.ahk

/**
 * The IWMReaderAdvanced4 interface provides additional functionality to the reader.An IWMReaderAdvanced4 interface exists for every reader object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreaderadvanced4
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced4 extends IWMReaderAdvanced3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAdvanced4
     * @type {Guid}
     */
    static IID => Guid("{945a76a2-12ae-4d48-bd3c-cd1d90399b85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLanguageCount", "GetLanguage", "GetMaxSpeedFactor", "IsUsingFastCache", "AddLogParam", "SendLogParams", "CanSaveFileAs", "CancelSaveFileAs", "GetURL"]

    /**
     * The GetLanguageCount method retrieves the total number of languages supported by an output. Only outputs associated with streams mutually exclusive by language will have more than one supported language.
     * @remarks
     * This method should not be confused with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmlanguagelist-getlanguagecount">IWMLanguageList::GetLanguageCount</a>. This method retrieves supported languages for a specific output. The methods of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmlanguagelist">IWMLanguageList</a> interface manipulate a list of languages at the file level. An individual output might not support all of the languages in the language list.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @returns {Integer} Pointer to a <b>WORD</b> containing the language count.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-getlanguagecount
     */
    GetLanguageCount(dwOutputNum) {
        result := ComCall(40, this, "uint", dwOutputNum, "ushort*", &pwLanguageCount := 0, "HRESULT")
        return pwLanguageCount
    }

    /**
     * The GetLanguage method retrieves information about a language supported by an output. You must specify an output number and a language index, and this method will supply the RFC1766-compliant language string.
     * @remarks
     * When setting the language to use for an output, you must set the value of the <b>g_wszLanguage</b> setting to the language index passed to this method as <i>wLanguage</i>. Do not use the language index assigned by the language list, which will be different.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number for which you want to identify the language.
     * @param {Integer} wLanguage <b>WORD</b> containing the language index of the supported language for which you want the details.
     * @param {PWSTR} pwszLanguageString Pointer to a wide-character <b>null</b>-terminated string containing the RFC1766-compliant language string. Pass <b>NULL</b> to retrieve the size of the string, which will be returned in <i>pcbLanguageStringLength</i>.
     * @param {Pointer<Integer>} pcchLanguageStringLength Pointer to a <b>WORD</b> containing the size of <i>pwszLanguageString</i> in wide characters. This size includes the terminating <b>null</b> character.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-getlanguage
     */
    GetLanguage(dwOutputNum, wLanguage, pwszLanguageString, pcchLanguageStringLength) {
        pwszLanguageString := pwszLanguageString is String ? StrPtr(pwszLanguageString) : pwszLanguageString

        pcchLanguageStringLengthMarshal := pcchLanguageStringLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(41, this, "uint", dwOutputNum, "ushort", wLanguage, "ptr", pwszLanguageString, pcchLanguageStringLengthMarshal, pcchLanguageStringLength, "HRESULT")
        return result
    }

    /**
     * The GetMaxSpeedFactor method retrieves the maximum playback rate that can be delivered by the source. For network content, this value reflects the available bandwidth relative to the maximum bit rate of the content.
     * @remarks
     * If the server is using Fast Cache streaming, this method returns 1.0. For local files, including cached content, the method returns DBL_MAX. If no file is open, the method returns 0.0.
     * @returns {Float} Pointer to a variable that receives the maximum playback rate.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-getmaxspeedfactor
     */
    GetMaxSpeedFactor() {
        result := ComCall(42, this, "double*", &pdblFactor := 0, "HRESULT")
        return pdblFactor
    }

    /**
     * The IsUsingFastCache method queries whether the reader is using Fast Cache streaming.
     * @returns {BOOL} Pointer to a variable that receives a Boolean value. The value is True if the reader is currently using Fast Cache streaming, or False otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-isusingfastcache
     */
    IsUsingFastCache() {
        result := ComCall(43, this, "int*", &pfUsingFastCache := 0, "HRESULT")
        return pfUsingFastCache
    }

    /**
     * The AddLogParam method adds a named value to the logging information that the reader object will send to the sever.
     * @remarks
     * The reader object sends logging data to the server in the form of an XML stream. The <b>AddLogParam</b> method enables the client to specify additional logging entries. The <i>wszNameSpace</i> parameter can be used to specify an XML namespace for the new entry. If you do not specify a namespace, the default namespace is used. However, the reader will not override log entries already defined by the server, with the following exception: If the server specifies an empty string ("") for the cs-media-role or cs-media-name entry, you can overwrite these entries. By default, a server running Windows Media Services 9 Series sends an empty string for cs-media-role, and the name of the file for cs-media-name.
     * 
     * To send the logging information to the server, call the <b>SendLogParams</b> method. To retrieve the log entries on the server, you must provide a custom logging plug-in, using the Windows Media Services 9 Series SDK. The default logging plug-in writes just the W3C-compliant log summary, so custom log entries are not included in the log.
     * @param {PWSTR} wszNameSpace Optional wide-character string that contains the namespace for the log entry. This parameter can be <b>NULL</b>. Namespace names are limited to 1024 wide characters.
     * @param {PWSTR} wszName Wide-character string that contains the name of the log entry. Log entry names are limited to 1024 wide characters.
     * @param {PWSTR} wszValue Wide-character string that contains the value of the log entry. Log entry values are limited to 1024 wide characters.
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
     * One of the parameters exceeded the allowed string length.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-addlogparam
     */
    AddLogParam(wszNameSpace, wszName, wszValue) {
        wszNameSpace := wszNameSpace is String ? StrPtr(wszNameSpace) : wszNameSpace
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszValue := wszValue is String ? StrPtr(wszValue) : wszValue

        result := ComCall(44, this, "ptr", wszNameSpace, "ptr", wszName, "ptr", wszValue, "HRESULT")
        return result
    }

    /**
     * The SendLogParams method sends log entries to the originating server. Call this method after calling AddLogParam.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reader is not streaming content from a remote server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-sendlogparams
     */
    SendLogParams() {
        result := ComCall(45, this, "HRESULT")
        return result
    }

    /**
     * The CanSaveFileAs method ascertains whether the content being played by the reader can be saved using the IWMReaderAdvanced2::SaveFileAs method.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if that the content being read can be saved.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-cansavefileas
     */
    CanSaveFileAs() {
        result := ComCall(46, this, "int*", &pfCanSave := 0, "HRESULT")
        return pfCanSave
    }

    /**
     * The CancelSaveFileAs method cancels a file save resulting from a call to IWMReaderAdvanced2::SaveFileAs.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-cancelsavefileas
     */
    CancelSaveFileAs() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * The GetURL method retrieves the URL of the file being read. This URL might be different from the URL that was passed to IWMReader::Open, because the reader might have been redirected.
     * @remarks
     * Call this method twice. The first time, pass <b>NULL</b> as the value for <i>pwszURL</i>. The method returns the size of the string in the <i>pcchURL</i> parameter. Allocate the required amount of memory for the string and call the method again. This time, pass a pointer to the allocated buffer in the <i>pwszURL</i> parameter.
     * @param {PWSTR} pwszURL [ out ] Pointer to a wide-character <b>null</b>-terminated string containing the URL of the file.
     * @param {Pointer<Integer>} pcchURL [ in, out ] Pointer to a variable containing the number of wide characters in <i>pwszURL</i>.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-geturl
     */
    GetURL(pwszURL, pcchURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pcchURLMarshal := pcchURL is VarRef ? "uint*" : "ptr"

        result := ComCall(48, this, "ptr", pwszURL, pcchURLMarshal, pcchURL, "HRESULT")
        return result
    }
}
