#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A string-variable interface accesses a string variable.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectstringvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectStringVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectStringVariable
     * @type {Guid}
     */
    static IID := Guid("{71417501-8df9-4e0a-a78a-255f9756baff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectStringVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        GetString      : IntPtr
        GetStringArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectStringVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the string.
     * @returns {PSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a>*</b>
     * 
     * A pointer to the string.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectstringvariable-getstring
     */
    GetString() {
        result := ComCall(25, this, PSTR.Ptr, &ppString := 0, "HRESULT")
        return ppString
    }

    /**
     * Get an array of strings.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset (in number of strings) between the start of the array and the first string to get.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of strings in the returned array.
     * @returns {PSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a>*</b>
     * 
     * A pointer to the first string in the array.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectstringvariable-getstringarray
     */
    GetStringArray(Offset, Count) {
        result := ComCall(26, this, PSTR.Ptr, &ppStrings := 0, "uint", Offset, "uint", Count, "HRESULT")
        return ppStrings
    }

    Query(iid) {
        if (ID3D10EffectStringVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 2)
        this.vtbl.GetStringArray := CallbackCreate(GetMethod(implObj, "GetStringArray"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.GetStringArray)
    }
}
