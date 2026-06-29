#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectInputDevice2W.ahk" { IDirectInputDevice2W }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DIFILEEFFECT.ahk" { DIFILEEFFECT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct IDirectInputDevice7W extends IDirectInputDevice2W {
    /**
     * The interface identifier for IDirectInputDevice7W
     * @type {Guid}
     */
    static IID := Guid("{57d7c6bd-2356-11d3-8e9d-00c04f6844ae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInputDevice7W interfaces
    */
    struct Vtbl extends IDirectInputDevice2W.Vtbl {
        EnumEffectsInFile : IntPtr
        WriteEffectToFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInputDevice7W.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Pointer<LPDIENUMEFFECTSINFILECALLBACK>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    EnumEffectsInFile(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0

        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(27, this, "ptr", param0, "ptr", param1, param2Marshal, param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Integer} param1 
     * @param {Pointer<DIFILEEFFECT>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    WriteEffectToFile(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(28, this, "ptr", param0, "uint", param1, DIFILEEFFECT.Ptr, param2, "uint", param3, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectInputDevice7W.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumEffectsInFile := CallbackCreate(GetMethod(implObj, "EnumEffectsInFile"), flags, 5)
        this.vtbl.WriteEffectToFile := CallbackCreate(GetMethod(implObj, "WriteEffectToFile"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumEffectsInFile)
        CallbackFree(this.vtbl.WriteEffectToFile)
    }
}
