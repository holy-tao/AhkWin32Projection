#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamConfig2.ahk

/**
 * The IWMStreamConfig3 interface controls language settings for a stream.An IWMStreamConfig3 interface exists for every stream configuration object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstreamconfig3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStreamConfig3 extends IWMStreamConfig2{
    /**
     * The interface identifier for IWMStreamConfig3
     * @type {Guid}
     */
    static IID => Guid("{cb164104-3aa9-45a7-9ac9-4daee131d6e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {PWSTR} pwszLanguageString 
     * @param {Pointer<UInt16>} pcchLanguageStringLength 
     * @returns {HRESULT} 
     */
    GetLanguage(pwszLanguageString, pcchLanguageStringLength) {
        pwszLanguageString := pwszLanguageString is String ? StrPtr(pwszLanguageString) : pwszLanguageString

        result := ComCall(20, this, "ptr", pwszLanguageString, "ushort*", pcchLanguageStringLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszLanguageString 
     * @returns {HRESULT} 
     */
    SetLanguage(pwszLanguageString) {
        pwszLanguageString := pwszLanguageString is String ? StrPtr(pwszLanguageString) : pwszLanguageString

        result := ComCall(21, this, "ptr", pwszLanguageString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
