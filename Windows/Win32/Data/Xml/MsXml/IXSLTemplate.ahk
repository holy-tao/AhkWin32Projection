#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXSLProcessor.ahk" { IXSLProcessor }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXSLTemplate extends IDispatch {
    /**
     * The interface identifier for IXSLTemplate
     * @type {Guid}
     */
    static IID := Guid("{2933bf93-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXSLTemplate interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_stylesheet : IntPtr
        get_stylesheet    : IntPtr
        createProcessor   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXSLTemplate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IXMLDOMNode} 
     */
    stylesheet {
        get => this.get_stylesheet()
    }

    /**
     * 
     * @param {IXMLDOMNode} stylesheet 
     * @returns {HRESULT} 
     */
    putref_stylesheet(stylesheet) {
        result := ComCall(7, this, "ptr", stylesheet, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_stylesheet() {
        result := ComCall(8, this, "ptr*", &stylesheet := 0, "HRESULT")
        return IXMLDOMNode(stylesheet)
    }

    /**
     * 
     * @returns {IXSLProcessor} 
     */
    createProcessor() {
        result := ComCall(9, this, "ptr*", &ppProcessor := 0, "HRESULT")
        return IXSLProcessor(ppProcessor)
    }

    Query(iid) {
        if (IXSLTemplate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_stylesheet := CallbackCreate(GetMethod(implObj, "putref_stylesheet"), flags, 2)
        this.vtbl.get_stylesheet := CallbackCreate(GetMethod(implObj, "get_stylesheet"), flags, 2)
        this.vtbl.createProcessor := CallbackCreate(GetMethod(implObj, "createProcessor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_stylesheet)
        CallbackFree(this.vtbl.get_stylesheet)
        CallbackFree(this.vtbl.createProcessor)
    }
}
