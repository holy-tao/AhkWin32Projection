#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDxcOperationResult.ahk" { IDxcOperationResult }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDxcBlob.ahk" { IDxcBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcLinker extends IUnknown {
    /**
     * The interface identifier for IDxcLinker
     * @type {Guid}
     */
    static IID := Guid("{f1b5be2a-62dd-4327-a1c2-42ac1e1e78e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcLinker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterLibrary : IntPtr
        Link            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcLinker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pLibName 
     * @param {IDxcBlob} pLib 
     * @returns {HRESULT} 
     */
    RegisterLibrary(pLibName, pLib) {
        pLibName := pLibName is String ? StrPtr(pLibName) : pLibName

        result := ComCall(3, this, "ptr", pLibName, "ptr", pLib, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pEntryName 
     * @param {PWSTR} pTargetProfile 
     * @param {Pointer<PWSTR>} pLibNames 
     * @param {Integer} libCount 
     * @param {Pointer<PWSTR>} pArguments 
     * @param {Integer} argCount 
     * @returns {IDxcOperationResult} 
     */
    Link(pEntryName, pTargetProfile, pLibNames, libCount, pArguments, argCount) {
        pEntryName := pEntryName is String ? StrPtr(pEntryName) : pEntryName
        pTargetProfile := pTargetProfile is String ? StrPtr(pTargetProfile) : pTargetProfile

        pLibNamesMarshal := pLibNames is VarRef ? "ptr*" : "ptr"
        pArgumentsMarshal := pArguments is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pEntryName, "ptr", pTargetProfile, pLibNamesMarshal, pLibNames, "uint", libCount, pArgumentsMarshal, pArguments, "uint", argCount, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOperationResult(ppResult)
    }

    Query(iid) {
        if (IDxcLinker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterLibrary := CallbackCreate(GetMethod(implObj, "RegisterLibrary"), flags, 3)
        this.vtbl.Link := CallbackCreate(GetMethod(implObj, "Link"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterLibrary)
        CallbackFree(this.vtbl.Link)
    }
}
