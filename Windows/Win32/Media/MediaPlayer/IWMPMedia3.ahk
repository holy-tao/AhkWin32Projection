#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPMedia2.ahk

/**
 * The IWMPMedia3 interface provides methods that supplement the IWMPMedia2 interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpmedia3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMedia3 extends IWMPMedia2{
    /**
     * The interface identifier for IWMPMedia3
     * @type {Guid}
     */
    static IID => Guid("{f118efc7-f03a-4fb4-99c9-1c02a5c1065b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {BSTR} bstrType 
     * @param {BSTR} bstrLanguage 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    getAttributeCountByType(bstrType, bstrLanguage, plCount) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(26, this, "ptr", bstrType, "ptr", bstrLanguage, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrType 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} lIndex 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    getItemInfoByType(bstrType, bstrLanguage, lIndex, pvarValue) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(27, this, "ptr", bstrType, "ptr", bstrLanguage, "int", lIndex, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
