#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLAreasCollection extends IDispatch {
    /**
     * The interface identifier for IHTMLAreasCollection
     * @type {Guid}
     */
    static IID := Guid("{3050f383-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAreasCollection
     * @type {Guid}
     */
    static CLSID := Guid("{3050f4ca-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAreasCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_length   : IntPtr
        get_length   : IntPtr
        get__newEnum : IntPtr
        item         : IntPtr
        tags         : IntPtr
        add          : IntPtr
        remove       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAreasCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
        set => this.put_length(value)
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_length(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @param {VARIANT} name 
     * @param {VARIANT} index 
     * @returns {IDispatch} 
     */
    item(name, index) {
        result := ComCall(10, this, VARIANT, name, VARIANT, index, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }

    /**
     * 
     * @param {VARIANT} tagName 
     * @returns {IDispatch} 
     */
    tags(tagName) {
        result := ComCall(11, this, VARIANT, tagName, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }

    /**
     * Component-wise add of 2 vectors.
     * @remarks
     * The following table shows the results obtained when executing the instruction with various classes of numbers, assuming that neither overflow or underflow occurs. F means finite real number.
     * 
     * 
     * 
     * | **src0 src1->** | **-inf** | **-F**     | **-denorm** | **-0** | **+0** | **denorm** | **+F**     | **+inf** | **NaN** |
     * |--------------------|----------|------------|-------------|--------|--------|------------|------------|----------|---------|
     * | **-inf**           | -inf     | -inf       | -inf        | -inf   | -inf   | -inf       | -inf       | NaN      | NaN     |
     * | **-F**             | -inf     | -F         | src0        | src0   | src0   | src0       | +-F or +-0 | +inf     | NaN     |
     * | **-denorm**        | -inf     | src1       | -0          | -0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **-0**             | -inf     | src1       | -0          | -0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **+0**             | i-inf    | src1       | +0          | +0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **+denorm**        | -inf     | src1       | +0          | +0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **+F**             | -inf     | +-F or +-0 | src0        | src0   | src0   | src0       | +F         | +inf     | NaN     |
     * | **+inf**           | NaN      | +inf       | +inf        | +inf   | +inf   | +inf       | +inf       | +inf     | NaN     |
     * | **NaN**            | NaN      | NaN        | NaN         | NaN    | NaN    | NaN        | NaN        | NaN      | NaN     |
     * 
     * 
     * 
     *  
     * 
     * This instruction applies to the following shader stages:
     * 
     * 
     * 
     * | Vertex Shader | Geometry Shader | Pixel Shader |
     * |---------------|-----------------|--------------|
     * | x             | x               | x            |
     * @param {IHTMLElement} element 
     * @param {VARIANT} before 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/add--sm4---asm-
     */
    add(element, before) {
        result := ComCall(12, this, "ptr", element, VARIANT, before, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    remove(index) {
        result := ComCall(13, this, "int", index, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLAreasCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_length := CallbackCreate(GetMethod(implObj, "put_length"), flags, 2)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 4)
        this.vtbl.tags := CallbackCreate(GetMethod(implObj, "tags"), flags, 3)
        this.vtbl.add := CallbackCreate(GetMethod(implObj, "add"), flags, 3)
        this.vtbl.remove := CallbackCreate(GetMethod(implObj, "remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_length)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get__newEnum)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.tags)
        CallbackFree(this.vtbl.add)
        CallbackFree(this.vtbl.remove)
    }
}
