#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced3.ahk

/**
 * The IWMReaderAdvanced4 interface provides additional functionality to the reader.An IWMReaderAdvanced4 interface exists for every reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderadvanced4
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
     * 
     * @param {Integer} dwOutputNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-getlanguagecount
     */
    GetLanguageCount(dwOutputNum) {
        result := ComCall(40, this, "uint", dwOutputNum, "ushort*", &pwLanguageCount := 0, "HRESULT")
        return pwLanguageCount
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} wLanguage 
     * @param {PWSTR} pwszLanguageString 
     * @param {Pointer<Integer>} pcchLanguageStringLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-getlanguage
     */
    GetLanguage(dwOutputNum, wLanguage, pwszLanguageString, pcchLanguageStringLength) {
        pwszLanguageString := pwszLanguageString is String ? StrPtr(pwszLanguageString) : pwszLanguageString

        pcchLanguageStringLengthMarshal := pcchLanguageStringLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(41, this, "uint", dwOutputNum, "ushort", wLanguage, "ptr", pwszLanguageString, pcchLanguageStringLengthMarshal, pcchLanguageStringLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-getmaxspeedfactor
     */
    GetMaxSpeedFactor() {
        result := ComCall(42, this, "double*", &pdblFactor := 0, "HRESULT")
        return pdblFactor
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-isusingfastcache
     */
    IsUsingFastCache() {
        result := ComCall(43, this, "int*", &pfUsingFastCache := 0, "HRESULT")
        return pfUsingFastCache
    }

    /**
     * 
     * @param {PWSTR} wszNameSpace 
     * @param {PWSTR} wszName 
     * @param {PWSTR} wszValue 
     * @returns {HRESULT} 
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-sendlogparams
     */
    SendLogParams() {
        result := ComCall(45, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-cansavefileas
     */
    CanSaveFileAs() {
        result := ComCall(46, this, "int*", &pfCanSave := 0, "HRESULT")
        return pfCanSave
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-cancelsavefileas
     */
    CancelSaveFileAs() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer<Integer>} pcchURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced4-geturl
     */
    GetURL(pwszURL, pcchURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pcchURLMarshal := pcchURL is VarRef ? "uint*" : "ptr"

        result := ComCall(48, this, "ptr", pwszURL, pcchURLMarshal, pcchURL, "HRESULT")
        return result
    }
}
