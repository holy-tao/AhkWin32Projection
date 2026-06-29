#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugInputCallbacks extends IUnknown {
    /**
     * The interface identifier for IDebugInputCallbacks
     * @type {Guid}
     */
    static IID := Guid("{9f50e42c-f136-499e-9a97-73036c94ed2d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugInputCallbacks interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartInput : IntPtr
        EndInput   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugInputCallbacks.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     */
    StartInput(BufferSize) {
        result := ComCall(3, this, "uint", BufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndInput() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugInputCallbacks.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartInput := CallbackCreate(GetMethod(implObj, "StartInput"), flags, 2)
        this.vtbl.EndInput := CallbackCreate(GetMethod(implObj, "EndInput"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartInput)
        CallbackFree(this.vtbl.EndInput)
    }
}
