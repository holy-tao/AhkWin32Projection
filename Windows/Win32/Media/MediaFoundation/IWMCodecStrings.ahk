#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves names and descriptive strings for codecs and formats.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcodecstrings
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecStrings extends IUnknown{
    /**
     * The interface identifier for IWMCodecStrings
     * @type {Guid}
     */
    static IID => Guid("{a7b2504b-e58a-47fb-958b-cac7165a057d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @param {Integer} cchLength 
     * @param {PWSTR} szName 
     * @param {Pointer<UInt32>} pcchLength 
     * @returns {HRESULT} 
     */
    GetName(pmt, cchLength, szName, pcchLength) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", pmt, "uint", cchLength, "ptr", szName, "uint*", pcchLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @param {Integer} cchLength 
     * @param {PWSTR} szDescription 
     * @param {Pointer<UInt32>} pcchLength 
     * @returns {HRESULT} 
     */
    GetDescription(pmt, cchLength, szDescription, pcchLength) {
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(4, this, "ptr", pmt, "uint", cchLength, "ptr", szDescription, "uint*", pcchLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
