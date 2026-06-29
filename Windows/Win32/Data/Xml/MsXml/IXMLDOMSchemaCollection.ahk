#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMSchemaCollection extends IDispatch {
    /**
     * The interface identifier for IXMLDOMSchemaCollection
     * @type {Guid}
     */
    static IID := Guid("{373984c8-b845-449b-91e7-45ac83036ade}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMSchemaCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        add              : IntPtr
        get              : IntPtr
        remove           : IntPtr
        get_length       : IntPtr
        get_namespaceURI : IntPtr
        addCollection    : IntPtr
        get__newEnum     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMSchemaCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
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
     * @param {BSTR} namespaceURI 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/add--sm4---asm-
     */
    add(namespaceURI, var) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(7, this, BSTR, namespaceURI, VARIANT, var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} namespaceURI 
     * @returns {IXMLDOMNode} 
     */
    get(namespaceURI) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(8, this, BSTR, namespaceURI, "ptr*", &schemaNode := 0, "HRESULT")
        return IXMLDOMNode(schemaNode)
    }

    /**
     * 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    remove(namespaceURI) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(9, this, BSTR, namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(10, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    get_namespaceURI(index) {
        length := BSTR.Owned()
        result := ComCall(11, this, "int", index, BSTR.Ptr, length, "HRESULT")
        return length
    }

    /**
     * 
     * @param {IXMLDOMSchemaCollection} otherCollection 
     * @returns {HRESULT} 
     */
    addCollection(otherCollection) {
        result := ComCall(12, this, "ptr", otherCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(13, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    Query(iid) {
        if (IXMLDOMSchemaCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.add := CallbackCreate(GetMethod(implObj, "add"), flags, 3)
        this.vtbl.get := CallbackCreate(GetMethod(implObj, "get"), flags, 3)
        this.vtbl.remove := CallbackCreate(GetMethod(implObj, "remove"), flags, 2)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get_namespaceURI := CallbackCreate(GetMethod(implObj, "get_namespaceURI"), flags, 3)
        this.vtbl.addCollection := CallbackCreate(GetMethod(implObj, "addCollection"), flags, 2)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.add)
        CallbackFree(this.vtbl.get)
        CallbackFree(this.vtbl.remove)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get_namespaceURI)
        CallbackFree(this.vtbl.addCollection)
        CallbackFree(this.vtbl.get__newEnum)
    }
}
