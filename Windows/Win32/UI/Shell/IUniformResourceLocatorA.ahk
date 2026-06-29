#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\URLINVOKECOMMANDINFOA.ahk" { URLINVOKECOMMANDINFOA }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 */
export default struct IUniformResourceLocatorA extends IUnknown {
    /**
     * The interface identifier for IUniformResourceLocatorA
     * @type {Guid}
     */
    static IID := Guid("{fbf23b80-e3f0-101b-8488-00aa003e56f8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUniformResourceLocatorA interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetURL        : IntPtr
        GetURL        : IntPtr
        InvokeCommand : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUniformResourceLocatorA.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PSTR} pcszURL 
     * @param {Integer} dwInFlags 
     * @returns {HRESULT} 
     */
    SetURL(pcszURL, dwInFlags) {
        pcszURL := pcszURL is String ? StrPtr(pcszURL) : pcszURL

        result := ComCall(3, this, "ptr", pcszURL, "uint", dwInFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PSTR} 
     */
    GetURL() {
        result := ComCall(4, this, PSTR.Ptr, &ppszURL := 0, "HRESULT")
        return ppszURL
    }

    /**
     * 
     * @param {Pointer<URLINVOKECOMMANDINFOA>} purlici 
     * @returns {HRESULT} 
     */
    InvokeCommand(purlici) {
        result := ComCall(5, this, URLINVOKECOMMANDINFOA.Ptr, purlici, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUniformResourceLocatorA.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetURL := CallbackCreate(GetMethod(implObj, "SetURL"), flags, 3)
        this.vtbl.GetURL := CallbackCreate(GetMethod(implObj, "GetURL"), flags, 2)
        this.vtbl.InvokeCommand := CallbackCreate(GetMethod(implObj, "InvokeCommand"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetURL)
        CallbackFree(this.vtbl.GetURL)
        CallbackFree(this.vtbl.InvokeCommand)
    }
}
