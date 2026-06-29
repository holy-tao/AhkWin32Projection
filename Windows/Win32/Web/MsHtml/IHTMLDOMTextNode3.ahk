#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMTextNode3 extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMTextNode3
     * @type {Guid}
     */
    static IID := Guid("{3051073e-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMTextNode3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        substringData    : IntPtr
        insertData       : IntPtr
        deleteData       : IntPtr
        replaceData      : IntPtr
        splitText        : IntPtr
        get_wholeText    : IntPtr
        replaceWholeText : IntPtr
        hasAttributes    : IntPtr
        normalize        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMTextNode3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    wholeText {
        get => this.get_wholeText()
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {BSTR} 
     */
    substringData(offset, Count) {
        pbstrsubString := BSTR.Owned()
        result := ComCall(7, this, "int", offset, "int", Count, BSTR.Ptr, pbstrsubString, "HRESULT")
        return pbstrsubString
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    insertData(offset, bstrstring) {
        bstrstring := bstrstring is String ? BSTR.Alloc(bstrstring).Value : bstrstring

        result := ComCall(8, this, "int", offset, BSTR, bstrstring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    deleteData(offset, Count) {
        result := ComCall(9, this, "int", offset, "int", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    replaceData(offset, Count, bstrstring) {
        bstrstring := bstrstring is String ? BSTR.Alloc(bstrstring).Value : bstrstring

        result := ComCall(10, this, "int", offset, "int", Count, BSTR, bstrstring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @returns {IHTMLDOMNode} 
     */
    splitText(offset) {
        result := ComCall(11, this, "int", offset, "ptr*", &pRetNode := 0, "HRESULT")
        return IHTMLDOMNode(pRetNode)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wholeText() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrText 
     * @returns {IHTMLDOMNode} 
     */
    replaceWholeText(bstrText) {
        bstrText := bstrText is String ? BSTR.Alloc(bstrText).Value : bstrText

        result := ComCall(13, this, BSTR, bstrText, "ptr*", &ppRetNode := 0, "HRESULT")
        return IHTMLDOMNode(ppRetNode)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributes() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &pfHasAttributes := 0, "HRESULT")
        return pfHasAttributes
    }

    /**
     * Normalizes the specified floating-point vector according to x / length(x).
     * @remarks
     * The **normalize** HLSL intrinsic function uses the following formula: *x* / [**length**](dx-graphics-hlsl-length.md)(*x*).
     * @returns {HRESULT} | Item                                                   | Description                                            |
     * |--------------------------------------------------------|--------------------------------------------------------|
     * | <span id="x"></span><span id="X"></span>*x*<br/> | \[in\] The specified floating-point vector.<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * The normalized *x* parameter. If the length of the *x* parameter is 0, the result is indefinite.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-normalize
     */
    normalize() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLDOMTextNode3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.substringData := CallbackCreate(GetMethod(implObj, "substringData"), flags, 4)
        this.vtbl.insertData := CallbackCreate(GetMethod(implObj, "insertData"), flags, 3)
        this.vtbl.deleteData := CallbackCreate(GetMethod(implObj, "deleteData"), flags, 3)
        this.vtbl.replaceData := CallbackCreate(GetMethod(implObj, "replaceData"), flags, 4)
        this.vtbl.splitText := CallbackCreate(GetMethod(implObj, "splitText"), flags, 3)
        this.vtbl.get_wholeText := CallbackCreate(GetMethod(implObj, "get_wholeText"), flags, 2)
        this.vtbl.replaceWholeText := CallbackCreate(GetMethod(implObj, "replaceWholeText"), flags, 3)
        this.vtbl.hasAttributes := CallbackCreate(GetMethod(implObj, "hasAttributes"), flags, 2)
        this.vtbl.normalize := CallbackCreate(GetMethod(implObj, "normalize"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.substringData)
        CallbackFree(this.vtbl.insertData)
        CallbackFree(this.vtbl.deleteData)
        CallbackFree(this.vtbl.replaceData)
        CallbackFree(this.vtbl.splitText)
        CallbackFree(this.vtbl.get_wholeText)
        CallbackFree(this.vtbl.replaceWholeText)
        CallbackFree(this.vtbl.hasAttributes)
        CallbackFree(this.vtbl.normalize)
    }
}
