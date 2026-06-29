#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IJsDebugFrame.ahk" { IJsDebugFrame }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IJsDebugStackWalker extends IUnknown {
    /**
     * The interface identifier for IJsDebugStackWalker
     * @type {Guid}
     */
    static IID := Guid("{db24b094-73c4-456c-a4ec-e90ea00bdfe3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IJsDebugStackWalker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IJsDebugStackWalker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IJsDebugFrame} 
     */
    GetNext() {
        result := ComCall(3, this, "ptr*", &ppFrame := 0, "HRESULT")
        return IJsDebugFrame(ppFrame)
    }

    Query(iid) {
        if (IJsDebugStackWalker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNext := CallbackCreate(GetMethod(implObj, "GetNext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNext)
    }
}
