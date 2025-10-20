#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMProfileManagerLanguage interface controls the language of the system profiles parsed by the profile manager.An IWMProfileManagerLanguage interface exists for every profile manager object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmprofilemanagerlanguage
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProfileManagerLanguage extends IUnknown{
    /**
     * The interface identifier for IWMProfileManagerLanguage
     * @type {Guid}
     */
    static IID => Guid("{ba4dcc78-7ee0-4ab8-b27a-dbce8bc51454}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt16>} wLangID 
     * @returns {HRESULT} 
     */
    GetUserLanguageID(wLangID) {
        result := ComCall(3, this, "ushort*", wLangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wLangID 
     * @returns {HRESULT} 
     */
    SetUserLanguageID(wLangID) {
        result := ComCall(4, this, "ushort", wLangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
