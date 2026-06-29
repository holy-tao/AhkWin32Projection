#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintReadStream.ahk" { IPrintReadStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintReadStreamFactory extends IUnknown {
    /**
     * The interface identifier for IPrintReadStreamFactory
     * @type {Guid}
     */
    static IID := Guid("{acb971e3-df8d-4fc2-bee6-0609d15f3cf9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintReadStreamFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintReadStreamFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IPrintReadStream} 
     */
    GetStream() {
        result := ComCall(3, this, "ptr*", &ppStream := 0, "HRESULT")
        return IPrintReadStream(ppStream)
    }

    Query(iid) {
        if (IPrintReadStreamFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStream)
    }
}
