#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGraphicsAnalysis extends IUnknown {
    /**
     * The interface identifier for IDXGraphicsAnalysis
     * @type {Guid}
     */
    static IID := Guid("{9f251514-9d4d-4902-9d60-18988ab7d4b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGraphicsAnalysis interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginCapture : IntPtr
        EndCapture   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGraphicsAnalysis.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginCapture() {
        ComCall(3, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    EndCapture() {
        ComCall(4, this)
    }

    Query(iid) {
        if (IDXGraphicsAnalysis.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginCapture := CallbackCreate(GetMethod(implObj, "BeginCapture"), flags, 1)
        this.vtbl.EndCapture := CallbackCreate(GetMethod(implObj, "EndCapture"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginCapture)
        CallbackFree(this.vtbl.EndCapture)
    }
}
