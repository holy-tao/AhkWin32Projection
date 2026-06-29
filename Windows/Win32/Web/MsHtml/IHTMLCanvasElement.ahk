#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICanvasRenderingContext2D.ahk" { ICanvasRenderingContext2D }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCanvasElement extends IDispatch {
    /**
     * The interface identifier for IHTMLCanvasElement
     * @type {Guid}
     */
    static IID := Guid("{305106e4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCanvasElement
     * @type {Guid}
     */
    static CLSID := Guid("{305106e5-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCanvasElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_width  : IntPtr
        get_width  : IntPtr
        put_height : IntPtr
        get_height : IntPtr
        getContext : IntPtr
        toDataURL  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCanvasElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * @type {Integer} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} contextId 
     * @returns {ICanvasRenderingContext2D} 
     */
    getContext(contextId) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        result := ComCall(11, this, BSTR, contextId, "ptr*", &ppContext := 0, "HRESULT")
        return ICanvasRenderingContext2D(ppContext)
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {VARIANT} jpegquality 
     * @returns {BSTR} 
     */
    toDataURL(type, jpegquality) {
        type := type is String ? BSTR.Alloc(type).Value : type

        pUrl := BSTR.Owned()
        result := ComCall(12, this, BSTR, type, VARIANT, jpegquality, BSTR.Ptr, pUrl, "HRESULT")
        return pUrl
    }

    Query(iid) {
        if (IHTMLCanvasElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.getContext := CallbackCreate(GetMethod(implObj, "getContext"), flags, 3)
        this.vtbl.toDataURL := CallbackCreate(GetMethod(implObj, "toDataURL"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.getContext)
        CallbackFree(this.vtbl.toDataURL)
    }
}
