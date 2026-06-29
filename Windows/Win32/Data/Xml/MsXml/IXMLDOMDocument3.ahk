#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMParseError.ahk" { IXMLDOMParseError }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IXMLDOMDocument2.ahk" { IXMLDOMDocument2 }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMDocument3 extends IXMLDOMDocument2 {
    /**
     * The interface identifier for IXMLDOMDocument3
     * @type {Guid}
     */
    static IID := Guid("{2933bf96-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMDocument3 interfaces
    */
    struct Vtbl extends IXMLDOMDocument2.Vtbl {
        validateNode : IntPtr
        importNode   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMDocument3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IXMLDOMNode} _node 
     * @returns {IXMLDOMParseError} 
     */
    validateNode(_node) {
        result := ComCall(82, this, "ptr", _node, "ptr*", &errorObj := 0, "HRESULT")
        return IXMLDOMParseError(errorObj)
    }

    /**
     * 
     * @param {IXMLDOMNode} _node 
     * @param {VARIANT_BOOL} deep 
     * @returns {IXMLDOMNode} 
     */
    importNode(_node, deep) {
        result := ComCall(83, this, "ptr", _node, VARIANT_BOOL, deep, "ptr*", &clone := 0, "HRESULT")
        return IXMLDOMNode(clone)
    }

    Query(iid) {
        if (IXMLDOMDocument3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.validateNode := CallbackCreate(GetMethod(implObj, "validateNode"), flags, 3)
        this.vtbl.importNode := CallbackCreate(GetMethod(implObj, "importNode"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.validateNode)
        CallbackFree(this.vtbl.importNode)
    }
}
