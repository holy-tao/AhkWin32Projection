#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IActiveScriptSite.ahk" { IActiveScriptSite }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\IDispatch.ahk" { IDispatch }
#Import ".\SCRIPTSTATE.ahk" { SCRIPTSTATE }
#Import "..\..\..\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import ".\SCRIPTTHREADSTATE.ahk" { SCRIPTTHREADSTATE }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScript extends IUnknown {
    /**
     * The interface identifier for IActiveScript
     * @type {Guid}
     */
    static IID := Guid("{bb1a2ae1-a4f9-11cf-8f20-00805f2cd064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScript interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetScriptSite            : IntPtr
        GetScriptSite            : IntPtr
        SetScriptState           : IntPtr
        GetScriptState           : IntPtr
        Close                    : IntPtr
        AddNamedItem             : IntPtr
        AddTypeLib               : IntPtr
        GetScriptDispatch        : IntPtr
        GetCurrentScriptThreadID : IntPtr
        GetScriptThreadID        : IntPtr
        GetScriptThreadState     : IntPtr
        InterruptScriptThread    : IntPtr
        Clone                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScript.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IActiveScriptSite} pass 
     * @returns {HRESULT} 
     */
    SetScriptSite(pass) {
        result := ComCall(3, this, "ptr", pass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetScriptSite(riid) {
        result := ComCall(4, this, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * 
     * @param {SCRIPTSTATE} ss 
     * @returns {HRESULT} 
     */
    SetScriptState(ss) {
        result := ComCall(5, this, SCRIPTSTATE, ss, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SCRIPTSTATE} 
     */
    GetScriptState() {
        result := ComCall(6, this, "int*", &pssState := 0, "HRESULT")
        return pssState
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddNamedItem(pstrName, dwFlags) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(8, this, "ptr", pstrName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidTypeLib 
     * @param {Integer} dwMajor 
     * @param {Integer} dwMinor 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddTypeLib(rguidTypeLib, dwMajor, dwMinor, dwFlags) {
        result := ComCall(9, this, Guid.Ptr, rguidTypeLib, "uint", dwMajor, "uint", dwMinor, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrItemName 
     * @returns {IDispatch} 
     */
    GetScriptDispatch(pstrItemName) {
        pstrItemName := pstrItemName is String ? StrPtr(pstrItemName) : pstrItemName

        result := ComCall(10, this, "ptr", pstrItemName, "ptr*", &ppdisp := 0, "HRESULT")
        return IDispatch(ppdisp)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentScriptThreadID() {
        result := ComCall(11, this, "uint*", &pstidThread := 0, "HRESULT")
        return pstidThread
    }

    /**
     * 
     * @param {Integer} dwWin32ThreadId 
     * @returns {Integer} 
     */
    GetScriptThreadID(dwWin32ThreadId) {
        result := ComCall(12, this, "uint", dwWin32ThreadId, "uint*", &pstidThread := 0, "HRESULT")
        return pstidThread
    }

    /**
     * 
     * @param {Integer} stidThread 
     * @returns {SCRIPTTHREADSTATE} 
     */
    GetScriptThreadState(stidThread) {
        result := ComCall(13, this, "uint", stidThread, "int*", &pstsState := 0, "HRESULT")
        return pstsState
    }

    /**
     * 
     * @param {Integer} stidThread 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    InterruptScriptThread(stidThread, pexcepinfo, dwFlags) {
        result := ComCall(14, this, "uint", stidThread, EXCEPINFO.Ptr, pexcepinfo, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IActiveScript} 
     */
    Clone() {
        result := ComCall(15, this, "ptr*", &ppscript := 0, "HRESULT")
        return IActiveScript(ppscript)
    }

    Query(iid) {
        if (IActiveScript.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetScriptSite := CallbackCreate(GetMethod(implObj, "SetScriptSite"), flags, 2)
        this.vtbl.GetScriptSite := CallbackCreate(GetMethod(implObj, "GetScriptSite"), flags, 3)
        this.vtbl.SetScriptState := CallbackCreate(GetMethod(implObj, "SetScriptState"), flags, 2)
        this.vtbl.GetScriptState := CallbackCreate(GetMethod(implObj, "GetScriptState"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.AddNamedItem := CallbackCreate(GetMethod(implObj, "AddNamedItem"), flags, 3)
        this.vtbl.AddTypeLib := CallbackCreate(GetMethod(implObj, "AddTypeLib"), flags, 5)
        this.vtbl.GetScriptDispatch := CallbackCreate(GetMethod(implObj, "GetScriptDispatch"), flags, 3)
        this.vtbl.GetCurrentScriptThreadID := CallbackCreate(GetMethod(implObj, "GetCurrentScriptThreadID"), flags, 2)
        this.vtbl.GetScriptThreadID := CallbackCreate(GetMethod(implObj, "GetScriptThreadID"), flags, 3)
        this.vtbl.GetScriptThreadState := CallbackCreate(GetMethod(implObj, "GetScriptThreadState"), flags, 3)
        this.vtbl.InterruptScriptThread := CallbackCreate(GetMethod(implObj, "InterruptScriptThread"), flags, 4)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetScriptSite)
        CallbackFree(this.vtbl.GetScriptSite)
        CallbackFree(this.vtbl.SetScriptState)
        CallbackFree(this.vtbl.GetScriptState)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.AddNamedItem)
        CallbackFree(this.vtbl.AddTypeLib)
        CallbackFree(this.vtbl.GetScriptDispatch)
        CallbackFree(this.vtbl.GetCurrentScriptThreadID)
        CallbackFree(this.vtbl.GetScriptThreadID)
        CallbackFree(this.vtbl.GetScriptThreadState)
        CallbackFree(this.vtbl.InterruptScriptThread)
        CallbackFree(this.vtbl.Clone)
    }
}
