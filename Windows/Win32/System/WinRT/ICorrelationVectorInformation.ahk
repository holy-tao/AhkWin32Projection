#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }
#Import ".\HSTRING.ahk" { HSTRING }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ICorrelationVectorInformation extends IInspectable {
    /**
     * The interface identifier for ICorrelationVectorInformation
     * @type {Guid}
     */
    static IID := Guid("{83c78b3c-d88b-4950-aa6e-22b8d22aabd3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorrelationVectorInformation interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        get_LastCorrelationVectorForThread : IntPtr
        get_NextCorrelationVectorForThread : IntPtr
        put_NextCorrelationVectorForThread : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorrelationVectorInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {HSTRING} 
     */
    LastCorrelationVectorForThread {
        get => this.get_LastCorrelationVectorForThread()
    }

    /**
     * @type {HSTRING} 
     */
    NextCorrelationVectorForThread {
        get => this.get_NextCorrelationVectorForThread()
        set => this.put_NextCorrelationVectorForThread(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LastCorrelationVectorForThread() {
        cv := HSTRING.Owned()
        result := ComCall(6, this, HSTRING.Ptr, cv, "HRESULT")
        return cv
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NextCorrelationVectorForThread() {
        cv := HSTRING.Owned()
        result := ComCall(7, this, HSTRING.Ptr, cv, "HRESULT")
        return cv
    }

    /**
     * 
     * @param {HSTRING} cv 
     * @returns {HRESULT} 
     */
    put_NextCorrelationVectorForThread(cv) {
        result := ComCall(8, this, HSTRING, cv, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorrelationVectorInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LastCorrelationVectorForThread := CallbackCreate(GetMethod(implObj, "get_LastCorrelationVectorForThread"), flags, 2)
        this.vtbl.get_NextCorrelationVectorForThread := CallbackCreate(GetMethod(implObj, "get_NextCorrelationVectorForThread"), flags, 2)
        this.vtbl.put_NextCorrelationVectorForThread := CallbackCreate(GetMethod(implObj, "put_NextCorrelationVectorForThread"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LastCorrelationVectorForThread)
        CallbackFree(this.vtbl.get_NextCorrelationVectorForThread)
        CallbackFree(this.vtbl.put_NextCorrelationVectorForThread)
    }
}
