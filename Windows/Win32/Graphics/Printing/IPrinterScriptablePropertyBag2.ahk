#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrinterScriptablePropertyBag.ahk" { IPrinterScriptablePropertyBag }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterScriptablePropertyBag2 extends IPrinterScriptablePropertyBag {
    /**
     * The interface identifier for IPrinterScriptablePropertyBag2
     * @type {Guid}
     */
    static IID := Guid("{2a1c53c4-8638-4b3e-b518-2773c94556a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterScriptablePropertyBag2 interfaces
    */
    struct Vtbl extends IPrinterScriptablePropertyBag.Vtbl {
        GetReadStreamAsXML : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterScriptablePropertyBag2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IUnknown} 
     */
    GetReadStreamAsXML(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(17, this, BSTR, bstrName, "ptr*", &ppXmlNode := 0, "HRESULT")
        return IUnknown(ppXmlNode)
    }

    Query(iid) {
        if (IPrinterScriptablePropertyBag2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetReadStreamAsXML := CallbackCreate(GetMethod(implObj, "GetReadStreamAsXML"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetReadStreamAsXML)
    }
}
