#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXMLDOMDocument.ahk" { IXMLDOMDocument }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDSOControl extends IDispatch {
    /**
     * The interface identifier for IXMLDSOControl
     * @type {Guid}
     */
    static IID := Guid("{310afa62-0575-11d2-9ca9-0060b0ec3d39}")

    /**
     * The class identifier for XMLDSOControl
     * @type {Guid}
     */
    static CLSID := Guid("{550dda30-0541-11d2-9ca9-0060b0ec3d39}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDSOControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_XMLDocument       : IntPtr
        put_XMLDocument       : IntPtr
        get_JavaDSOCompatible : IntPtr
        put_JavaDSOCompatible : IntPtr
        get_readyState        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDSOControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IXMLDOMDocument} 
     */
    XMLDocument {
        get => this.get_XMLDocument()
        set => this.put_XMLDocument(value)
    }

    /**
     * @type {BOOL} 
     */
    JavaDSOCompatible {
        get => this.get_JavaDSOCompatible()
        set => this.put_JavaDSOCompatible(value)
    }

    /**
     * @type {Integer} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * 
     * @returns {IXMLDOMDocument} 
     */
    get_XMLDocument() {
        result := ComCall(7, this, "ptr*", &ppDoc := 0, "HRESULT")
        return IXMLDOMDocument(ppDoc)
    }

    /**
     * 
     * @param {IXMLDOMDocument} ppDoc 
     * @returns {HRESULT} 
     */
    put_XMLDocument(ppDoc) {
        result := ComCall(8, this, "ptr", ppDoc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_JavaDSOCompatible() {
        result := ComCall(9, this, BOOL.Ptr, &fJavaDSOCompatible := 0, "HRESULT")
        return fJavaDSOCompatible
    }

    /**
     * 
     * @param {BOOL} fJavaDSOCompatible 
     * @returns {HRESULT} 
     */
    put_JavaDSOCompatible(fJavaDSOCompatible) {
        result := ComCall(10, this, BOOL, fJavaDSOCompatible, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(11, this, "int*", &state := 0, "HRESULT")
        return state
    }

    Query(iid) {
        if (IXMLDSOControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_XMLDocument := CallbackCreate(GetMethod(implObj, "get_XMLDocument"), flags, 2)
        this.vtbl.put_XMLDocument := CallbackCreate(GetMethod(implObj, "put_XMLDocument"), flags, 2)
        this.vtbl.get_JavaDSOCompatible := CallbackCreate(GetMethod(implObj, "get_JavaDSOCompatible"), flags, 2)
        this.vtbl.put_JavaDSOCompatible := CallbackCreate(GetMethod(implObj, "put_JavaDSOCompatible"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_XMLDocument)
        CallbackFree(this.vtbl.put_XMLDocument)
        CallbackFree(this.vtbl.get_JavaDSOCompatible)
        CallbackFree(this.vtbl.put_JavaDSOCompatible)
        CallbackFree(this.vtbl.get_readyState)
    }
}
