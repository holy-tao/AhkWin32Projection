#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IHTMLDocument2.ahk" { IHTMLDocument2 }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLObjectElement.ahk" { IHTMLObjectElement }
#Import ".\IHTMLFontSizesCollection.ahk" { IHTMLFontSizesCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLFontNamesCollection.ahk" { IHTMLFontNamesCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLOptionsHolder extends IDispatch {
    /**
     * The interface identifier for IHTMLOptionsHolder
     * @type {Guid}
     */
    static IID := Guid("{3050f378-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLOptionsHolder interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_document                  : IntPtr
        get_fonts                     : IntPtr
        put_execArg                   : IntPtr
        get_execArg                   : IntPtr
        put_errorLine                 : IntPtr
        get_errorLine                 : IntPtr
        put_errorCharacter            : IntPtr
        get_errorCharacter            : IntPtr
        put_errorCode                 : IntPtr
        get_errorCode                 : IntPtr
        put_errorMessage              : IntPtr
        get_errorMessage              : IntPtr
        put_errorDebug                : IntPtr
        get_errorDebug                : IntPtr
        get_unsecuredWindowOfDocument : IntPtr
        put_findText                  : IntPtr
        get_findText                  : IntPtr
        put_anythingAfterFrameset     : IntPtr
        get_anythingAfterFrameset     : IntPtr
        sizes                         : IntPtr
        openfiledlg                   : IntPtr
        savefiledlg                   : IntPtr
        choosecolordlg                : IntPtr
        showSecurityInfo              : IntPtr
        isApartmentModel              : IntPtr
        getCharset                    : IntPtr
        get_secureConnectionInfo      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLOptionsHolder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLDocument2} 
     */
    document {
        get => this.get_document()
    }

    /**
     * @type {IHTMLFontNamesCollection} 
     */
    fonts {
        get => this.get_fonts()
    }

    /**
     * @type {VARIANT} 
     */
    execArg {
        get => this.get_execArg()
        set => this.put_execArg(value)
    }

    /**
     * @type {Integer} 
     */
    errorLine {
        get => this.get_errorLine()
        set => this.put_errorLine(value)
    }

    /**
     * @type {Integer} 
     */
    errorCharacter {
        get => this.get_errorCharacter()
        set => this.put_errorCharacter(value)
    }

    /**
     * @type {Integer} 
     */
    errorCode {
        get => this.get_errorCode()
        set => this.put_errorCode(value)
    }

    /**
     * @type {BSTR} 
     */
    errorMessage {
        get => this.get_errorMessage()
        set => this.put_errorMessage(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    errorDebug {
        get => this.get_errorDebug()
        set => this.put_errorDebug(value)
    }

    /**
     * @type {IHTMLWindow2} 
     */
    unsecuredWindowOfDocument {
        get => this.get_unsecuredWindowOfDocument()
    }

    /**
     * @type {BSTR} 
     */
    findText {
        get => this.get_findText()
        set => this.put_findText(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    anythingAfterFrameset {
        get => this.get_anythingAfterFrameset()
        set => this.put_anythingAfterFrameset(value)
    }

    /**
     * @type {BSTR} 
     */
    secureConnectionInfo {
        get => this.get_secureConnectionInfo()
    }

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
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_execArg() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
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

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_errorMessage() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_errorDebug(v) {
        result := ComCall(19, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_errorDebug() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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

        result := ComCall(22, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_findText() {
        p := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_anythingAfterFrameset(v) {
        result := ComCall(24, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_anythingAfterFrameset() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} fontName 
     * @returns {IHTMLFontSizesCollection} 
     */
    sizes(fontName) {
        fontName := fontName is String ? BSTR.Alloc(fontName).Value : fontName

        result := ComCall(26, this, BSTR, fontName, "ptr*", &pSizesCollection := 0, "HRESULT")
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
        _pathName := BSTR.Owned()
        result := ComCall(27, this, VARIANT, initFile, VARIANT, initDir, VARIANT, filter, VARIANT, title, BSTR.Ptr, _pathName, "HRESULT")
        return _pathName
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
        _pathName := BSTR.Owned()
        result := ComCall(28, this, VARIANT, initFile, VARIANT, initDir, VARIANT, filter, VARIANT, title, BSTR.Ptr, _pathName, "HRESULT")
        return _pathName
    }

    /**
     * 
     * @param {VARIANT} initColor 
     * @returns {Integer} 
     */
    choosecolordlg(initColor) {
        result := ComCall(29, this, VARIANT, initColor, "int*", &_rgbColor := 0, "HRESULT")
        return _rgbColor
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
     * @param {IHTMLObjectElement} _object 
     * @returns {VARIANT_BOOL} 
     */
    isApartmentModel(_object) {
        result := ComCall(31, this, "ptr", _object, VARIANT_BOOL.Ptr, &fApartment := 0, "HRESULT")
        return fApartment
    }

    /**
     * 
     * @param {BSTR} fontName 
     * @returns {Integer} 
     */
    getCharset(fontName) {
        fontName := fontName is String ? BSTR.Alloc(fontName).Value : fontName

        result := ComCall(32, this, BSTR, fontName, "int*", &charset := 0, "HRESULT")
        return charset
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_secureConnectionInfo() {
        p := BSTR.Owned()
        result := ComCall(33, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLOptionsHolder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_document := CallbackCreate(GetMethod(implObj, "get_document"), flags, 2)
        this.vtbl.get_fonts := CallbackCreate(GetMethod(implObj, "get_fonts"), flags, 2)
        this.vtbl.put_execArg := CallbackCreate(GetMethod(implObj, "put_execArg"), flags, 2)
        this.vtbl.get_execArg := CallbackCreate(GetMethod(implObj, "get_execArg"), flags, 2)
        this.vtbl.put_errorLine := CallbackCreate(GetMethod(implObj, "put_errorLine"), flags, 2)
        this.vtbl.get_errorLine := CallbackCreate(GetMethod(implObj, "get_errorLine"), flags, 2)
        this.vtbl.put_errorCharacter := CallbackCreate(GetMethod(implObj, "put_errorCharacter"), flags, 2)
        this.vtbl.get_errorCharacter := CallbackCreate(GetMethod(implObj, "get_errorCharacter"), flags, 2)
        this.vtbl.put_errorCode := CallbackCreate(GetMethod(implObj, "put_errorCode"), flags, 2)
        this.vtbl.get_errorCode := CallbackCreate(GetMethod(implObj, "get_errorCode"), flags, 2)
        this.vtbl.put_errorMessage := CallbackCreate(GetMethod(implObj, "put_errorMessage"), flags, 2)
        this.vtbl.get_errorMessage := CallbackCreate(GetMethod(implObj, "get_errorMessage"), flags, 2)
        this.vtbl.put_errorDebug := CallbackCreate(GetMethod(implObj, "put_errorDebug"), flags, 2)
        this.vtbl.get_errorDebug := CallbackCreate(GetMethod(implObj, "get_errorDebug"), flags, 2)
        this.vtbl.get_unsecuredWindowOfDocument := CallbackCreate(GetMethod(implObj, "get_unsecuredWindowOfDocument"), flags, 2)
        this.vtbl.put_findText := CallbackCreate(GetMethod(implObj, "put_findText"), flags, 2)
        this.vtbl.get_findText := CallbackCreate(GetMethod(implObj, "get_findText"), flags, 2)
        this.vtbl.put_anythingAfterFrameset := CallbackCreate(GetMethod(implObj, "put_anythingAfterFrameset"), flags, 2)
        this.vtbl.get_anythingAfterFrameset := CallbackCreate(GetMethod(implObj, "get_anythingAfterFrameset"), flags, 2)
        this.vtbl.sizes := CallbackCreate(GetMethod(implObj, "sizes"), flags, 3)
        this.vtbl.openfiledlg := CallbackCreate(GetMethod(implObj, "openfiledlg"), flags, 6)
        this.vtbl.savefiledlg := CallbackCreate(GetMethod(implObj, "savefiledlg"), flags, 6)
        this.vtbl.choosecolordlg := CallbackCreate(GetMethod(implObj, "choosecolordlg"), flags, 3)
        this.vtbl.showSecurityInfo := CallbackCreate(GetMethod(implObj, "showSecurityInfo"), flags, 1)
        this.vtbl.isApartmentModel := CallbackCreate(GetMethod(implObj, "isApartmentModel"), flags, 3)
        this.vtbl.getCharset := CallbackCreate(GetMethod(implObj, "getCharset"), flags, 3)
        this.vtbl.get_secureConnectionInfo := CallbackCreate(GetMethod(implObj, "get_secureConnectionInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_document)
        CallbackFree(this.vtbl.get_fonts)
        CallbackFree(this.vtbl.put_execArg)
        CallbackFree(this.vtbl.get_execArg)
        CallbackFree(this.vtbl.put_errorLine)
        CallbackFree(this.vtbl.get_errorLine)
        CallbackFree(this.vtbl.put_errorCharacter)
        CallbackFree(this.vtbl.get_errorCharacter)
        CallbackFree(this.vtbl.put_errorCode)
        CallbackFree(this.vtbl.get_errorCode)
        CallbackFree(this.vtbl.put_errorMessage)
        CallbackFree(this.vtbl.get_errorMessage)
        CallbackFree(this.vtbl.put_errorDebug)
        CallbackFree(this.vtbl.get_errorDebug)
        CallbackFree(this.vtbl.get_unsecuredWindowOfDocument)
        CallbackFree(this.vtbl.put_findText)
        CallbackFree(this.vtbl.get_findText)
        CallbackFree(this.vtbl.put_anythingAfterFrameset)
        CallbackFree(this.vtbl.get_anythingAfterFrameset)
        CallbackFree(this.vtbl.sizes)
        CallbackFree(this.vtbl.openfiledlg)
        CallbackFree(this.vtbl.savefiledlg)
        CallbackFree(this.vtbl.choosecolordlg)
        CallbackFree(this.vtbl.showSecurityInfo)
        CallbackFree(this.vtbl.isApartmentModel)
        CallbackFree(this.vtbl.getCharset)
        CallbackFree(this.vtbl.get_secureConnectionInfo)
    }
}
