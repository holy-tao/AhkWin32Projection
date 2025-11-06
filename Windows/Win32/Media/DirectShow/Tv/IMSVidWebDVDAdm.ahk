#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidWebDVDAdm extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidWebDVDAdm
     * @type {Guid}
     */
    static IID => Guid("{b8be681a-eb2c-47f0-b415-94d5452f0e05}")

    /**
     * The class identifier for MSVidWebDVDAdm
     * @type {Guid}
     */
    static CLSID => Guid("{fa7c375b-66a7-4280-879d-fd459c84bb02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ChangePassword", "SaveParentalLevel", "SaveParentalCountry", "ConfirmPassword", "GetParentalLevel", "GetParentalCountry", "get_DefaultAudioLCID", "put_DefaultAudioLCID", "get_DefaultSubpictureLCID", "put_DefaultSubpictureLCID", "get_DefaultMenuLCID", "put_DefaultMenuLCID", "get_BookmarkOnStop", "put_BookmarkOnStop"]

    /**
     * 
     * @param {BSTR} strUserName 
     * @param {BSTR} strOld 
     * @param {BSTR} strNew 
     * @returns {HRESULT} 
     */
    ChangePassword(strUserName, strOld, strNew) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strOld := strOld is String ? BSTR.Alloc(strOld).Value : strOld
        strNew := strNew is String ? BSTR.Alloc(strNew).Value : strNew

        result := ComCall(7, this, "ptr", strUserName, "ptr", strOld, "ptr", strNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} level 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     */
    SaveParentalLevel(level, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(8, this, "int", level, "ptr", strUserName, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} country 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     */
    SaveParentalCountry(country, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(9, this, "int", country, "ptr", strUserName, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {VARIANT_BOOL} 
     */
    ConfirmPassword(strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(10, this, "ptr", strUserName, "ptr", strPassword, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetParentalLevel() {
        result := ComCall(11, this, "int*", &lLevel := 0, "HRESULT")
        return lLevel
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetParentalCountry() {
        result := ComCall(12, this, "int*", &lCountry := 0, "HRESULT")
        return lCountry
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultAudioLCID() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_DefaultAudioLCID(newVal) {
        result := ComCall(14, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultSubpictureLCID() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_DefaultSubpictureLCID(newVal) {
        result := ComCall(16, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultMenuLCID() {
        result := ComCall(17, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_DefaultMenuLCID(newVal) {
        result := ComCall(18, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_BookmarkOnStop() {
        result := ComCall(19, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_BookmarkOnStop(newVal) {
        result := ComCall(20, this, "short", newVal, "HRESULT")
        return result
    }
}
