#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPControls2.ahk

/**
 * The IWMPControls3 interface provides methods that supplement the IWMPControls2 interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcontrols3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPControls3 extends IWMPControls2{
    /**
     * The interface identifier for IWMPControls3
     * @type {Guid}
     */
    static IID => Guid("{a1d1110e-d545-476a-9a78-ac3e4cb1e6bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_audioLanguageCount(plCount) {
        result := ComCall(24, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Int32>} plLangID 
     * @returns {HRESULT} 
     */
    getAudioLanguageID(lIndex, plLangID) {
        result := ComCall(25, this, "int", lIndex, "int*", plLangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrLangDesc 
     * @returns {HRESULT} 
     */
    getAudioLanguageDescription(lIndex, pbstrLangDesc) {
        result := ComCall(26, this, "int", lIndex, "ptr", pbstrLangDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plLangID 
     * @returns {HRESULT} 
     */
    get_currentAudioLanguage(plLangID) {
        result := ComCall(27, this, "int*", plLangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLangID 
     * @returns {HRESULT} 
     */
    put_currentAudioLanguage(lLangID) {
        result := ComCall(28, this, "int", lLangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plIndex 
     * @returns {HRESULT} 
     */
    get_currentAudioLanguageIndex(plIndex) {
        result := ComCall(29, this, "int*", plIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    put_currentAudioLanguageIndex(lIndex) {
        result := ComCall(30, this, "int", lIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLangID 
     * @param {Pointer<BSTR>} pbstrLangName 
     * @returns {HRESULT} 
     */
    getLanguageName(lLangID, pbstrLangName) {
        result := ComCall(31, this, "int", lLangID, "ptr", pbstrLangName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrTimecode 
     * @returns {HRESULT} 
     */
    get_currentPositionTimecode(bstrTimecode) {
        result := ComCall(32, this, "ptr", bstrTimecode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTimecode 
     * @returns {HRESULT} 
     */
    put_currentPositionTimecode(bstrTimecode) {
        bstrTimecode := bstrTimecode is String ? BSTR.Alloc(bstrTimecode).Value : bstrTimecode

        result := ComCall(33, this, "ptr", bstrTimecode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
