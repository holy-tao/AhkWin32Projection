#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IXpsDocumentProvider extends IUnknown {
    /**
     * The interface identifier for IXpsDocumentProvider
     * @type {Guid}
     */
    static IID := Guid("{b8cf8530-5562-47c4-ab67-b1f69ecf961e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsDocumentProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetXpsPart : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsDocumentProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetXpsPart() {
        result := ComCall(3, this, "ptr*", &ppIXpsPart := 0, "HRESULT")
        return IUnknown(ppIXpsPart)
    }

    Query(iid) {
        if (IXpsDocumentProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetXpsPart := CallbackCreate(GetMethod(implObj, "GetXpsPart"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetXpsPart)
    }
}
