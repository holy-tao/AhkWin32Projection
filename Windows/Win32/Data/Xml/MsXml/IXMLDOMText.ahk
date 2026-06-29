#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXMLDOMCharacterData.ahk" { IXMLDOMCharacterData }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMText extends IXMLDOMCharacterData {
    /**
     * The interface identifier for IXMLDOMText
     * @type {Guid}
     */
    static IID := Guid("{2933bf87-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMText interfaces
    */
    struct Vtbl extends IXMLDOMCharacterData.Vtbl {
        splitText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMText.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} offset 
     * @returns {IXMLDOMText} 
     */
    splitText(offset) {
        result := ComCall(51, this, "int", offset, "ptr*", &rightHandTextNode := 0, "HRESULT")
        return IXMLDOMText(rightHandTextNode)
    }

    Query(iid) {
        if (IXMLDOMText.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.splitText := CallbackCreate(GetMethod(implObj, "splitText"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.splitText)
    }
}
