#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedEnumeration.ahk" { ISVGAnimatedEnumeration }
#Import ".\ISVGAnimatedLength.ahk" { ISVGAnimatedLength }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGPoint.ahk" { ISVGPoint }
#Import ".\ISVGRect.ahk" { ISVGRect }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGTextContentElement extends IDispatch {
    /**
     * The interface identifier for ISVGTextContentElement
     * @type {Guid}
     */
    static IID := Guid("{3051051a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGTextContentElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105dd-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGTextContentElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_textLength      : IntPtr
        get_textLength         : IntPtr
        putref_lengthAdjust    : IntPtr
        get_lengthAdjust       : IntPtr
        getNumberOfChars       : IntPtr
        getComputedTextLength  : IntPtr
        getSubStringLength     : IntPtr
        getStartPositionOfChar : IntPtr
        getEndPositionOfChar   : IntPtr
        getExtentOfChar        : IntPtr
        getRotationOfChar      : IntPtr
        getCharNumAtPosition   : IntPtr
        selectSubString        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGTextContentElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    textLength {
        get => this.get_textLength()
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    lengthAdjust {
        get => this.get_lengthAdjust()
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_textLength(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_textLength() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_lengthAdjust(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_lengthAdjust() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    getNumberOfChars() {
        result := ComCall(11, this, "int*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {Float} 
     */
    getComputedTextLength() {
        result := ComCall(12, this, "float*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Integer} nchars 
     * @returns {Float} 
     */
    getSubStringLength(charnum, nchars) {
        result := ComCall(13, this, "int", charnum, "int", nchars, "float*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Integer} charnum 
     * @returns {ISVGPoint} 
     */
    getStartPositionOfChar(charnum) {
        result := ComCall(14, this, "int", charnum, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    /**
     * 
     * @param {Integer} charnum 
     * @returns {ISVGPoint} 
     */
    getEndPositionOfChar(charnum) {
        result := ComCall(15, this, "int", charnum, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    /**
     * 
     * @param {Integer} charnum 
     * @returns {ISVGRect} 
     */
    getExtentOfChar(charnum) {
        result := ComCall(16, this, "int", charnum, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGRect(ppResult)
    }

    /**
     * 
     * @param {Integer} charnum 
     * @returns {Float} 
     */
    getRotationOfChar(charnum) {
        result := ComCall(17, this, "int", charnum, "float*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {ISVGPoint} _point 
     * @returns {Integer} 
     */
    getCharNumAtPosition(_point) {
        result := ComCall(18, this, "ptr", _point, "int*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Integer} nchars 
     * @returns {HRESULT} 
     */
    selectSubString(charnum, nchars) {
        result := ComCall(19, this, "int", charnum, "int", nchars, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISVGTextContentElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_textLength := CallbackCreate(GetMethod(implObj, "putref_textLength"), flags, 2)
        this.vtbl.get_textLength := CallbackCreate(GetMethod(implObj, "get_textLength"), flags, 2)
        this.vtbl.putref_lengthAdjust := CallbackCreate(GetMethod(implObj, "putref_lengthAdjust"), flags, 2)
        this.vtbl.get_lengthAdjust := CallbackCreate(GetMethod(implObj, "get_lengthAdjust"), flags, 2)
        this.vtbl.getNumberOfChars := CallbackCreate(GetMethod(implObj, "getNumberOfChars"), flags, 2)
        this.vtbl.getComputedTextLength := CallbackCreate(GetMethod(implObj, "getComputedTextLength"), flags, 2)
        this.vtbl.getSubStringLength := CallbackCreate(GetMethod(implObj, "getSubStringLength"), flags, 4)
        this.vtbl.getStartPositionOfChar := CallbackCreate(GetMethod(implObj, "getStartPositionOfChar"), flags, 3)
        this.vtbl.getEndPositionOfChar := CallbackCreate(GetMethod(implObj, "getEndPositionOfChar"), flags, 3)
        this.vtbl.getExtentOfChar := CallbackCreate(GetMethod(implObj, "getExtentOfChar"), flags, 3)
        this.vtbl.getRotationOfChar := CallbackCreate(GetMethod(implObj, "getRotationOfChar"), flags, 3)
        this.vtbl.getCharNumAtPosition := CallbackCreate(GetMethod(implObj, "getCharNumAtPosition"), flags, 3)
        this.vtbl.selectSubString := CallbackCreate(GetMethod(implObj, "selectSubString"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_textLength)
        CallbackFree(this.vtbl.get_textLength)
        CallbackFree(this.vtbl.putref_lengthAdjust)
        CallbackFree(this.vtbl.get_lengthAdjust)
        CallbackFree(this.vtbl.getNumberOfChars)
        CallbackFree(this.vtbl.getComputedTextLength)
        CallbackFree(this.vtbl.getSubStringLength)
        CallbackFree(this.vtbl.getStartPositionOfChar)
        CallbackFree(this.vtbl.getEndPositionOfChar)
        CallbackFree(this.vtbl.getExtentOfChar)
        CallbackFree(this.vtbl.getRotationOfChar)
        CallbackFree(this.vtbl.getCharNumAtPosition)
        CallbackFree(this.vtbl.selectSubString)
    }
}
