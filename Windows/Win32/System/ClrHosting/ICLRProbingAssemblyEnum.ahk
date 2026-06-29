#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRProbingAssemblyEnum extends IUnknown {
    /**
     * The interface identifier for ICLRProbingAssemblyEnum
     * @type {Guid}
     */
    static IID := Guid("{d0c5fb1f-416b-4f97-81f4-7ac7dc24dd5d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRProbingAssemblyEnum interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Get : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRProbingAssemblyEnum.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get started learning the basics of building great desktop apps in this section.
     * @param {Integer} dwIndex 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/desktop-programming
     */
    Get(dwIndex, pwzBuffer, pcchBufferSize) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferSizeMarshal := pcchBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwIndex, "ptr", pwzBuffer, pcchBufferSizeMarshal, pcchBufferSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRProbingAssemblyEnum.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Get)
    }
}
