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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_audioLanguageCount", "getAudioLanguageID", "getAudioLanguageDescription", "get_currentAudioLanguage", "put_currentAudioLanguage", "get_currentAudioLanguageIndex", "put_currentAudioLanguageIndex", "getLanguageName", "get_currentPositionTimecode", "put_currentPositionTimecode"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-get_audiolanguagecount
     */
    get_audioLanguageCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} plLangID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-getaudiolanguageid
     */
    getAudioLanguageID(lIndex, plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, "int", lIndex, plLangIDMarshal, plLangID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrLangDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-getaudiolanguagedescription
     */
    getAudioLanguageDescription(lIndex, pbstrLangDesc) {
        result := ComCall(26, this, "int", lIndex, "ptr", pbstrLangDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plLangID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-get_currentaudiolanguage
     */
    get_currentAudioLanguage(plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, plLangIDMarshal, plLangID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLangID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-put_currentaudiolanguage
     */
    put_currentAudioLanguage(lLangID) {
        result := ComCall(28, this, "int", lLangID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-get_currentaudiolanguageindex
     */
    get_currentAudioLanguageIndex(plIndex) {
        plIndexMarshal := plIndex is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, plIndexMarshal, plIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-put_currentaudiolanguageindex
     */
    put_currentAudioLanguageIndex(lIndex) {
        result := ComCall(30, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLangID 
     * @param {Pointer<BSTR>} pbstrLangName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-getlanguagename
     */
    getLanguageName(lLangID, pbstrLangName) {
        result := ComCall(31, this, "int", lLangID, "ptr", pbstrLangName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrTimecode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-get_currentpositiontimecode
     */
    get_currentPositionTimecode(bstrTimecode) {
        result := ComCall(32, this, "ptr", bstrTimecode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTimecode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols3-put_currentpositiontimecode
     */
    put_currentPositionTimecode(bstrTimecode) {
        bstrTimecode := bstrTimecode is String ? BSTR.Alloc(bstrTimecode).Value : bstrTimecode

        result := ComCall(33, this, "ptr", bstrTimecode, "HRESULT")
        return result
    }
}
