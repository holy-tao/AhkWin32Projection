#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\SCRIPTGCTYPE.ahk" { SCRIPTGCTYPE }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptGarbageCollector extends IUnknown {
    /**
     * The interface identifier for IActiveScriptGarbageCollector
     * @type {Guid}
     */
    static IID := Guid("{6aa2c4a0-2b53-11d4-a2a0-00104bd35090}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptGarbageCollector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CollectGarbage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptGarbageCollector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SCRIPTGCTYPE} _scriptgctype 
     * @returns {HRESULT} 
     */
    CollectGarbage(_scriptgctype) {
        result := ComCall(3, this, SCRIPTGCTYPE, _scriptgctype, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptGarbageCollector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CollectGarbage := CallbackCreate(GetMethod(implObj, "CollectGarbage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CollectGarbage)
    }
}
