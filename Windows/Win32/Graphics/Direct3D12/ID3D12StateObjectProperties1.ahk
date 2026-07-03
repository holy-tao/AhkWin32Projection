#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_PROGRAM_IDENTIFIER.ahk" { D3D12_PROGRAM_IDENTIFIER }
#Import ".\ID3D12StateObjectProperties.ahk" { ID3D12StateObjectProperties }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12StateObjectProperties1 extends ID3D12StateObjectProperties {
    /**
     * The interface identifier for ID3D12StateObjectProperties1
     * @type {Guid}
     */
    static IID := Guid("{460caac7-1d24-446a-a184-ca67db494138}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12StateObjectProperties1 interfaces
    */
    struct Vtbl extends ID3D12StateObjectProperties.Vtbl {
        GetProgramIdentifier : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12StateObjectProperties1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pProgramName 
     * @returns {D3D12_PROGRAM_IDENTIFIER} 
     */
    GetProgramIdentifier(pProgramName) {
        pProgramName := pProgramName is String ? StrPtr(pProgramName) : pProgramName

        result := ComCall(7, this, "ptr", pProgramName, D3D12_PROGRAM_IDENTIFIER)
        return result
    }

    Query(iid) {
        if (ID3D12StateObjectProperties1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProgramIdentifier := CallbackCreate(GetMethod(implObj, "GetProgramIdentifier"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProgramIdentifier)
    }
}
