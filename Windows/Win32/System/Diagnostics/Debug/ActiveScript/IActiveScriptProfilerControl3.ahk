#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IActiveScriptProfilerControl2.ahk" { IActiveScriptProfilerControl2 }
#Import ".\IActiveScriptProfilerHeapEnum.ahk" { IActiveScriptProfilerHeapEnum }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProfilerControl3 extends IActiveScriptProfilerControl2 {
    /**
     * The interface identifier for IActiveScriptProfilerControl3
     * @type {Guid}
     */
    static IID := Guid("{0b403015-f381-4023-a5d0-6fed076de716}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProfilerControl3 interfaces
    */
    struct Vtbl extends IActiveScriptProfilerControl2.Vtbl {
        EnumHeap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProfilerControl3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IActiveScriptProfilerHeapEnum} 
     */
    EnumHeap() {
        result := ComCall(8, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IActiveScriptProfilerHeapEnum(ppEnum)
    }

    Query(iid) {
        if (IActiveScriptProfilerControl3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumHeap := CallbackCreate(GetMethod(implObj, "EnumHeap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumHeap)
    }
}
