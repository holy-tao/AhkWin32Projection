#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectInput2W.ahk" { IDirectInput2W }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct IDirectInput7W extends IDirectInput2W {
    /**
     * The interface identifier for IDirectInput7W
     * @type {Guid}
     */
    static IID := Guid("{9a4cb685-236d-11d3-8e9d-00c04f6844ae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInput7W interfaces
    */
    struct Vtbl extends IDirectInput2W.Vtbl {
        CreateDeviceEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInput7W.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<Guid>} param1 
     * @param {Pointer<Pointer<Void>>} param2 
     * @param {IUnknown} param3 
     * @returns {HRESULT} 
     */
    CreateDeviceEx(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, Guid.Ptr, param0, Guid.Ptr, param1, param2Marshal, param2, "ptr", param3, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectInput7W.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDeviceEx := CallbackCreate(GetMethod(implObj, "CreateDeviceEx"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDeviceEx)
    }
}
