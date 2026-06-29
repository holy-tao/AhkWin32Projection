#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ISurfacePresenterFlip extends IUnknown {
    /**
     * The interface identifier for ISurfacePresenterFlip
     * @type {Guid}
     */
    static IID := Guid("{30510848-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISurfacePresenterFlip interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Present   : IntPtr
        GetBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISurfacePresenterFlip.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Present() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} backBufferIndex 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetBuffer(backBufferIndex, riid) {
        result := ComCall(4, this, "uint", backBufferIndex, Guid.Ptr, riid, "ptr*", &ppBuffer := 0, "HRESULT")
        return ppBuffer
    }

    Query(iid) {
        if (ISurfacePresenterFlip.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Present := CallbackCreate(GetMethod(implObj, "Present"), flags, 1)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Present)
        CallbackFree(this.vtbl.GetBuffer)
    }
}
