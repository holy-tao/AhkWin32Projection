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
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<UInt16>} pwLanguageCount 
     * @returns {HRESULT} 
     */
    GetLanguageCount(dwOutputNum, pwLanguageCount) {
        result := ComCall(40, this, "uint", dwOutputNum, "ushort*", pwLanguageCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} wLanguage 
     * @param {PWSTR} pwszLanguageString 
     * @param {Pointer<UInt16>} pcchLanguageStringLength 
     * @returns {HRESULT} 
     */
    GetLanguage(dwOutputNum, wLanguage, pwszLanguageString, pcchLanguageStringLength) {
        pwszLanguageString := pwszLanguageString is String ? StrPtr(pwszLanguageString) : pwszLanguageString

        result := ComCall(41, this, "uint", dwOutputNum, "ushort", wLanguage, "ptr", pwszLanguageString, "ushort*", pcchLanguageStringLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdblFactor 
     * @returns {HRESULT} 
     */
    GetMaxSpeedFactor(pdblFactor) {
        result := ComCall(42, this, "double*", pdblFactor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfUsingFastCache 
     * @returns {HRESULT} 
     */
    IsUsingFastCache(pfUsingFastCache) {
        result := ComCall(43, this, "ptr", pfUsingFastCache, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszNameSpace 
     * @param {PWSTR} wszName 
     * @param {PWSTR} wszValue 
     * @returns {HRESULT} 
     */
    AddLogParam(wszNameSpace, wszName, wszValue) {
        wszNameSpace := wszNameSpace is String ? StrPtr(wszNameSpace) : wszNameSpace
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszValue := wszValue is String ? StrPtr(wszValue) : wszValue

        result := ComCall(44, this, "ptr", wszNameSpace, "ptr", wszName, "ptr", wszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SendLogParams() {
        result := ComCall(45, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCanSave 
     * @returns {HRESULT} 
     */
    CanSaveFileAs(pfCanSave) {
        result := ComCall(46, this, "ptr", pfCanSave, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelSaveFileAs() {
        result := ComCall(47, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer<UInt32>} pcchURL 
     * @returns {HRESULT} 
     */
    GetURL(pwszURL, pcchURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(48, this, "ptr", pwszURL, "uint*", pcchURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
