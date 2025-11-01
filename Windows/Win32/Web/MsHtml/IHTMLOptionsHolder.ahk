#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IHTMLDocument2>} p 
     * @returns {HRESULT} 
     */
    get_document(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLFontNamesCollection>} p 
     * @returns {HRESULT} 
     */
    get_fonts(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_execArg(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_errorLine(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pMarshal, p, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_errorCharacter(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pMarshal, p, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_errorCode(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pMarshal, p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_errorMessage(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_errorDebug(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} p 
     * @returns {HRESULT} 
     */
    get_unsecuredWindowOfDocument(p) {
        result := ComCall(21, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_findText(p) {
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_anythingAfterFrameset(p) {
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} fontName 
     * @param {Pointer<IHTMLFontSizesCollection>} pSizesCollection 
     * @returns {HRESULT} 
     */
    sizes(fontName, pSizesCollection) {
        fontName := fontName is String ? BSTR.Alloc(fontName).Value : fontName

        result := ComCall(26, this, "ptr", fontName, "ptr*", pSizesCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} initFile 
     * @param {VARIANT} initDir 
     * @param {VARIANT} filter 
     * @param {VARIANT} title 
     * @param {Pointer<BSTR>} pathName 
     * @returns {HRESULT} 
     */
    openfiledlg(initFile, initDir, filter, title, pathName) {
        result := ComCall(27, this, "ptr", initFile, "ptr", initDir, "ptr", filter, "ptr", title, "ptr", pathName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} initFile 
     * @param {VARIANT} initDir 
     * @param {VARIANT} filter 
     * @param {VARIANT} title 
     * @param {Pointer<BSTR>} pathName 
     * @returns {HRESULT} 
     */
    savefiledlg(initFile, initDir, filter, title, pathName) {
        result := ComCall(28, this, "ptr", initFile, "ptr", initDir, "ptr", filter, "ptr", title, "ptr", pathName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} initColor 
     * @param {Pointer<Integer>} rgbColor 
     * @returns {HRESULT} 
     */
    choosecolordlg(initColor, rgbColor) {
        rgbColorMarshal := rgbColor is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, "ptr", initColor, rgbColorMarshal, rgbColor, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} fApartment 
     * @returns {HRESULT} 
     */
    isApartmentModel(object, fApartment) {
        result := ComCall(31, this, "ptr", object, "ptr", fApartment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} fontName 
     * @param {Pointer<Integer>} charset 
     * @returns {HRESULT} 
     */
    getCharset(fontName, charset) {
        fontName := fontName is String ? BSTR.Alloc(fontName).Value : fontName

        charsetMarshal := charset is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, "ptr", fontName, charsetMarshal, charset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_secureConnectionInfo(p) {
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return result
    }
}
