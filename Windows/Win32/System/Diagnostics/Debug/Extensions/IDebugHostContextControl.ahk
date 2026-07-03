#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugHostContextAlternator.ahk" { IDebugHostContextAlternator }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostContextControl extends IUnknown {
    /**
     * The interface identifier for IDebugHostContextControl
     * @type {Guid}
     */
    static IID := Guid("{eeb8fb43-b44e-4b0f-b871-65f0886fcaf2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostContextControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SwitchTo             : IntPtr
        GetContextAlternator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostContextControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchTo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugHostContextAlternator} 
     */
    GetContextAlternator() {
        result := ComCall(4, this, "ptr*", &contextAlternator := 0, "HRESULT")
        return IDebugHostContextAlternator(contextAlternator)
    }

    Query(iid) {
        if (IDebugHostContextControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SwitchTo := CallbackCreate(GetMethod(implObj, "SwitchTo"), flags, 1)
        this.vtbl.GetContextAlternator := CallbackCreate(GetMethod(implObj, "GetContextAlternator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SwitchTo)
        CallbackFree(this.vtbl.GetContextAlternator)
    }
}
