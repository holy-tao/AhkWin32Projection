#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IActiveScriptErrorDebug.ahk" { IActiveScriptErrorDebug }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptSiteDebugEx extends IUnknown {
    /**
     * The interface identifier for IActiveScriptSiteDebugEx
     * @type {Guid}
     */
    static IID := Guid("{bb722ccb-6ad2-41c6-b780-af9c03ee69f5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptSiteDebugEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCanNotJITScriptErrorDebug : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptSiteDebugEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IActiveScriptErrorDebug} pErrorDebug 
     * @returns {BOOL} 
     */
    OnCanNotJITScriptErrorDebug(pErrorDebug) {
        result := ComCall(3, this, "ptr", pErrorDebug, BOOL.Ptr, &pfCallOnScriptErrorWhenContinuing := 0, "HRESULT")
        return pfCallOnScriptErrorWhenContinuing
    }

    Query(iid) {
        if (IActiveScriptSiteDebugEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCanNotJITScriptErrorDebug := CallbackCreate(GetMethod(implObj, "OnCanNotJITScriptErrorDebug"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCanNotJITScriptErrorDebug)
    }
}
