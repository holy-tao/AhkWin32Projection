#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct AsyncIPipeDouble extends IUnknown {
    /**
     * The interface identifier for AsyncIPipeDouble
     * @type {Guid}
     */
    static IID := Guid("{db2f3acf-2f86-11d1-8e04-00c04fb9989a}")

    /**
     * The class identifier for AsyncIPipeDouble
     * @type {Guid}
     */
    static CLSID := Guid("{db2f3acf-2f86-11d1-8e04-00c04fb9989a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIPipeDouble interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_Pull  : IntPtr
        Finish_Pull : IntPtr
        Begin_Push  : IntPtr
        Finish_Push : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIPipeDouble.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cRequest 
     * @returns {HRESULT} 
     */
    Begin_Pull(cRequest) {
        result := ComCall(3, this, "uint", cRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} buf 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {HRESULT} 
     */
    Finish_Pull(buf, pcReturned) {
        bufMarshal := buf is VarRef ? "double*" : "ptr"
        pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, bufMarshal, buf, pcReturnedMarshal, pcReturned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} buf 
     * @param {Integer} cSent 
     * @returns {HRESULT} 
     */
    Begin_Push(buf, cSent) {
        bufMarshal := buf is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, bufMarshal, buf, "uint", cSent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_Push() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIPipeDouble.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_Pull := CallbackCreate(GetMethod(implObj, "Begin_Pull"), flags, 2)
        this.vtbl.Finish_Pull := CallbackCreate(GetMethod(implObj, "Finish_Pull"), flags, 3)
        this.vtbl.Begin_Push := CallbackCreate(GetMethod(implObj, "Begin_Push"), flags, 3)
        this.vtbl.Finish_Push := CallbackCreate(GetMethod(implObj, "Finish_Push"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_Pull)
        CallbackFree(this.vtbl.Finish_Pull)
        CallbackFree(this.vtbl.Begin_Push)
        CallbackFree(this.vtbl.Finish_Push)
    }
}
