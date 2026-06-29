#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostContextAlternator extends IUnknown {
    /**
     * The interface identifier for IDebugHostContextAlternator
     * @type {Guid}
     */
    static IID := Guid("{6301eee8-85e3-4058-a7c0-d37e0ea65f75}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostContextAlternator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SwitchTo   : IntPtr
        SwitchBack : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostContextAlternator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} fullSwitch 
     * @returns {HRESULT} 
     */
    SwitchTo(fullSwitch) {
        result := ComCall(3, this, "char", fullSwitch, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchBack() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostContextAlternator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SwitchTo := CallbackCreate(GetMethod(implObj, "SwitchTo"), flags, 2)
        this.vtbl.SwitchBack := CallbackCreate(GetMethod(implObj, "SwitchBack"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SwitchTo)
        CallbackFree(this.vtbl.SwitchBack)
    }
}
