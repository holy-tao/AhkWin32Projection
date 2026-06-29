#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugApplication32.ahk" { IDebugApplication32 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugDocumentHelper32.ahk" { IDebugDocumentHelper32 }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IProcessDebugManager32 extends IUnknown {
    /**
     * The interface identifier for IProcessDebugManager32
     * @type {Guid}
     */
    static IID := Guid("{51973c2f-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProcessDebugManager32 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateApplication         : IntPtr
        GetDefaultApplication     : IntPtr
        AddApplication            : IntPtr
        RemoveApplication         : IntPtr
        CreateDebugDocumentHelper : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProcessDebugManager32.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugApplication32} 
     */
    CreateApplication() {
        result := ComCall(3, this, "ptr*", &ppda := 0, "HRESULT")
        return IDebugApplication32(ppda)
    }

    /**
     * 
     * @returns {IDebugApplication32} 
     */
    GetDefaultApplication() {
        result := ComCall(4, this, "ptr*", &ppda := 0, "HRESULT")
        return IDebugApplication32(ppda)
    }

    /**
     * 
     * @param {IDebugApplication32} pda 
     * @returns {Integer} 
     */
    AddApplication(pda) {
        result := ComCall(5, this, "ptr", pda, "uint*", &pdwAppCookie := 0, "HRESULT")
        return pdwAppCookie
    }

    /**
     * 
     * @param {Integer} dwAppCookie 
     * @returns {HRESULT} 
     */
    RemoveApplication(dwAppCookie) {
        result := ComCall(6, this, "uint", dwAppCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkOuter 
     * @returns {IDebugDocumentHelper32} 
     */
    CreateDebugDocumentHelper(punkOuter) {
        result := ComCall(7, this, "ptr", punkOuter, "ptr*", &pddh := 0, "HRESULT")
        return IDebugDocumentHelper32(pddh)
    }

    Query(iid) {
        if (IProcessDebugManager32.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateApplication := CallbackCreate(GetMethod(implObj, "CreateApplication"), flags, 2)
        this.vtbl.GetDefaultApplication := CallbackCreate(GetMethod(implObj, "GetDefaultApplication"), flags, 2)
        this.vtbl.AddApplication := CallbackCreate(GetMethod(implObj, "AddApplication"), flags, 3)
        this.vtbl.RemoveApplication := CallbackCreate(GetMethod(implObj, "RemoveApplication"), flags, 2)
        this.vtbl.CreateDebugDocumentHelper := CallbackCreate(GetMethod(implObj, "CreateDebugDocumentHelper"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateApplication)
        CallbackFree(this.vtbl.GetDefaultApplication)
        CallbackFree(this.vtbl.AddApplication)
        CallbackFree(this.vtbl.RemoveApplication)
        CallbackFree(this.vtbl.CreateDebugDocumentHelper)
    }
}
