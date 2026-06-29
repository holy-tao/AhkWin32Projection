#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectInputW.ahk" { IDirectInputW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct IDirectInput2W extends IDirectInputW {
    /**
     * The interface identifier for IDirectInput2W
     * @type {Guid}
     */
    static IID := Guid("{5944e663-aa8a-11cf-bfc7-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInput2W interfaces
    */
    struct Vtbl extends IDirectInputW.Vtbl {
        FindDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInput2W.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<Guid>} param2 
     * @returns {HRESULT} 
     */
    FindDevice(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        result := ComCall(8, this, Guid.Ptr, param0, "ptr", param1, Guid.Ptr, param2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectInput2W.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindDevice := CallbackCreate(GetMethod(implObj, "FindDevice"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindDevice)
    }
}
