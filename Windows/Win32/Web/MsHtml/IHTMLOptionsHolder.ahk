#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLDocument2.ahk
#Include .\IHTMLFontNamesCollection.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLWindow2.ahk
#Include .\IHTMLFontSizesCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLOptionsHolder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLOptionsHolder
     * @type {Guid}
     */
    static IID => Guid("{3050f378-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_document", "get_fonts", "put_execArg", "get_execArg", "put_errorLine", "get_errorLine", "put_errorCharacter", "get_errorCharacter", "put_errorCode", "get_errorCode", "put_errorMessage", "get_errorMessage", "put_errorDebug", "get_errorDebug", "get_unsecuredWindowOfDocument", "put_findText", "get_findText", "put_anythingAfterFrameset", "get_anythingAfterFrameset", "sizes", "openfiledlg", "savefiledlg", "choosecolordlg", "showSecurityInfo", "isApartmentModel", "getCharset", "get_secureConnectionInfo"]

    /**
     * 
     * @returns {IHTMLDocument2} 
     */
    get_document() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDocument2(p)
    }

    /**
     * 
     * @returns {IHTMLFontNamesCollection} 
     */
    get_fonts() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFontNamesCollection(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_execArg(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_execArg() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_errorLine(v) {
        result := ComCall(11, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_errorLine() {
        result := ComCall(12, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_errorCharacter(v) {
        result := ComCall(13, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_errorCharacter() {
        result := ComCall(14, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_errorCode(v) {
        result := ComCall(15, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_errorCode() {
        result := ComCall(16, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_errorMessage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_errorMessage() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_errorDebug(v) {
        result := ComCall(19, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_errorDebug() {
        result := ComCall(20, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_unsecuredWindowOfDocument() {
        result := ComCall(21, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_findText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(22, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_findText() {
        p := BSTR()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_anythingAfterFrameset(v) {
        result := ComCall(24, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_anythingAfterFrameset() {
        result := ComCall(25, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} fontName 
     * @returns {IHTMLFontSizesCollection} 
     */
    sizes(fontName) {
        fontName := fontName is String ? BSTR.Alloc(fontName).Value : fontName

        result := ComCall(26, this, "ptr", fontName, "ptr*", &pSizesCollection := 0, "HRESULT")
        return IHTMLFontSizesCollection(pSizesCollection)
    }

    /**
     * 
     * @param {VARIANT} initFile 
     * @param {VARIANT} initDir 
     * @param {VARIANT} filter 
     * @param {VARIANT} title 
     * @returns {BSTR} 
     */
    openfiledlg(initFile, initDir, filter, title) {
        pathName := BSTR()
        result := ComCall(27, this, "ptr", initFile, "ptr", initDir, "ptr", filter, "ptr", title, "ptr", pathName, "HRESULT")
        return pathName
    }

    /**
     * 
     * @param {VARIANT} initFile 
     * @param {VARIANT} initDir 
     * @param {VARIANT} filter 
     * @param {VARIANT} title 
     * @returns {BSTR} 
     */
    savefiledlg(initFile, initDir, filter, title) {
        pathName := BSTR()
        result := ComCall(28, this, "ptr", initFile, "ptr", initDir, "ptr", filter, "ptr", title, "ptr", pathName, "HRESULT")
        return pathName
    }

    /**
     * 
     * @param {VARIANT} initColor 
     * @returns {Integer} 
     */
    choosecolordlg(initColor) {
        result := ComCall(29, this, "ptr", initColor, "int*", &rgbColor := 0, "HRESULT")
        return rgbColor
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    showSecurityInfo() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLObjectElement} object 
     * @returns {VARIANT_BOOL} 
     */
    isApartmentModel(object) {
        result := ComCall(31, this, "ptr", object, "short*", &fApartment := 0, "HRESULT")
        return fApartment
    }

    /**
     * 
     * @param {BSTR} fontName 
     * @returns {Integer} 
     */
    getCharset(fontName) {
        fontName := fontName is String ? BSTR.Alloc(fontName).Value : fontName

        result := ComCall(32, this, "ptr", fontName, "int*", &charset := 0, "HRESULT")
        return charset
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_secureConnectionInfo() {
        p := BSTR()
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return p
    }
}
